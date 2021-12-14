/*
Write a query that'll identify returning active users. 
A returning active user is a user that has made a second purchase
within 7 days of any other of their purchases.
Output a list of user_ids of these returning active users.
*/

SELECT DISTINCT a1.user_id
  FROM amazon_transactions AS a1, amazon_transactions AS a2
 WHERE a1.user_id = a2.user_id 
   AND a1.id <> a2.id
   AND a2.created_at - a1.created_at BETWEEN 0 AND 7
 ORDER BY a1.user_id
