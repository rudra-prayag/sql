create table EMP_at(
emp_ID INT,
Name VARCHAR(100),
AGE INT
);
INSERT into EMP_at
VALUES (1,"Amir",20),(2,"Bakhya",25),(3,"Chitraa",28),(4,"Dravid",40);

Alter table emp_at ADD company VARCHAR(100);
Alter table emp_at ADD country VARCHAR(100) after emp_ID;
Alter table emp_at DROP country;
Alter table emp_at MODIFY company char(50);
Alter table emp_at modify emp_id int primary key auto_increment;

Alter table emp_at rename column name to EMP_name;
Alter table emp_at rename employees;
SET SQL_safe_updates = 0;
Update employees
set company = "TCS";