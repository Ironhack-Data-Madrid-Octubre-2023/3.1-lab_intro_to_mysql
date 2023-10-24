USE coches;
SELECT *
FROM salespersons;

UPDATE salespersons
SET store = 'Miami'
WHERE idsalesperson = 4;


SELECT *
FROM customers;

UPDATE customers
SET email = 'ppicasso@gmail.com' WHERE idcustomers = 0;
UPDATE customers
SET email = 'lamarr_hd@hollywood.com' WHERE idcustomers = 1;
UPDATE customers
SET email = 'hello@nasa.gov' WHERE idcustomers = 2;

