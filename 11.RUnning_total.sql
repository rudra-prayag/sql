CREATE TABLE Orders(
Order_date DATE,
Sales INT
);
INSERT INTO Orders
VALUES ("2023-12-11",508),("2023-12-12",56),("2023-12-13",356),("2023-12-14",564),("2023-12-15",568),("2023-12-16",664),("2023-12-17",64),
("2023-12-18",56);
# last 3 days sales including todays date
select * from Orders 
where order_date > CURRENT_date()- INTERVAL 3 day;
# last 3 days sales excluding todays date
select * from Orders 
where order_date>CURRENT_date()- INTERVAL 4 day AND order_date <> CURRENT_date;
# total sales in last 3 days
select SUM(sales) as total FROM orders
where order_date > CURRENT_date()- INTERVAL 4 day AND order_date <> CURRENT_date;
