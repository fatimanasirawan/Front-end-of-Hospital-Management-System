#create database HMS;
USE HMS;

CREATE TABLE Ward
(
WardId              integer PRIMARY KEY NOT NULL,
WardName            CHAR(30),
Description         CHAR(100)
);

####################################################################################################################

CREATE TABLE Room
(
RoomId              integer PRIMARY KEY NOT NULL,
WardId              integer,
RoomNumber          VARCHAR(100),

FOREIGN KEY(WardId) REFERENCES Ward(WardId)
);

####################################################################################################################

CREATE TABLE Pharmacy
(
PharmacyId          integer PRIMARY KEY NOT NULL,
StoreNName          VARCHAR(10),
StreetAddress       VARCHAR(25),
City                VARCHAR(20),
State               VARCHAR(20),
Zipcode             VARCHAR(20),
Phone               VARCHAR(20),
LeadPharmacist      VARCHAR(20),
Email               VARCHAR(30)
);

####################################################################################################################

CREATE TABLE InsurancePolicy
(
PolicyNumber          integer PRIMARY KEY NOT NULL,
InsuranceNetwork      CHAR(30),
PolicyName            CHAR(30),
Description           VARCHAR(25),
Deductible            decimal(10,2),
Co_pay                double NOT NULL
);

####################################################################################################################

CREATE TABLE Patient
(
PatientId           integer PRIMARY KEY NOT NULL,
RoomId              integer NOT NULL,
FirstName           VARCHAR(20),
LastName            VARCHAR(20),
Email               VARCHAR(20),
Phone               VARCHAR(20),
StreetAdress        VARCHAR(20),
City                VARCHAR(20),
State               VARCHAR(20),
Zipcode             VARCHAR(20),
Allergies           CHAR(30),
ChronicDisease      CHAR(30),
OtherHealthConcerns CHAR(30),

PolicyNumber       integer NOT NULL,
PharmacyId         integer NOT NULL,

FOREIGN KEY(PolicyNumber) REFERENCES InsurancePolicy(PolicyNumber),
FOREIGN KEY(PharmacyId) REFERENCES Pharmacy(PharmacyId),
FOREIGN KEY(RoomId) REFERENCES Room(RoomId)
);

####################################################################################################################

CREATE TABLE TreatmentDetails
(
TreatmentDetailsId     integer PRIMARY KEY ,
TreatmentName          VARCHAR(25),
Description            CHAR(100),
Price                  decimal(10,2)

);

####################################################################################################################

CREATE TABLE Treatment
(
TreatmentId           integer PRIMARY KEY NOT NULL,
PatientId             integer,
TreatmentDetailsId    integer,
CurrentCondition      VARCHAR(100),
TreatmentDate         datetime,

FOREIGN KEY(PatientId) REFERENCES Patient(PatientId),
FOREIGN KEY(TreatmentDetailsId) REFERENCES TreatmentDetails(TreatmentDetailsId)
);

####################################################################################################################

CREATE TABLE Payment
(
PaymentNumber        integer PRIMARY KEY NOT NULL,
PatientId            integer,
TreatmentId          integer,
TotalAmountDue       decimal(10,2),
DueDate              datetime,
AmountPaid           decimal(10,2),
CurrentBalance       decimal(10,2),

FOREIGN KEY(TreatmentId) REFERENCES Treatment(TreatmentId),
FOREIGN KEY(PatientId)   REFERENCES Patient(PatientId)
);

####################################################################################################################

CREATE TABLE InsurancePayment
(
PaymentNumber         integer  NOT NULL,
PolicyNumber          integer PRIMARY KEY NOT NULL,
AppliedDeductible     decimal(10,2),

FOREIGN KEY(PolicyNumber) REFERENCES InsurancePolicy(PolicyNumber),
FOREIGN KEY(PaymentNumber) REFERENCES Payment(PaymentNumber)
);

####################################################################################################################

CREATE TABLE Perscription
(
PerscriptionId      integer PRIMARY KEY NOT NULL,
Name                CHAR(20),
Description         CHAR(20),
SideEffects         CHAR(50)
);

####################################################################################################################

