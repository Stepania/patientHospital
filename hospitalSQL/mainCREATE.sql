CREATE DATABASE HOSPITAL;
GO

drop database HOSPITAL

CREATE TABLE DEPARTMENT (
	departmentID int NOT NULL,
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
	DOB date,

	PRIMARY KEY (patientNHI),
	doctorID int FOREIGN KEY REFERENCES DOCTOR(doctorID)
);

drop table PATIENT;

select*from PATIENT;

--waitlistl list     waitListNo	Added to Waitlist Date	FSA Date	patientNHI	DOCTOR


CREATE TABLE WAITLIST (
	waitListNo varchar(7) NOT NULL,
	addedDate date,
	FSADate date,	
	PRIMARY KEY (waitListNo),
	patientNHI varchar(7) FOREIGN KEY REFERENCES PATIENT(patientNHI),
	surgeonID int FOREIGN KEY REFERENCES SURGEON(surgeonID),
	departmentID int FOREIGN KEY REFERENCES DEPARTMENT(departmentID)

);

drop table WAITLIST;

select*from WAITLIST;

--REFERRAL referenceCode	ReferralDate	HealthTarget	doctor	patientNHI	DOCTOR

CREATE TABLE REFERRAL (
	referenceCode int NOT NULL,
	ReferralDate date,
	HealthTarget varchar (3),
	referralType varchar(25),	
	PRIMARY KEY (patientNHI),	
	patientNHI varchar(7) FOREIGN KEY REFERENCES PATIENT(patientNHI),
	doctorID int FOREIGN KEY REFERENCES DOCTOR(doctorID),
	departmentID int NOT NULL FOREIGN KEY REFERENCES DEPARTMENT(departmentID),

);

drop table REFERRAL;

select*from REFERRAL;

