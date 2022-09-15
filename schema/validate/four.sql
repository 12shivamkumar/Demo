CREATE TABLE meeting(
is_available boolean NOT NULL DEFAULT TRUE,
room_id smallint ,
PRIMARY KEY (meet_id),
INDEX (room_id, is_available)
);