CREATE TABLE PerscriptionHistory
(
PatientId           integer NOT NULL,
PerscriptionId      integer,
DatePerscribed      datetime,
Dosage              VARCHAR(100),
Frequency           VARCHAR(20),

FOREIGN KEY(PatientId)      REFERENCES Patient(PatientId),
FOREIGN KEY(PerscriptionId) REFERENCES Perscription(PerscriptionId)
);

####################################################################################################################

CREATE TABLE Doctor
(
DoctorId            integer PRIMARY KEY NOT NULL,
SupervisorId        integer NOT NULL,
FirstName           VARCHAR(20),
LastName            VARCHAR(20),
Email               VARCHAR(20),
Phone               VARCHAR(20),
StreetAdress        VARCHAR(20),
City                VARCHAR(20),
State               VARCHAR(20),
InsuranceNetwork    VARCHAR(20)


);

####################################################################################################################

CREATE TABLE Nurse
(
NurseId             integer PRIMARY KEY NOT NULL,
FirstName           VARCHAR(20),
LastName            VARCHAR(20),
Email               VARCHAR(20),
Phone               VARCHAR(20),
StreetAddress       VARCHAR(20),
City                VARCHAR(20),
State               VARCHAR(20),
Zipcode             VARCHAR(20)
);

####################################################################################################################

CREATE TABLE NurseWard
(
WardAssignmentId    integer PRIMARY KEY NOT NULL,
NurseId             integer,
WardId              integer,
Shift               datetime,
ShiftTime           CHAR(30),

FOREIGN KEY(NurseId) REFERENCES Nurse(NurseId),
FOREIGN KEY(WardId) REFERENCES Ward(WardId)
);

####################################################################################################################

CREATE TABLE Speciality
(
SpecialityId        integer PRIMARY KEY NOT NULL,
SpecialityName      CHAR(20),
Description         CHAR(200)
);

####################################################################################################################



CREATE TABLE Doctor_Patient
(
DoctorId            integer PRIMARY KEY NOT NULL,
PatientId           integer NOT NULL,
AptDate             datetime,

FOREIGN KEY(DoctorId)  REFERENCES Doctor(DoctorId),
#FOREIGN KEY(PatientId) REFERENCES Patient(PatientId),
 UNIQUE(PatientId) 
);

####################################################################################################################

CREATE TABLE Doctor_Speciality
(
SpecialityId       integer PRIMARY KEY NOT NULL,
DoctorId           CHAR(20) ,

FOREIGN KEY(SpecialityId) REFERENCES Speciality(SpecialityId),
 UNIQUE(DoctorId)

);

####################################################################################################################




---------------------------------------------------------------------------------------------------------------
                                      INSERTION
 --------------------------------------------------------------------------------------------------------------
 
 
 
INSERT INTO Ward (WardId , WardName  , Description) VALUES
('1' , 'Dengue Ward' , 'All patients having Dengue' ),
('2' , 'ICU Ward' , 'All patients having serious problem'),
('3' , 'Heart Ward' , 'All patients having Heart Problems'),
('4' , 'Test Ward' , 'All patients will have blood test in TestWard'),
('5' , 'Surgical Ward' , 'Patients will have surgery in surgical Ward'),
('6', 'Cardiology Ward', 'For heart-related disorders'),
('7', 'Oncology Ward', 'For cancer treatment'),
('8', 'Pediatrics Ward', 'For medical care of children'),
('9', 'Maternity Ward', 'For prenatal and postnatal care'),
('10', 'Psychiatric Ward', 'For mental health and related disorders');
select*From Ward;



INSERT INTO Room (RoomId  , WardId , RoomNumber ) VALUES
(011 , '1' , '401F' ),
(012 , '2' , '402G' ),
(013 , '3' , '403H' ),
(014 , '4' , '404I' ),
(015 , '5' , '405J' ),
(016 , '6' , '406K'),
(017 , '7' , '407L'),
(018 , '8' , '408M'),
(019 , '9' , '409N'),
(020 , '10' , '410O');
select * From Room;




INSERT INTO Pharmacy (PharmacyId,StoreNName,StreetAddress,City,State,Zipcode,Phone,LeadPharmacist,Email) VALUES

