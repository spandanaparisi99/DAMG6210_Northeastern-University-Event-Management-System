1.
SELECT o.first_name, o.last_name, c.club_location
FROM organiser o LEFT JOIN clubs c
ON o.organiser_id = c.organiser_id
WHERE club_location = 'Northeastern';

2.
SELECT e.event_id, e.event_title, e.event_date, es.Event_status, c.club_name
FROM((events e LEFT JOIN event_status es
      ON es.status_id = e.status_id)
      LEFT JOIN clubs c
      ON e.club_id = c.club_id);

3.
SELECT e.event_title, e.event_date, e.event_theme, et.ticket_cost
FROM events e RIGHT JOIN event_tickets et
ON et.event_id = e.event_id
GROUP BY et.ticket_cost
ORDER BY e.event_title DESC

4. 
SELECT c.club_name, u.name, count(c.club_location)
FROM clubs c CROSS JOIN user 
GROUP BY u.name
ORDER BY c.club_name DESC

5.
SELECT UPPER(l.street) AS Decided_location , UPPER(ls.street) AS Held_location
FROM location l INNER JOIN location ls
ON l.street = ls.street;

6.
SELECT p.payment_details, p.total_amount, et.ticket_cost
FROM payments p LEFT JOIN event_tickets et
ON p.event_id = et.event_id;

7.
SELECT o.first_name, o.last_name, c.club_location, c.club_contact, c.club_email
FROM organiser o LEFT JOIN clubs c
ON o.organiser_id = c.organiser_id
WHERE club_contact LIKE '9%9' ;

8.
SELECT e.event_title, e.event_perks, p.paid_on
FROM events e LEFT JOIN payments p
ON e.event_price = p.total_amount
WHERE e.event_price = 70;

9.
SELECT e.event_title, e.event_theme, et.event_type_name
FROM events e RIGHT JOIN event_type et
ON et.event_type_id = e.event_type_id

10.
SELECT u.name,p.paid_on, p.total_amount
FROM user u CROSS JOIN payments p

11. 
SELECT u.name, u.twitter_handle, t.tweet_text, to.twitter_order_id
FROM user u JOIN tweets t
ON u.twitter_handle = t.twitter_handle
JOIN twitter_order to
ON t.tweet_id = to.tweet_id
WHERE u.twitter_handle = '@john'

12. 
SELECT u.name, u.twitter_handle, t.tweet_text, c.club_name
FROM user u JOIN tweets t
ON u.twitter_handle = t.twitter_handle
JOIN clubs c
ON u.twitter_handle = c.twitter_handle
WHERE u.twitter_handle = '@GWiSE'

13. 
SELECT e.event_title, e.event_date, es.event_status
FROM events e LEFT JOIN event_status es
ON e.status_id = es.status_id 
WHERE es.event_status = 'ongoing'

14. 
SELECT e.event_title, e.event_date, c.club_name
FROM events e INNER JOIN clubs c
ON e.club_id = c.club_id 
WHERE c.club_name = 'nusanskriti'

15. 
SELECT count(e.event_title), c.club_name
FROM events e INNER JOIN clubs c
ON e.club_id = c.club_id 
WHERE c.club_name = 'NUimpact'






