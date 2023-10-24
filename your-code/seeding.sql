De la manera en la que he establecido el negocio, "invoice" es la tabla madre, tiene una estructura estrella.

1:1 cars-invoice. En las facturas, sólo aparecerá un coche determinado una vez.
1:n customer-invoice. Dentro de invoice, un customer puede aparecer en varias facturas porque puede comprar varios coches.
1:n salesperson-invoice. Dentro de invoice, un salesperson puede aparecer en distintas facturas porque puede vender varios coches.

Puedo añadir datos de coches, customers y salespersons. 

Para invoice, necesito las foreign keys del resto de elementos. IMPORTANTE!

insert into cars (ID, VIN, Manufacturer, Model, `Year`, Color)
values (0,'3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
(1,'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
(2,'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
(3,'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'),
(4,'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'),
(5,'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray');


insert into customers (ID,idCustomers,`Name`,`Phone number`,email,Adress,City,`State/province`,Country,`Zip/postal code`)
values (0,'10001', 'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045'),
(1,'20001', 'Hedy Lamarr', '+43 1 514442250', '-', 'Viena', 'Weiglgasse 10', 'Vienna', 'Austria', '1150'),
(2,'30001', 'Katherine Johnson', '+1 202 358 0000', '-', '300 E St SW', 'Washington, DC', 'Washington', 'United States', '20546');


insert into salespersons (ID,idSalespersons,`Name`,Store)
values (0,'00001', 'Petey Cruiser', 'Madrid'),
(1, '00002', 'Anna Sthesia', 'Barcelona'),
(2, '00003', 'Paul Molive', 'Berlin'),
(3, '00004', 'Gail Forcewind', 'Paris'),
(4, '00005', 'Paige Turner', 'Mimia'),
(5, '00006', 'Bob Frapples', 'Mexico City'),
(6, '00007', 'Walter Melon', 'Amsterdam'),
(7, '00008', 'Shonda Leer', 'São Paulo');


insert into invoices (idInvoices,InvoiceNumber,`Date`,Car,Customer,`Salesperson related`,cars_ID,customers_ID,salespersons_ID)
values (0,'852399038', '2018-08-22',0,1,3,0,1,3),
(1,'731166526', '2018-12-31',3,0,5,3,0,5),
(2,'271135104', '2019-01-22',2,2,7,2,2,7);