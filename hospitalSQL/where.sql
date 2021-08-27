USE AdventureWorks2014;
GO
SELECT FirstName, LastName, PersonType
FROM Person.Person
-- where PersonType = 'EM' or PersonType = 'IN';
where PersonType like '%'
GO