/* Get music name of a particular cost */

CREATE OR REPLACE FUNCTION getMusicNamesOfParticularCost (musicCost int)

RETURNS TABLE(
	musicname varchar(200)
)
LANGUAGE 'plpgsql'

AS 
$$

BEGIN

RETURN QUERY
	SELECT m.musicname
	FROM music m, artist a
	WHERE m.artistid = a.artistid 
	AND m.cost = musicCost;

END;
$$;

SELECT getMusicNamesOfParticularCost(20);
