USE Master
go
DROP DATABASE IF EXISTS Assign3;
go
CREATE DATABASE Assign3;
go
USE Assign3;
go

DROP TABLE IF EXISTS Supplier;
--DROP TABLE Supplier;
CREATE TABLE Supplier
(
	SupplierID		CHAR(10)		NOT NULL PRIMARY KEY,
	SupplierName	VARCHAR(50)		NOT NULL,
	SupplierAddress	VARCHAR(255)	NOT NULL
);

DROP TABLE IF EXISTS A3DSensor;
--DROP TABLE A3DSensor;
CREATE TABLE A3DSensor
(
	A3DSensorID		CHAR(10)		NOT NULL PRIMARY KEY,
	Texture			VARCHAR(255)	NOT NULL,
	A3DVideo		VARCHAR(255)	NOT NULL,
	BodyShape		VARCHAR(255)	NOT NULL,
	SkeletalPoints	VARCHAR(255)	NOT NULL
);

DROP TABLE IF EXISTS Staff;
--DROP TABLE Staff;
CREATE TABLE Staff
(
	StaffID		CHAR(10)	NOT NULL PRIMARY KEY,
	Name		VARCHAR(50)	NOT NULL,
	Attribute	CHAR(10)	NOT NULL
);

DROP TABLE IF EXISTS Maintainer;
--DROP TABLE Maintainer;
CREATE TABLE Maintainer
(
	StaffID		CHAR(10)	NOT NULL PRIMARY KEY,
	Name		VARCHAR(50)	NOT NULL,
	Attribute	CHAR(10)	NOT NULL,
	FOREIGN KEY(StaffID) REFERENCES Staff(StaffID),
);

DROP TABLE IF EXISTS Maintenance;
--DROP TABLE Maintenance;
CREATE TABLE Maintenance
(
	MaintenanceID	CHAR(10)		NOT NULL PRIMARY KEY,
	Timestamp		TIMESTAMP		NOT NULL,
	Notes			VARCHAR(500)	NOT NULL,
	A3DSensorID		CHAR(10)		NOT NULL,
	FOREIGN KEY(A3DSensorID) REFERENCES A3DSensor(A3DSensorID),
	FOREIGN KEY(MaintenanceID) REFERENCES Staff(StaffID)
);

DROP TABLE IF EXISTS Part;
--DROP TABLE Part;
CREATE TABLE Part
(
	PartID			CHAR(10)	NOT NULL PRIMARY KEY,
	PartName		VARCHAR(50)	NOT NULL,
	SupplierID		CHAR(10)	NOT NULL,
	MaintenanceID	CHAR(10)	NOT NULL,
	FOREIGN KEY(SupplierID) REFERENCES Supplier(SupplierID),
	FOREIGN KEY(MaintenanceID) REFERENCES Maintenance(MaintenanceID)
);

DROP TABLE IF EXISTS Zone;
--DROP TABLE Zone;
CREATE TABLE Zone
(
	ZoneID	CHAR(10)	NOT NULL PRIMARY KEY
);

DROP TABLE IF EXISTS Location;
--DROP TABLE Location;
CREATE TABLE Location
(
	Altitude	decimal(19,19)	NOT NULL,
	Longitude	decimal(19,19)	NOT NULL,
	Latitude	decimal(19,19)	NOT NULL,
	Zoneid		CHAR(10)		NOT NULL,
	FOREIGN KEY(ZoneID)	REFERENCES Zone(ZoneID)
);

DROP TABLE IF EXISTS SalesPerson;
--DROP TABLE SalesPerson;
CREATE TABLE SalesPerson
(
	StaffID		CHAR(10)	NOT NULL PRIMARY KEY,
	Name		VARCHAR(50)	NOT NULL,
	Attribute	CHAR(10)	NOT NULL,
	Discount	CHAR(10)	NOT NULL,
	FOREIGN KEY(StaffID) REFERENCES Staff(StaffID),
);

DROP TABLE IF EXISTS AdministrativeExecutive;
--DROP TABLE AdministrativeExecutive;
CREATE TABLE AdministrativeExecutive
(
	StaffID		CHAR(10)	NOT NULL PRIMARY KEY,
	Name		VARCHAR(50)	NOT NULL,
	Attribute	CHAR(10)	NOT NULL,
	FOREIGN KEY(StaffID) REFERENCES Staff(StaffID),
);

DROP TABLE IF EXISTS Contracts;
--DROP TABLE Contracts;
CREATE TABLE Contracts
(
	ContractID		CHAR(10)	NOT NULL PRIMARY KEY,
	StartDate		DATE		NOT NULL,
	EndDate			DATE		NOT NULL,
	StaffID			CHAR(10)	NOT NULL,
	Admin_StaffID	CHAR(10)	NOT NULL,
	FOREIGN KEY(StaffID) REFERENCES Staff(StaffID),
	FOREIGN KEY(Admin_StaffID) REFERENCES AdministrativeExecutive(StaffID),
);

