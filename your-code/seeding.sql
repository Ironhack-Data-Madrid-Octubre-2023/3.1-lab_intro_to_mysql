-- Ingresar dato a tabla cars
INSERT INTO cars (Cars_ID, VIN, manufacturer, model, cars_year, color)
VALUES 
(0, '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
(1, 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
(2, 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
(3, 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'),
(4, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'),
(5, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60CrossCountry', 2019, 'Gray');

-- Ingresar datos a tabla customers
insert into customers(id, customers_ID ,name, phone_number ,email ,adress ,city ,state_province ,country, zip_postal)
VALUES 
(0, '10001', 'Pablo Picasso', '+34 636 17 63 82','', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045'),
(1, '20001', 'Hedy Lamarr', '+43 1 514442250','', 'Weiglgasse 10', 'Viena', 'Vienna', 'Austria', '1150'),
(2, '30001', 'Katherine Johnson', '+1 202 358 0000','', '300 E St SW', 'Washington, DC', 'Washington', 'United States', '20546');

-- Ingreso datos a tabla salespersons
INSERT INTO Salespersons (ID, staff_ID, name, store)
VALUES 
(0, '00001', 'Petey Cruiser', 'Madrid'),
(1, '00002', 'Anna Sthesia', 'Barcelona'),
(2, '00003', 'Paul Molive', 'Berlin'),
(3, '00004', 'Gail Forcewind', 'Paris'),
(4, '00005', 'Paige Turner', 'Mimia'),
(5, '00006', 'Bob Frapples', 'Mexico City'),
(6, '00007', 'Walter Melon', 'Amsterdam'),
(7, '00008', 'Shonda Leer', 'São Paulo');

-- Ingreso dato a tabla innvoice
INSERT INTO invoices (invoice_ID, number, date, car, Customer, salesPerson, salespersons_ID,customers_id, cars_Cars_ID)
VALUES 
(0, 852399038, '2018-08-22', 0, 1, 3, 3 , 1, 0),
(1, 731166526, '2018-12-31', 3, 0, 5, 5, 0, 3),
(2, 271135104, '2019-01-22', 2, 2, 7, 7, 2, 2);
