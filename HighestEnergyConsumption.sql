/*
Find the date with the highest total energy consumption from the Facebook data centers. 
Output the date along with the total energy consumption across all data centers.
*/

WITH
all_cte AS (
SELECT * FROM fb_eu_energy 
UNION
SELECT * FROM fb_asia_energy
UNION 
SELECT * FROM fb_na_energy
)

,sum_cons AS (
SELECT date
      ,SUM(consumption) AS sum_cons
  FROM all_cte
 GROUP BY date
)

,max_cons AS (
SELECT MAX(sum_cons) AS max_cons 
  FROM sum_cons
)

SELECT s.date
       ,s.sum_cons
  FROM max_cons AS m, sum_cons as s
 WHERE m.max_cons = s.sum_cons
 ORDER BY m.max_cons DESC
