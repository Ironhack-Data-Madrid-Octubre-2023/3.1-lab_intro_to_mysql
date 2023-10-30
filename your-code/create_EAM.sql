-- CREATE TABLE cars(
   --  ID INT PRIMARY KEY,
    -- VIN VARCHAR(17),
   --  Manufacturer VARCHAR(255),
    -- Model VARCHAR(255),
    -- Year VARCHAR (40),
    -- Color VARCHAR(50)
-- );
-- CREATE TABLE Customers (
   --  ID INT PRIMARY KEY,
   --  Customer_ID VARCHAR(10),
    -- Name VARCHAR(255),
    -- Phone VARCHAR(15),
    -- Email VARCHAR(255),
    -- Address VARCHAR(255),
    -- City VARCHAR(50),
    -- State_Province VARCHAR(50),
    -- Country VARCHAR(50),
    -- Postal VARCHAR(10)
-- );

-- CREATE TABLE Salespersons (
   --  ID INT PRIMARY KEY,
    -- Staff_ID VARCHAR(10),
    -- Name VARCHAR(255),
    -- Store VARCHAR(50)
-- );

CREATE TABLE Invoices (
    ID INT PRIMARY KEY,
    Invoice_Number VARCHAR(20),
    Date DATE,
    Car VARCHAR(255),
    Customer VARCHAR(255),
    Sales_Person VARCHAR(255)