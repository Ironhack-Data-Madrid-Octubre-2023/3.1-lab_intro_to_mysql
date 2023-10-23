-- Update the Salespersons table to correct the spelling error for Paige Turner
UPDATE Salespersons
SET Store = 'Miami'
WHERE Name = 'Paige Turner';

-- Add email addresses to the Customers table
UPDATE Customers
SET Email = 'ppicasso@gmail.com'
WHERE Name = 'Pablo Picasso';

UPDATE Customers
SET Email = 'lamarr_hd@hollywood.com'
WHERE Name = 'Hedy Lamarr';

UPDATE Customers
SET Email = 'hello@nasa.gov'
WHERE Name = 'Katherine Johnson';
