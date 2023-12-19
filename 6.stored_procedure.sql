DELIMITER //
CREATE PROCEDURE GetCustomers()
BEGIN
SELECT customerNumber, customerName, country
From Customers
WHERE COUNTRY IN ("Australia", "UK")
ORDER BY country;

END //

CALL GetCustomers; # To see the data from procedure
DROP procedure GetCustomers;

-- with parameters
DELIMITER //
CREATE PROCEDURE GetCustomers1(IN Param_country VARCHAR (100))
BEGIN
SELECT customerNumber, customerName, country
FROM customers
where country = Param_country;

END //
CALL GetCustomers1("Russia");
CALL GetCustomers1("USA");
CALL GetCustomers1("Philippines");
DROP PROCEDURE GetCustomers1;

-- with more than 1 parameter
CREATE PROCEDURE GetCustomers2(IN P1 VARCHAR (100), IN P2 VARCHAR(100), IN P3 VARCHAR(100))
BEGIN
	SELECT customerNumber, customerName, country
    From customers
    where country IN (P1,P2,P3)
    ORDER BY country;
END //
CALL GetCustomers2("Russia", "Singapore", "");
DROP Procedure GetCustomers2;

DELIMITER //

CREATE PROCEDURE GetStatus(IN p_custno INT, OUT p_status VARCHAR(100))
BEGIN
    DECLARE X DECIMAL;

    SELECT creditLimit INTO X
    FROM customers
    WHERE customerNumber = p_custno;

    IF X > 100000 THEN
        SET p_status = 'Platinum';
    ELSEIF X BETWEEN 25000 AND 100000 THEN
        SET p_status = 'Gold';
    ELSE
        SET p_status = 'Silver';
    END IF;

END //

DELIMITER ;

-- session variable @
CALL GetStatus(141,@prasi);
SELECT @prasi as status;

-- INOUT parameters used in loops
DELIMITER //
CREATE PROCEDURE Set_Counter(INOUT X INT, IN Y INT)
BEGIN

SET X = X+Y;

END //

SET @abc = 5;
CALL Set_Counter(@abc, 0);
SELECT @abc As output;

CALL Set_Counter(@abc, 3);
SELECT @abc As output;

CALL Set_Counter(@abc, 4);
SELECT @abc As output;

