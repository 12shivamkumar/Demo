CREATE TABLE employee_meeting(
  employee_id varchar(10) ,
  meeting_id int,
  name varchar(20) NOT NULL,
  status varchar(10) NOT NULL,
  location varchar(100) NOT NULL UNIQUE,
  date date NOT NULL,
  PRIMARY KEY ( employee_id , meeting_id),
  INDEX(date, status)
);