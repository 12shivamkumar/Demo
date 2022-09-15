CREATE TABLE employee (
id varchar(10),
email varchar(30) NOT NULL UNIQUE,
office_id tinyint,
is_available boolean NOT NULL DEFAULT TRUE,
created_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
auto_update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (id),
INDEX(office_id)
);