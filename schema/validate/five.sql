CREATE TABLE employee_meeting(
  employee_id varchar(10) ,
  meeting_id int,
  status varchar(10) NOT NULL,
  date date NOT NULL,
  PRIMARY KEY ( employee_id , meeting_id),
  INDEX(date, status)
);