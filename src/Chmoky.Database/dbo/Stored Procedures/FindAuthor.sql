


-- =============================================
-- Author:		P.Shyrko
-- Create date: 2017-04-03
-- =============================================
CREATE PROCEDURE [dbo].[FindAuthor]
	@Input nvarchar(255)
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Input1 nvarchar(257) = '%' + @Input + '%'

	SELECT DISTINCT
		s.*
	FROM
		[dbo].[SkypeUsers] s
		INNER JOIN [dbo].[vAuthorDisplayNames] d ON s.[author] = d.[author] 
	WHERE
		@Input IS NULL 
		OR (s.[FirstName] LIKE @Input1)
		OR (s.[LastName] LIKE @Input1)
		OR (s.[author] LIKE @Input1)
		OR (s.[account] LIKE @Input1)
		OR (d.[from_dispname] LIKE @Input1)
	ORDER BY s.[LastName], s.[FirstName] 


END