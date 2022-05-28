/* stored procedure to reduce a cost of music */

CREATE OR REPLACE PROCEDURE reduceCostOfMusic
(discount int, music_id int)
LANGUAGE plpgsql
AS 
$$

BEGIN

UPDATE music 
SET cost = cost - discount
WHERE musicid = music_id;


END
$$;

CALL reduceCostOfMusic(10, 1);


/* Procedure for inserting the customer values */


CREATE PROCEDURE customerInsert(cid int, fname varchar(20000), lname varchar(20000),
							   	email varchar(30000), phone int, address varchar(30000),
								cdate date,
								ldate date
							   )
LANGUAGE 'plpgsql'
AS $$
BEGIN
	INSERT INTO CUSTOMER VALUES
	(cid, fname, lname, email, phone, 
	 address, cdate, ldate);
END;
$$;

CALL customerInsert(2000, 'S', 'J', 'sj@gmail.com', 20000000, 'address', '2018-08-06', '2018-08-06 12:00:00');
