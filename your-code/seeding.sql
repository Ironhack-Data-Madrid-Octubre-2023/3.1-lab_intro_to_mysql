INSERT INTO cars (`VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES
  ('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
  ('ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
  ('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
  ('HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'),
  ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'),
  ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray');

INSERT INTO customers (`CustomerID`, `Name`, `Phone`, `Email`, `Address`, `City`, `StateProvince`, `Country`, `ZipPostalCode`) VALUES
  (10001, 'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045'),
  (20001, 'Hedy Lamarr', '+43 1 514442250', '-', 'Weiglgasse 10', 'Viena', 'Vienna', 'Austria', '1150'),
  (30001, 'Katherine Johnson', '+1 202 358 0000', '-', '300 E St SW', 'Washington, DC', 'Washington', 'United States', '20546');

  
INSERT INTO salespersons (`StaffID`, `Name`, `Store`) VALUES
  (00001, 'Petey Cruiser', 'Madrid'),
  (00002, 'Anna Sthesia', 'Barcelona'),
  (00003, 'Paul Molive', 'Berlin'),
  (00004, 'Gail Forcewind', 'Paris'),
  (00005, 'Paige Turner', 'Mimia'),
  (00006, 'Bob Frapples', 'Mexico City'),
  (00007, 'Walter Melon', 'Amsterdam'),
  (00008, 'Shonda Leer', 'São Paulo');

  
INSERT INTO Invoices (InvoiceID, InvoiceNumber, Date, CarID, CustomerID, SalespersonID) VALUES
    (0, '852399038', '2018-08-22', 1, 1, 3),
    (1, '731166526', '2018-12-31', 3, 3, 5),
    (2, '271135104', '2019-01-22', 2, 2, 7);