('021' , 'BestCare'      , 'Delivery Islamabad I-10' , 'Islamabad' , 'Pakistan ' ,'AB12', '032457954' , 'Managed Care' , 'abc1@gmail.com'),
('022' , 'Generation', 'General Post Office' , 'Peshawar'  , 'Pakistan'          ,'AC13', '032678912' ,'AL-Noor ' , 'bca2@gmail.com'),
('023' , 'Medilane '  , 'KARACHI GPO74200' , 'Karachi'   , 'Pakistan'            ,'AD14', '032567891' , 'Sheikh' , 'cba3@gmail.com'),
('024' , 'Health'       , 'Delivery Karachi  office' , 'Sialkot' , 'Pakistan '   ,'AE15', '032897630' , 'Trainer' , 'bac4@gmail.com'),
('025' , 'Center'    , 'Lahore Post office', 'Lahore' , 'Pakistan '              ,'AF16', '032456098' , 'E Pharmacist' , 'cab5@gmail.com'),
('026' , 'Kings'     , 'Kashmir Post office', 'Quetta' , 'Pakistan '             ,'AG17', '033260974'  , 'F Pharmacist' , 'fmn5@gmail.com'),
('027' , 'MixLab'    , 'B-4/91 MuslimTown', 'Rawalpindi' , 'Pakistan '           ,'AH18', '033111084'  , 'AL-hassan' , 'xyz@gmail.com'),
('028' , 'NewLondon' , '918A  Scheme3', 'Rawalpindi' , 'Pakistan '               ,'AI19', '031083364'  , 'SM super' , 'def@gmail.com'),
('029' , 'New' , 'DIK GPO74200', 'Dera Ismail Khan'  ,'Pakistan '                ,'AJ20', '031021795'  , 'Imtiaz' , 'fatima@gmail.com'),
('030' , '	Hudson' , 'AAFK87 Scheme2', 'Rawalpindi' ,'Pakistan '                ,'AK21', '037789526'  , 'Savemart' , 'shajia@gmail.com');
select * From Pharmacy ;




INSERT INTO InsurancePolicy (PolicyNumber,InsuranceNetwork,PolicyName,Description,Deductible,Co_pay) VALUES
('001' , 'UIC PAKISTAN' ,'Health Insurance' , '150000' , '5000', '30.7'),
('002' , 'Jubliee' , 'Fire Insurance' ,'2500000' , '2300' , '23.6'),
('003' , 'TPL Insurance' , 'Home Insurance' , '280000' , '1000' , '50.1'),
('004' , 'EFU' ,'Transport Insurance' , '10,00,000' , '6000 ' , '20.9'),
('005' , 'INC Pakistan' ,'Motor Insurance' , '20,00,000' , '17000 ','30.7' ),
('006' , 'POS' ,'Motor Insurance' , '20,00,000' , '30000 ','60.89' ),
('007' , 'INC Pakistan' ,'abc Insurance' , '22,00,000' , '9000 ','10.6' ),
('008' , 'HMO Pakistan' ,'Maintenance Insurance' , '16,00,000' , '10000 ','19.1' ),
('009' , 'PPO Pakistan' ,'Provider Insurance' , '18,000' , '8000 ','11.97' ),
('0010' , 'HSA Pakistan' ,'Healthsaving Insurance' , '60,00,000' , '2000 ','3.12' );
select * From  InsurancePolicy;


