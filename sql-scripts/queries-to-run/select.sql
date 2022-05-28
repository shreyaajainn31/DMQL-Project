/* Get Music name, genre name, and artist name with rating 5 - ORDER BY + Join*/ 

SELECT m.musicname, g.genrename, a.artistname, r.rating
FROM artist a, music m, genre g,rating r
WHERE r.musicid = m.musicid 
AND m.artistid = a.artistid 
AND m.genreid=g.genreid
AND r.rating =5
ORDER BY genrename, artistname;


/* Get Customer with specific first names */

SELECT * FROM customer 
WHERE firstname  LIKE 'G%';
