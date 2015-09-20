/* 
* @Author: grantmcgovern
* @Date:   2015-09-20 13:57:58
* @Last Modified by:   grantmcgovern
* @Last Modified time: 2015-09-20 14:19:04
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

