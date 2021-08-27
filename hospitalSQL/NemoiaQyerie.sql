USE PatientWaitListFinal
GO
SELECT  s.surgeonFName, s.surgeonLName, p.NHI AS PatientNHI, pr.DaysWaiting
FROM PatientReferral pr
INNER JOIN Surgeon s ON pr.surgeonID=s.surgeonID
INNER JOIN Referral r ON pr.referralID=r.referralID
INNER JOIN Patient p ON pr.NHI=p.NHI
WHERE pr.DaysWaiting IS NOT NULL 
AND r.healthTargetEligible = 'Yes'
ORDER BY s.surgeonFName

USE PatientWaitListFinal
GO
SELECT d.departmentName, AVG(pr.DaysWaiting) AS Avg_DaysWaiting 
FROM PatientReferral pr
INNER JOIN Department d ON pr.departmentID=d.departmentID
INNER JOIN Referral r ON pr.referralID=r.referralID
WHERE pr.DaysWaiting IS NOT NULL 
AND r.healthTargetEligible = 'Yes'
GROUP BY departmentName
ORDER BY departmentName

USE PatientWaitListFinal
GO

SELECT COUNT(*) PatientsReferredToCardio
FROM PatientReferral pr
INNER JOIN Referral r ON pr.referralID=r.referralID
WHERE pr.departmentID = 102 
AND r.healthTargetEligible = 'Yes'

USE PatientWaitListFinal
GO
SELECT p.NHI, p.patientFName, p.patientLName, PatientAge, departmentName
FROM Patient p
INNER JOIN PatientReferral pr ON p.NHI=pr.NHI
INNER JOIN Referral r ON pr.referralID=r.referralID
INNER JOIN Department d ON pr.departmentID=d.departmentID
WHERE pr.PatientAge < 18 AND r.healthTargetEligible = 'Yes' 
AND d.departmentName !='Paediatric Surgery'


/*USE PatientWaitListFinal
GO
SELECT d.departmentName,
CAST(CASE WHEN (CAST(m.MetCount AS DECIMAL(5,3)) / CAST(p.NoPatient AS DECIMAL(5,3))) *100 IS NULL THEN 0 
ELSE (CAST(m.MetCount AS DECIMAL(5,3)) / CAST(p.NoPatient AS DECIMAL(5,3))) *100 END AS DECIMAL(3,2)) AS PercentageMet
FROM
(
	SELECT departmentID, COUNT(*) AS MetCount 
	FROM PatientReferral 
	WHERE DaysWaiting < 76
	GROUP BY departmentID
) AS m
RIGHT JOIN 
(
	SELECT departmentID, COUNT(*) AS NoPatient
	FROM PatientReferral
	GROUP BY departmentID
) AS p ON p.departmentID=m.departmentID
INNER JOIN Department d ON d.departmentID=p.departmentID*/