/*EXTRA PROBLEMS*/

/*1.	Write a CREATE TABLE statement for the Customer table. 
Choose data types appropriate for the DBMS used in your course. Note that the CustBal column contains numeric data. 
The currency symbols are not stored in the database. The CustFirstName and CustLastName columns are required (not null).*/
CREATE TABLE Customer(

	CustNo  VARCHAR(8),
	CustFirstName	VARCHAR(50) CONSTRAINT CustFirstNameNOTNULL	NOT NULL,
	CustLastName 	VARCHAR(50) CONSTRAINT CustLastNameNOTNULL	NOT NULL,
	CustCity		VARCHAR(50),
	CustState		VARCHAR(50),
	CustBal			DECIMAL(5,2),
	CONSTRAINT PKCustNo PRIMARY KEY (CustNo)
);



/*2.	Write a CREATE TABLE statement for the Employee table. 
Choose data types appropriate for the DBMS used in your course.
 The EmpFirstName, EmpLastName, and EmpEMail columns are required (not null).*/


CREATE TABLE EMPLOYEE(

EmpNo Varchar(8),
EmpFirstName	VARCHAR(50) CONSTRAINT EmpFirstNameNOTNULL NOT NULL,
EmpLastName		VARCHAR(50) CONSTRAINT EmpLastNameNOTNULL NOT NULL,
EmpPhone		CHAR(15) ,
EmpEmail		VARCHAR(50) CONSTRAINT EmpEmail NOT NULL,

CONSTRAINT PKEmpNo PRIMARY KEY (EmpNo),
CONSTRAINT UNIQUEEmpEMail	UNIQUE (EmpEMail)

);



CREATE TABLE OrderTbl
(
	OrdNo VARCHAR(10)	,
	OrdDate	VARCHAR(10)	CONSTRAINT OrdDateNOTNULL NOT NULL,
	CustNo	 VARCHAR(10),
	EmpNo 	VARCHAR(10),
	CONSTRAINT PKOrdNo	PRIMARY KEY(OrdNo),
	CONSTRAINT FKCustNo FOREIGN KEY (CustNo) REFERENCES Customer,
	CONSTRAINT FKEmpNo	FOREIGN KEY (EmpNo) REFERENCES EMPLOYEE

)



/*1-M relationships 
customer and OrderTble: 

Parent Customer(CustNo PK)-Child OrderTbl(CustNo FK)
Parent Employee(EmpNo PK)-Child OrderTbl(EmpNo FK)
