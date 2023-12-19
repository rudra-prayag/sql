-- TCL (Transaction control language) for undoing the action of insert, update and delete

create table EMP_TCL(
emp_ID INT,
Name VARCHAR(100),
AGE INT
);
-- start transactions for undoing
START TRANSACTION;
INSERT into EMP_TCL
VALUES (101,"Amir",20),(102,"Bakhya",25),(103,"Chitraa",28),(104,"Dravid",40);
SAVEPOINT test_insert;

-- use primary key in where clause
UPDATE EMP_TCL
SET age=32
where emp_ID = 102;
savepoint test_update;

delete from emp_tcl
where emp_ID = 104;
savepoint test_delete;

Rollback to test_update;
commit;