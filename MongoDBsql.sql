CREATE DATABASE clientDB;

use clientDB;

CREATE TABLE Client_dt(
ID		int auto_increment primary key,
Name	varchar(100) NOT NULL,
Email	varchar(100) NOT NULL,
Pwd		varchar(15) NOT NULL
);

CREATE TABLE Meeting_dt(
ID				int auto_increment primary key,
Client_id		int,	
Meeting_topic	varchar(100) NOT NULL,
no_of_people	int,
Date_of_meeting	date,
CONSTRAINT fk_parent 
FOREIGN KEY (Client_id) REFERENCES Client_dt(ID)
);

Insert into Client_dt (ID,Name,Email,Pwd) Values (1,'Client_1','Client1@gmail.com','pwd@123');

select * from Client_dt;

Insert into Client_dt (ID,Name,Email,Pwd) 
Values 
(2,'Client_2','Client2@gmail.com','pwd@321'),
(3,'Client_3','Client3@gmail.com','pwd@456'),
(4,'Client_4','Client4@gmail.com','pwd@654'),
(5,'Client_5','Client5@gmail.com','pwd@789');

select * from Client_dt;

Insert into Meeting_dt (ID,Client_id,Meeting_topic,no_of_people,Date_of_meeting) 
Values (1,1,'Meeting 1',5,'2026-03-10');

select * from Meeting_dt;

Insert into Meeting_dt (ID,Client_id,Meeting_topic,no_of_people,Date_of_meeting) 
Values 
(2,1,'Meeting 2',15,'2026-03-11'), 
(3,2,'Meeting 3',10,'2026-03-12'),
(4,5,'Meeting 4',12,'2026-03-13');

select * from Meeting_dt;

Select	c.ID				AS PK_ID,
		c.Name				AS Client_Name,
		c.Email				AS Client_Mail_Id,
		c.Pwd				AS Client_pwd,
        m.Client_id			AS Foreign_Key,
        m.Meeting_topic		AS Meeting_topic,
        m.no_of_people		AS No_of_people,
        m.Date_of_meeting	AS Date_of_meeting 
from Client_dt c JOIN Meeting_dt m
WHERE c.id = m.Client_id;

Select	c.ID				AS PK_ID,
		c.Name				AS Client_Name,
		c.Email				AS Client_Mail_Id,
		c.Pwd				AS Client_pwd,
        m.Client_id			AS Foreign_Key,
        m.Meeting_topic		AS Meeting_topic,
        m.no_of_people		AS No_of_people,
        m.Date_of_meeting	AS Date_of_meeting 
from Client_dt c LEFT JOIN Meeting_dt m
ON c.id = m.Client_id;
