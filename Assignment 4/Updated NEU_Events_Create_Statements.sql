Create Table clubs(
club_id INT PRIMARY KEY ,
club_name varchar(255),
club_contact bigint,
club_email varchar(255),
club_location varchar(255)
);

create table Event_Status(
status_id varchar(65) primary key,
Event_status varchar(255)
);

Create table Event_type(
event_type_id varchar(65) Primary Key,
event_type_name varchar(255)
);

Create table Postal_code(
Postalcode int primary key,
city varchar(255) not null
);

Create Table Location(
location_id varchar(65) Primary Key,
street varchar(255) not null,
state varchar(255) not null,
country varchar(255) not null,
PostalCode int not null,
FOREIGN KEY (PostalCode) references Postal_code(PostalCode)
);

Create Table Events( 
event_id INT PRIMARY KEY,
event_title varchar(255) not null,
event_date DATE not null,
event_time TIME not null,
location_id varchar(65),
event_price INT,
event_type_id varchar(65) not null,
event_theme varchar(255) not null,
status_id varchar(65),
event_perks varchar(255) not null,
club_id int,
FOREIGN KEY (club_id) REFERENCES clubs(club_id),
FOREIGN KEY (status_id) REFERENCES event_status(status_id),
FOREIGN KEY (event_type_id) REFERENCES event_type(event_type_id),
FOREIGN KEY (location_id) REFERENCES location(location_id)
);

Create Table User(
twitter_handle varchar(255) primary key, 
user_name varchar(255) unique,
follower_count INT,
following_count int,
join_date date not null
);

Create table ClubUsers (
cu_id int primary key,
twitter_handle varchar(255),
club_id int,
FOREIGN KEY (club_id) REFERENCES clubs(club_id),
FOREIGN KEY (twitter_handle) REFERENCES User(twitter_handle)
);

Create Table Payments(
payments_id INT Primary Key,
paid_on datetime,
total_amount int,
payment_details varchar(255),
twitter_handle varchar(255),
event_id INT,
FOREIGN KEY (event_id) REFERENCES Events(event_id),
FOREIGN KEY (twitter_handle) REFERENCES User(twitter_handle)
);

Create Table Organiser(
organiser_id INT PRIMARY KEY,
first_name varchar(255) not null,
last_name varchar(255) not null,
email varchar(255) unique,
contact_number bigint unique,
club_id int,
FOREIGN KEY (club_id) REFERENCES clubs(club_id)
);

Create Table Tweets(
tweet_id bigint Primary Key,
twitter_handle varchar(255),
tweet_text varchar(10000) ,
created_at date ,
hashtags varchar(255),
FOREIGN KEY (twitter_handle) REFERENCES User(twitter_handle)
);

Create Table Twitter_Order(
twitter_order_id INT Primary Key,
tweet_id bigint,
FOREIGN KEY (tweet_id) REFERENCES Tweets(tweet_id)
);

Create Table Event_Tickets(
ticket_id INT Primary KEY,
ticket_cost int,
event_id int,
twitter_order_id int,
FOREIGN KEY (event_id) REFERENCES Events(event_id),
FOREIGN KEY (twitter_order_id) REFERENCES Twitter_Order(twitter_order_id)
);











