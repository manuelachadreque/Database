--Creating Calculations in Queries
--WHRE TO WRITE CALCULATIONS
USE MOVIES

--WORK ON PROFIT OR LOSS OF EACH FILM
SELECT
	FilmName
	,FilmRunTimeMinutes
	,FilmRunTimeMinutes/60 AS RuntimeHours
FROM
	tblFilm


	--CHANGING TO DECIMAL VALUE
SELECT
	FilmName
	,FilmRunTimeMinutes
	,FilmRunTimeMinutes/60.0 AS RuntimeHours
FROM
	tblFilm;

SELECT 
	FILMNAME
	,FilmBoxOfficeDollars
	,FilmBoxOfficeDollars*0.2 AS FILMTAX
	,FilmBudgetDollars+(FilmBoxOfficeDollars*0.2) AS FILMTOTAL
FROM 
	tblFilm


--MODULUS OPERATOR, GUIVE THE REMAIN OF AN DEVISION
	--CHANGING TO DECIMAL VALUE
SELECT
	FilmName
	,FilmRunTimeMinutes
	,FilmRunTimeMinutes/60 AS HOURS
	,FilmRunTimeMinutes%60AS MINUTES
FROM
	tblFilm;

