CREATE TABLE office(
id tinyint AUTO_INCREMENT,
office_name varchar(30) NOT NULL,
location varchar(100) NOT NULL UNIQUE,
PRIMARY KEY (id)
);