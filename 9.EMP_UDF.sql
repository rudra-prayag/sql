CREATE TABLE emp_udf (
    Emp_ID INT auto_increment primary key,
    Name VARCHAR(50),
    DOB DATE
);
INSERT INTO Emp_UDF(Name, DOB)
VALUES 
("Piyush", "1990-03-30"), 
("Aman", "1992-08-15"), 
("Meena", "1998-07-28"), 
("Ketan", "2000-11-21"), 
("Sanjay", "1995-05-21");

delimiter //
create function Calculate_age(DOB date)
returns varchar(100)
deterministic
begin
 return concat(
		timestampdiff(year, DOB, now()),
        " years ",
        timestampdiff(month, DOB, now())%12,
        " months "
        );
end//
select *,
calculate_age(DOB) as Age FROM EMP_UDF; 
