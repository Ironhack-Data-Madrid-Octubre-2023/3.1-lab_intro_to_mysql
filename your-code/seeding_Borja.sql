-- Insert data into the Customers table without including CustomerID
INSERT INTO Customers (Name, Phone, Email, Address, City, StateProvince, Country, ZipPostalCode) VALUES
    ('Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045'),
    ('Hedy Lamarr', '+43 1 514442250', '-', 'Weiglgasse 10', 'Vienna', 'Vienna', 'Austria', '1150'),
    ('Katherine Johnson', '+1 202 358 0000', '-', '300 E St SW', 'Washington, DC', 'Washington', 'United States', '20546');

-- Insert data into the Salespersons table without including Staff ID
INSERT INTO Salespersons (Name, Store) VALUES
    ('Petey Cruiser', 'Madrid'),
    ('Anna Sthesia', 'Barcelona'),
    ('Paul Molive', 'Berlin'),
    ('Gail Forcewind', 'Paris'),
    ('Paige Turner', 'Mimia'),
    ('Bob Frapples', 'Mexico City'),
    ('Walter Melon', 'Amsterdam'),
    ('Shonda Leer', 'São Paulo');

-- Insert data into the Invoices table without including ID
INSERT INTO Invoices (InvoiceNumber, Date, CarID, CustomerID, SalespersonID) VALUES
    ('852399038', '2018-08-22', 0, 1, 3),
    ('731166526', '2018-12-31', 3, 0, 5),
    ('271135104', '2019-01-22', 2, 2, 7);

-- Insert data into the Cars table with CarID as an auto-incremented primary key
INSERT INTO Cars (VIN, Manufacturer, Model, Year, Color) VALUES
    ('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
    ('ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
    ('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
    ('HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'),
    ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'),
    ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray');
