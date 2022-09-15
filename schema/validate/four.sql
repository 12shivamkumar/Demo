CREATE TABLE meeting(
meet_id int AUTO_INCREMENT,
description varchar(200),
is_available boolean NOT NULL DEFAULT TRUE,
room_id smallint ,
created_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (meet_id),
INDEX (room_id, is_available)
);
