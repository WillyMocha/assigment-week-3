/*SQL Query #1 */
CREATE TABLE test(testID int PRIMARY KEY, TestName varchar(50));

INSERT INTO employees Values(1703, "M Ilham", "Willy", "x2313", "willymilham28@gmail.com", "5", 1621, "Programmer");
UPDATE employees SET jobTitle = "Fullstack Programmer" WHERE employeeNumber = 1703;
DELETE FROM employees WHERE employeeNumber = 1703;

SELECT * FROM employees WHERE officeCode  = 5;

SELECT products.productCode , products.productName , products.productLine , orderdetails.quantityOrdered FROM products INNER JOIN orderdetails ON orderdetails.productCode = products.productCode;
SELECT customers.customerNumber, orders.customerNumber, customerName, orderNumber FROM customers , orders WHERE customers.customerNumber = orders.customerNumber ORDER BY orderNumber;
SELECT customers.customerNumber, orders.customerNumber, customerName, orderNumber FROM customers INNER JOIN orders ON customers.customerNumber =  orders.customerNumber ORDER BY orderNumber;

SELECT AVG(buyPrice) AS Average_price FROM products;
SELECT COUNT(customerNumber) AS Total_customers FROM customers;
SELECT MAX(buyPrice) AS Most_expensive FROM products;
SELECT MIN(buyPrice) AS Cheapest FROM products;
SELECT SUM(amount) AS Total_income FROM payments WHERE paymentDate LIKE '2003-12-%';
SELECT customerNumber,SUM(amount) FROM payments GROUP BY customerNumber;
SELECT customerNumber,SUM(amount) FROM payments WHERE customerNumber = 363 OR customerNumber = 128 GROUP BY customerNumber HAVING SUM(amount)>50;

CREATE TEMPORARY TABLE test_temp (testID int, TestName VARCHAR(50));

SELECT c.customerNumber, c.customerName FROM customers AS c;
SELECT customerNumber AS cNum, customerName AS cName FROM customers;
SELECT cus.customerNumber, cus.customerName, cus.city, cus.state, cus.country, cus.creditLimit FROM customers AS cus;
SELECT customerNumber AS "Customer ID", customerName AS "Customer Name", phone AS "Phone" FROM customers;

SELECT * FROM orders WHERE orderNumber = 10100;
SELECT * FROM products WHERE productDescription like 'Features%';
SELECT * FROM products WHERE productName like '%A_ton';

SELECT productCode, productName, buyPrice, buyPrice*1.1 AS Plus10Percent FROM products;


/*SQL Query #2 */
SELECT  firstName, lastName from employees;
UPDATE customers SET creditLimit = creditLimit * 1.05 WHERE creditLimit < 20000;

SELECT * FROM customers;
SELECT customerNumber, contactFirstName, contactLastName, creditLimit FROM customers;
SELECT orderNumber, status, comments, FLOOR(DATEDIFF('2003-01-01', orderDate) / 365) YoS from orders;

SELECT customerNumber, contactFirstName, contactLastName, phone FROM customers ORDER BY contactFirstName;

SELECT employeeNumber, firstName, lastName, officeCode FROM employees WHERE officeCode = 5 ORDER BY firstName;

SELECT e.employeeNumber, e.firstName, e.lastName, e.officeCode, o.city FROM employees e INNER JOIN offices o ON o.officeCode = e.officeCode ORDER BY firstName;

SELECT c.customerNumber, c.customerName, AVG(creditLimit) FROM customers c INNER JOIN payments p  ON p.customerNumber = c.customerNumber GROUP BY c.customerNumber;

/* Indexing */
SELECT * FROM orders WHERE status = 'Shipped';
CREATE INDEX status_name ON orders(status);
EXPLAIN SELECT * FROM orders WHERE status = 'Shipped';
