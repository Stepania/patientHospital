USE HospitalARA;
GO

--important commands to see data querry performance 
SET STATISTICS TIME ON; 
GO

SET STATISTICS IO ON; 
GO

-- Patient age at referral and days waiting from referral date
SELECT p.[PatientNHI], CONCAT(p.[PatientName], ' ',p.[PatientSurname] ) AS 'Patient Name', 
CAST(DATEDIFF(DAY,p.PatientDOB,r.ReferralDate) /365.25 AS INT) AS 'Patient Age', 
DATEDIFF(day, r.[ReferralDate], r.[FSADate]) AS 'Days Waiting'

FROM [dbo].[REFERRAL] r
INNER JOIN [dbo].[PATIENT]p ON r.[PatientNHI]=p.[PatientNHI]
WHERE r.[HealthTarget] like 'Y%' and
p.[PatientNHI] != 'YBB1095'-- wrong DOB that's why she has been terminated 

-- 1. referred for cardiothoracic?
SELECT COUNT(r.[DepartmentID]) AS 'Referred to Cardiothoracic'
FROM [dbo].[REFERRAL] r
WHERE r.[DepartmentID] = 2 AND r.[HealthTarget] like 'Y%'

-- 2. average time taken (in days) to see a Surgeon by Department?
--ordered
SELECT d.[DepartmentName] AS 'Department', r.[PatientNHI], DATEDIFF(day, r.[ReferralDate], r.[FSADate]) AS 'Days Waiting'
FROM [dbo].[Department] d
join [dbo].[REFERRAL] r on r.[DepartmentID] = d.[DepartmentID]
ORDER BY d.[DepartmentName] ASC


-- 3.Who has each Surgeon had on their list and how long have they been waiting or did they wait?
SELECT  CONCAT(s.[SurgeonName], ' ',s.[SurgeonSurname] ) AS 'Surgeon Name',
CONCAT(p.[PatientName], ' ',p.[PatientSurname] ) AS 'Patient Name',

DATEDIFF(day, r.[ReferralDate], r.[FSADate]) AS 'Days Waiting'
FROM [dbo].[REFERRAL] r
INNER JOIN [dbo].[Patient] p ON p.[PatientNHI] = r.[PatientNHI]
INNER JOIN [dbo].[SURGEON] s ON s.[SurgeonID] = r.[SurgeonID]
WHERE r.[FSADate] IS NOT NULL
ORDER BY s.SurgeonName ASC

SELECT r.[ReferralDate],p.[PatientNHI]
FROM REFERRAL r
right JOIN PATIENT p
ON r.[PatientNHI] = p.[PatientNHI]
WHERE [ReferralDate] = '2015-07-01'


-- 4. Assuming that all patients under 18 need to be seen by Paediatric Surgery, are there any patients who need to be reassigned? 
SELECT p.[PatientNHI] AS 'Patient NHI',
CONCAT(p.[PatientName], ' ', p.[PatientSurname]) AS 'Patient Name',
CAST(DATEDIFF(DAY,p.[PatientDOB],r.[ReferralDate]) /365.25 AS INT) AS 'Patient Age',
d.[DepartmentName] AS 'Department Name'
FROM [dbo].[REFERRAL]  r
INNER JOIN [dbo].[PATIENT] p ON p.[PatientNHI]=r.[PatientNHI]
INNER JOIN [dbo].[DEPARTMENT] d ON r.[DepartmentID]=d.[DepartmentID]
WHERE CAST(DATEDIFF(DAY,p.[PatientDOB],r.[ReferralDate]) /365.25 AS INT) < 18 and
p.[PatientNHI] != 'YBB1095'-- wrong DOB that's why she has been terminated 
AND r.[HealthTarget] = 'yes'
AND d.[DepartmentName] !='Paediatric Surgery'



-- 5.What percentage of patient were seen within the target of 75 days by department?
SELECT d.[DepartmentName] AS 'Department Name',
CAST(CAST(m.MetCriteria AS DECIMAL) / CAST(p.NoPatient AS DECIMAL) *100 AS DECIMAL) AS 'Percentage'
FROM
(
	SELECT r.[DepartmentID], COUNT(*) AS MetCriteria 
	FROM  [dbo].[REFERRAL] r
	WHERE DATEDIFF(DAY,r.[ReferralDate],r.[FSADate]) < 76
	GROUP BY r.[DepartmentID]
) AS m
RIGHT JOIN 
(
	SELECT r.[DepartmentID], COUNT(*) AS NoPatient
	FROM  [dbo].[REFERRAL] r
	GROUP BY r.[DepartmentID]
) AS p ON p.[DepartmentID]=m.[DepartmentID]
INNER JOIN [dbo].[DEPARTMENT] d ON d.[DepartmentID]=p.[DepartmentID]






SET STATISTICS TIME OFF; 
GO

SET STATISTICS IO OFF; 
GO