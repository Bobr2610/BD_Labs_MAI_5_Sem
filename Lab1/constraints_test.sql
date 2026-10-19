\set ON_ERROR_STOP off

\echo 'Expected rejection: duplicate table number (UNIQUE)'
INSERT INTO dining_table (table_number, seats)
VALUES (1, 3);

\echo 'Expected rejection: duplicate dish within category (UNIQUE)'
INSERT INTO dish (category_id, name, price)
SELECT category_id, name, 500.00
FROM dish
WHERE dish_id = 2;

\echo 'Expected rejection: negative dish price (CHECK)'
INSERT INTO dish (category_id, name, price)
VALUES (3, 'Lemonade', -10.00);

\echo 'Expected rejection: non-positive quantity (CHECK)'
INSERT INTO order_item (order_id, dish_id, quantity, unit_price)
VALUES (1, 3, 0, 450.00);

\echo 'Expected rejection: employee does not exist (FOREIGN KEY)'
INSERT INTO restaurant_order (table_id, employee_id, status)
VALUES (1, 9999, 'OPEN');

\echo 'Expected rejection: employee name is required (NOT NULL)'
INSERT INTO employee (full_name, position)
VALUES (NULL, 'Waiter');

\echo 'Expected rejection: duplicate order and dish pair (PRIMARY KEY)'
INSERT INTO order_item (order_id, dish_id, quantity, unit_price)
VALUES (1, 1, 2, 390.00);

\echo 'Expected rejection: seats must be positive (CHECK)'
UPDATE dining_table
SET seats = 0
WHERE table_id = 1;

\echo 'Expected rejection: unsupported order status (CHECK)'
UPDATE restaurant_order
SET status = 'SERVED'
WHERE order_id = 1;

\echo 'Expected rejection: dish does not exist (FOREIGN KEY)'
UPDATE order_item
SET dish_id = 9999
WHERE order_id = 1 AND dish_id = 1;
