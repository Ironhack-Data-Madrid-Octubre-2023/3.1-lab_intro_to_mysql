CREACION BASE Y DE TABLAS

CREATE DATABASE IF NOT EXISTS Coches;

USE Coches;

CREATE TABLE IF NOT EXISTS Cars (
    cars_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(50),
    manufacturer VARCHAR(50),
    model varchar(45),
    year YEAR(4),
    color VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS Customer (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
	Customer INT,
	name varchar(45),
	phone varchar (45),
	email varchar (45),
	address varchar(45),
	city varchar(45),
	state varchar(45),
	country varchar(45),
	postal INT
);

CREATE TABLE IF NOT EXISTS Salesperson (
	salesperson_id int auto_increment primary key,
	staff_id int,
	name varchar(45),
	store varchar(45)
);

CREATE TABLE IF NOT EXISTS Invoice (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_num INT,
    date DATE,
    cars_id INT,
    customer_id INT,
    salesperson_id INT,
    FOREIGN KEY (cars_id) REFERENCES Cars(cars_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (salesperson_id) REFERENCES Salesperson(salesperson_id)
);