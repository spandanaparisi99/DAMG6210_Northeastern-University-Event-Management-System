-- 1.
create view user_tweets as
Select twitter_handle, tweet_text from tweets where tweet_id='1591152363';
select * from  user_tweets;

-- 2
create view user_tweeted_dates as 
Select twitter_handle, tweet_text, created_at from tweets where created_at ='2008-11-11'; 
select * from user_tweeted_dates;

-- 3
create view past24hrs as
Select  tweet_id, tweet_text from tweets where twitter_handle='@apmc' and (created_at between (curdate()-1) and  curdate()); 
select * from past24hrs;

-- 4
create view nooftweets as
Select count(tweet_id) as NoOfTweets from tweets where twitter_handle='@apmc' and (created_at between (curdate()-1) and curdate());
select * from nooftweets;
 
-- 5 
create view twitterjoin as
Select  u.twitter_handle, u.join_date from tweets t, user u where u.twitter_handle=t.twitter_handle and u.twitter_handle='@apmc'; 
select * from twitterjoin;

-- 6
create view hashpopular as
Select hashtags from tweets group by hashtags having count(tweet_id)>10; 
select * from hashpopular;

-- 7 
create view eventreg as 
Select e.event_id from events e, event_tickets t, clubs c, user u where 
e.event_id=t.event_id and c.club_id=e.club_id and u.twitter_handle='@apmc'; 
select * from eventreg;

-- 8
create view pdate as 
Select * from events where event_date='2022-08-12'; 
select * from pdate;

-- 9
create view happening as
Select street,city,state from events e, location l, postal_code p where l.location_id=e.location_id and p.postalCode=l.postalCode and p.city='boston';
select * from happening;

-- 10
create view freeperks as
Select event_id, event_title, event_perks from events where event_perks like '%Free%'; 
select * from freeperks;

-- 11
create view theming as 
Select event_id,event_title, event_theme from events where event_theme='networking'; 
select * from theming;

-- 12
create view eventcluborg as
Select e.event_Id,e.event_title from events e, clubs c where c.club_id=e.club_id and club_name='Fintech Initiative'; 
select * from eventcluborg;

-- 13
create view paymentsbyuser as 
Select p.payments_id,p.paid_on,p.total_amount from payments p, user u where u.twitter_handle=p.twitter_handle and u.twitter_handle='@apmc'; 
 select * from paymentsbyuser;
 
-- 14
create view belowprice as 
Select event_id,event_title from events where event_price<20; 
select * from belowprice;

-- 15 
create view statusview as 
Select e.event_id, e.event_title,  s.event_status from events e, event_status s where s.status_id=e.status_id; 
select * from statusview;

-- 16 
create view orgevent as
Select o.organiser_id, o.first_name from events e, clubs c, organiser o where c.club_id=o.club_id and c.club_id=e.club_id; 
select * from orgevent;

-- 17
create view clubloc as
Select club_name, club_location from clubs where club_name='Fintech Initiative'; 
select * from clubloc;

-- 18
create view view1 as
SELECT o.first_name, o.last_name, c.club_location
FROM organiser o LEFT JOIN clubs c
ON o.club_id = c.club_id
WHERE club_location = 'Northeastern';
select * from view1;

-- 19 
create view view2 as
SELECT e.event_id, e.event_title, e.event_date, es.Event_status, c.club_name
FROM((events e LEFT JOIN event_status es
      ON es.status_id = e.status_id)
      LEFT JOIN clubs c
      ON e.club_id = c.club_id);
select * from view2;

-- 20 
create view view3 as
SELECT e.event_title, e.event_date, e.event_theme, et.ticket_cost
FROM events e RIGHT JOIN event_tickets et
ON et.event_id = e.event_id
GROUP BY et.ticket_cost
ORDER BY e.event_title DESC;
select * from view3;

-- 21
create view view4 as
SELECT UPPER(l.street) AS Decided_location , UPPER(ls.street) AS Held_location
FROM location l INNER JOIN location ls
ON l.street = ls.street;
select * from view4;

-- 22
create view view5 as 
SELECT p.payment_details, p.total_amount, et.ticket_cost
FROM payments p LEFT JOIN event_tickets et
ON p.event_id = et.event_id;
select * from view5;

-- 23
create view view6 as 
SELECT o.first_name, o.last_name, c.club_location, c.club_contact, c.club_email
FROM organiser o LEFT JOIN clubs c
ON o.club_id = c.club_id
WHERE club_contact LIKE '9%9';
select * from view6;

-- 24 
create view view7 as
SELECT e.event_title, e.event_perks, p.paid_on
FROM events e LEFT JOIN payments p
ON e.event_price = p.total_amount
WHERE e.event_price = 70;
select * from view7;

-- 25 
create view view8 as
SELECT e.event_title, e.event_theme, et.event_type_name
FROM events e RIGHT JOIN event_type et
ON et.event_type_id = e.event_type_id;
select * from view8;

-- 26 
create view view9 as
SELECT  u.twitter_handle, t.tweet_text, too.twitter_order_id
FROM user u JOIN tweets t
ON u.twitter_handle = t.twitter_handle
JOIN twitter_order too
ON t.tweet_id = too.tweet_id
WHERE u.twitter_handle = '@john';
select * from view9;









