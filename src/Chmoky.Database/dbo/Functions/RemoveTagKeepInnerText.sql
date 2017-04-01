
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
CREATE FUNCTION [dbo].[RemoveTagKeepInnerText]
(
	@InputString NVARCHAR(MAX),
	@Tag         NVARCHAR(100)
)

RETURNS NVARCHAR(MAX) WITH SCHEMABINDING
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

		SET @Result = STUFF(@Result, CHARINDEX(@Quote, @Result), LEN(@Quote), N'')
		SET @Result = STUFF(@Result, CHARINDEX(@CloseTag, @Result), LEN(@CloseTag), N'')

	END

	RETURN @Result

END