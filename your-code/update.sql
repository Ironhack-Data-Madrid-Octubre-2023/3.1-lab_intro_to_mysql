SET SQL_SAFE_UPDATES = 0;


UPDATE Customer
SET cust_email = 'ppicasso@gmail.com'
WHERE cust_name = 'Pablo Picasso';

UPDATE Customer
SET cust_email = 'lamarr_hd@hollywood.com'
WHERE cust_name = 'Hedy Lamarr';

UPDATE Customer
SET cust_email = 'hola@nasa.gov'
WHERE cust_name = 'Katherine Johnson';


SET SQL_SAFE_UPDATES = 1;