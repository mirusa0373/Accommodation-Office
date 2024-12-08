DROP DATABASE IF EXISTS universityaccomodationoffice;
CREATE DATABASE universityaccomodationoffice;
USE universityaccomodationoffice;


CREATE TABLE Student(
URN	INT NOT NULL,
Stu_FName	VARCHAR(32) NOT NULL,
Stu_LName	VARCHAR(32) NOT NULL,
Stu_Gender	ENUM('Male','Female','Non Binary', 'Other') NOT NULL,
Stu_DOB	DATE NOT NULL,
Stu_Email	VARCHAR(128) NOT NULL,
Stu_Home_Address	VARCHAR(512) NOT NULL,
Stu_Med_History	VARCHAR(512) NOT NULL,
Stu_Phone	VARCHAR(16) NOT NULL,
Stu_Comments	VARCHAR(512),
PRIMARY KEY(URN));


CREATE TABLE National_Student(
URN	INT NOT NULL,
Nat_Proof_Of_Identity	VARCHAR(1024) NOT NULL,
PRIMARY KEY(URN),
FOREIGN KEY(URN) REFERENCES Student(URN));


CREATE TABLE International_Student(
URN	INT NOT NULL,
Int_Home_Country	VARCHAR(64) NOT NULL,
Int_Proof_Of_Identity	VARCHAR(1024) NOT NULL,
Int_Visa	VARCHAR(1024) NOT NULL,
PRIMARY KEY(URN),
FOREIGN KEY(URN) REFERENCES Student(URN)
);


CREATE TABLE Emergency_Contact(
URN	INT NOT NULL,
EC_FName	VARCHAR(32) NOT NULL,
EC_LName	VARCHAR(32) NOT NULL,
EC_Relationship	VARCHAR(32),
EC_Phone	VARCHAR(16) NOT NULL,
EC_Address	VARCHAR(512) NOT NULL,
EC_Email	VARCHAR(128) NOT NULL,
PRIMARY KEY(URN),
FOREIGN KEY(URN) REFERENCES Student(URN)
);


CREATE TABLE Room(
LocationNumber	VARCHAR(16) NOT NULL,
Campus	VARCHAR(64) NOT NULL,
Block	CHAR(1) NOT NULL,
Floor	INT NOT NULL,
Room_Number	INT NOT NULL,
Number_Of_Occupants	INT NOT NULL,
Band_Type	CHAR(1) NOT NULL,
Is_Repair_Needed	BOOL NOT NULL,
Room_Comments VARCHAR(512),
PRIMARY KEY(LocationNumber)
);


CREATE TABLE Lease(
LeaseNo	VARCHAR(16) NOT NULL,
LocationNumber	VARCHAR(16) NOT NULL,
URN	INT NOT NULL,
StartDate	DATE NOT NULL,
EndDate	DATE NOT NULL,
PRIMARY KEY(LeaseNo),
FOREIGN KEY(LocationNumber) REFERENCES Room(LocationNumber),
FOREIGN KEY(URN) REFERENCES Student(URN)
);





INSERT INTO Student(URN, Stu_FName, Stu_LName, Stu_Gender, Stu_DOB, Stu_Email, Stu_Home_Address, Stu_Med_History, Stu_Phone, Stu_Comments) VALUES

('1234567', 'Dionne', 'Velez', 'Female', '2004-02-09', 'velez34@gmail.com', '12 Rashad Crossing, Aileenton, AV4 901, United Kingdom', 'None', '07269129776', 'No comments'),

('2638891', 'Deshawn', 'Hunter', 'Non Binary', '2003-12-09', 'hdeshawn1@gmail.com', '1 Walter Court, West Sim, NV72 0YP, United Kingdom', 'None', '07269129776', 'Quiet Dorms'),

('7129555', 'Lynne', 'Burton', 'Female', '2000-02-20', 'lynnethebest@hotmail.com', '11 Cornell Village, Lewview, BB3 0SO, United Kingdom', 'None.', '07123444421', 'No comments'),

('6778435', 'Heather', 'Hatton', 'Female', '2002-12-20', 'heather123@outlook.com', '41 Lempi Couse, Port Tom, 0U55 3GK, United Kingdom', 'None.', '07567844421', 'No comments'),

('1269312', 'Jeremy', 'Jenkinson', 'Male', '2004-10-05', 'jeremyjen59@gmail.com', '59 Murphy Village, Pilelen, GH21 0TY, United Kingdom', 'None.', '07462189120', 'No Alchohol Dorms'),

('7654321', 'Reva', 'Bray', 'Male', '2002-03-09', 'revab@gmail.com', '96 Martin Luther Street, 89875, Saarland, Germany', 'Migraines- treated with Topiramate', '497125127127', 'Same Sex Dorms'),

('3591271', 'Mickey', 'Midton', 'Female', '2000-02-09', 'mouse2112@hotmail.com', '21 Wilton, 2584, Adamport, Australia', 'For asthma, inhale short acting beta 2 agonists', '611269555776', 'No comments'),

('3444123', 'Ted', 'Hodge', 'Male', '1999-12-20', 'hodget@gmail.com', '590 Murphy Couse, East Ocie, 24730, United States', 'None.', '17821221991', 'No comments'),