INSERT INTO Patient(PatientId, RoomId, FirstName, LastName, Email, Phone, StreetAdress, City, State, Zipcode, Allergies, ChronicDisease, OtherHealthConcerns, PolicyNumber, PharmacyId)
VALUES 
  (100, 011, 'Sara', 'Tariq', 'Sara@example.com', '123-456-7890', '123 Main St', 'Anytown', 'CA', '12345', 'Peanuts', 'Asthma', 'High blood pressure', 001, 021),
  (200, 012, 'Saher', 'Tariq', 'Saher@example.com', '234-567-8901', '456 Oak St', 'Otherville', 'NY', '45678', 'Shellfish', 'Diabetes', 'Anxiety', 002, 022),
  (300, 013, 'Bob', 'Johnson', 'bob@example.com', '345-678-9012', '789 Elm St', 'Smalltown', 'OH', '56789', 'None', 'Arthritis', 'Depression', 003, 023),
  (400, 014, 'Lee', 'Thomskin', 'lee@example.com', '456-789-0123', '234 Maple St', 'Bigcity', 'CA', '67890', 'Pollen', 'Migraines', 'High cholesterol', 004, 024),
  (500, 015, 'Bruce', 'Wynes', 'bruce@example.com', '567-890-1234', '567 Pine St', 'Somewhere', 'TX', '78901', 'Dust', 'Hypertension', 'GERD', 005, 025),
  (600, 016, 'Thomas', 'Wynes', 'thomas@example.com', '678-901-2345', '890 Cedar St', 'Nowhere', 'WY', '89012', 'Cats', 'Eczema', 'Back pain', 006, 026),
  (700, 017, 'Jim', 'Gordan', 'Jim@example.com', '789-012-3456', '123 Oak Ave', 'Uptown', 'NY', '90123', 'Penicillin', 'Asthma', 'Depression', 007,027 ),
  (800, 018, 'Barbara', 'Chen', 'barbara@example.com', '890-123-4567', '456 Elm Ave', 'Downtown', 'CA', '01234', 'Nuts', 'Migraines', 'Anemia', 008, 028),
  (900, 019, 'Dave', 'Singh', 'dave@example.com', '901-234-5678', '789 Maple Ave', 'Midtown', 'TX', '12345', 'None', 'High blood pressure', 'GERD', 009, 029),
  (1000, 020, 'Jenny', 'Kim', 'jenny@example.com', '012-345-6789', '234 Pine Ave', 'Anytown', 'CA', '34567', 'Shellfish', 'Arthritis', 'Depression', 0010, 030);
select * From Patient ;




INSERT INTO TreatmentDetails(TreatmentDetailsId, TreatmentName, Description, Price)VALUES 
  (1, 'Teeth Cleaning', 'A basic teeth cleaning that includes removing plaque and tartar buildup', 75.00),
  (2, 'Cavity Filling', 'Filling a cavity to prevent further tooth decay', 150.00),
  (3, 'Root Canal', 'Removing infected tissue from inside a tooth', 800.00),
  (4, 'Tooth Extraction', 'Removing a tooth that cannot be saved', 200.00),
  (5, 'Teeth Whitening', 'A cosmetic treatment that removes stains and brightens teeth', 250.00),
  (6, 'Dental Implant', 'A permanent solution for replacing missing teeth', 2000.00),
  (7, 'Braces', 'A orthodontic treatment for correcting crooked teeth or a misaligned bite', 3500.00),
  (8, 'Dentures', 'A removable appliance for replacing missing teeth', 1200.00),
  (9, 'Gum Surgery', 'A surgical procedure for treating gum disease', 1500.00),
  (10, 'Mouthguard', 'A device for protecting teeth during sports or grinding', 100.00);
select * From TreatmentDetails ;


INSERT INTO Treatment(TreatmentId, PatientId, TreatmentDetailsId, CurrentCondition, TreatmentDate)VALUES 
  (1001, 100, 1, 'Good', '2022-03-15'),
  (1002, 200, 2, 'Fair', '2022-03-16'),
  (1003, 300, 3, 'Poor', '2022-03-17'),
  (1004, 400, 4, 'Good', '2022-03-18'),
  (1005, 500, 5, 'Fair', '2022-03-19'),
  (1006, 600, 6, 'Poor', '2022-03-20'),
  (1007, 700, 7, 'Good', '2022-03-21'),
  (1008, 800, 8, 'Fair', '2022-03-22'),
  (1009, 900, 9, 'Poor', '2022-03-23'),
  (1010, 1000,10, 'Good', '2022-03-24');
  select * From Treatment ;



INSERT INTO Payment(PaymentNumber,PatientId ,TreatmentId,TotalAmountDue,DueDate,AmountPaid,CurrentBalance)VALUES
  (101, 100, 1001, 75.00, '2022-04-15', 75.00, 0.00),
  (201, 200, 1002, 150.00, '2022-04-16', 75.00, 75.00),
  (301, 300, 1003, 800.00, '2022-04-17', 400.00, 400.00),
  (401, 400, 1004, 200.00, '2022-04-18', 150.00, 50.00),
  (501, 500, 1005, 250.00, '2022-04-19', 0.00, 250.00),
  (601, 600, 1006, 2000.00, '2022-04-20', 1000.00, 1000.00),
  (701, 700, 1007, 3500.00, '2022-04-21', 1750.00, 1750.00),
  (801, 800, 1008, 1200.00, '2022-04-22', 600.00, 600.00),
  (901, 900, 1009, 1500.00, '2022-04-23', 0.00, 1500.00),
  (1001,1000, 1010, 100.00, '2022-04-24', 100.00, 0.00);
