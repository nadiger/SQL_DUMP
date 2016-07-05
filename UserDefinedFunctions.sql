CREATE FUNCTION myFirstFunction()
RETURNS int
AS
BEGIN
	return 7
END

select dbo.myFirstFunction()
