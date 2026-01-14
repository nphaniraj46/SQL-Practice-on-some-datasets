CREATE DATABASE company_db;
USE company_db;

CREATE TABLE customers1 (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);


INSERT INTO customers1 VALUES
(1, 'Ravi', 'Hyderabad'),
(2, 'Neha', 'Chennai'),
(3, 'Aman', 'Delhi'),
(4, 'Sita', 'Mumbai');


CREATE TABLE orders12 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount INT
);


INSERT INTO orders12 VALUES
(101, 1, 500),
(102, 1, 300),
(103, 2, 700),
(104, 3, 400),
(105, 1, 200),
(106, 5, 600);  -- invalid customer_id on purpose


CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_mode VARCHAR(20)
);


INSERT INTO payments VALUES
(1, 101, 'UPI'),
(2, 102, 'Card'),
(3, 103, 'UPI'),
(4, 105, 'Cash'),
(5, 106, 'Card');


select * from customers1;
select * from orders12;
select * from payments;

select c.name,o.order_id,p.payment_mode from customers1 c inner join orders12 o on c.customer_id=o.customer_id inner join payments p on 
o.order_id=p.order_id;

select c.name,o.order_id,p.payment_mode from customers1 c right join orders12 o on c.customer_id=o.customer_id right join payments p on 
o.order_id=p.order_id;