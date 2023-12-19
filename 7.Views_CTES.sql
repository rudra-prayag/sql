CREATE VIEW TERRITORY_status AS
	SELECT territory, COUNT(employeeNumber) as "No of Employees"
    FROM offices
    INNER JOIN EMPLOYEES USING(officecode)
GROUP BY territory
ORDER BY "No of Employees" DESC;

Select * from TERRITORY_status;

-- year wise total orders
CREATE VIEW Total_orders AS
	SELECT 
		year(orderDate) as year,
        COUNT(orderNumber)as total
	FROM Orders
    GROUP BY Year;

ALTER VIEW Total_orders as
	SELECT 
		year(orderDate) as year,
        monthname(orderDate) as month,
        COUNT(orderNumber) as total
	FROM Orders
    GROUP BY Year, month;

DROP VIEW Total_orders;
