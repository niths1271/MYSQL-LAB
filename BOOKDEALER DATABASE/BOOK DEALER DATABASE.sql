-- i. Create the above tables by properly specifying the primary keys and the foreign keys.
-- ii. Enter at least five tuples for each relation.
CREATE DATABASE BOOKDEALER;
USE BOOKDEALER;
SHOW DATABASES;
CREATE TABLE AUTHOR(AUTHOR_ID INT,ANAME VARCHAR(30),ACITY VARCHAR(30),ACOUNTRY VARCHAR(30),PRIMARY KEY(AUTHOR_ID));
CREATE TABLE PUBLISHER(PUBLISHER_ID INT,PNAME VARCHAR(20),PCITY VARCHAR(30),PCOUNTRY VARCHAR(30),PRIMARY KEY(PUBLISHER_ID));
CREATE TABLE CATALOG(BOOK_ID INT,TITLE VARCHAR(30),AUTHOR_ID INT,PUBLISHER_ID INT,CATEGORY_ID INT,CYEAR INT,PRICE INT,PRIMARY KEY(BOOK_ID),
                                                                     FOREIGN KEY(AUTHOR_ID) REFERENCES AUTHOR(AUTHOR_ID) ON DELETE CASCADE,
                                                                     FOREIGN KEY(PUBLISHER_ID) REFERENCES PUBLISHER(PUBLISHER_ID) ON DELETE CASCADE,
																	 FOREIGN KEY(CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID) ON DELETE CASCADE);
-- SHOW TABLES;
CREATE TABLE CATEGORY(CATEGORY_ID INT,DESCRIPTION VARCHAR(30),PRIMARY KEY(CATEGORY_ID));
CREATE TABLE ORDER_DETAILS(ORDER_NO INT,BOOK_ID INT,QUANTITY INT,PRIMARY KEY(ORDER_NO),
                          FOREIGN KEY(BOOK_ID) REFERENCES CATALOG(BOOK_ID) ON DELETE CASCADE);
INSERT INTO AUTHOR(AUTHOR_ID,ANAME,ACITY,ACOUNTRY) VALUES (1001,'TERAS CHAN', 'CA','USA'),
												          (1002,'STEVENS', 'ZOMBI','UGANDA'),
                                                          (1003,'M MANO', 'CAIR','CANADA'),
														  (1004,'KARTHIK B.P', 'NEW YORK','USA'),
                                                          (1005,'WILLIAM STALLINGS', 'LAS VEGAS','USA');
INSERT INTO PUBLISHER(PUBLISHER_ID,PNAME,PCITY,PCOUNTRY) VALUES (1,'PEARSON', 'NEW YORK','USA'),
																(2,'EEE','NEW SOUTH WALES','USA'),
																(3,'PHI','DELHI','INDIA'),
										                         (4,'WILLEY', 'BERLIN','GERMANY'),
										                         (5,'MGH', 'NEW YORK','USA');
                                                                 
insert into category values(1001,'CSE');
insert into category values(1002,'ADA');
insert into category values(1003,'ECE');
insert into category values(1004,'PROGRAMING');
insert into category values(1005,'OS');

insert into catalog values(11,'unixsysprg',1001,1,1001,2000 ,251);
insert into catalog values(12,'DS',1002,2,1003, 2001 ,425);
insert into catalog values(13,'LD',1003,3,1002, 1999 ,225);
insert into catalog values(14,'server prg',1004,4,1004, 2001 ,333);
insert into catalog values(15,'linux os',1005,5,1005, 2003 ,326);
insert into catalog values(16,'c++ bible',1005,5,1001, 2000 ,526);
insert into catalog values(17,'cobol HB',1005,4,1001, 2000 ,658);

insert into order_details values(1,11,5);
insert into order_details values(2,12,8);
insert into order_details values(3,13,15);
insert into order_details values(4,14,22);
insert into order_details values(5,15,3);
insert into order_details values(12,17,10);

-- iii. Give the details of the authors who have 2 or more books in the catalog and the year of publication is after 2000.

SELECT A.ANAME,A.AUTHOR_ID,A.ACOUNTRY,A.ACITY FROM AUTHOR A,CATALOG C WHERE A.AUTHOR_ID=C.AUTHOR_ID AND C.CYEAR>=2000 GROUP BY C.AUTHOR_ID HAVING COUNT(C.AUTHOR_ID)>=2;
-- OR 
SELECT * FROM AUTHOR WHERE AUTHOR_ID=(SELECT AUTHOR_ID FROM CATALOG WHERE CYEAR>=2000 GROUP BY AUTHOR_ID HAVING COUNT(AUTHOR_ID)>=2);


-- iv. Find the author of the book which has maximum sales.

SELECT A.ANAME FROM AUTHOR A,CATALOG C,ORDER_DETAILS O WHERE A.AUTHOR_ID=C.AUTHOR_ID AND C.BOOK_ID=O.BOOK_ID 
                                                    AND O.QUANTITY=(SELECT MAX(QUANTITY) FROM ORDER_DETAILS);

-- v. Demonstrate how you increase the price of books published by a specific publisher by 10%.

UPDATE CATALOG SET PRICE=(PRICE+PRICE*0.1) WHERE PUBLISHER_ID=5;
SELECT * FROM CATALOG;


