


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
CREATE FUNCTION [dbo].[NormalizeString]
(
	@InputString NVARCHAR(MAX)
)

RETURNS NVARCHAR(MAX) WITH SCHEMABINDING
AS
BEGIN

	DECLARE @Result NVARCHAR(MAX) = @InputString

	WHILE ([dbo].[HasTag](@Result, N'URIObject') = 1)
	BEGIN
		SET @Result = [dbo].[RemoveTag](@Result, N'URIObject')
	END

	-- smiles
	WHILE ([dbo].[HasTag](@Result, N'ss') = 1)
	BEGIN
		SET @Result = [dbo].[RemoveTagKeepInnerText](@Result, N'ss')
	END

	-- italic
	WHILE ([dbo].[HasTag](@Result, N'i') = 1)
	BEGIN
		SET @Result = [dbo].[RemoveTagKeepInnerText](@Result, N'i')
	END

	-- bold
	WHILE ([dbo].[HasTag](@Result, N'b') = 1)
	BEGIN
		SET @Result = [dbo].[RemoveTagKeepInnerText](@Result, N'b')
	END

	-- strike
	WHILE ([dbo].[HasTag](@Result, N's') = 1)
	BEGIN
		SET @Result = [dbo].[RemoveTagKeepInnerText](@Result, N's')
	END

	-- link
	WHILE ([dbo].[HasTag](@Result, N'a') = 1)
	BEGIN
		SET @Result = [dbo].[RemoveTagKeepInnerText](@Result, N'a')
	END

	-- quotes
	WHILE ([dbo].[HasTag](@Result, N'quote') = 1)
	BEGIN
		SET @Result = [dbo].[RemoveTagKeepInnerText](@Result, N'quote')
	END

	-- legacyquote
	WHILE ([dbo].[HasTag](@Result, N'legacyquote') = 1)
	BEGIN
		SET @Result = [dbo].[RemoveTagKeepInnerText](@Result, N'legacyquote')
	END

	SET @Result = REPLACE(@Result, N'&quot;', N'"')

	SET @Result = REPLACE(@Result, N'&gt;', N'>')

	SET @Result = REPLACE(@Result, N'&lt;', N'<')

	SET @Result = REPLACE(@Result, N'&apos;', N'''')
	
	RETURN @Result;

END