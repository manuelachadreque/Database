--ISTO É SO UM COMENTÁRIO

/* ISTO ABRE O BLOCO DE COMENTÁRIOS
CRIADO POR MANUELA
MOSTRA A LISTA DOS NOSSOS FILMES

FONTE: 
https://www.wiseowl.co.uk/videos/sql/sql-criteria.htm
*/
USE Movies

SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
	,FilmOscarWins 
FROM	
	TBLFILM

/*ORDENAR OS RESULTADOS

*/

SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
	,FilmOscarWins 
FROM	
	TBLFILM
ORDER BY 
	FilmName DESC

--CAN USE THE NAME OF A COLUMN OR THE ALIAS

---SORT BASE ON MORE THAN ONE FIELD


SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
	,FilmOscarWins 
FROM	
	TBLFILM
ORDER BY 
	FilmName DESC

--CAN USE THE NAME OF A COLUMN OR THE ALIAS

SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
	,FilmOscarWins 
FROM	
	TBLFILM
ORDER BY 
	DURATION DESC
	,FilmName ASC



SELECT 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
	,FilmOscarWins 
FROM	
	TBLFILM
ORDER BY 
	FilmOscarWins DESC


--TOP 10
SELECT TOP 10 
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
	,FilmOscarWins 
FROM	
	TBLFILM
ORDER BY 
	FilmOscarWins DESC


--TOP 10 COM EMPATES
SELECT TOP 10 WITH TIES
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
	,FilmOscarWins 
FROM	
	TBLFILM
ORDER BY 
	FilmOscarWins DESC


--BOTTOM 10 OSCAR FILMES
SELECT TOP 10 WITH TIES
	FilmName AS TITLE
	,FilmReleaseDate AS  [RELEASE ON]
	,FilmRunTimeMinutes AS [DURATION]
	,FilmOscarWins 
FROM	
	TBLFILM
ORDER BY 
	FilmOscarWins ASC






