CREATE TABLE office(
id tinyint AUTO_INCREMENT,
office_name varchar(30) NOT NULL,
created_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id)
);