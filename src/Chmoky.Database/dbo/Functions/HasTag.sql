


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
CREATE FUNCTION [dbo].[HasTag]
(
	@InputString NVARCHAR(MAX),
	@Tag         NVARCHAR(100)
)
RETURNS BIT
AS
BEGIN

	DECLARE @Result NVARCHAR(MAX) = @InputString

	IF (@InputString LIKE N'%</' + @Tag +  N'>%') 
	BEGIN

		RETURN 1

	END

	RETURN 0

END