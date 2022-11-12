Create Table Events( 
event_id INT PRIMARY KEY,
event_title varchar(255) not null,
event_date DATE not null,
event_time TIME not null,
event_duration INT not null,
location_id INT,
event_price INT,
event_type_id INT not null,
event_theme varchar(255) not null,
status_id INT,
event_perks varchar(255) not null,
club_id int,
FOREIGN KEY (club_id) REFERENCES clubs(club_id),
FOREIGN KEY (status_id) REFERENCES event_status(status_id),
FOREIGN KEY (event_type_id) REFERENCES event_type(event_type_id),
FOREIGN KEY (location_id) REFERENCES location(location_id)
);

Create Table clubs(
club_id INT PRIMARY KEY ,
club_name varchar(255),
club_contact int,
club_email varchar(255),
club_location varchar(255),
twitter_handle varchar(255),
organiser_id int,
foreign key (organiser_id) references Organiser(organiser_id),
FOREIGN KEY (twitter_handle) REFERENCES User(twitter_handle)
);

Create Table User(
twitter_handle varchar(255) primary key, 
user_name varchar(255) unique,
follower_count INT,
following_count int,
join_date datetime not null
);

Create Table Payments(
payments_id INT Primary Key,
paid_on datetime,
total_amount varchar(255),
payment_details varchar(255),
twitter_handle varchar(255),
event_id INT,
FOREIGN KEY (twitter_handle) REFERENCES User(twitter_handle)
);

Create Table Organiser(
organiser_id INT PRIMARY KEY,
first_name varchar(255) not null,
last_name varchar(255) not null,
email varchar(255) unique,
contact_number int unique
);

Create Table Admin(
twitter_handle varchar(255),
password varchar(255) not null,
foreign key (twitter_handle) references user(twitter_handle)
);

Create Table Location(
location_id INT Primary Key,
street varchar(255) not null,
city varchar(255) not null,
state varchar(255) not null,
country varchar(255) not null,
postal_code int not null
);

Create Table Tweets(
tweet_id INT Primary Key,
twitter_handle varchar(255),
tweet_text varchar(255) ,
created_at datetime ,
hashtags varchar(255),
FOREIGN KEY (twitter_handle) REFERENCES User(twitter_handle)
);


Create Table Event_Tickets(
ticket_id INT Primary KEY,
ticket_cost int,
event_id int,
club_id int,
twitter_order_id int,
FOREIGN KEY (event_id) REFERENCES Events(event_id),
FOREIGN KEY (twitter_order_id) REFERENCES Twitter_Order(twitter_order_id)
);

Create table Event_type(
event_type_id INT Primary Key,
event_type_name varchar(255)
);

create table Event_Status(
status_id int primary key,
Event_status varchar(255)
);

Create Table Twitter_Order(
twitter_order_id INT Primary Key,
tweet_id int,
FOREIGN KEY (tweet_id) REFERENCES Tweets(tweet_id)
);















