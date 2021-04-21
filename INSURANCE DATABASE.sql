-- i. Create the above tables by properly specifying the primary keys and the foreign keys.
-- ii. Enter at least five tuples for each relation.
CREATE DATABASE INSURANCE;
USE INSURANCE;
SHOW DATABASES;
CREATE TABLE PERSON(DRIVER_ID VARCHAR(20),PNAME VARCHAR(30),ADDRESSS VARCHAR(20),PRIMARY KEY(DRIVER_ID));
CREATE TABLE CAR(REGNO VARCHAR(20),MODEL VARCHAR(20),CYEAR INT,PRIMARY KEY(REGNO));
CREATE TABLE ACCIDENT(REPORT_NUM INT,ADATE DATE,LOCATION VARCHAR(30),PRIMARY KEY(REPORT_NUM));
SHOW TABLES;
CREATE TABLE OWNS(DRIVER_ID VARCHAR(20),REGNO VARCHAR(20),PRIMARY KEY(DRIVER_ID,REGNO),
                  FOREIGN KEY(DRIVER_ID) REFERENCES PERSON(DRIVER_ID) ON DELETE CASCADE,
                  FOREIGN KEY(REGNO) REFERENCES CAR(REGNO) ON DELETE CASCADE);
CREATE TABLE PARTICIPATED(DRIVER_ID VARCHAR(20),REGNO VARCHAR(20),REPORT_NUM INT,DAMAGE_AMT DOUBLE,
                          FOREIGN KEY(DRIVER_ID,REGNO) REFERENCES OWNS(DRIVER_ID,REGNO) ON DELETE CASCADE,
						  FOREIGN KEY(REPORT_NUM) REFERENCES ACCIDENT(REPORT_NUM) ON DELETE CASCADE);
DESC PARTICIPATED;
INSERT INTO PERSON VALUES('1111','RAMU','K.S LAYOUT');
INSERT INTO PERSON(DRIVER_ID, PNAME,ADDRESSS) VALUES (2222, 'JOHN', 'INDIRANAGAR'),
												     (3333, 'PRIYA', 'JAYANAGAR'),
                                                     (4444, 'GOPAL', 'WHITEFIELD'),
                                                     (5555, 'LATHA', 'VIJAYANAGAR');
INSERT INTO CAR(REGNO,MODEL,CYEAR) VALUES ('KA04Q2301', 'MARUTHI-DX', 2000),
                                              ('KA05P1000', 'FORDICON', 2000),
                                              ('KA03L1234', 'ZEN-VXI', 1999),
                                              ('KA03L9999', 'MARUTHI-DX', 2002),
                                              ('KA01P4020', 'INDICA-VX', 2002);
INSERT INTO ACCIDENT(REPORT_NUM,ADATE,LOCATION) VALUES (12, '2002-06-01', 'M G ROAD'),
                                                            (200, '2002-12-10', 'DOUBLEROAD'),
                                                            (300, '1999-07-23', 'M G ROAD'),
                                                            (25000, '2000-06-11', 'RESIDENCY ROAD'), 
                                                            (26500, '2001-10-16', 'RICHMOND ROAD');
INSERT INTO OWNS(DRIVER_ID,REGNO) VALUES ('1111', 'KA04Q2301'), ('1111', 'KA05P1000'), ('2222', 'KA03L1234'), ('3333', 'KA03L9999'), ('4444', 'KA01P4020');
INSERT INTO PARTICIPATED(DRIVER_ID, REGNO, REPORT_NUM, DAMAGE_AMT) VALUES ('1111', 'KA04Q2301', 12, 20000),
                                                                            ('2222', 'KA03L1234', 200, 500),
                                                                             ('3333', 'KA03L9999', 300, 10000),
                                                                            ('4444', 'KA01P4020', 25000, 2375),
																		    ('1111', 'KA05P1000', 26500, 70000);
                                                                            
-- 3a Update the damage amount for the car with a specific Regno in the accident with report number 12 to 25000.
UPDATE PARTICIPATED SET DAMAGE_AMT=25000 WHERE REPORT_NUM =12 AND REGNO='KA04Q2301';
SELECT * FROM PARTICIPATED;

-- b. Add a new accident to the database.
INSERT INTO ACCIDENT VALUE('20000','2003-05-13','Frazer Town');

-- iv. Find the total number of people who owned cars that involved in accidents in 2008.
SELECT COUNT(*) FROM ACCIDENT WHERE YEAR(ADATE)=2002;

-- v. Find the number of accidents in which cars belonging to a specific model were involved.
SELECT COUNT(A.REPORT_NUM) FROM ACCIDENT A, PARTICIPATED P, CAR C
WHERE A.REPORT_NUM=P.REPORT_NUM
AND
P.REGNO=C.REGNO
AND
C.MODEL='MARUTHI-DX';






