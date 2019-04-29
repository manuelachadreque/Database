--SUBQUERIES
--WHAT IS A SUBQUERY
--USING SUBQUERIES IN THE WHERE CLAUSE
--USING SUBQUERIES IN THE SELECT LIST
--ADDING CRITERIA TO A SUBQUERY
--USING SUBQUERIES TO RETURN MULTIPLE VALUES
USE MOVIES

SELECT 
	FilmName
	,FilmReleaseDate
FROM TBLFILM 
WHERE FILMOSCARWINS=
		(SELECT 
			MAX(FILMOSCARWINS)
		FROM tblFilm)
---FILMS THAT A LONGER THAN THE AVERAGE
SELECT 
	FilmName
	,FilmRunTimeMinutes
FROM tblFilm
WHERE 
	FilmRunTimeMinutes>=
		(SELECT
			AVG(FilmRunTimeMinutes)
		FROM TBLFILM)
---FILMS RUNNING TIME IN MINUTES
SELECT 
	FilmName
	,FilmRunTimeMinutes
	,(SELECT
			AVG(FilmRunTimeMinutes)
		FROM TBLFILM) AS [AVERAGERUNTIME]
FROM tblFilm
WHERE 
	FilmRunTimeMinutes>=
		(SELECT
			AVG(FilmRunTimeMinutes)
		FROM TBLFILM)

		--HIGHEST BUDGET FILM REALEASED BEFORE 2000
SELECT 
	FilmName
	,FilmReleaseDate
	,FilmBudgetDollars
FROM tblFilm
WHERE FilmBudgetDollars>
		(SELECT
			MAX(FilmBudgetDollars)
			FROM	tblFilm
			WHERE
			FilmReleaseDate<'2000-01-01'
			)

---FILMS RUNNING TIME IN MINUTES
select
	FilmName
	,FilmReleaseDate
from tblFilm
where FilmReleaseDate=
		(SELECT
			FilmReleaseDate
		FROM tblFilm

		WHERE 
			FilmName='Casino')

---LIST OF FILMES MADE BY THE LIST OF DIRETORS
SELECT 
	FilmName
	,FilmDirectorID
FROM tblFilm
WHERE
	FilmDirectorID IN(
		SELECT 
			DirectorID
		FROM tblDirector
		WHERE DirectorDOB BETWEEN '1946-01-01' AND '1946-12-31')