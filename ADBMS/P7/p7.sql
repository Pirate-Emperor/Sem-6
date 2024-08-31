-- Task 1:
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    region_id INT
);

-- Task 2:
CREATE TABLE new_countries AS
SELECT country_id, country_name, region_id
FROM countries;

-- Task 3:
CREATE TABLE dup_countries (LIKE countries INCLUDING ALL);

-- Task 4:
-- Duplicate Schema
CREATE TABLE dup_countries2 AS
SELECT *
FROM countries
WITH NO DATA;
-- Duplicate Data
INSERT INTO dup_countries2
SELECT *
FROM countries;

-- Task 5:
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) NULL,
    region_id INT
);

-- Task 6:
CREATE TABLE jobs (
    job_id SERIAL PRIMARY KEY,
    job_title VARCHAR(100) NOT NULL,
    min_salary NUMERIC(10, 2) DEFAULT 0.00,
    max_salary NUMERIC(10, 2) CHECK (max_salary <= 25000)
);
-- Check
INSERT INTO jobs VALUES (3, 'A', 0, 122000);

-- Task 7:
CREATE TYPE allowed_countries AS ENUM ('Italy', 'India', 'China');
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name allowed_countries NOT NULL,
    region_id INT
);
INSERT INTO countries VALUES (1, 'USA', 1);
-- Task 8:
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    region_id INT,
    CONSTRAINT unique_country_id UNIQUE (country_id)
);
INSERT INTO countries VALUES (1, 'India', 1);
INSERT INTO countries VALUES (1, 'China', 2);
-- Task 9:
CREATE TABLE jobs (
    job_id SERIAL PRIMARY KEY,
    job_title VARCHAR(100) DEFAULT '',  
    min_salary NUMERIC(10, 2) DEFAULT 8000.00,  
    max_salary NUMERIC(10, 2) DEFAULT NULL  
);
INSERT INTO jobs DEFAULT VALUES;
SELECT * FROM jobs;
-- Task 10:
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    region_id INT,
    CONSTRAINT unique_country_id UNIQUE (country_id)
);
INSERT INTO countries VALUES (1, 'India', 1);
INSERT INTO countries VALUES (1, 'China', 2);
-- Task 11:
CREATE TABLE jobs (
    job_id SERIAL PRIMARY KEY,
    job_title VARCHAR(100), 
    min_salary NUMERIC(10, 2),
    max_salary NUMERIC(10, 2)
);
INSERT INTO jobs 
(job_title, min_salary, max_salary)
VALUES ('AI', 0, 10000);
SELECT * FROM jobs;
-- Task 12:
CREATE TABLE countries (
    country_id INT,
    country_name VARCHAR(100) NOT NULL,
    region_id INT NOT NULL,
    CONSTRAINT unique_country_region UNIQUE (country_id, region_id)
);
INSERT INTO countries VALUES (1, 'India', 1);
INSERT INTO countries VALUES (1, 'China', 2);
INSERT INTO countries VALUES (1, 'Italy', 2);