select * from customer
order by custname;

select distinct city,state,zip
from customer
order by zip;

select EMPNAME,DEPARTMENT,PHONE,EMAIL 
from employee
where PHONE like '3-%';


select * 
from resourcetbl
where rate between 10 and 20
order by rate desc;


select * 
from EventRequest
where status in ('Approved','Denied') and DATEAUTH like '%07-13';

select * from location;

select * from facility;


select *
from facility  F inner join location Loc on F.FacNo=Loc.FacNo
where F.FACNAME='Basketball arena' ;


SELECT * FROM EVENTPLAN;
SELECT * FROM EVENTPLANLINE;


SELECT  EVENTNO, EL.PLANNO,COUNT(LINENO) AS SUBTOTAL_LINES, SUM(NUMBERFLD)  TOTAL_RESOURCES
FROM EVENTPLAN E INNER JOIN EVENTPLANLINE EL  
    ON E.PLANNO=EL.PLANNO
    GROUP BY EVENTNO,EL.PLANNO
    HAVING COUNT(LINENO)>1;



gROUP BY PLANNO;

















select * from employee;
select * from customer;
select * from resourcetbl;
select * from facility;
select * from location;
select * from eventrequest;
select * from eventplan;
select * from eventplanline;