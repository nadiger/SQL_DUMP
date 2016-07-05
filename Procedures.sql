--***** Creating a Table******
--________________________________
--create table Authors (
--ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
--FIRSTNAME VARCHAR (50) NOT NULL,
--LASTNAME VARCHAR (50) NOT NULL,
--DOB DATE NOT NULL,
--ADDRESS VARCHAR (100),
--CITY VARCHAR (50),
--STATE VARCHAR (50),
--ZIP VARCHAR (15),
--)
--SELECT * FROM AUTHORS
--insert into authors values('Niteesh','Nadiger','09-08-1990','146/4, 4th main, 12th cross, Thubarahalli','Bengaluru','Karnataka','560066',0)
--insert into authors values('Suhas','S Rao','12-04-1989','146/4, 4th main, 12th cross, Thubarahalli','Bengaluru','Karnataka','560066',0)
--insert into authors values('Athri','M S','03-15-1990','146/4, 4th main, 12th cross, Thubarahalli','Bengaluru','Karnataka','560066',0)
--insert into authors values('Prashant','R','09-21-1989','146/4, 4th main, 12th cross, Thubarahalli','Bengaluru','Karnataka','560066',0)
--select * from dbo.Authors

--CREATE PROCEDURE getName
--AS
--BEGIN
--SELECT 'Hello'
--END

--EXEC getName
--********* ALTER PROC
--ALTER PROCEDURE getName  
--AS 
--BEGIN
--SELECT 'HELLO WORLD'
--END

--********** RETURN RESULT SET
--ALTER PROCEDURE getName
--AS
--BEGIN
--SELECT 'hI THIS IS NOT EASY'

--SELECT 'hI TOT EASY'

--RETURN -1
--END

--GO

--DECLARE @return_value as int
--exec @return_value = getName
--select @return_value

--****** @Param
--ALTER PROCEDURE getName (@param1 as int,@param2 as VARCHAR(12))
--AS
--BEGIN
--	SELECT @param1
--	SELECT @param2
--END

--exec getNAme 123223,'Hello'

--ALTER PROCEDURE getName (@param1 AS int OUTPUT)
--AS
--BEGIN
--select @param1 AS VALUE
--set @param1 = @param1+1990

--return -1
--END 

--declare @x as int
--exec getName @X OUTPUT

--GO
--declare @x as int = 12
--exec getName @x OUTPUT
--Select @x AS VALUE

--CREATE PROCEDURE getUser (@param1 AS varchar (50))
--AS
--Begin
--Select * from authors where firstname =@param1
--END

--EXEC getUser 'Niteesh'

--ALTER procedure getAge (@param AS int OUTPUT)
--AS 
--Begin
--set @param = 116-@param
--END

--GO
--Declare @VAR AS int = 90
--EXEC getAge @var OUTPUT
--select @var as [YOUR AGE]

----***** CURSOR
--CREATE PROC SPCursor(@authors CURSOR VARYING OUTPUT)
--AS
--BEGIN
--	SET @authors = CURSOR FOR
--	SELECT firstname from Authors order by firstname
--	OPEN @authors

--END

--GO
--DECLARE @myCursor CURSOR 
--DECLARE @fname VARCHAR (50)

--EXEC SPCursor @authors = @myCursor OUTPUT
--FETCH NEXT FROM @mycursor INTO @fname
--SELECT @fname
--FETCH NEXT FROM @mycursor INTO @fname
--SELECT @fname
--CLOSE @myCursor
--DEALLOCATE @myCursor

-- USING TRANSACTION IN SP
ALTER PROCEDURE deleteUser (@first varchar(50), @last varchar(50))
AS
BEGIN
	BEGIN TRANSACTION
	UPDATE AUTHORS SET ACTIVE=1 WHERE FIRSTNAME=@first AND LASTNAME=@last

	UPDATE AUTHORS SET ADDRESS = '' WHERE  FIRSTNAME=@first AND LASTNAME=@last
	IF @@ERROR!=0
		ROLLBACK TRANSACTION
			ELSE
				COMMIT TRANSACTION
	
	
END

GO
EXEC deleteUser 'Suhas','S'
select * from authors