('5678125', 'Camila', 'Heng', 'Female', '2000-07-31', 'hengc@yahoo.com', 'Parque Oscar 2, Pais Vasco, 24730, Spain', 'None.', '347212921921', 'Single Sex Dorms, Quiet Dorms'),

('1279889', 'Costa', 'Bonomi', 'Non Binary', '1999-04-20', 'boncosta@gmail.com', 'Borgo Arialdo 98, Piano 3, 22810, Umbro, Italy', 'Asthma attack- use xanthines.', '397218301231', 'Quiet Dorms')
;


INSERT INTO National_Student (URN, Nat_Proof_Of_Identity) VALUES

('1234567', 'Passport, Passport Number: 556983454, Class: A, ISS: 1/2/2020, EXP: 1/2/2025'),

('2638891', 'Passport, Passport Number: 456891234, Class: C, ISS: 13/11/2020, EXP: 13/11/2025'),

('7129555', 'Passport, Passport Number: 124723221, Class: B, ISS: 5/5/2020, EXP: 5/5/2025'),

('6778435', 'Passport, Passport Number: 455463770, Class: A, ISS: 12/3/2020, EXP: 12/3/2025'),

('1269312', 'Passport, Passport Number: 243512311, Class: A, ISS: 17/9/2020, EXP: 17/9/2025')
;


INSERT INTO International_Student (URN, Int_Home_Country, Int_Proof_Of_Identity, Int_Visa) VALUES

('7654321', 'Germany', 'Passport, Passport Number: 216788112, Class: A, ISS: 01/02/2020, EXP: 01/02/2025', 'Visa Number: 010000663, Type: D-STUDY, ISS: 01/02/2022, EXP:01/02/2027'), 

('3591271', 'Australia', 'Driving Licence, ID Number: 781221781, Class: A, ISS: 20/12/2020, EXP: 20/12/2025', 'Visa Number: 219129190, Type: D-STUDY, ISS: 20/12/2022, EXP:20/12/2027'),

('3444123', 'United States', 'Driving Licence, ID Number: 63315061, Class: C, ISS: 19/09/2022, EXP: 19/02/2027', 'Visa Number: 080000123, Type: D-STUDY, ISS: 09/06/2022, EXP:09/06/2027'),

('5678125', 'Spain', 'Driving Licence, ID Number: 858828084, Class: B, ISS: 07/06/2020, EXP: 07/06/2025', 'Visa Number: 010000663, Type: D-STUDY, ISS: 11/09/2022, EXP:11/09/2027'),

('1279889', 'Italy', 'Passport, Passport Number: 768231129, Class: A, ISS: 02/02/2020, EXP: 02/02/2025', 'Visa Number: 678712341, Type: D-STUDY, ISS: 12/07/2021, EXP:12/07/2026')
;


INSERT INTO Emergency_Contact (URN, EC_FName, EC_LName, EC_Relationship, EC_Phone, EC_Address, EC_Email) VALUES

('1234567', 'Audrina', 'Cabello', 'Mother', '07890867155', '12 Rashad Crossing, Aileenton, AV4 901, United Kingdom', 'cabellaa12@gmail.com'),

('2638891', 'Elvis', 'Rainey', 'Father', '07567668541', '1 Walter Court, West Sim, NV72 0YP, United Kingdom', 'elvisrainey129@yahoo.com'),

('7129555', 'Jos', 'Mitchell', 'Sister', '01672671980', '11 Cornell Village, Lewview, BB3 0SO, United Kingdom', 'mitchell09@gmail.com'),

('6778435', 'Atticus', 'Raity', 'Father', '01829192012', '41 Lempi Couse, Port Tom, 0U55 3GK, United Kingdom', 'raityattic@gmail.com'),

('1269312', 'Anna', 'Perez', 'Mother', '07129127966', '59 Murphy Village, Pilelen, GH21 0TY, United Kingdom', 'annaperez127@gmail.com')
;


INSERT INTO Room(LocationNumber, Campus, Block, Floor, Room_Number, Number_Of_Occupants, Band_Type, Is_Repair_Needed, Room_Comments) VALUES
('121', 'Manor Park', 'R', '1', '1153', '1', 'D', '0', 'None.'),

('403', 'Stag Hill', 'A', '4', '1122', '1', 'C', '1', 'Water emptying slow in shower.'),

('203', 'Manor Park', 'Q', '1', '1113', '2', 'E', '0', 'None.'),

('527', 'Stag Hill', 'B', '1', '121', '1', 'D', '0', 'Wall scratches near entrance.'),

('84', 'Manor Park', 'S', '3', '1345', '3', 'F', '0', 'None.');


INSERT INTO Lease(LeaseNo, LocationNumber, URN, StartDate, EndDate) VALUES
('3244334', '121', '1234567', '2022-09-09', '2023-06-12'),

('2352445', '403', '2638891', '2022-09-09', '2023-06-12'),

('4543552', '203', '7129555', '2022-09-09', '2023-06-12'),

('1212365', '527', '6778435', '2022-09-09', '2023-06-12'),

('5464376', '84', '1269312', '2022-09-09', '2023-06-12');

