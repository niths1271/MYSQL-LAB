-- i. Create the above tables by properly specifying the primary keys and the foreign keys.
-- ii. Enter at least five tuples for each relation.
CREATE DATABASE STUDENT_ENROLLMENT;
USE STUDENT_ENROLLMENT;
-- SHOW DATABASES;
CREATE TABLE STUDENT(REG_NO VARCHAR(30),SNAME VARCHAR(30),MAJOR VARCHAR(30),BDATE DATE,PRIMARY KEY(REG_NO));

CREATE TABLE COURSE(COURSE_ID INT,CNAME VARCHAR(30),DEPT VARCHAR(30),PRIMARY KEY(COURSE_ID));

CREATE TABLE ENROLL(REG_NO VARCHAR(30),COURSE_ID INT,SEM INT,MARKS INT,
				  FOREIGN KEY(REG_NO) REFERENCES STUDENT(REG_NO) ON UPDATE CASCADE,
                  FOREIGN KEY(COURSE_ID) REFERENCES COURSE(COURSE_ID) ON UPDATE CASCADE);
                  
CREATE TABLE BOOK_ADPOTION(COURSE_ID INT,SEM INT,BOOK_ISBN INT,
                  FOREIGN KEY(COURSE_ID) REFERENCES COURSE(COURSE_ID) ON DELETE CASCADE ON UPDATE CASCADE);
                  
CREATE TABLE TEXT(BOOK_ISBN INT,BOOK_TITLE VARCHAR(30),PUBLISHER VARCHAR(30),AUTHOR VARCHAR(30),
				  FOREIGN KEY(BOOK_ISBN) REFERENCES COURSE(BOOK_ISBN) ON UPDATE CASCADE);

INSERT INTO STUDENT(REG_NO,SNAME,MAJOR,BDATE) VALUES ('CS01', 'RAM', 'DS', '1986-03-12'),
													 ('IS02', 'SMITH', 'USP', '1987-12-23'),
													 ('EC03', 'AHMED', 'SNS', '1985-04-17'),
													 ('CS03', 'SNEHA', 'DBMS', '1987-01-01'),
													 ('TC05', 'AKHILA', 'EC', '1986-10-06');
INSERT INTO COURSE(COURSE_ID,CNAME,DEPT) VALUES (11, 'DS', 'CS'),
												(22, 'USP', 'IS'),
												(33, 'SNS', 'EC'),
												(44, 'DBMS', 'CS'),
												(55, 'EC', 'TC');
INSERT INTO ENROLL(REG_NO,COURSE_ID,SEM,MARKS) VALUES ('CS01', 11, 4, 85),
													  ('IS02', 22, 6, 80),
													  ('EC03', 33, 2, 80),
													  ('CS03', 44, 6, 75),
													  ('TC05', 55, 2, 8);
INSERT INTO BOOK_ADOPTION(COURSE_ID,SEM,BOOK_ISBN) VALUES (11,4,1),
                                                          (11,4,2),
														  (44,6,3),
                                                          (44,6,4),
														  (55,2,5),
                                                          (22,6,6),
                                                          (55,2,7);
                                            





                                                
