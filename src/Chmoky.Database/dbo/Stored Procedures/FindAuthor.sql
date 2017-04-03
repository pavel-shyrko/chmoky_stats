

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

	SELECT
		*
	FROM
		[dbo].[SkypeUsers]
	WHERE
		@Input IS NULL 
		OR ([FirstName] LIKE @Input1)
		OR ([LastName] LIKE @Input1)
		OR ([author] LIKE @Input1)
		OR ([account] LIKE @Input1)
	ORDER BY [LastName], [FirstName] 


END