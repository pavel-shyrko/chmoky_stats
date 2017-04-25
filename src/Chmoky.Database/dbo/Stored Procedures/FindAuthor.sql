
-- =============================================
-- Author:		P.Shyrko
-- Create date: 2017-04-03
-- =============================================
CREATE PROCEDURE [dbo].[FindAuthor]
	@author nvarchar(255)
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	--DECLARE @Input1 nvarchar(257) = '%' + @Input + '%'

	SELECT 
		 a.[author]
		,a.[DispNames]
		,[FirstName]
		,[LastName]
		,[DispName]
		,[CompanyDepartment]
		,[JobTitle]
		,[Dismissed]
		,[City]
		,[Country]
		,[Account]
		,[EmailDisplayName]
		,[ManagersName]
		,[OfficeLocation]
	FROM
		[dbo].[vAuthorNames] a
		LEFT OUTER JOIN [dbo].[SkypeUsers] s ON a.[author] = s.[author] 
	WHERE
		a.[author] LIKE @author
	ORDER BY s.[LastName], s.[FirstName] 
END