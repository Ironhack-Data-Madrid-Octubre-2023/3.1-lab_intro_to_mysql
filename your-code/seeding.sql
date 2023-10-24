INSERT INTO cars (VIN, manufacturer, model, year, color )
VALUES ("3K096I98581DHSNUP", "Volkswagen", "Tiguan", "2019", "Blue"),
("ZM8G7BEUQZ97IH46V","Peugeot", "Rifter", "2019", "Red"),
("RKXVNNIHLVVZOUB4M", "Ford", "Fusion",	"2018", "White"),
("HKNDGS7CU31E9Z7JW", "Toyota", "RAV4", "2018","Silver"),
("DAM41UDN3CHU2WVF6", "Volvo", "V60", "2019", "Gray"),
("DAM41UDN3CHU2WVF6", "Volvo", "V60 Cross Country", "2019", "Gray");


INSERT INTO customers (`Customer ID`, name, `phone number`, email, address, city, `state/province`, country, `zip/postal code`)
VALUES ("10001", "Pablo Picasso", "+34 636 17 63 82", "-", "Paseo de la Chopera, 14", "Madrid", "Madrid", "Spain", "28045"),
("20001","Hedy Lamarr", "+43 1 514442250", "-",  "Weiglgasse 10", "Viena", "Vienna", "Austria", "1150" ),
("30001","Katherine Johnson", "+1 202 358 0000", "-",  "300 E St SW", "Washington, DC", "Washington", "United States", "20546");

INSERT INTO salespersons (`staff ID`, `name`, `store`)
VALUES ("00001", "Petey Cruiser", "Madrid"),
("00002", "Anna Sthesia", "Barcelona"),
("00003", "Paul Molive", "Berlin"),
("00004", "Gail Forcewind", "Paris"),
("00005", "Paige Turner", "Mimia"),
("00006", "Bob Frapples", "	Mexico City"),
("00007", "Walter Melon", "Amsterdam"),
("00008", "Shonda Leer", "São Paulo");


INSERT INTO invoices (`invoice number`, `date`, `Cars_ID Cars1`, `Customers_ID Customer`, `Salespersons_ID Salespersons1`)
VALUES ("852399038", "22-08-2018", "0", "1", "3"),
("731166526", "31-12-2018", "3", "0", "5"),
("271135104", "22-01-2019", "2", "2", "7");
