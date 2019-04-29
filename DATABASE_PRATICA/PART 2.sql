--THW WHERE CLAUSE
--NUMBER CRITERIA
--TEXT CRITIERIA
--WILDCARDS
--DATE CRITERIA
--https://www.wiseowl.co.uk/videos/sql/sql-criteria.htm

USE Movies


--ADD CRITERIA , FOR THAT YOU HAVE TO USE A WHERE CLAUSE
--NUMBER CRITERIA
SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
FROM	
	TBLFILM
WHERE 
	FilmRunTimeMinutes>=120
ORDER BY 
	FilmRunTimeMinutes

	--ADD CRITERIA , FOR THAT YOU HAVE TO USE A WHERE CLAUSE
--NUMBER CRITERIA
SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
FROM	
	TBLFILM
WHERE 
	FilmRunTimeMinutes<>120
ORDER BY 
	FilmRunTimeMinutes;

--NUMBER CRITERIA
SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
FROM	
	TBLFILM
WHERE 
	FilmRunTimeMinutes BETWEEN 120 AND 150
ORDER BY 
	FilmRunTimeMinutes



--NUMBER CRITERIA
SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
FROM	
	TBLFILM
WHERE 
	FilmRunTimeMinutes BETWEEN 120 AND 150
ORDER BY 
	FilmRunTimeMinutes


--NUMBER CRITERIA
SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
FROM	
	TBLFILM
WHERE 
	FilmRunTimeMinutes IN (90,120,150,180)
ORDER BY 
	FilmRunTimeMinutes

--TEXT CRITIERIA: SPECIFIC NAME
SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
FROM	
	TBLFILM
WHERE 
	FilmName='die hard'
ORDER BY 
	FilmRunTimeMinutes

	--TEXT CRITIERIA: MORE USEFULL
SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
FROM	
	TBLFILM
WHERE 
	FilmName LIKE '%die hard%'
ORDER BY 
	FilmRunTimeMinutes


--TEXT CRITIERIA: SPECIFIC NAME
SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
FROM	
	TBLFILM
WHERE 
	FilmName like'lethal weapon__'
ORDER BY 
	FilmRunTimeMinutes

--TEXT CRITIERIA: THAT DONT INCLUDE A PARTICULAR 
SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
FROM	
	TBLFILM
WHERE 
	FilmName NOT LIKE'%twilight%'
ORDER BY 
	FilmRunTimeMinutes

	--TEXT CRITIERIA: DATE
SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
FROM	
	TBLFILM
WHERE 
	FilmReleaseDate>'1999-12-31'
ORDER BY 
	FilmReleaseDate

SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
FROM	
	TBLFILM
WHERE 
	FilmReleaseDate BETWEEN '2000-01-01' AND '2000-12-31'
ORDER BY 
	FilmReleaseDate


	SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
FROM	
	TBLFILM
WHERE 
	MONTH(FilmReleaseDate)=5
ORDER BY 
	FilmReleaseDate

	
	SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
FROM	
	TBLFILM
WHERE 
	YEAR(FilmReleaseDate)=2000
ORDER BY 
	FilmReleaseDate


	SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
FROM	
	TBLFILM
WHERE 
	DAY(FilmReleaseDate)=5
ORDER BY 
	FilmReleaseDate



	SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
FROM	
	TBLFILM
WHERE 
	FilmName LIKE '%star%' AND 
	FilmReleaseDate <'2000-01-01' AND
	FilmRunTimeMinutes >120
ORDER BY 
	FilmName

-- SELECT ANY WITH A GIVEN CRITERIA
	SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
FROM	
	TBLFILM
WHERE 
	FilmName LIKE 'X%' OR
	FilmName LIKE 'S%' OR
	FilmName LIKE 't%'
ORDER BY 
	FilmName


-- SELECT ANY WITH A GIVEN CRITERIA
	SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
FROM	
	TBLFILM
WHERE 
	FilmRunTimeMinutes >180 AND 
	(FilmName LIKE 'S%' OR
	FilmName LIKE 't%')
ORDER BY 
	FilmName

