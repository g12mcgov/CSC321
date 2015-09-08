/* 
* @Author: grantmcgovern
* @Date:   2015-09-03 12:52:31
* @Last Modified by:   grantmcgovern
* @Last Modified time: 2015-09-08 17:39:28
*
*
* Lab #1
*/

/*
1.
*/
SELECT * FROM Album WHERE Title LIKE '%America%';

/*
2. 
*/
SELECT LastName, FirstName 
FROM 
	Invoice 
	INNER JOIN Customer 
		ON Invoice.CustomerId = Customer.CustomerId 
			WHERE Invoice.Total > 5;

/*
3.
*/
SELECT InvoiceLineId, InvoiceLine.InvoiceId TrackId, UnitPrice, Quantity 
FROM 
	InvoiceLine 
	INNER JOIN Invoice 
		ON InvoiceLine.InvoiceId = Invoice.InvoiceId 
			WHERE Invoice.CustomerId = 45;

/*
4.
*/
-- SELECT LastName, FirstName, Quantity 
-- FROM 
-- 	Customer 
-- 	INNER JOIN Invoice
-- 		ON Customer.CustomerId = Invoice.CustomerId
-- 		INNER JOIN InvoiceLine
-- 			ON InvoiceLine.InvoiceId = Invoice.InvoiceId;
SELECT FirstName, LastName, SUM(Quantity) 
FROM 
	Customer 
	JOIN (SELECT * FROM Invoice JOIN InvoiceLine USING(InvoiceId)) 
		USING (CustomerId) GROUP BY (LastName) ORDER BY LastName;

/*
5.
*/
SELECT COUNT(*) FROM Album JOIN Track USING(AlbumId) WHERE Title='Black Sabbath'; 

/*
6.
*/
SELECT SUM(Track.UnitPrice) FROM Album JOIN Track USING(AlbumId) WHERE Title='Black Sabbath'; 

/*
7.
*/
SELECT Title
FROM 
Album 
	JOIN (SELECT * FROM Genre JOIN Track USING (GenreId)
		WHERE Genre.Name="Opera") 
			USING (AlbumId);

/*
8.
*/
SELECT MAX(Bytes) FROM Track;

/*
9.
*/
SELECT Track.Name 
FROM 
	Track 
	JOIN (SELECT * FROM Playlist JOIN PlaylistTrack USING (PlaylistId) 
		WHERE Playlist.Name = 'Grunge') 
			USING (TrackId);

/*
10.
*/

/*
a.
*/
SELECT COUNT(*) FROM Invoice;

/*
b.
*/
SELECT COUNT(*) FROM Invoice WHERE BillingState = 'CA';

/*
c.
*/
SELECT COUNT(*) FROM Invoice WHERE BillingState != 'CA';

/*
d. 
*/
/* 
	b + c is not equal to a because the query does not 
	include the Null values, which compose a large portion
	of the records. 
*/

