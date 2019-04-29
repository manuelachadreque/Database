/*
WHAT ARE CASE STATEMENT USED FOR
USING CASE WITH NUMBERS
USE CASE WITH TEXT
USING CASE WITH DATES
*/


USE Movies


SELECT
	FilmName
	,FilmRunTimeMinutes
	,CASE
		WHEN FilmRunTimeMinutes<=90 THEN 'Short'
		WHEN FilmRunTimeMinutes<=150 THEN 'Medium'
		WHEN FilmRunTimeMinutes<=180 THEN 'Long'
	ELSE 'Epic'
	END AS FilmDuration
	,FilmReleaseDate
FROM 
	tblFilm
WHERE
	CASE
		WHEN FilmRunTimeMinutes<=90 THEN 'Short'
		WHEN FilmRunTimeMinutes<=150 THEN 'Medium'
		WHEN FilmRunTimeMinutes<=180 THEN 'Long'
	ELSE 'Epic'
	END ='Medium'

SELECT
	FilmName
	,CASE
	WHEN FilmName LIKE '%twilight%' then 'Just awful'
	ELSE 'Probably not bad'
	END

FROM tblFilm


--teste date and time information
	--was realeased in a non talking or talking era
	SELECT
	FilmName
	,CASE
	WHEN FilmReleaseDate<'1927-10-01' THEN 'SILENT ERA'
	ELSE 'TALKIE ERA'
	END

FROM tblFilm

--



