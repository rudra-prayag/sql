select LOWER("INdian is my natioNality") as result;
select UPPER("INdian is my natioNality") as result;

select CONCAT("The population of India is ", 143, "crores") as result;

SELECT left("United states of America",13) As result;
SELECT right("United states of America",7) As result;

select CHAR_Length(" Indian ") as result;
select(" s angr    Prak") as result;
select(trim(" s angr    Prak")) as result;
select replace(" s angr    Prak"," ","") as result;
select replace(" United States of America","United States of America","USA") as result;
select substring("WWW.twitter.com",5) as result;

-- Find function in excel similar to locate
SELECT LOCATE(" ", "Prashanth R",5) as result;

SELECT SUBSTRING_INDEX("WWW.Twitter.com",".",-1);
SELECT SUBSTRING_INDEX("WWW.Twitter.com",".",-2);

SELECT
	"Prashanth Rajendran"As "Full name",
    SUBSTRING_INDEX("Prashanth Rajendran", " ",1)As "first Name",
    SUBSTRING_INDEX("Prashanth Rajendran", " ",-1)As "Last Name";

SELECT 
	SUBSTRING_INDEX(SUBSTRING_INDEX("Prashanth Rajendran nair", " ",1)," ",-1) As first_Name,
    SUBSTRING_INDEX(SUBSTRING_INDEX("Prashanth nair Rajendran", " ",2)," ",-1) As mid_name
    
-- Date functions
SELECT NOW() As result;
SELECT CURRENT_DATE() As result;
SELECT CURRENT_TIME() As result;
SELECT DATE("1991-08-12 00:00:00") As result;
SELECT YEAR(NOW()) As result;
SELECT MONTH(NOW()) As result;
SELECT monthname(NOW()) As result;
SELECT DAY(NOW()) As result;
SELECT DAYNAME(NOW()) As result;
SELECT WEEK(NOW()) As result;
SELECT CONCAT("WEEK ", WEEK(NOW())) As result;
SELECT DAYOFWEEK(NOW()) As result;
SELECT quarter(NOW()) as reuslt;
SELECT CONCAT("Q", quarter(NOW())) as reuslt;

SELECT DATE_FORMAT(NOW(),"%d-%m-%Y");
SELECT DATE_FORMAT(NOW(),"%d-%m-%Y %h:%I:%s %p") as result;
SELECT DATE_FORMAT(NOW(),"%M %Y")as result;
SELECT DATE_FORMAT(NOW(),"FY %Y")as result;

SELECT datediff("2023-06-15", "2023-02-10") as result;
SELECT timestampdiff(YEAR,"2023-02-10", "2033-06-15") as result;