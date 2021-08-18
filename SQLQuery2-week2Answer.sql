create database Arara;
GO
use Arara;
GO
CREATE TABLE Artist(
artiID int primary key,
firstName varchar(20),
lastName varchar(20),
email	varchar(50)
);
-- delete from [dbo].[Artist];
-- drop table [dbo].[Artist];

insert into Artist ( artistID,firstName, lastName, email) values (1, 'Vincent', 'van gogh', 'myemail@email.com'),
(2, 'Vincent', 'Cassel','donotknow@email.com'), (3, 'Mike', 'Lance', 'clever@email.com');

-- Test
select * from Artist;

select [firstName], [lastName]
from [dbo].[Artist];

CREATE TABLE Painting(
paintingID int primary key,
paintingName varchar(25),
artistID int,
foreign key (artistID) references Artist (artistID)
);
insert into Painting (paintingID,paintingName,artistID)   values(1, 'Sunflower', 1),
(2, 'UML', 3);

select * from [dbo].[Painting];
-- interesting + Aliasing + DRY
select [firstName] as 'First Name', [lastName] as 'Last Name', [paintingName] as
'Name of the Painting'
from [dbo].[Artist] A , [dbo].[Painting] P
where A.[artistID] = P.[artistID];

select [firstName] as 'First Name', [lastName] as 'Last Name', [paintingName] as
'Name of the Painting'
from [dbo].[Artist] A INNER JOIN [dbo].[Painting] P
ON A.[artistID] = P.[artistID];

select [firstName] as 'First Name', [lastName] as 'Last Name', [paintingName] as
'Name of the Painting'
from [dbo].[Artist] A LEFT JOIN [dbo].[Painting] P
on A.[artistID] = P.[artistID];

-- Deleting table + data
drop table Painting;
-- Delete data from table but not the table itself
delete from [dbo].[Painting];
select * from [dbo].[Painting];
-- Alternate option called ALTER
ALTER TABLE Artist
ADD Email varchar(255);

-- Edit stuff also
Update Artist
set firstName = 'Rob'
where  artistID = 1;



