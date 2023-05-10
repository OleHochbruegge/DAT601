USE Master
go
DROP DATABASE IF EXISTS Assign1_SQL_23;
go
CREATE DATABASE Assign1_SQL_23;
go
USE Assign1_SQL_23;
go


DROP TABLE IF EXISTS Customer;
--DROP TABLE Customer;
CREATE TABLE Customer
(
	CustID		CHAR(10)	NOT NULL PRIMARY KEY,
	CustName	CHAR(50)	NOT NULL,
	CustAddress	CHAR(50)	,
	CustCity	CHAR(50)	,
	CustContact	CHAR(50)	,
	CustPhone	CHAR(15)	,
	CustEmail	CHAR(255)	
);

--DROP TABLE OrderEntry;
CREATE TABLE OrderEntry
(
	OrderID		INTEGER		NOT NULL PRIMARY KEY,
	OrderDate	DATETIME	NOT NULL,
	CustID		CHAR(10)	NOT NULL,
	FOREIGN KEY(CustID) REFERENCES Customer(CustID)
);

--DROP TABLE Vendor;
CREATE TABLE Vendor
(
	VendorID		CHAR(10)	NOT NULL PRIMARY KEY,
	VendorName		CHAR(50)	NOT NULL,
	VendorAddress	CHAR(50)	,
	VendorCity		CHAR(50)	,
	VendorPhone		CHAR(15)
);

--DROP TABLE Product;
CREATE TABLE Product
(
	ProductID		CHAR(10)	NOT NULL PRIMARY KEY,
	VendorID		CHAR(10)	NOT NULL,
	ProductName		CHAR(255)	NOT NULL,
	ProductPrice	DECIMAL(8,2)NOT NULL,
	ProductDesc		VARCHAR(100),
	FOREIGN KEY(VendorID) REFERENCES Vendor(VendorID)
);


--DROP TABLE OrderItem;
CREATE TABLE OrderItem
(
	OrderID		INTEGER		NOT NULL,
	OrderItem	INTEGER		NOT NULL,
	ProductID	CHAR(10)	NOT NULL,
	Quantity	INTEGER		NOT NULL,
	ItemPrice	DECIMAL(8,2)NOT NULL,
	PRIMARY KEY(OrderID, OrderItem),
	FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
	FOREIGN KEY(OrderID) REFERENCES OrderEntry(OrderID)
);
