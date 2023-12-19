-- ●	State should not contain null values
select customernumber, customername, state, creditlimit 
from customers
where state is not null
order by creditlimit desc;

-- Do not place any orders - handling null
SELECT c.customernumber, c.customerName
FROM customers AS c
LEFT JOIN orders AS o ON c.customernumber = o.customernumber
WHERE o.orderNumber IS NULL;

SELECT customerNumber, customerName
FROM customers
WHERE customerNumber NOT IN (SELECT customerNumber FROM orders);

WITH USA_Customers as
(SELECT customerNumber, customerName, country
FROM Customers
WHERE country = "USA")
SELECT * FROM USA_Customers;

-- CTE's
WITH 2003_orders AS
(SELECT customerNumber, orderNumber, orderDate
FROM Orders
WHERE YEAR(orderDate) = 2003
)
select * from 2003_orders;
-- CTE's
WITH 2003_orders AS
(SELECT customerNumber, orderNumber, orderDate
FROM Orders
WHERE YEAR(orderDate) = 2003
)
SELECT customerNumber, customerName, country, COUNT(orderNumber) AS total_orders
FROM USA_Customers INNER JOIN 2003_orders using (customerNumber)
GROUP By customerNumber;
 
 -- CTE's
WITH USA_Customers as
(SELECT customerNumber, customerName, country
FROM Customers
WHERE country = "USA"),
2003_orders AS
(SELECT customerNumber, orderNumber, orderDate
FROM Orders
WHERE YEAR(orderDate) = 2003
)
SELECT customerNumber, customerName, country, COUNT(orderNumber) AS total_orders
FROM USA_Customers INNER JOIN 2003_orders using (customerNumber)
GROUP By customerNumber;

