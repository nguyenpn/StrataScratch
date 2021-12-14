/*
Find the date with the highest total energy consumption from the Facebook data centers. 
Output the date along with the total energy consumption across all data centers.
*/

select c.date
       ,max_consumption
from (  select MAX(sum_consumption) AS max_consumption
        from (  select date
                      ,SUM(consumption) AS sum_consumption
                from (
                        select * from fb_eu_energy
                        UNION all
                        select * from fb_asia_energy
                        UNION all
                        select * from fb_na_energy
                    ) as a
                group by date
            ) as c
    ) as b
    
    JOIN 
    
    (   select date
              ,SUM(consumption) AS sum_consumption
        from (
                select * from fb_eu_energy
                UNION all
                select * from fb_asia_energy
                UNION all
                select * from fb_na_energy
            ) as a
        group by date
    ) as c
    ON c.sum_consumption = b.max_consumption





