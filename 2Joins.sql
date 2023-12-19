create table EMP_joins(
emp_ID INT,
Name VARCHAR(100),
AGE INT
);
INSERT into EMP_joins
VALUES (1,"A",20),(2,"B",25),(3,"C",28),(4,"D",40);
Create table Dept_joins(
DID INT,
Dept_name varchar(100),
EID INT
);
INSERT INTO Dept_joins
values(101,"HR",3),(102,"Marketing",2),(103,"Finance",1);
-- Converting output of left join into inner join
SELECT emp.EMP_ID, emp.Name,dept.dept_name,dept.EID
FROM EMP_JOINS emp left join Dept_joins dept
ON emp.emp_ID = dept.EID
UNION
Select emp.EMP_ID, emp.Name, dept.DEPT_name, dept.EID
FROM EMP_joins emp RIGHT JOIN DEPT_joins dept
ON emp.EMP_ID = dept.EID;

-- Cross joins
create table Laptop(
Lap_name VARCHAR(100)
);
INSERT into Laptop
VALUES ("HP"),("Dell");
create table Colors(
col_name Varchar(100)
);
INSERT into colors
VALUES ("black"), ("white"),("silver");
select * from Laptop CROSS JOIN colors order by lap_name DESC;

-- -- Self join
CREATE table COMPANY(
EMP_ID INT,
NAME varchar(50),
Manager_ID int
);
INSERT INTO company
VALUES(1,"Rahul",NULL),
(2,"Kedar",3),
(3,"Meenakshi",4),
(4,"kanchan",5),
(5,"sakshi",1);
select * from company;

select
	T2.name As employee,
    T1.name as Manager
From Company T1 RIGHT JOIN Company T2
ON T1.EMP_ID = T2.Manager_ID;

SELECT
	c.customerNumber,
    c.customerName,
    CONCAT(ROUND(SUM(od.priceEach * od.quantityOrdered)/1000),"K") AS sales
FROM customers c
INNER JOIN Orders o ON o.customerNumber = c.customerNumber
INNER JOIN Orderdetails od ON od.orderNumber = o.orderNumber
GROUP BY c.customerNumber
Order By sales Desc;

-- INNER JOIN Orders o using customerNumber 
-- INNER JOIN Orderdetails od ON using orderNumber