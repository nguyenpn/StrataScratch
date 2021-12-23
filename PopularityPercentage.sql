/* Popularity Percentage
Find the popularity percentage for each user on Facebook. 
The popularity percentage is defined as the total number of friends 
the user has divided by the total number of users on the platform,
then converted into a percentage by multiplying by 100.

Output each user along with their popularity percentage. 
Order records in ascending order by user id.
The 'user1' and 'user2' column are pairs of friends.
*/

WITH 
cte_user1 AS (
SELECT DISTINCT user1, user2
  FROM facebook_friends

UNION
 
SELECT DISTINCT user2, user1
  FROM facebook_friends
 ORDER BY user1
)


SELECT DISTINCT user1
       ,CAST(COUNT(*) AS FLOAT) * 100/ SUM(COUNT(DISTINCT user1)) OVER() AS percentage
  FROM cte_user1
 GROUP BY user1
 ORDER BY percentage DESC
