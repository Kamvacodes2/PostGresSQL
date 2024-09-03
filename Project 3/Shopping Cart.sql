-- products table
CREATE TABLE products (
	productId bigserial PRIMARY KEY,
	productName varchar(50) NOT NULL,
	price decimal(10,2) NOT NULL
);

-- cart table
CREATE TABLE cart (
	productId bigint PRIMARY KEY references products(productId),
	Qty int NOT NULL CHECK (Qty > 0)
);

-- users table
CREATE TABLE users_table (
	userId bigserial PRIMARY KEY,
	userName varchar(50) NOT NULL
);

-- orderheader table
CREATE TABLE orderheader (
	orderId bigserial PRIMARY KEY,
	userId bigint NOT NULL references users_table(userId),
	orderDate timestamp NOT NULL DEFAULT NOW()
);

-- orderDetails table
CREATE TABLE orderDetails (
	orderHeadId bigint NOT NULL references orderheader(orderId),
	productId bigint NOT NULL references products(productId),
	Qty int NOT NULL CHECK (Qty > 0),
	PRIMARY KEY (orderHeadId, productId)
);


-- INSERT VALUES

-- INTSERT PRODUCTS MENU

INSERT INTO products (productName, price)
VALUES
    ('Nike SB Dunk Low Pro Tokyo', 35000.00),
    ('PlayStation x Nike Air Force 1', 5000.00);

SELECT * FROM products;

--- INSERT INTO CART
INSERT INTO cart (productId, Qty )
VALUES 
(1, 3),
(2, 5);


-- USERS TABLE

INSERT INTO users_table (userName) 
VALUES 
('Akira'),
('Precious');

SELECT * FROM users_table;

-- insert orderhead info

INSERT INTO orderheader (userId)
VALUES 
(1); 

INSERT INTO orderheader (userId)
VALUES 
(2); 

SELECT * FROM orderheader;


-- -- Add a product with IF EXISTS 
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM cart WHERE productId = 1) THEN
        UPDATE cart SET Qty = Qty + 1 WHERE productId = 1;
    ELSE
        INSERT INTO cart (productId, Qty) VALUES (1, 1);
    END IF;
END $$

-- Add another product with IF EXISTS logic
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM cart WHERE productId = 2) THEN
        UPDATE cart SET Qty = Qty + 1 WHERE productId = 2;
    ELSE
        INSERT INTO cart (productId, Qty) VALUES (2, 1);
    END IF;
END $$;

SELECT * FROM cart;


-- Remove an Item from the Cart

DO $$
BEGIN
    IF (SELECT Qty FROM cart WHERE productId = 1) > 1 THEN
        UPDATE cart SET Qty = Qty - 1 WHERE productId = 1;
    ELSE
        DELETE FROM cart WHERE productId = 1;
    END IF;
END $$;

DO $$
BEGIN
    IF (SELECT Qty FROM cart WHERE productId = 2) > 1 THEN
        UPDATE cart SET Qty = Qty - 1 WHERE productId = 2;
    ELSE
        DELETE FROM cart WHERE productId = 2;
    END IF;
END $$;

SELECT * FROM cart;

-- Checkout to Place the Order

-- Insert cart contents into orderDetails
INSERT INTO orderDetails (orderHeadId, productId, Qty)
SELECT (SELECT MAX(orderId) FROM orderheader), productId, Qty
FROM cart;

SELECT * FROM orderDetails;
--  Delete Cart Contents After Checkout:

-- Delete cart contents after checkout
DELETE FROM cart;


-- Adding Multiple Products to the Cart:

-- Add "Nike SB Dunk Low Pro Tokyo" (productId = 1) again
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM cart WHERE productId = 1) THEN
        UPDATE cart SET Qty = Qty + 1 WHERE productId = 1;
    ELSE
        INSERT INTO cart (productId, Qty) VALUES (1, 1);
    END IF;
END $$;

-- Select to verify
SELECT * FROM cart;

-- Removing Products from the Cart:

-- Remove "PlayStation x Nike Air Force 1" (productId = 2)
DO $$
BEGIN
    IF (SELECT Qty FROM cart WHERE productId = 2) > 1 THEN
        UPDATE cart SET Qty = Qty - 1 WHERE productId = 2;
    ELSE
        DELETE FROM cart WHERE productId = 2;
    END IF;
END $$;

-- Select to verify
SELECT * FROM cart;

SELECT * FROM orderheader;
SELECT * FROM orderDetails;
