CREATE DATABASE employee;
USE employee;

-- DDL COMMANDS
-- 1 TABLE CREATION

-- Departments Table
CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(100)
);
DESC departments;

-- Location Table
CREATE TABLE location (
    location_id INT,
    location VARCHAR(30)
);
DESC location;

-- Employees Table
CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(50),
    gender ENUM('M','F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2)
);
DESC employees;


-- 2 TABLE ALTERATION

-- Add email column
ALTER TABLE employees ADD COLUMN email VARCHAR(100);

-- Widen designation column
ALTER TABLE employees MODIFY COLUMN designation VARCHAR(150);

-- Drop age column
ALTER TABLE employees DROP COLUMN age;

-- Rename hire_date to date_of_joining
ALTER TABLE employees RENAME COLUMN hire_date TO date_of_joining;


-- 3 TABLE RENAMING

RENAME TABLE departments TO Departments_Info;
RENAME TABLE location TO Locations;

DESC Departments_info;
DESC Locations;

-- 4 TABLE TRUNCATION

TRUNCATE TABLE employees;

-- 5 DATABASE & TABLE DROPPING

DROP TABLE employees;
DROP DATABASE employee;


-- CONSTRAINTS
-- 1 DATABASE RECREATION

DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;

-- 2 Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- 3 Location Table
CREATE TABLE location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(30) NOT NULL UNIQUE
);

-- 4 Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M','F') NOT NULL,
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(150),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);


DESC departments;
DESC location;
DESC employees;