CREATE DATABASE ARAHOSPITAL;
GO

drop database HOSPITAL

CREATE TABLE DEPARTMENT (
	DepartmentID int NOT NULL,
	DepartmentName varchar (25) NOT NULL,
	PRIMARY KEY (DepartmentID)
);

drop table DEPARTMENT;

select*from DEPARTMENT;

--ref DOCTOR 

CREATE TABLE DOCTOR (
	DoctorID int NOT NULL,
	DoctorName varchar (50) NOT NULL,	
	DoctorType varchar (25) NOT NULL,
	PRIMARY KEY (DoctorID)
);

drop table DOCTOR;

select*from DOCTOR;

--surgeon 

CREATE TABLE SURGEON (
	SurgeonID int NOT NULL,
	SurgeonName varchar (50) NOT NULL,
	SurgeonSurname varchar (50) NOT NULL,
	PRIMARY KEY (surgeonID),
	departmentID int FOREIGN KEY REFERENCES DEPARTMENT(departmentID)
);

drop table SURGEON;

select*from SURGEON;


--PATIENt   

CREATE TABLE PATIENT (
	PatientNHI varchar(7) NOT NULL,
	PatientName varchar (50) NOT NULL,
	PatientSurname varchar (50) NOT NULL,
	Gender varchar (20) NOT NULL,
	PatientDOB date NOT NULL,
	PRIMARY KEY (PatientNHI),
	DoctorID int FOREIGN KEY REFERENCES DOCTOR(DoctorID)
);

drop table PATIENT;

select*from PATIENT;


--REFERRAL 

CREATE TABLE REFERRAL (
	ReferralCode int NOT NULL,
	ReferralDate date,
	HealthTarget varchar (3),
	FSADate date ,
	AddedDate date,

	PRIMARY KEY (ReferralCode),	
	PatientNHI varchar(7) FOREIGN KEY REFERENCES PATIENT(PatientNHI),
	DoctorID int FOREIGN KEY REFERENCES DOCTOR(DoctorID),
	DepartmentID int NOT NULL FOREIGN KEY REFERENCES DEPARTMENT(DepartmentID),
	SurgeonID int FOREIGN KEY REFERENCES SURGEON(SurgeonID),
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
