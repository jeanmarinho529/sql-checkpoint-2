USE delivery;

-- INSERT NEW DATA IN TABLE STATUS
INSERT INTO status
VALUES 
(null, 'Ativo'),
(null, 'Em rota'),
(null, 'Cancelado'),
(null, 'Entregue'),
(null, 'bsdkldsakl');

-- INSERT NEW DATA IN TABLE VEHICLES
INSERT INTO vehicles
VALUES 
(null, 'Moto'),
(null, 'Carro'),
(null, 'Caminhão');

-- INSERT NEW DATA IN TABLE PRODUCTS 
INSERT INTO products
VALUES 
(null, 'Smart TV'),
(null, 'Vitrola'),
(null, 'Pendrive');

-- INSERT NEW DATA IN TABLE USERS 
INSERT INTO users
VALUES 
(null, 'Jean',  'jeanmarinho529@gmail.com', 'password'),
(null, 'store',  'store@gmail.com', 'password'),
(null, 'Driver',  'driver@gmail.com', 'password');


-- INSERT NEW DATA IN TABLE DRIVERS 
INSERT INTO drivers
VALUES 
(null, '00000000000',  '84996000000 ', (SELECT id FROM users where name = 'driver'), (SELECT id FROM status WHERE name = 'Ativo'), (SELECT id FROM vehicles limit 1));

-- INSERT NEW DATA IN TABLE STORES 
INSERT INTO stores
VALUES 
(null, '00000000000', 'New Store','newstore@gmail.com','84996000000 ', (SELECT id FROM users where name = 'store'), (SELECT id FROM status WHERE name = 'Ativo'));

-- INSERT NEW DATA IN TABLE ORDERS 
INSERT INTO orders 
VALUES 
(null, 'Test address', 'Marinho', '84996000000', (SELECT id FROM drivers LIMIT 1), (SELECT id FROM stores LIMIT 1), (SELECT id FROM status WHERE name = 'Entregue'));

-- INSERT NEW DATA IN TABLE ORDERS_X_PRODUCTS
INSERT INTO orders_x_products
VALUES
((SELECT id FROM orders LIMIT 1), (SELECT id FROM products LIMIT 1)),
((SELECT id FROM orders LIMIT 1), (SELECT id FROM products ORDER BY id DESC LIMIT 1));


-- DELETE STATUS bsdkldsakl
DELETE FROM status WHERE name = "bsdkldsakl";

-- UPDATE USERS Jean
UPDATE users SET name = "Jean Marinho" WHERE email = "jeanmarinho529@gmail.com";

-- SELECT WITH JOIN
SELECT orders.id, orders.address, orders.client_name, orders.client_phone,
stores.name AS store_name, status.name AS status_name
FROM orders
INNER JOIN stores ON stores.id = orders.store_id
INNER JOIN status ON status.id = orders.status_id;
