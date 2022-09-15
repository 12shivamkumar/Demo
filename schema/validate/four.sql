CREATE TABLE meeting(
meet_id int AUTO_INCREMENT,
description varchar(200),
agenda varchar(100) NOT NULL,
is_available boolean NOT NULL DEFAULT TRUE,
room_id smallint ,
PRIMARY KEY (meet_id),
INDEX (room_id, is_available)
);
