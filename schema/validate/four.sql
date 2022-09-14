CREATE TABLE meeting(
meet_id int AUTO_INCREMENT,
description varchar(200),
agenda varchar(100) NOT NULL,
owner_id varchar(10) NOT NULL,
is_available boolean NOT NULL DEFAULT TRUE,
room_id smallint ,
created_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (meet_id),
INDEX (room_id, date_of_meeting, is_available)
);
