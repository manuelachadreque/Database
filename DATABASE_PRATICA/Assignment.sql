DROP TABLE Customer;
DROP TABLE Employee;
Drop table resourcetbl purge;
Drop table facility purge;
Drop table location purge;
Drop table eventrequest purge;
Drop table eventplan purge;
Drop table  eventplanline purge;
DROP TABLE Product;
DROP TABLE OrderTbl;
DROP TABLE OrdLine;




CREATE TABLE EMPLOYEE (
	Empno VARCHAR2(8) CONSTRAINT EmpnoNotNull NOT NULL,
	EmpName	VARCHAR2(50)  CONSTRAINT EmpNameNotNull NOT NULL ,
	Department	VARCHAR2(50) CONSTRAINT DepartmentNotNull NOT NULL,
	Email VARCHAR2(50) 	CONSTRAINT EmailNotNull NOT NULL,
	Phone VARCHAR2(11)	CONSTRAINT PhoneNotNull NOT NULL,
	CONSTRAINT PK_Empno	PRIMARY KEY	(Empno)
	);

CREATE TABLE CUSTOMER (
	CustNo VARCHAR2(8) CONSTRAINT CustNoNotNull NOT null,
	CustName VARCHAR2(50)	CONSTRAINT CustnameNotNull NOT null,
	Address	VARCHAR2(50)	CONSTRAINT AdressNotNull NOT null,
	Internal CHAR(1)	CONSTRAINT InternalNotNull NOT null,
	Contact VARCHAR2(50)	CONSTRAINT ContactNotNull NOT null,
	Phone varchar2(11)	CONSTRAINT NotNullPhone NOT NULL,
	City	varchar2(50)	CONSTRAINT CityNotNull NOT null,
	State	varchar2(50)	CONSTRAINT StateNotNull NOT null,
	Zip	varchar(11) CONSTRAINT ZipNotNull NOT null,
	CONSTRAINT PK_Custno PRIMARY KEY(CustNo)
	);
    


CREATE TABLE RESOURCETBL (
	Resno VARCHAR2(8) CONSTRAINT ResnoNotNull NOT NULL,
	Resname	VARCHAR2(1000) CONSTRAINT ResnameNotNull NOT NULL,
	Rate	DECIMAL(4,2) CONSTRAINT RateNotNull NOT NULL,
	CONSTRAINT PK_Resno PRIMARY KEY(Resno),
	CONSTRAINT ValidRate CHECK(Rate>0)

	);


CREATE TABLE FACILITY  (
	FacNo VARCHAR2(8) CONSTRAINT FacNoNotNull NOT NULL,
	FacName	VARCHAR2(50) CONSTRAINT NotNullFacname NOT NULL,
	CONSTRAINT PK_Facno	PRIMARY KEY(FacNo)
	);

CREATE TABLE LOCATION (
	LocNo varchar2(8),
	FacNo varchar2(8) CONSTRAINT Facno_NotNull NOT NULL,
	LocName	varchar2(50) CONSTRAINT Locname_NotNull NOT NULL,
	CONSTRAINT PK_Locno PRIMARY KEY(LocNo),
    CONSTRAINT FK_FacNoLoc FOREIGN KEY(FacNo) REFERENCES FACILITY
	);
    

CREATE TABLE EVENTREQUEST (
	EventNo VARCHAR2(8) CONSTRAINT EventNoNotNull NOT NULL,
	DateHeld DATE CONSTRAINT DateHeldNotNull NOT NULL,
	DateReq DATE CONSTRAINT DateReqNotNull NOT NULL,
	CustNo varchar2(8) CONSTRAINT NotNullCustNo NOT NULL,
	FacNo varchar2(8) CONSTRAINT NotNullFacno NOT NULL,
	DateAuth DATE ,
	Status VARCHAR2(20) CONSTRAINT StatusNotNull NOT NULL ,
	EstCost	DECIMAL(10,2) CONSTRAINT EstcostNotNull NOT NULL,
	EstAudience	INTEGER CONSTRAINT EstaudienceNotNull NOT NULL,
	BUDNO	VARCHAR2(6),
	CONSTRAINT PK_Eventno PRIMARY KEY (EVENTNO),
	CONSTRAINT Custno_FK FOREIGN KEY (CUSTNO) REFERENCES CUSTOMER,
	CONSTRAINT Facno_FK FOREIGN KEY(FACNO) REFERENCES FACILITY,
	CONSTRAINT ValidStatus  CHECK ( STATUS IN ('Pending','Denied', 'Approved')),
	CONSTRAINT ValidESTAUDIENCE	 CHECK ( EstAudience > 0 )
	);