select * From  Payment;



INSERT INTO InsurancePayment(PaymentNumber,PolicyNumber,AppliedDeductible)VALUES
  (101, '001', 25.00),
  (201, '002', 50.00),
  (301, '003', 100.00),
  (401, '004', 0.00),
  (501, '005', 75.00),
  (601, '006', 200.00),
  (701, '007', 500.00),
  (801, '008', 0.00),
  (901, '009', 100.00),
  (1001, '0010', 25.00);
  select * From InsurancePayment;


 INSERT INTO  Perscription(PerscriptionId,Name,Description,SideEffects)VALUES
  (111, 'Ibuprofen', 'Pain relief ', 'Upset stomach'),
  (222, 'Amoxicillin', 'Antibiotic', 'Nausea, diarrhea'),
  (333, 'Lisinopril', 'BP medication', 'Dizziness'),
  (444, 'Metformin', 'Diabetes medication', 'Stomach pain'),
  (555, 'Simvastatin', 'Cholesterol mdicat', 'Muscle pain'),
  (666, 'Aspirin', 'Blood thinner', 'Stomach bleeding'),
  (777, 'Albuterol', 'Asthma medication', 'Tremors'),
  (888, 'Prednisone', 'Steroid', 'Weight gain'),
  (999, 'Gabapentin', 'Seizure medication', 'Dizziness, drowsiness'),
  (1010, 'Omeprazole', 'Acid medication', 'Headache');
  select * From Perscription;
  


  INSERT INTO  PerscriptionHistory(PatientId,PerscriptionId,DatePerscribed,Dosage,Frequency)VALUES
  (100, 111, '2022-01-01', '10mg', 'Once daily'),
  (200, 222, '2022-02-01', '20mg', 'Twice daily'),
  (300, 333, '2022-01-15', '5mg', 'Once daily'),
  (400, 444, '2022-02-15', '10mg', 'Twice daily'),
  (500, 555, '2022-03-01', '15mg', 'Once daily'),
  (600, 666, '2022-03-15', '30mg', 'Twice daily'),
  (700, 777, '2022-04-01', '5mg', 'Once daily'),
  (800, 888, '2022-05-01', '10mg', 'Twice daily'),
  (900, 999, '2022-04-15', '20mg', 'Once daily'),
  (1000,1010, '2022-05-15','40mg', 'Twice daily');
select * From PerscriptionHistory;




INSERT INTO Doctor(DoctorId,SupervisorId,FirstName,LastName,Email,Phone,StreetAdress,City,State,InsuranceNetwork)VALUES 
  (1, 11, 'Sara', 'Tariq', 'saratariq@email.com', '555-123-4567', '123 Main St', 'Los Angeles', 'CA', 'Aetna'),
  (2, 22, 'Saher', 'Tariq', 'sahertariq@email.com', '555-234-5678', '456 Oak Ave', 'San Francisco', 'CA', 'Blue Cross'),
  (3, 33, 'David', 'Joe', 'david.joe@email.com', '555-345-6789', '789 Elm St', 'New York', 'NY', 'Cigna'),
  (4, 44, 'Lisa', 'Williams', 'williams@email.com', '555-456-7890', '234 Pine Ave', 'Boston', 'MA', 'Humana'),
  (5, 55, 'Michael', 'Garcia', NULL, '555-567-8901', '567 Maple St', 'Miami', 'FL', 'UnitedHealthcare'),
  (6, 66, 'Michelle', 'Martinez', NULL, '555-678-9012', '890 Cedar Ln', 'Chicago', 'IL', 'Aetna'),
  (7, 77, 'Christopher', 'Brown', NULL, '555-789-0123', '345 Elmwood Ave', 'Atlanta', 'GA', 'Blue Shield'),
  (8, 88, 'Amanda', 'Davis', NULL, '555-890-1234', '678 Oak Rd', 'Dallas', 'TX', 'Cigna'),
  (9, 99, 'Matthew', 'Rodriguez', NULL, '555-901-2345', '901 Pine St', 'Denver', 'CO', 'Humana'),
  (10, 1010, 'Ashley', 'Wilson', NULL, '555-012-3456', '234 Cedar Ave', 'Seattle', 'WA', 'UnitedHealthcare');
