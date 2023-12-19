SELECT  
country, 
Round(AVG(creditlimit)) as AVG_credit,
CASE
	WHEN ROUND(AVG(creditlimit)) > 75000 THEN "HIGH"
    WHEN ROUND(AVG(creditlimit)) BETWEEN 25000 AND 75000 THEN "MEIDUM"
    ELSE "LOW"
END as Status
FROM customers
GROUP BY country
ORDER BY AVG_credit DESC;