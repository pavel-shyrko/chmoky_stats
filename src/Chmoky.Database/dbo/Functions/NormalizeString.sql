

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
CREATE FUNCTION [dbo].[NormalizeString]
(
	@InputString NVARCHAR(MAX)
)

RETURNS NVARCHAR(MAX)
AS
BEGIN

	RETURN [dbo].[RemoveTagKeepInnerText](
				[dbo].[RemoveTagKeepInnerText](
					[dbo].[RemoveTagKeepInnerText](
						[dbo].[RemoveTagKeepInnerText](
							[dbo].[RemoveTagKeepInnerText](
								[dbo].[RemoveTag](@InputString, N'URIObject'),
								N's'),
							N'i'),
						N'b'),
					N'ss'),
				N'a');

END