select * From Doctor;



INSERT INTO Nurse(NurseId,FirstName,LastName,Email,Phone,StreetAddress,City,State,Zipcode) VALUES
(122, 'Sara', 'Tariq', 'saratariq@email.com', '03432958', '123 Main St', 'Los Angeles', 'CA', 'Aetna'),
  (123, 'Saher', 'Tariq', 'sahertariq@email.com', '5552345678', '456 Oak Ave', 'San Francisco', 'CA', 'Blue Cross'),
  (124, 'David', 'Joe', 'david.joe@email.com', '5553456789', '789 Elm St', 'New York', 'NY', 'Cigna'),
  (125, 'Lisa', 'Williams', 'williams@email.com', '5554567890', '234 Pine Ave', 'Boston', 'MA', 'Humana'),
  (126, 'Michael', 'Garcia', NULL, '5555678901', '567 Maple St', 'Miami', 'FL', 'UnitedHealthcare'),
  (127, 'Michelle', 'Martinez', NULL, '5556789012', '890 Cedar Ln', 'Chicago', 'IL', 'Aetna'),
  (128, 'Christopher', 'Brown', NULL, '5557890123', '345 Elmwood Ave', 'Atlanta', 'GA', 'Blue Shield'),
  (129, 'Amanda', 'Davis', NULL, '5558901234', '678 Oak Rd', 'Dallas', 'TX', 'Cigna'),
  (130, 'Matthew', 'Rodriguez', NULL, '5559012345', '901 Pine St', 'Denver', 'CO', 'Humana'),
  (131, 'Ashley', 'Wilson', NULL, '5550123456', '234 Cedar Ave', 'Seattle', 'WA', 'UnitedHealthcare');
  select * From  Nurse;


INSERT INTO NurseWard(WardAssignmentId,NurseId,WardId,Shift,ShiftTime) VALUES
  (211, 122, 1, '20:02:27', 'Onehour'),
  (222, 123, 2, '21:02:18', 'twohour'),
  (233, 124, 3, '20:02:10', 'threehour'),
  (244, 125, 4, '20:02:2', 'fourhour'),
  (255, 126, 2, '20:02:17', 'fifehour'),
  (266, 127, 5, '20:02:17', 'sixhour'),
  (277, 128, 6, '20:02:20', 'sevenhour'),
  (288, 129, 7, '20:02:19', 'eighthour'),
  (299, 130, 8, '20:02:5', 'ninehour'),
  (230, 131, 9, '20:02:20 ','tenhour');
select * From NurseWard ;


INSERT INTO Speciality(SpecialityId,SpecialityName,Description) VALUES
  (311, 'Cardiology', 'Deals with heart disorders'),
  (322, 'Oncology', 'Deals with cancer treatment'),
  (333, 'Pediatrics', 'Deals with medical care of children'),
  (344, 'Gynecology', 'Deals with medical care of female reproductive system'),
  (355, 'Neurology', 'Deals with nervous system disorders'),
  (366, 'Dermatology', 'Deals with skin and related disorders'),
  (377, 'Orthopedics', 'Deals with bone and joint disorders'),
  (388, 'Endocrinology', 'Deals with hormonal imbalances'),
  (399, 'Urology', 'Deals with medical care of urinary tract system'),
  (310, 'Psychiatry', 'Deals with mental health and related disorders');
  select * From Speciality;



INSERT INTO Doctor_Speciality(SpecialityId,DoctorId) VALUES
  (311, 1),
  (322, 2),
  (333, 3),
  (344, 4),
  (355, 5),
  (366, 6),
  (377, 7),
  (388, 8),
  (399, 9),
  (310, 10);
select * From Doctor_Speciality;
*/



/*INSERT INTO Doctor_Patient(DoctorId,PatientId,AptDate) VALUES
(1, 100, '2023-04-13'),
(2, 200, '2023-04-14'),
(3, 300, '2023-04-15'),
(4, 400, '2023-04-16'),
(5, 500, '2023-04-17'),
(6, 600, '2023-04-18'),
(7, 700, '2023-04-19'),
(8, 800, '2023-04-20'),
(9, 900, '2023-04-21'),
(10, 1000, '2023-04-22');
select * From Doctor_Patient;

*/

select * From Patient ;