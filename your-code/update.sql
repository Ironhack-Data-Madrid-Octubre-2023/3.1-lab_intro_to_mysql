UPDATE cars.salesperson
SET Store = 'Miami'
WHERE id = 4;

UPDATE cars.customers
SET Email = 'ppicasso@gmail.com'
WHERE id = 0;

UPDATE cars.customers
SET Email = 'lamarr_hd@hollywood.com'
WHERE id = 1;

UPDATE cars.customers
SET Email = 'hello@nasa.gov'
WHERE id = 2;

-- I also saw that 'Viena' was written as 'Vienna'

UPDATE cars.customers
SET State_Province = 'Viena'
WHERE id = 1;