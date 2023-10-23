UPDATE salespersons
SET store = 'Miami'
WHERE store = 'Mimia';

UPDATE salespersons
SET store = 'Miami'
WHERE store = 'Mimia';

UPDATE customers
SET email = 
    CASE 
        WHEN name = 'Pablo Picasso' THEN 'ppicasso@gmail.com'
        WHEN name = 'Hedy Lamarr' THEN 'lamarr_hd@hollywood.com'
        WHEN name = 'Katherine Johnson' THEN 'hello@nasa.gov'
    END
WHERE name IN ('Pablo Picasso', 'Hedy Lamarr', 'Katherine Johnson');