



---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
CREATE FUNCTION [dbo].[RemoveTagKeepInnerText]
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
		DECLARE @EndOfQuote INT      = CHARINDEX(N'>', @InputString, @StartOfQuote) + 1
		DECLARE @Quote NVARCHAR(MAX) = SUBSTRING(@InputString, @StartOfQuote, @EndOfQuote - @StartOfQuote)

		SET @Result = REPLACE(@InputString, @Quote, '')
		SET @Result = STUFF(@Result, CHARINDEX(@CloseTag, @Result), LEN(@CloseTag), N'')

		SET @Result = [dbo].[RemoveTagKeepInnerText] (@Result, @Tag)

	END

	RETURN @Result

END