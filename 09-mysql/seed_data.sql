INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Gadgets, cameras, and computers'),
('Home & Kitchen', 'Appliances and decor'),
('Fashion', 'Clothing, shoes, and accessories'),
('Books', 'Physical and digital reading material'),
('Sports', 'Fitness gear and outdoor equipment'),
('Beauty', 'Skincare and cosmetics'),
('Toys', 'Games and children toys'),
('Automotive', 'Car parts and accessories'),
('Pet Supplies', 'Food and toys for animals'),
('Grocery', 'Daily essentials and food');

INSERT INTO customers (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john.doe@email.com', '555-0101'),
('Jane', 'Smith', 'jane.smith@email.com', '555-0102'),
('Michael', 'Brown', 'm.brown@email.com', '555-0103'),
('Emily', 'Davis', 'emilyd@email.com', '555-0104'),
('Chris', 'Wilson', 'chris.w@email.com', '555-0105'),
('Sarah', 'Miller', 'sarah.m@email.com', '555-0106'),
('David', 'Moore', 'dmoore@email.com', '555-0107'),
('Jessica', 'Taylor', 'jtaylor@email.com', '555-0108'),
('Daniel', 'Anderson', 'dan.a@email.com', '555-0109'),
('Laura', 'Thomas', 'l.thomas@email.com', '555-0110');

INSERT INTO products (product_name, description, price, stock_quantity, category_id) VALUES
('Laptop Pro', '15-inch high performance laptop', 1200.00, 50, 1),
('Wireless Mouse', 'Ergonomic optical mouse', 25.50, 200, 1),
('Coffee Maker', '12-cup programmable brewer', 85.00, 45, 2),
('Cotton T-Shirt', 'Breathable organic cotton', 15.99, 500, 3),
('SQL Guide', 'Complete database reference book', 45.00, 120, 4),
('Yoga Mat', 'Non-slip eco-friendly mat', 30.00, 80, 5),
('Face Cream', 'Moisturizing night cream', 22.50, 150, 6),
('Building Blocks', '100-piece creative set', 35.00, 60, 7),
('Dog Leash', 'Heavy-duty 6ft leash', 12.00, 100, 9),
('Olive Oil', 'Extra virgin 500ml', 10.50, 300, 10);

INSERT INTO orders (customer_id, status, total_amount, shipping_address) VALUES
(1, 'delivered', 1225.50, '123 Pine St, NY'),
(2, 'shipped', 85.00, '456 Oak Rd, CA'),
(3, 'pending', 45.00, '789 Maple Ave, TX'),
(4, 'processing', 31.98, '101 Birch Ln, FL'),
(5, 'delivered', 1200.00, '202 Cedar St, WA'),
(6, 'cancelled', 30.00, '303 Elm Blvd, IL'),
(7, 'delivered', 135.50, '404 Walnut Dr, OH'),
(8, 'shipped', 22.50, '505 Spruce Ct, MI'),
(9, 'pending', 10.50, '606 Cherry Way, GA'),
(10, 'delivered', 47.00, '707 Aspen Pl, CO');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1200.00), (1, 2, 1, 25.50),
(2, 3, 1, 85.00),
(3, 5, 1, 45.00),
(4, 4, 2, 15.99),
(5, 1, 1, 1200.00),
(6, 6, 1, 30.00),
(7, 3, 1, 85.00), (7, 8, 1, 35.00), (7, 10, 1, 10.50),
(8, 7, 1, 22.50),
(9, 10, 1, 10.50),
(10, 9, 3, 12.00), (10, 10, 1, 11.00);