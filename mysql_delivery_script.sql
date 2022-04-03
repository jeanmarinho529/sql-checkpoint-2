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

-- SELECT DRIVERS
SELECT * FROM users WHERE name = "driver";