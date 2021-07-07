-- create database
Create Database Supplier;

use Supplier;

-- Create tables
create table suppliers(
sid integer primary key,
sname varchar(20),
address varchar(50));


create table parts(
pid integer primary key,
pname varchar(20),
color varchar(10));

create table catalog(
sid integer,
pid integer,
cost real,
primary key(sid,pid),
foreign key(sid) references suppliers(sid) on delete cascade on update cascade,
foreign key(pid) references parts(pid) on delete cascade on update cascade);

-- Insert values
insert into suppliers(sid,sname,address) VALUES
(001,'Rohan','Mangalore'),
(002,'Avni','Bangalore'),
(003,'Pratibha','Bagalkot'),
(004,'Rahul','Udupi'),
(005,'Prithvi','Hassan');

insert into parts(pid,pname,color) VALUES
(001,'Pipe','white'),
(002,'Screw','red'),
(003,'Nail','black'),
(004,'Tap','grey'),
(005,'bottle','red'),
(006,'plywood','brown');

insert into catalog(sid,pid,cost) VALUES
(001,001,50.00),
(001,006,120.00),
(002,002,75),
(002,005,100),
(003,002,45),
(003,003,75),
(004,001,140),
(004,002,38),
(004,003,42),
(004,004,310),
(004,005,79),
(004,006,110),
(005,002,50),
(005,003,48);




-- Find the pnames of parts for which there is some supplier.
select distinct parts.pname from parts,catalog
where parts.pid = catalog.pid;


-- Find the snames of suppliers who supply every part.
select s.sname from suppliers s
where not exists ((select p.pid from parts p) except
(selectc.pid from catalog c where c.sid = s.sid));


-- Find the snames of suppliers who supply every red part.
select s.sname from suppliers s
where not exists ((select p.pid from parts p where p.color = "red") except
(select c.pid from catalogc,parts p
where c.sid = s.sid and c.pid = p.pid and p.color = "red"));


-- Find the pnames of parts supplied by Rahul and by no one else.
SELECT P.pname FROM Parts P, Catalog C, Suppliers S
WHERE P.pid = C.pid AND C.sid = S.sid AND S.sname = "Rahul"
AND NOT EXISTS ( SELECT *
FROM Catalog C1, Suppliers S1
WHERE P.pid = C1.pid AND C1.sid = S1.sid AND S1.sname<>"Rahul" );


-- Find the sids of suppliers who charge more for some part than the average cost of that part
SELECT DISTINCT C.sid FROM Catalog C
WHERE C.cost> ( SELECT AVG (C1.cost)
FROM Catalog C1 WHERE C1.pid = C.pid );


-- For each part, find the sname of the supplier who charges the most for that part.
SELECT P.pid, S.sname FROM Parts P, Suppliers S, Catalog C
WHERE C.pid = P.pid AND C.sid = S.sid
AND C.cost = (SELECT MAX(C1.cost) FROM Catalog C1
WHERE C1.pid = P.pid);

-- Find the sids of suppliers who supply only red parts.
SELECT DISTINCT C.sid FROM Catalog C
WHERE NOT EXISTS ( SELECT * FROM Parts P
WHERE P.pid = C.pid AND P.color<> "red");