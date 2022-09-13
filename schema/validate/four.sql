CREATE TABLE meeting_room(
id int AUTO_INCREMENT,
room_name varchar(15) NOT NULL UNIQUE,
office_id tinyint,
is_open boolean NOT NULL DEFAULT TRUE,
created_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY(id),
INDEX(office_id, room_name)
);