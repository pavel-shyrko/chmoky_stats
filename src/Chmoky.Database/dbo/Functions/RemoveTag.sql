



---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
CREATE FUNCTION [dbo].[RemoveTag]
(
	@InputString NVARCHAR(MAX),
	@Tag         NVARCHAR(100)
)

RETURNS NVARCHAR(MAX)
AS
BEGIN

	DECLARE @Result NVARCHAR(MAX) = @InputString

	IF [dbo].[HasTag](@InputString, @Tag) = 1
	BEGIN

		DECLARE @OpenTag nvarchar(101)  = N'<' + @Tag
		DECLARE @CloseTag nvarchar(101) = N'</' + @Tag + N'>'

		DECLARE @StartOfQuote INT    = CHARINDEX(@OpenTag, @InputString)
		DECLARE @EndOfQuote INT      = CHARINDEX(@CloseTag, @InputString, @StartOfQuote) + LEN(@Tag) + 3
		DECLARE @Quote NVARCHAR(MAX) = SUBSTRING(@InputString, @StartOfQuote, @EndOfQuote - @StartOfQuote)

		SET @Result = REPLACE(@InputString, @Quote, '')

		SET @Result = [dbo].[RemoveTag] (@Result, @Tag)

	END

	RETURN @Result

END