CREATE DATABASE cars;
USE cars;

CREATE TABLE cars (
    ID INT NOT NULL,
    VIN VARCHAR(17) NOT NULL,
    Manufacturer VARCHAR(255) NOT NULL,
    Model VARCHAR(255) NOT NULL,
    Year INT NOT NULL,
    Color VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE customers (
    ID INT NOT NULL,
    CustomerID INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Phone VARCHAR(30) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(255) NOT NULL,
    StateProvince VARCHAR(255) NOT NULL,
    Country VARCHAR(255) NOT NULL,
    Postal VARCHAR(10) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE salespersons (
    ID INT NOT NULL,
    StaffID INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Store VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE invoices (
    ID INT NOT NULL,
    InvoiceNumber INT NOT NULL,
    Date DATE NOT NULL,
    Car INT NOT NULL,
    Customer INT NOT NULL,
    SalesPerson INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (Car) REFERENCES cars(ID),
    FOREIGN KEY (Customer) REFERENCES customers(ID),
    FOREIGN KEY (SalesPerson) REFERENCES salespersons(ID)
);

