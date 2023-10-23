-- Create the Cars table with CarID as the primary key and remove the unique constraint from VIN
CREATE TABLE Cars (
    CarID INT AUTO_INCREMENT PRIMARY KEY,
    VIN CHAR(17),
    Manufacturer VARCHAR(255),
    Model VARCHAR(255),
    Year INT,
    Color VARCHAR(255)
);

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(255),
    StateProvince VARCHAR(255),
    Country VARCHAR(255),
    ZipPostalCode VARCHAR(20)
);

-- Create the Salespersons table
CREATE TABLE Salespersons (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Store VARCHAR(255)
);

-- Create the Invoices table
CREATE TABLE Invoices (
    InvoiceID INT AUTO_INCREMENT PRIMARY KEY,
    InvoiceNumber VARCHAR(20),
    Date DATE,
    CarID INT,
    CustomerID INT,
    SalespersonID INT,
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (SalespersonID) REFERENCES Salespersons(StaffID)
);
