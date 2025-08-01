-- Case 0 - Export data use GUI
select distinct recs.firstname as firstname, recs.surname as surname
	from 
		cd.members mems
		inner join cd.members recs
			on recs.memid = mems.recommendedby
order by surname, firstname;       



-- Case 1: Exatract a table to csv
COPY (
  SELECT * FROM cd.bookings
) TO 'D:\booking.csv' DELIMITER ',' CSV HEADER;

-- Case 2: More complex but the same

COPY (
    SELECT DISTINCT 
        recs.firstname AS firstname, 
        recs.surname AS surname
    FROM 
        cd.members mems
    INNER JOIN 
        cd.members recs
        ON recs.memid = mems.recommendedby
    ORDER BY 
        surname, firstname
) TO 'D:\recommended_members.csv' DELIMITER ',' CSV HEADER;

