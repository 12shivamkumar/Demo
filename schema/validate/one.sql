CREATE TABLE employee (
id varchar(10),
office_id tinyint,
created_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
auto_update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (id),
INDEX(office_id)
);