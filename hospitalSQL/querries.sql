USE ARAHOSPITAL;
GO
--1 querry how many parients cardio....something
SELECT COUNT(*) as refferedToCardio
FROM REFERRAL 
WHERE departmentID = 2
GO
--important commands to see data querry performance 
SET STATISTICS TIME ON; 
GO

SET STATISTICS IO ON; 
GO

----second querry

SELECT d.departmentName, AVG(pr.DaysWaiting) AS AvgDaysWaiting 
FROM PatientReferral pr
INNER JOIN DEPARTMENTy d ON pr.departmentID=d.departmentID
INNER JOIN Referral r ON pr.referralID=r.referralID
WHERE pr.DaysWaiting IS NOT NULL 
AND r.healthTargetEligible = 'Yes'
GROUP BY departmentName
ORDER BY departmentName


/*SELECT DATEDIFF(DAY,addedDate,FSADate) AS timeTaken, departmentName AS departmentName
INTO waitingTimeBeforeSeen
FROM WAITLIST w
JOIN DEPARTMENT ON w.departmentID=Department.departmentID
WHERE NOT FSADate = '2015-11-11'
;
SELECT * FROM waitingTimeBeforeSeen

SELECT departmentName, AVG(timeTaken) AS [AvgTimeTaken]
FROM waitingTimeBeforeSeen
GROUP BY departmentName
ORDER BY departmentName

DROP TABLE waitingTimeBeforeSeen*/









SET STATISTICS TIME OFF; 
GO

SET STATISTICS IO OFF; 
GO