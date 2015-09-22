/* 
* @Author: grantmcgovern
* @Date:   2015-09-20 13:57:58
* @Last Modified by:   grantmcgovern
* @Last Modified time: 2015-09-22 14:31:36
*/

/*
1.
*/
SELECT MAX(Invoice.Total) AS Totals FROM Invoice 
UNION 
SELECT MIN(Invoice.Total) FROM Invoice;

/*
2.
*/
SELECT ALbum.Title FROM Album 
JOIN 
	Track USING(AlbumId) 
	GROUP BY Album.Title 
		HAVING COUNT(*) = 13;

/*
3.
*/
SELECT ALbum.Title, SUM(Track.Milliseconds) / 60000 AS Minutes FROM Album 
JOIN 
	Track 
		USING(AlbumId) 
		GROUP BY Album.Title 
			HAVING TOTAL(Track.Milliseconds) > 3600000;

/*
4.
*/
/* First run this command */
CREATE VIEW AlbumLengthView AS
SELECT Album.Title AS Title, TOTAL(Track.Milliseconds) AS Length FROM Album 
JOIN
	Track USING(AlbumId) 
	GROUP BY Album.Title;
/* Then run the below command */
SELECT Title, MAX(Length) FROM AlbumLengthView;

/*
5.
*/
/*
	SKIP FOR NOW
*/

/*
6.
*/
SELECT Track.Name FROM Track
EXCEPT
	SELECT Track.Name FROM 
		Track JOIN PlaylistTrack USING(TrackId);

/*
7.
*/
/* First run this command */
CREATE VIEW Combined AS
	SELECT MediaTypeId, MediaType.Name AS MediaName, GenreId, Genre.Name AS GenreName
		FROM MediaType, Genre
/* Then run the below command */
SELECT Combined.MediaName, Combined.GenreName, COUNT(TrackId)
	FROM Combined LEFT OUTER JOIN Track USING(GenreId, MediaTypeId)
		GROUP BY GenreId, MediaTypeId		

