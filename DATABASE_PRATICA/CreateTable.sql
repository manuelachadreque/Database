/*1)	Write a CREATE TABLE statement for the Customer table.
 Choose data types appropriate for the DBMS used in your course. All columns are required (not null).
 */

 CREATE table Customer
 (
 	Custno VARCHAR(8),
 	Custname VARCHAR(50) CONSTRAINT CustnameNOTNUL NOT NULL,
 	address VARCHAR(50)	CONSTRAINT addressNOTNUL NOT NULL,
	Internal VARCHAR(3)	CONSTRAINT	InternalNOTNUL NOT NULL,
 	contact VARCHAR(50)	 CONSTRAINT contactNOTNUL NOT NULL,
 	phone	INTEGER	CONSTRAINT	phoneNOTNUL NOT NULL,
 	city	VARCHAR(50) CONSTRAINT cityNOTNUL	NOT NULL,
 	state 	VARCHAR(2)	CONSTRAINT stateNOTNUL NOT NULL,
 	zip		VARCHAR(10)	CONSTRAINT zipNOTNUL NOT NULL ,

 	CONSTRAINT PKCustomer PRIMARY KEY(Custno)
    );


/*2)	Write a CREATE TABLE statement for the Facility table. 
Choose data types appropriate for the DBMS used in your course. All columns are required (not null).*/
 CREATE TABLE FACILITY 
 (
 	FacNo	CHAR(8),
 	Facname	VARCHAR(50) CONSTRAINT FacnameNOTNULL	NOT NULL,
 	CONSTRAINT FacNoPK	PRIMARY KEY(FacNo)
);



/*3)	Write a CREATE TABLE statement for the Location table.
 Choose data types appropriate for the DBMS used in your course. LocName column is required (not null).*/
 CREATE TABLE Location
 (
	locno 	CHAR(8),
	FacNo 	CHAR(8) CONSTRAINT FacNonNOTNULL NOT NULL,
	locName	VARCHAR(50) CONSTRAINT locNameNOTNULL NOT NULL,
	CONSTRAINT PKlocno PRIMARY KEY(locno),
	CONSTRAINT FKFacNo FOREIGN KEY(FacNo)   REFERENCES FACILITY,
		CONSTRAINT uniqueLocName	unique(locName)
    );


/*7)	Extend your CREATE TABLE statement for the Location table 
(problem 6) with a unique constraint for LocName. Use a named constraint clause for the unique constraint.*/

 CREATE TABLE Location
 (
	locno 	CHAR(8),
	FacNo 	CHAR(8) CONSTRAINT FacNonNOTNULL NOT NULL,
	locName	VARCHAR(50) CONSTRAINT locNameNOTNULL NOT NULL,
	CONSTRAINT PKlocno PRIMARY KEY(locno),
	CONSTRAINT FKFacNo FOREIGN KEY(locno),

 	);



SELECT * FROM CUSTOMER                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    666666bb6b;



BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB