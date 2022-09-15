CREATE TABLE employee (
id varchar(10),
name varchar(20) NOT NULL,
email varchar(30) NOT NULL UNIQUE,
office_id tinyint,
auto_update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (id),
INDEX(office_id)
);