select E.EVENTNO,DATEHELD, count(E.PLANNO) as Subtotal_EventPLan
from EVENTPLAN E
inner join EVENTREQUEST EV
on  E.EVENTNO=EV.EVENTNO
where WorkDate>'01-12-2013'
GROUP by E.EVENTNO, EV.DATEHELD
having count(E.Planno)>1 ;


select E.PLANNO,E.EVENTNO,E.WORKDATE,E.ACTIVITY,F.FACNAME from EVENTPLAN E
inner join EVENTPLANLINE EL
on E.PLANNO=EL.PLANNO
inner join location L
on EL.LOCNO=L.LOCNO
inner join facility F
on L.FACNO=F.FACNO
where E.WORKDATE>'01-12-13' and F.FACNAME='Basketball arena'
;

select E.EVENTNO,E.DATEHELD,E.STATUS,E.ESTCOST,EP.EMPNAME,F.FACNAME
from EVENTREQUEST E
     inner join FACILITY F on E.FACNO=F.FACNO
     inner join EVENTPLAN EV on E.EVENTNO = EV.EVENTNO
     inner join EMPLOYEE EP on EP.EMPNO=EV.EMPNO
     where E.DATEHELD Between '01-10-13' and '31-12-13'
     and EP.EMPNAME='Mary Manager'
     and F.FACNAME='Basketball arena';

select E.PLANNO,E.LINENO, L.LOCNAME,E.TIMESTART,E.TIMEEND,EP.WORKDATE,F.FACName
from  EVENTPLANLINE E
inner join location L on L.LOCNO=E.LOCNO
inner join FACILITY F on F.FACNO=L.FACNO
inner join EVENTPLAN EP on EP.PLANNO = E.PLANNO
where F.FACNAME='Basketball arena'
and EP.ACTIVITY='Operation'
and EP.WORKDATE between '01-10-13' and '31-12-13'
;

INSERT INTO Student 
 (StdNo, StdFirstName, StdLastName, 
  StdCity, StdState, StdZip, StdClass, 
  StdMajor, StdGPA) 
 VALUES ('999-99-9999','JOE','STUDENT','SEATAC',
   'WA','98042-1121','FR','IS', 0.0); 


INSERT INTO facility 
(facno,facname)
values('F104','Swimming Pool');
SELECT * FROM FACILITY;


INSERT INTO LOCATION (LOCNO,FACNO,LOCNAME)
VALUES ('L107','F104','Door');

SELECT * FROM LOCATION;


INSERT INTO LOCATION(LOCNO,FACNO,LOCNAME)
VALUES('L108','F104','Locker Room');
SELECT * FROM LOCATION;

UPDATE LOCATION
SET LOCNAME='Door'
WHERE LOCNAME='Gate';

SELECT * FROM LOCATION;

DELETE FROM FACILITY
WHERE FACNO='F104';


DELETE FROM LOCATION
WHERE LOCNAME='Locker Room';
SELECT * FROM LOCATION;



