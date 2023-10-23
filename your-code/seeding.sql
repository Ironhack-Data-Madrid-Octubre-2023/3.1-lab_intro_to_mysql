insert into cars (carID, VIN, manufacturer, model, `year`, color)
values (0, '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
		(1, 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
        (2, 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
        (3, 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'),
        (4, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60' , 2019, 'Gray'),
        (5, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray');

INSERT INTO invoices (invoiceID, invoicenumber, `date`, car, customer, salesperson)
VALUES (0, 852399038, '2018-08-22', '0', '1', '3'),
       (1, 731166526, '2018-12-31', '3', '0', '5'),
       (2, 271135104, '2019-01-22', '2', '2', '7');
