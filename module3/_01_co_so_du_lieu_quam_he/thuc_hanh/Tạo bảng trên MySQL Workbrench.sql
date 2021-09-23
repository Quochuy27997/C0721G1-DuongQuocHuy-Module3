DROP DATABASE IF EXISTS manager_student;
CREATE DATABASE IF NOT EXISTS  manager_student;
USE manager_student;
CREATE TABLE student(
`id`INT NOT NULL PRIMARY KEY,
`name` VARCHAR(45) NULL,
`age`INT NOT NULL,
`country` VARCHAR(45) NULL
);