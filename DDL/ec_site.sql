CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    total_amount NUMERIC(10, 2),
    created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    quantity INT NOT NULL
);

-- ダミーデータ挿入
INSERT INTO users (name, email) VALUES 
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com');

INSERT INTO products (name, price) VALUES 
('Laptop', 1000.00),
('Phone', 500.00);

INSERT INTO orders (user_id, total_amount) VALUES 
(1, 1500.00),
(2, 500.00);

INSERT INTO order_items (order_id, product_id, quantity) VALUES 
(1, 1, 1), -- AliceがLaptopを1個購入
(1, 2, 1), -- AliceがPhoneを1個購入
(2, 2, 1); -- BobがPhoneを1個購入