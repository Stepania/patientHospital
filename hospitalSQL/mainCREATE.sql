CREATE DATABASE ARAHOSPITAL;
GO

drop database HOSPITAL

CREATE TABLE DEPARTMENT (
	departmentID int,
	departmentName varchar (50) NOT NULL,
	PRIMARY KEY (departmentID)
);

drop table DEPARTMENT;

select*from DEPARTMENT;

--ref DOCTOR doctorID	doctorName	doctorSurname

CREATE TABLE DOCTOR (
	doctorID int NOT NULL,
	doctorName varchar (50) NOT NULL,
	doctorSurname varchar (50) NOT NULL,
	--DoctorType varchar (50) NOT NULL,
	PRIMARY KEY (doctorID)
);

drop table DOCTOR;

select*from DOCTOR;

--surgeon surgeonID	SurgeonName	SurgeonSurname departmentName-fk PersonID int FOREIGN KEY REFERENCES Persons(PersonID)

CREATE TABLE SURGEON (
	surgeonID int NOT NULL,
	SurgeonName varchar (50) NOT NULL,
	SurgeonSurname varchar (50) NOT NULL,
	PRIMARY KEY (surgeonID),
	departmentID int FOREIGN KEY REFERENCES DEPARTMENT(departmentID)
);

drop table SURGEON;

select*from SURGEON;


--PATIENt   patientNHI	PatientName	PatientSurname	Gender	DOB

CREATE TABLE PATIENT (
	patientNHI varchar(7) NOT NULL,
	PatientName varchar (50) NOT NULL,
	PatientSurname varchar (50) NOT NULL,
	Gender varchar (20),
	patientDOB date,
	PRIMARY KEY (patientNHI),
	doctorID int FOREIGN KEY REFERENCES DOCTOR(doctorID)
);

drop table PATIENT;

select*from PATIENT;

--waitlistl list     waitListNo	Added to Waitlist Date	FSA Date	patientNHI	DOCTOR


CREATE TABLE WAITLIST (
	waitListNo int NOT NULL,
	addedDate date,
	FSADate date,	
	PRIMARY KEY (waitListNo),
	patientNHI varchar(7) FOREIGN KEY REFERENCES PATIENT(patientNHI),
	surgeonID int FOREIGN KEY REFERENCES SURGEON(surgeonID),
	departmentID int FOREIGN KEY REFERENCES DEPARTMENT(departmentID),
	referenceCode int FOREIGN KEY REFERENCES REFERRAL(referenceCode)

);

drop table WAITLIST;

select*from WAITLIST;

--REFERRAL referenceCode	ReferralDate	HealthTarget	doctor	patientNHI	DOCTOR

CREATE TABLE REFERRAL (
	referenceCode int NOT NULL,
	ReferralDate date,
	HealthTarget varchar (3),
	referralType varchar(25),	

	PRIMARY KEY (referenceCode),	
	patientNHI varchar(7) FOREIGN KEY REFERENCES PATIENT(patientNHI),
	doctorID int FOREIGN KEY REFERENCES DOCTOR(doctorID),
	departmentID int NOT NULL FOREIGN KEY REFERENCES DEPARTMENT(departmentID),	
);

drop table REFERRAL;

select*from REFERRAL;


--creating added fields

ALTER TABLE Referral ADD PatientAge INT

UPDATE REFERRAL
SET [PatientAge] = DATEDIFF(DAY,p.patientDOB,r.ReferralDate) /365.25
FROM REFERRAL r
JOIN PATIENT p ON r.patientNHI=p.patientNHI


SELECT * FROM REFERRAL
select * from WAITLIST

ALTER TABLE REFERRAL ADD DaysWaiting INT

UPDATE REFERRAL
SET DaysWaiting = DATEDIFF(DAY,r.ReferralDate,w.FSADate)
FROM REFERRAL p
JOIN Referral r ON p.referralID = r.referralID
