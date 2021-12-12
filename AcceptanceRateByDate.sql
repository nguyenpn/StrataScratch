/*
What is the overall friend acceptance rate by date? Your output should have
the rate of acceptances by the date the request was sent.
Order by the earliest date to latest.

Assume that each friend request starts by a user sending (i.e., user_id_sender)
a friend request to another user (i.e., user_id_receiver) that's logged in the
table with action = 'sent'. 
If the request is accepted, the table logs action = 'accepted'. 
If the request is not accepted, no record of action = 'accepted' is logged.
*/

WITH 
sent AS (
SELECT *
  FROM fb_friend_requests
 WHERE action = 'sent'
)

, accepted AS (
SELECT *
  FROM fb_friend_requests
 WHERE action = 'accepted'
)

, combine AS (
SELECT s.user_id_sender
      ,s.user_id_receiver
      ,s.date AS sent_date
      ,s.action AS sent_action
      ,a.action AS receiver_action
      ,a.date AS receiver_date
FROM sent AS s
LEFT JOIN accepted AS a
  ON s.user_id_sender = a.user_id_sender
 AND s.user_id_receiver = a.user_id_receiver
)

SELECT sent_date as date
       ,COUNT(receiver_action) * 1.0 / COUNT(sent_action) as percentage_acceptance
  FROM combine
 GROUP BY sent_date
