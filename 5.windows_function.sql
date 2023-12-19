# For each ordernumber find the sim of quantityOrdered value

SELECT orderNumber,SUM(quantityOrdered) as Total
FROM orderdetails
GROUP BY orderNumber;

SELECT orderNumber, SUM(quantityOrdered) OVER()as TOTAL
FROM orderdetails;

SELECT orderNumber, sum(quantityOrdered) OVER(PARTITION BY orderNumber)As total
FROM orderdetails;

SELECT DISTINCT(orderNumber), sum(quantityOrdered) OVER(PARTITION BY orderNumber)As total
FROM orderdetails;

SELECT 
	orderNumber,
    quantityOrdered,
    ROW_NUMBER()OVER () AS "ROW_NUMBER",
    RANK() OVER(ORDER BY quantityOrdered DESC) As "Rank",
    DENSE_RANK() OVER(ORDER BY quantityOrdered DESC) As "DENSE rank"
FROM Orderdetails;

# GET the second highest quantity ordered value for each order number
SELECT * from(
			SELECT orderNumber, quantityOrdered,
            DENSE_Rank() OVER(PARTITION BY orderNumber ORDER BY quantityOrdered DESC) As rnk
            FROM orderdetails
            ) As Rankings
		WHERE rnk = 2;

SELECT 
	orderNumber, quantityOrdered,
    LAG(quantityOrdered,1) OVER(PARTITION BY orderNumber)AS "LAG",
    LEAD(quantityOrdered,1) OVER(PARTITION BY orderNumber)AS "LEAD",
    FIRST_VALUE(quantityOrdered) OVER(PARTITION BY orderNumber)AS "FIRST VALUE",
    LAST_VALUE(quantityOrdered) OVER(PARTITION BY orderNumber)AS "LAST VALUE",
    NTH_VALUE(quantityOrdered,2) OVER(PARTITION BY orderNumber)AS "Nth Value"
FROM orderdetails;

SELECT 
	YEAR(orderDate) AS Year,
    COUNT(orderNumber)As total_orders,
    CONCAT(round(((COUNT(orderNumber) - LAG(COUNT(orderNumber),1) OVER())/LAG(COUNT(orderNumber),1) OVER ())* 100),"%") As "% YoY Growth"
FROM Orders
GROUP BY Year;

# For each Year and each month calculated total orders placed
SELECT 
	YEAR(orderDate) AS Year,
    MONTHNAME(orderDate)As month_name,
    COUNT(orderNumber)As total_orders
From Orders
group by YEAR, month_name;

SELECT
	c.customerNumber,
    c.customerName,
   CONCAT(ROUND(SUM(od.priceEach * od.quantityordered)/1000),"K") as sales
FROM customers c
INNER JOIN Orders o USING(customerNumber)
INNER JOIN orderdetails od USING(orderNumber)
GROUP BY c.customerNumber
ORDER BY SUM(od.priceEach * od.quantityordered)DESC;




    