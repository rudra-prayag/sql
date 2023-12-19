# show the order number for which the quantityOrdered value is the highest

select orderNumber, quantityOrdered from orderdetails
ORDER BY quantityOrdered DESC
LIMIT 1;

select orderNumber, quantityOrdered 
from orderdetails
where quantityOrdered = 
	(select Max(quantityOrdered) from orderdetails);
    
# show the orderNUmber for which the quantityOrdered value is the least
select orderNumber, quantityOrdered 
from orderdetails
where quantityOrdered = 
	(select min(quantityOrdered) from orderdetails);
    
# show the orderNUmbers for which the quantityOrdered value is the more than the average quantityOrdered values
select orderNumber, quantityOrdered 
from orderdetails
where quantityOrdered > (select avg(quantityOrdered) from orderdetails);

# show the customers who didn't place orders
SELECT customerNumber, customerName
FROM customers
where customerNumber NOT IN (select customerNumber FROM orders);

# show the max, min and avg value of total product placed under each order number
SELECT MAX(items), MIN(items), avg(items)
FROM (
		select orderNumber, COUNT(productCode) as Items
        FROM orderdetails
        GROUP BY orderNumber
        ) as Agg_orders;
        
# Show the avg value of number of customers present in each country
SELECT AVG(TOTAL)
FROM(
	SELECT country, COUNT(customerNumber) As total
    FROM customers
    GROUP BY COUNTRY
    ) as CountryWiseCustomers;

# conditional column
SELECT c.customerNumber, 
		c.customerName, 
		COUNT(o.orderNumber) as total_orders,
CASE
	When COUNT(o.orderNumber) > 5 THEN "Frequent"
    ELSE "NOT FREQUENT"
    END AS status
FROM customers C INNER JOIN Orders O
ON c.customerNumber = o.customerNumber
GROUP BY c.customerNumber;
    
# given the status as frequent and non-frequent to customers who placed the orders and count how many frequent and non frequent values

SELECT status, count(status) As count
FROM (
	SELECT c.customerNumber, 
		c.customerName, 
		COUNT(o.orderNumber) as total_orders,
	CASE
	When COUNT(o.orderNumber) > 5 THEN "Frequent"
    ELSE "NOT FREQUENT"
    END AS status
	FROM customers C INNER JOIN Orders O
	ON c.customerNumber = o.customerNumber
	GROUP BY c.customerNumber
    ) as table1
    Group By status
    Order BY count;

