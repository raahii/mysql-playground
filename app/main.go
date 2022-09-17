package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"
	"time"

	_ "github.com/go-sql-driver/mysql"
	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
)

func connectToDatabase() (*sql.DB, error) {
	db, err := sql.Open("mysql", "root:password@tcp(db:3306)/employees?parseTime=true&loc=Asia%2FTokyo")
	if err != nil {
		return nil, fmt.Errorf("failed to initialize db connection: %w", err)
	}

	maxTrials := 10
	interval := 1 * time.Second

	for i := 0; i < maxTrials; i++ {
		err = db.Ping()
		if err != nil {
			fmt.Printf("failed to ping, retrying... (count: %d, error: %v)\n", i+1, err)
			time.Sleep(interval)
		} else {
			return db, nil
		}
	}

	return nil, err
}

type Handler struct {
	db *sql.DB
}

type Employee struct {
	EmployeeNumber int        `db:"emp_no"`
	FirstName      string     `db:"first_name"`
	LastName       string     `db:"last_name"`
	Gender         string     `db:"gender"`
	BirthDate      *time.Time `db:"birth_date"`
	HireDate       *time.Time `db:"hire_date"`
}

func (h *Handler) selectRows(limit int) ([]*Employee, error) {
	rows, err := h.db.Query("SELECT * FROM employees.employees LIMIT ?", limit)
	if err != nil {
		return []*Employee{}, fmt.Errorf("getRows db.Query error err: %w", err)
	}
	defer rows.Close()

	employees := make([]*Employee, 0, limit)
	for rows.Next() {
		emp := new(Employee)
		if err := rows.Scan(
			&emp.EmployeeNumber,
			&emp.BirthDate,
			&emp.FirstName,
			&emp.LastName,
			&emp.Gender,
			&emp.HireDate,
		); err != nil {
			return []*Employee{}, fmt.Errorf("getRows rows.Scan error err: %w", err)
		}
		employees = append(employees, emp)
	}

	err = rows.Err()
	if err != nil {
		return []*Employee{}, fmt.Errorf("getRows rows.Err error err: %w", err)
	}

	return employees, nil
}

func (h *Handler) findEmployees(c echo.Context) error {
	employees, err := h.selectRows(10)
	if err != nil {
		log.Fatalf("getRows error err:%w", err)
	}

	return c.JSON(http.StatusOK, employees)
}

func main() {
	db, err := connectToDatabase()
	if err != nil {
		log.Fatalf("main sql.Open error err:%v", err)
	}
	defer db.Close()

	e := echo.New()

	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	h := Handler{db}
	e.GET("/employees", h.findEmployees)

	e.Logger.Fatal(e.Start(":8080"))
}
