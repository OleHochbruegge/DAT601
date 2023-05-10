--Assessment 1 part 2
use Assign1_SQL_23;
go
--1. List all product names in alphabetical order (ORDER BY)
select ProductName
from Product
order by ProductName asc;
--2. List the product ID, name and price of all products in price and alphabetical name order (ORDER BY)
select ProductID, format(ProductPrice,'N4')as ProductPrice, ProductName
from Product
order by ProductPrice asc,
		ProductName asc;
--3. List the product ID, name and price of all products from highest to lowest price and in alphabetical name order (ORDER BY, DESC)
select ProductID, format(ProductPrice,'N4')as ProductPrice, ProductName 
from Product
order by ProductPrice desc,
ProductName asc;
--4. List all the products that cost $3.49 (WHERE, =)
select ProductName, format(ProductPrice,'N4')as ProductPrice
from Product
where ProductPrice = $3.49;
--5. List all products that cost less than $10.00 (WHERE, <)
select ProductName, format(ProductPrice,'N4')as ProductPrice
from Product
where ProductPrice < $10.00;
--6. List all products not made by vendor DLL01 (WHERE, <>)
select ProductID, ProductName
from Product
where VendorID != 'DLL01';
--7. List all the products with a price between $5.00 and $10.00 (WHERE, BETWEEN)
select ProductName, format(ProductPrice,'N4')as ProductPrice
from Product
where ProductPrice between $5.00 and $10.00;
--8. List any products made by either vendor DLL01 or vendor BRS01 costing $10.00 or greater (where, or, and, also look at order of evaluation using parenthesis)
select ProductName, format(ProductPrice,'N4')as ProductPrice
from Product
where (VendorID = 'DLL01' or VendorID = 'BRS01') and ProductPrice >= $10.00;
--9. Return the average price of all the products in the Products table (AVG)
select format(avg(ProductPrice),'N4') as AveragePrice
from product
--10. Return the total number of customers in the Customers table (COUNT (*), AS result name)
select count(*)as TotalCustomers 
from Customer;
--11. Return the number of customers in the Customers table with an e-mail address (COUNT (column name))
select count(CustEmail)as TotalCustomerEmail 
from Customer;
--12. Return the number of product types, minimum, maximum and average product price from the products table
select count(ProductName)as TotalProducts, format(min(ProductPrice),'N4')as MinimumPrice,format(max(ProductPrice),'N4')as MaximumPrice, format(avg(ProductPrice),'N4')as AveragePrice
from Product;
--13. Joins: Return the vendor name, product price and product name from the vendors and products tables (JOIN or WHERE tablename.columnname, =)
select VendorName, ProductName,format(ProductPrice,'N4')as ProductPrice
from Vendor, Product
--14. Return the product name, vendor name, product price and quantity for each item in order number 20007 (JOIN or WHERE tablename.columnname, =, AND)

--15. Create a list of all the customers (customer name and customer contact) who ordered item RGAN01

--16. Display the total number of orders placed by every customer in the Customers table, as well as the city the customer is in
--Retrieve the list of customers from the customers table
--For each customer retrieved, count the number of associated orders in the Orders treble

--17. Create a report on all the customers in Nelson and Wellington. You also should include all Fun4All locations, regardless of city. The resulting customers should be in alphabetical order of customer name then customer contact (WHERE, IN(), UNION, ORDER BY)

--18. Create a view called vProductCustomer which joins the Customer, Order and OrderItem tables to return a list of all customers who have ordered any product (CREATE VIEW, AS)

--19. Add a customer to the database:
-- -CustID = 1000000006
-- -CustName = The Toy Emporium
-- -CustPhone = 09-546-8552
--Using a view to format mailing list data:
-- - First create a query that will display the customer name and then the address in the following format:
--CustName Customer address City/town, Phone number
-- - Next turn this query into a view called vCustomerMailingLabel
-- - Display all the “entries” in vCustomerMailingLabel