CREATE TABLE EVENTPLAN (
	Planno	varchar2(8) CONSTRAINT PlannoNotNull NOT NULL,
	EventNo varchar2(8) CONSTRAINT NotNullEventno NOT NULL,
	WorkDate Date CONSTRAINT WorkDateNotNull NOT NULL,
	Notes varchar2(250),
	Activity varchar2(20) CONSTRAINT ActivityNotNull NOT null,
	Empno varchar2(8),
	CONSTRAINT PK_Planno PRIMARY KEY(Planno),
	CONSTRAINT FK_EmpNo	FOREIGN KEY(Empno) REFERENCES EMPLOYEE,
    CONSTRAINT FK_EventNo	FOREIGN KEY(EventNo) REFERENCES  EVENTREQUEST
	) ;
    


CREATE TABLE EVENTPLANLINE (
	PlanNo varchar2(8) CONSTRAINT NotNullPlanNo NOT NULL,
	LineNo varchar2(8) CONSTRAINT NotNullLineNo NOT NULL,
	TimeStart TIMESTAMP CONSTRAINT TimestartNotNull NOT NULL,
	TimeEnd TIMESTAMP CONSTRAINT TimeEndNotNull NOT NULL,
	Numberfld INTEGER CONSTRAINT NumberFldNotNull NOT NULL,
	LocNo VARCHAR(8) CONSTRAINT NotNullLocNo NOT NULL,
	ResNo VARCHAR(8) CONSTRAINT NotNullResNo NOT NULL,
	CONSTRAINT PK_PlannoLine PRIMARY KEY(PlanNo,LineNo),
	CONSTRAINT FK_Locno	FOREIGN KEY(LocNo) REFERENCES LOCATION,
	CONSTRAINT FK_Resno	FOREIGN Key(ResNo) REFERENCES RESOURCETBL,
	CONSTRAINT ValidTime  CHECK ( TimeStart < TimeEnd )
	);


Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE) values ('E100','Chuck Coordinator','Administration','chuck@colorado.edu','3-1111');
Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE) values ('E101','Mary Manager','Football','mary@colorado.edu','5-1111');
Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE) values ('E102','Sally Supervisor','Planning','sally@colorado.edu','3-2222');
Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE) values ('E103','Alan Administrator','Administration','alan@colorado.edu','3-3333');

Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C100','Football','Box 352200','Y','Mary Manager','6857100','Boulder','CO','80309');
Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C101','Men''s Basketball','Box 352400','Y','Sally Supervisor','5431700','Boulder','CO','80309');
Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C103','Baseball','Box 352020','Y','Bill Baseball','5431234','Boulder','CO','80309');
Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C104','Women''s Softball','Box 351200','Y','Sue Softball','5434321','Boulder','CO','80309');
Insert into CUSTOMER (CUSTNO,CUSTNAME,ADDRESS,INTERNAL,CONTACT,PHONE,CITY,STATE,ZIP) values ('C105','High School Football','123 AnyStreet','N','Coach Bob','4441234','Louisville','CO','80027');

Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R100','attendant',10);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R101','police',15);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R102','usher',10);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R103','nurse',20);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R104','janitor',15);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R105','food service',10);

