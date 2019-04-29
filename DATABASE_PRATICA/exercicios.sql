/*Exercise: List the events which happened after the last international one
Create a query which lists out all of the events in the tblEvent table which happened after the 
last one for country 21 (International) took place.  Here's the gist of what you need to do:*/

use WorldEvents

select  EventName
		,EventDate
from tblEvent
where EventDate>
		(select 
			MAX(EventDate)
		From tblEvent
		where CountryID=21)
order by EventDate desc;





/*Exercise: List events not in the last 30 countries or the last 15 categories
Create a subquery to list out all of those events whose:

Country id is not in the list of the last 30 country ids in alphabetical order; and
Category id is not in the list of the last 15 category ids in alphabetical order.
*/
select *
from tblEvent
where CountryID not in (
				select TOP 30 CountryID
				from tblCountry
				Order by CountryName Desc) 
				and CategoryID not in(
				select TOP 15 CategoryID 
				from tblCategory ca 
				order by CategoryName Desc)

select *
from tblEvent;



/*Exercise: Show countries with more than 8 events, using a subquery
Write a query which lists out countries which have more than 8 events,
 using a correlated subquery rather than HAVING. */


