package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"time"

	_ "github.com/go-sql-driver/mysql"
)

type Employee struct {
	EmployeeNumber int        `db:"emp_no"`
	FirstName      string     `db:"first_name"`
	LastName       string     `db:"last_name"`
	Gender         string     `db:"gender"`
	BirthDate      *time.Time `db:"birth_date"`
	HireDate       *time.Time `db:"hire_date"`
}

func getRows(db *sql.DB, limit int) ([]*Employee, error) {
	rows, err := db.Query("SELECT * FROM employees.employees LIMIT ?", limit)
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

func main() {
	db, err := connectToDatabase()
	if err != nil {
		log.Fatalf("main sql.Open error err:%v", err)
	}
	defer db.Close()

	employees, err := getRows(db, 10)
	if err != nil {
		log.Fatalf("getRows error err:%w", err)
	}

	jsonBytes, err := json.Marshal(employees)
	if err != nil {
		log.Fatalf("marshal json error err:%w", err)
	}

	fmt.Println(string(jsonBytes))
}
