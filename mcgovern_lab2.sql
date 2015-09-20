/* 
* @Author: grantmcgovern
* @Date:   2015-09-20 13:57:58
* @Last Modified by:   grantmcgovern
* @Last Modified time: 2015-09-20 14:34:10
*/

/*
1.
*/
SELECT MAX(Invoice.Total), MIN(Invoice.Total) FROM Invoice;

/*
2.
*/
SELECT ALbum.Title FROM Album 
JOIN 
	Track USING(AlbumId) 
	GROUP BY Album.Title 
		HAVING COUNT(*)=13;

/*
3.
*/
SELECT ALbum.Title FROM Album 
JOIN 
	Track 
		USING(AlbumId) 
		GROUP BY Album.Title 
			HAVING COUNT(*) = 13 AND TOTAL(Track.Milliseconds) > 3600000;

/*
4.
*/
CREATE VIEW AlbumLengthView AS
SELECT Album.Title, TOTAL(Track.Milliseconds) AS Length FROM Album 
JOIN 
	Track USING(AlbumId) 
	GROUP BY Album.Title;
SELECT MAX(Length) FROM AlbumLengthView;



