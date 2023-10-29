use Coches;

INSERT INTO Cars (VIN, manufacturer, model, year, color)
VALUES ('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue');

INSERT INTO Cars (VIN, manufacturer, model, year, color)
VALUES ('ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red');

INSERT INTO Cars (VIN, manufacturer, model, year, color)
VALUES ('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White');

INSERT INTO Cars (VIN, manufacturer, model, year, color)
VALUES ('HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver');

INSERT INTO Cars (VIN, manufacturer, model, year, color)
VALUES ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray');

INSERT INTO Cars (VIN, manufacturer, model, year, color)
VALUES ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray');



INSERT INTO Customer  (Customer, name, phone, email, address, city, state, country, postal)
VALUES (10001, 'Pablo Picasso', '+34 636 17 63 82', "-", 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', 28045);

INSERT INTO Customer  (Customer, name, phone, email, address, city, state, country, postal)
VALUES (20001, 'Hedy Lamarr', '+43 1 514442250', "-", 'Weiglgasse 10', 'Viena', 'Vienna', 'Austria', 1150);

INSERT INTO Customer  (Customer, name, phone, email, address, city, state, country, postal)
VALUES (30001, 'Katherine Johnson', '+1 202 358 0000', "-", '300 E St SW', 'Washington, DC', 'Washington', 'United States', 20546);



INSERT INTO Salesperson (staff_id, name, store)
VALUES (00001, 'Petey Cruiser', 'Madrid');

INSERT INTO Salesperson (staff_id, name, store)
VALUES (00002, 'Anna Sthesia', 'Barcelona');

INSERT INTO Salesperson (staff_id, name, store)
VALUES (00003, 'Paul Molive', 'Berlin');

INSERT INTO Salesperson (staff_id, name, store)
VALUES (00004, 'Gail Forcewind', 'Paris');

INSERT INTO Salesperson (staff_id, name, store)
VALUES (00005, 'Paige Turner', 'Mimia');

INSERT INTO Salesperson (staff_id, name, store)
VALUES (00006, 'Bob Frapples', 'Mexico City');

INSERT INTO Salesperson (staff_id, name, store)
VALUES (00007, 'Walter Melon', 'Amsterdam');

INSERT INTO Salesperson (staff_id, name, store)
VALUES (00008, 'Shonda Leer', 'São Paulo');



INSERT INTO Invoice (invoice_num, date, cars_id, customer_id, salesperson_id)
VALUES (852399038, '2018-08-22', 2, 1, 3);

INSERT INTO Invoice (invoice_num, date, cars_id, customer_id, salesperson_id)
VALUES (731166526, '2018-12-31', 4, 2, 5);

INSERT INTO Invoice (invoice_num, date, cars_id, customer_id, salesperson_id)
VALUES (271135104, '2019-01-22', 6, 3, 7)
