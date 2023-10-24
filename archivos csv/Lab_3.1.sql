create database coches;
insert into cars (ID,VIN,manufacturer,model,year,color)
values (0,'3K096I98581DHSNUP','Volkswagen','Tiguan',2019,'Blue'),
(1,'ZM8G7BEUQZ97IH46V','Peugeot','Rifter',2019,'Red'),
(2,'RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White'),
(3,'HKNDGS7CU31E9Z7JW','Toyota','RAV4',2018,'Silver'),
(4,'DAM41UDN3CHU2WVF6','Volvo','V60',2019,'Gray'),
(5,'DAM41UDN3CHU2WVF6','Volvo','V60 Cross Country',2019,'Gray');
insert into customers (customer_ID,name, phone,email,address,city,state,country,postal)
values (10001,'Pablo Picasso','+34 636 17 63 82','-','Paseo de la Chopera, 14','Madrid','Madrid','Spain','28045'),
(20001,'Hedy Lamarr','+43 1 514442250','-','Weiglgasse 10','Viena','Vienna','Austria','1150'),
(30001,'Katherine Johnson','+1 202 358 0000','-','300 E St SW','Washington, DC','Washington','United States','20546'); 
insert into salesperson (staff_ID, name,store)
values (00001,'Petey Cruiser','Madrid'),
(00002,'Anna Sthesia','Barcelona'),
(00003,'Paul Molive','Berlin'),
(00004,'Gail Forcewind','Paris'),
(00005,'Paige Turner','Mimia'),
(00006,'Bob Frapples','Mexico City'),
(00007,'Walter Melon','Amsterdam'),
(00008,'Shonda Leer','São Paulo');

insert into invoices (invoice_ID, invoice_number,`date`,customers_customer_ID,salesperson_staff_ID,cars_ID)
values (0,'852399038','22-08-2018',20001,00004,1),
(1,'731166526','31-12-2018',10001,00006,0),
(2,'271135104','22-01-2018',30001,00008,2);

update salesperson
set store = 'Miami'
where staff_ID = 00005;
select * from salesperson;

delete from cars where ID = 5;
select * from cars;