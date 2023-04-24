-- Exercise 01

SELECT first_name, last_name, line1, 
	city, state, zip_code
FROM customers c JOIN addresses a
	ON c.customer_id = a.customer_id
WHERE shipping_address_id = address_id;

-- Exercise 02

SELECT last_name, first_name, 
	order_date, product_name, 
    item_price, discount_amount, quantity
FROM customers c JOIN orders o 
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON o.order_id = oi.order_id
JOIN products p
	ON oi.product_id = p.product_id
ORDER BY last_name, order_date, product_name;

-- Exercise 03

SELECT p1.product_name, p1.list_price
FROM products p1 JOIN products p2
	ON p1.product_id != p2.product_id AND
    p1.list_price = p2.list_price
ORDER BY product_name;

-- Exercise 04

SELECT category_name, product_id
FROM categories c LEFT JOIN products p
	ON c.category_id = p.category_id
WHERE p.product_id IS null;

-- Exercise 05

SELECT "Shipped" AS ship_status, order_id, order_date
FROM orders
WHERE ship_date IS NOT NULL
UNION
SELECT "Not Shipped" AS ship_status, order_id, order_date
FROM orders
WHERE ship_date IS null 
ORDER BY order_date;
