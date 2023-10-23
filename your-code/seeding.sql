Insert into cars(carspkID, VIN, manufacturer, model, year_, color)
Values
(1, “ZM8G7BEUQZ97IH46V”, “Peugeot”, “Rifter”, 2019, “Red”)
(2, “RKXVNNIHLVVZOUB4M”, “Ford”, “Fusion”, 2018, “White”)
(3, “HKNDGS7CU31E9Z7JW”, “Toyota”, “RAV4”, 2018, “Silver”) 
(4, “DAM41UDN3CHU2WVF6”, “Volvo”, “V60”, 2019, “Gray”) 
(5, “DAM41UDN3CHU2WVF6”, “Volvo”, “V60 Cross Country”, 2019, “Gray”)

insert into salespersons(salespersonspkID, staff_id, name, store)
values
(0, '00001', 'Petey_Cruiser', 'Madrid'),
(1, '00002', 'Anna_Sthesia', 'Barcelona'),
(2, '00003', 'Paul_Molive', 'Berlin'),
(3, '00004', 'Gail_Forcewind', 'Paris'),
(4, '00005', 'Paige_Turner', 'Mimia'),
(5, '00006', 'Bob_Frapples', 'Mexico_City'),
(6, ‘00007’, ‘Walter_Melon’, ‘Amsterdam’),
(7, ‘00008’, ‘Shonda_Leer’, ‘Sao_Paulo’);

insert into customers(customerpkID,  customer_ID, name, phone_number, email, address, city, state_province, country, zip_postal_code)
values 
(0, ‘1001’, ‘Pablo_Picasso’. ‘+34636176382’, ‘-‘, ‘Paseo_de_la_Chopera_14’, ‘Madrid’, ‘Madrid’, ‘Spain’, ‘28045’)
(1, ‘20001’, ‘Hedy_Lamarr’, ‘+431514442250’, ‘-‘, ‘Weiglgasse_10’, ‘Viena’, ‘Vienna’, ‘Austria’ ‘1150’)
(2, ‘30001’, ‘Katherine_Johnson’, ‘+12023580000’, ‘-‘, ‘300_E_St_SW’, ‘Washington’, ‘DCWashington’, ‘United_States’, ‘20546’)

Insert into invoices (invoicepkID, invoice_number, date, cars_carspkID, customers_customerpkID, salespersons_salespersonspkID)
Values
(0, "852399038", "2018-08-22", 0, 1, 3),
(1, "731166526", "2018-12-31", 3, 0, 5),
(2, "271135104", "2019-01-22", 2, 2, 7);