Insert into FACILITY (FACNO,FACNAME) values ('F100','Football stadium');
Insert into FACILITY (FACNO,FACNAME) values ('F101','Basketball arena');
Insert into FACILITY (FACNO,FACNAME) values ('F102','Baseball field');
Insert into FACILITY (FACNO,FACNAME) values ('F103','Recreation room');

Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L100','F100','Locker room');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L101','F100','Plaza');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L102','F100','Vehicle gate');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L103','F101','Locker room');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L104','F100','Ticket Booth');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L105','F101','Gate');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L106','F100','Pedestrian gate');

Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E100',to_date('25-OCT-13','DD-MON-RR'),to_date('06-JUN-13','DD-MON-RR'),'C100','F100',to_date('08-JUN-13','DD-MON-RR'),'Approved',5000,80000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E101',to_date('26-OCT-13','DD-MON-RR'),to_date('28-JUL-13','DD-MON-RR'),'C100','F100',null,'Pending',5000,80000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E103',to_date('21-SEP-13','DD-MON-RR'),to_date('28-JUL-13','DD-MON-RR'),'C100','F100',to_date('01-AUG-13','DD-MON-RR'),'Approved',5000,80000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E102',to_date('14-SEP-13','DD-MON-RR'),to_date('28-JUL-13','DD-MON-RR'),'C100','F100',to_date('31-JUL-13','DD-MON-RR'),'Approved',5000,80000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E104',to_date('03-DEC-13','DD-MON-RR'),to_date('28-JUL-13','DD-MON-RR'),'C101','F101',to_date('31-JUL-13','DD-MON-RR'),'Approved',2000,12000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E105',to_date('05-DEC-13','DD-MON-RR'),to_date('28-JUL-13','DD-MON-RR'),'C101','F101',to_date('01-AUG-13','DD-MON-RR'),'Approved',2000,10000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E106',to_date('12-DEC-13','DD-MON-RR'),to_date('28-JUL-13','DD-MON-RR'),'C101','F101',to_date('31-JUL-13','DD-MON-RR'),'Approved',2000,10000,'B1000');
Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO) values ('E107',to_date('23-NOV-13','DD-MON-RR'),to_date('28-JUL-13','DD-MON-RR'),'C105','F100',to_date('31-JUL-13','DD-MON-RR'),'Denied',10000,5000,null);


Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P100','E100',to_date('25-OCT-13','DD-MON-RR'),'Standard operation','Operation','E102');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P101','E104',to_date('03-DEC-13','DD-MON-RR'),'Watch for gate crashers','Operation','E100');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P102','E105',to_date('05-DEC-13','DD-MON-RR'),'Standard operation','Operation','E102');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P103','E106',to_date('12-DEC-13','DD-MON-RR'),'Watch for seat switching','Operation',null);
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P104','E101',to_date('26-OCT-13','DD-MON-RR'),'Standard cleanup','Cleanup','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P105','E100',to_date('25-OCT-13','DD-MON-RR'),'Light cleanup','Cleanup','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P199','E102',to_date('10-DEC-13','DD-MON-RR'),'ABC','Operation','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P299','E101',to_date('26-OCT-13','DD-MON-RR'),null,'Operation','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P349','E106',to_date('12-DEC-13','DD-MON-RR'),null,'Setup','E101');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P85','E100',to_date('25-OCT-13','DD-MON-RR'),'Standard operation','Cleanup','E102');
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P95','E101',to_date('26-OCT-13','DD-MON-RR'),'Extra security','Cleanup','E102');

Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P100',1, to_date('25-OCT-13 8:00:00','DD-MON-RR HH24:MI:SS'), to_date('25-OCT-13 17:00:00','DD-MON-RR HH24:MI:SS'),2,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P100',2, to_date('25-OCT-13 12:00:00','DD-MON-RR HH24:MI:SS'),to_date('25-OCT-13 17:00:00','DD-MON-RR HH24:MI:SS'), 2,'L101','R101');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P100',3, to_date('25-OCT-13 7:00:00','DD-MON-RR HH24:MI:SS'), to_date('25-OCT-13 16:30:00','DD-MON-RR HH24:MI:SS'), 1,'L102','R102');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P100',4, to_date('25-OCT-13 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('25-OCT-13 22:00:00','DD-MON-RR HH24:MI:SS'),2,'L100','R102');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P101',1, to_date('3-DEC-13 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('3-DEC-13 20:00:00','DD-MON-RR HH24:MI:SS'),2,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P101',2, to_date('3-DEC-13 18:30:00','DD-MON-RR HH24:MI:SS'),to_date('3-DEC-13 19:00:00','DD-MON-RR HH24:MI:SS'),4,'L105','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P101',3, to_date('3-DEC-13 19:00:00','DD-MON-RR HH24:MI:SS'),to_date('3-DEC-13 20:00:00','DD-MON-RR HH24:MI:SS'),2,'L103','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P102',1, to_date('5-DEC-13 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('5-DEC-13 19:00:00','DD-MON-RR HH24:MI:SS'),2,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P102',2, to_date('5-DEC-13 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('5-DEC-13 21:00:00','DD-MON-RR HH24:MI:SS'),4,'L105','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P102',3, to_date('5-DEC-13 19:00:00','DD-MON-RR HH24:MI:SS'),to_date('5-DEC-13 22:00:00','DD-MON-RR HH24:MI:SS'),2,'L103','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P103',1, to_date('12-DEC-13 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('12-DEC-13 21:00:00','DD-MON-RR HH24:MI:SS'),2,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P103',2, to_date('12-DEC-13 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('12-DEC-13 21:00:00','DD-MON-RR HH24:MI:SS'),4,'L105','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P103',3, to_date('12-DEC-13 19:00:00','DD-MON-RR HH24:MI:SS'),to_date('12-DEC-13 22:00:00','DD-MON-RR HH24:MI:SS'),2,'L103','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P104',1, to_date('26-OCT-13 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('26-OCT-13 22:00:00','DD-MON-RR HH24:MI:SS'),4,'L101','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P104',2, to_date('26-OCT-13 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('26-OCT-13 22:00:00','DD-MON-RR HH24:MI:SS'),4,'L100','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P105',1, to_date('25-OCT-13 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('25-OCT-13 22:00:00','DD-MON-RR HH24:MI:SS'),4,'L101','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P105',2, to_date('25-OCT-13 18:00:00','DD-MON-RR HH24:MI:SS'),to_date('25-OCT-13 22:00:00','DD-MON-RR HH24:MI:SS'),4,'L100','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P199',1, to_date('10-DEC-13 8:00:00','DD-MON-RR HH24:MI:SS'), to_date('10-DEC-13 12:00:00','DD-MON-RR HH24:MI:SS'),1,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P349',1, to_date('12-DEC-13 12:00:00','DD-MON-RR HH24:MI:SS'),to_date('12-DEC-13 15:30:00','DD-MON-RR HH24:MI:SS'),1,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P85',1,  to_date('25-OCT-13 9:00:00','DD-MON-RR HH24:MI:SS'), to_date('25-OCT-13 17:00:00','DD-MON-RR HH24:MI:SS'),5,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P85',2,  to_date('25-OCT-13 8:00:00','DD-MON-RR HH24:MI:SS'), to_date('25-OCT-13 17:00:00','DD-MON-RR HH24:MI:SS'),2,'L102','R101');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P85',3, to_date('25-OCT-13 10:00:00','DD-MON-RR HH24:MI:SS'), to_date('25-OCT-13 15:00:00','DD-MON-RR HH24:MI:SS'),3,'L104','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',1, to_date('26-OCT-13 8:00:00','DD-MON-RR HH24:MI:SS'),  to_date('26-OCT-13 17:00:00','DD-MON-RR HH24:MI:SS'),4,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',2, to_date('26-OCT-13 9:00:00','DD-MON-RR HH24:MI:SS'),  to_date('26-OCT-13 17:00:00','DD-MON-RR HH24:MI:SS'),4,'L102','R101');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',3, to_date('26-OCT-13 10:00:00','DD-MON-RR HH24:MI:SS'), to_date('26-OCT-13 15:00:00','DD-MON-RR HH24:MI:SS'),4,'L106','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',4, to_date('26-OCT-13 13:00:00','DD-MON-RR HH24:MI:SS'), to_date('26-OCT-13 17:00:00','DD-MON-RR HH24:MI:SS'),2,'L100','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',5, to_date('26-OCT-13 13:00:00','DD-MON-RR HH24:MI:SS'), to_date('26-OCT-13 17:00:00','DD-MON-RR HH24:MI:SS'),2,'L101','R104');


