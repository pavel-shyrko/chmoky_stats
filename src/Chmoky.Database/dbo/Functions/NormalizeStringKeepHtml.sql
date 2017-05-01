




---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
CREATE FUNCTION [dbo].[NormalizeStringKeepHtml]
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

	SET @Result = REPLACE(@Result, N'<s raw_pre="~" raw_post="~">', N'<strike>');

	SET @Result = REPLACE(@Result, N'</s>', N'</strike>');

	--SET @Result = REPLACE(@Result, N'&lt;&lt;&lt;', N'<br /><br />&lt;&lt;&lt;')

	SET @Result = REPLACE(@Result,  CHAR(13) + CHAR(10), N'<br />')
	
	RETURN @Result;

END