--challenge #1--
SELECT ic.firstName AS employee_first_name, 
  ic.lastName AS employee_last_name, 
  m.firstName AS manager_first_name,
  m.lastName AS manager_last_name
FROM employee ic 
INNER JOIN employee m 
  ON ic.managerId=m.employeeId;

--challenge #2--
SELECT emp.firstName,
  emp.lastName
FROM employee emp
LEFT JOIN sales 
  ON sales.employeeId = emp.employeeId
WHERE emp.title = 'Sales Person'
AND sales.salesId IS NULL;

--challenge #3--
SELECT cus.firstName, cus.lastName, cus.email, sls.salesAmount, sls.soldDate
FROM customer cus
INNER JOIN sales sls
  ON cus.customerId = sls.customerId
UNION
SELECT cus.firstName, cus.lastName, cus.email, sls.salesAmount, sls.soldDate
FROM customer cus
LEFT JOIN sales sls 
  ON cus.customerId = sls.customerId
WHERE sls.salesId IS NULL
UNION
SELECT cus.firstName, cus.lastName, cus.email, sls.salesAmount, sls.soldDate
FROM sales sls 
LEFT JOIN customer cus 
 ON cus.customerId = sls.customerId
WHERE cus.customerId IS NULL;

