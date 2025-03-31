DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS donuts;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;


CREATE TABLE ingredients (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT,
    "type" TEXT,
    "price_per_unit" INTEGER
);

CREATE TABLE donuts (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT,
    "gluten_free" INTEGER,
    "price" INTEGER,
    "ingredient1_id" INTEGER,
    "ingredient2_id" INTEGER,
    "ingredient3_id" INTEGER,
    FOREIGN KEY (ingredient1_id) REFERENCES ingredients(id),
    FOREIGN KEY (ingredient2_id) REFERENCES ingredients(id),
    FOREIGN KEY (ingredient3_id) REFERENCES ingredients(id)
);


CREATE TABLE orders (
    "id" INTEGER PRIMARY KEY,
    "donuts_id" INTEGER,
    "customer_id" INTEGER,
    FOREIGN KEY (donuts_id) REFERENCES donuts(id),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);


CREATE TABLE customers (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT,
    "last_name" TEXT
);


