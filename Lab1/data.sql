INSERT INTO dining_table (table_number, seats)
VALUES
    (1, 2),
    (2, 4),
    (3, 6);

INSERT INTO employee (full_name, position)
VALUES
    ('Анна Смирнова', 'Официант'),
    ('Иван Петров', 'Официант');

INSERT INTO menu_category (category_name)
VALUES
    ('Салаты'),
    ('Горячие блюда'),
    ('Напитки');

INSERT INTO dish (category_id, name, price)
VALUES
    (1, 'Салат овощной', 390.00),
    (1, 'Салат Цезарь', 520.00),
    (2, 'Борщ', 450.00),
    (2, 'Паста с грибами', 680.00),
    (3, 'Чай', 180.00);

INSERT INTO restaurant_order (table_id, employee_id, status)
VALUES
    (1, 1, 'OPEN'),
    (2, 2, 'PAID'),
    (1, 1, 'PAID');

INSERT INTO order_item (order_id, dish_id, quantity, unit_price)
VALUES
    (1, 1, 1, 390.00),
    (1, 5, 2, 180.00),
    (2, 3, 1, 450.00),
    (3, 4, 1, 680.00);
