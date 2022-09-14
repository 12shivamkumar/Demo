CREATE TABLE office(
id tinyint AUTO_INCREMENT,
location varchar(100) NOT NULL UNIQUE,
created_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id)
);