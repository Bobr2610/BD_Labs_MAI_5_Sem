CREATE TABLE dining_table (
    table_id      bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    table_number  integer NOT NULL UNIQUE,
    seats         integer NOT NULL CHECK (seats > 0)
);

CREATE TABLE employee (
    employee_id  bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name    text NOT NULL,
    position     text NOT NULL,
    active       boolean NOT NULL DEFAULT true
);

CREATE TABLE menu_category (
    category_id    bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_name  text NOT NULL UNIQUE
);

CREATE TABLE dish (
    dish_id      bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_id  bigint NOT NULL
    REFERENCES menu_category (category_id) ON DELETE RESTRICT,
    name         text NOT NULL,
    price        numeric(10, 2) NOT NULL CHECK (price >= 0),
    available    boolean NOT NULL DEFAULT true,
    UNIQUE (category_id, name)
);

CREATE TABLE restaurant_order (
    order_id     bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    table_id     bigint NOT NULL
    REFERENCES dining_table (table_id) ON DELETE RESTRICT,
    employee_id  bigint NOT NULL
    REFERENCES employee (employee_id) ON DELETE RESTRICT,
    status       text NOT NULL DEFAULT 'OPEN'
    CHECK (status IN ('OPEN', 'PAID', 'CANCELLED')),
    created_at   timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE order_item (
    order_id     bigint NOT NULL
    REFERENCES restaurant_order (order_id) ON DELETE CASCADE,
    dish_id      bigint NOT NULL
    REFERENCES dish (dish_id) ON DELETE RESTRICT,
    quantity     integer NOT NULL CHECK (quantity > 0),
    unit_price   numeric(10, 2) NOT NULL CHECK (unit_price >= 0),
    PRIMARY KEY (order_id, dish_id)
);
