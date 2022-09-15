CREATE TABLE employee_meeting(
  employee_id varchar(10) ,
  meeting_id int,
  status varchar(10) NOT NULL,
  date date NOT NULL,
  created_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ( employee_id , meeting_id),
  INDEX(date, status)
);