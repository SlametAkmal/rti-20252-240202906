-- CREATE

INSERT INTO products(product_name,category,price,stock)
VALUES
('Laptop ASUS','Laptop',8500000,15);

-------------------------------------------------

-- READ

SELECT *
FROM products
WHERE category='Laptop';

-------------------------------------------------

-- UPDATE

UPDATE products
SET stock=20
WHERE id=1;

-------------------------------------------------

-- DELETE

DELETE
FROM products
WHERE id=1;