DROP TABLE IF EXISTS Subscriber;
--DROP TABLE Subscriber;
CREATE TABLE Subscriber
(
	CustomerID	CHAR(10)		NOT NULL PRIMARY KEY,
	ContractID	CHAR(10)		NOT NULL,
	Name		VARCHAR(50)		NOT NULL,
	Email		VARCHAR(50)		NOT NULL,
	Phone		CHAR(50)		NOT NULL,
	Address		VARCHAR(255)	NOT NULL,
	FOREIGN KEY(ContractID)	REFERENCES Contracts(ContractID)
);

DROP TABLE IF EXISTS Subscription;
--DROP TABLE Subscription;
CREATE TABLE Subscription
(
	SubscriptionID	CHAR(10)		NOT NULL PRIMARY KEY,
	Price			CHAR(10)		NOT NULL,
	Details			VARCHAR(255)	NOT NULL,
	Discount		CHAR(10)		NOT NULL,
	ContractID		CHAR(10)		NOT NULL,
	FOREIGN KEY(ContractID)	REFERENCES Contracts(ContractID)
);

DROP TABLE IF EXISTS DataStream;
--DROP TABLE DataStream;
CREATE TABLE DataStream
(
	HumanVoice			VARCHAR(255)	NOT NULL,
	SharedAudio			VARCHAR(255)	NOT NULL,
	OtherSourceAudio	VARCHAR(255)	NOT NULL,
	ZoneID				CHAR(10)		NOT NULL,
	A3DSensorID			CHAR(10)		NOT NULL,
	FOREIGN KEY(ZoneID) REFERENCES Zone(ZoneID),
	FOREIGN KEY(A3DSensorID) REFERENCES A3DSensor(A3DSensorID)
);

DROP TABLE IF EXISTS Live3DStream;
--DROP TABLE Live3DStream;
CREATE TABLE Live3DStream
(
	VideoID			CHAR(10)	NOT NULL PRIMARY KEY,
	Duration		CHAR(10)	NOT NULL,
	A3DSensorID		CHAR(10)	NOT NULL,
	FOREIGN KEY(A3DSensorID) REFERENCES A3DSensor(A3DSensorID)
);

DROP TABLE IF EXISTS Standards;
--DROP TABLE Standards;
CREATE TABLE Standards
(
	SubscriptionID	CHAR(10)		NOT NULL,
	Price			CHAR(10)		NOT NULL,
	Details			VARCHAR(255)	NOT NULL,
	Discount		CHAR(10)		NOT NULL,
	ContractID		CHAR(10)		NOT NULL,
	FOREIGN KEY(SubscriptionID)	REFERENCES Subscription(SubscriptionID),
	FOREIGN KEY(ContractID)	REFERENCES Contracts(ContractID)
);

DROP TABLE IF EXISTS Gold;
--DROP TABLE Gold;
CREATE TABLE Gold
(
	SubscriptionID	CHAR(10)		NOT NULL,
	Price			CHAR(10)		NOT NULL,
	Details			VARCHAR(255)	NOT NULL,
	Discount		CHAR(10)		NOT NULL,
	ContractID		CHAR(10)		NOT NULL,
	FOREIGN KEY(SubscriptionID)	REFERENCES Subscription(SubscriptionID),
	FOREIGN KEY(ContractID)	REFERENCES Contracts(ContractID)
);

DROP TABLE IF EXISTS Platinum;
--DROP TABLE Platinum;
CREATE TABLE Platinum
(
	SubscriptionID	CHAR(10)		NOT NULL,
	Price			CHAR(10)		NOT NULL,
	Details			VARCHAR(255)	NOT NULL,
	Discount		CHAR(10)		NOT NULL,
	ContractID		CHAR(10)		NOT NULL,
	FOREIGN KEY(SubscriptionID)	REFERENCES Subscription(SubscriptionID),
	FOREIGN KEY(ContractID)	REFERENCES Contracts(ContractID)
);

DROP TABLE IF EXISTS SuperPlatinum;
--DROP TABLE SuperPlatinum;
CREATE TABLE SuperPlatinum
(
	SubscriptionID	CHAR(10)		NOT NULL,
	Price			CHAR(10)		NOT NULL,
	Details			VARCHAR(255)	NOT NULL,
	Discount		CHAR(10)		NOT NULL,
	ContractID		CHAR(10)		NOT NULL,
	FOREIGN KEY(SubscriptionID)	REFERENCES Subscription(SubscriptionID),
	FOREIGN KEY(ContractID)	REFERENCES Contracts(ContractID)
);