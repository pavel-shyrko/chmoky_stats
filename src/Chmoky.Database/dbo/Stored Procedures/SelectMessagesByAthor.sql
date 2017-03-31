-- =============================================
-- Author:		P.Shyrko
-- Create date: 2017-03-31
-- =============================================
CREATE PROCEDURE SelectMessagesByAthor
	@author nvarchar(max),
	@startdate datetime,
	@enddate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
	   [id]
      ,[author]
      ,[from_dispname]
      ,[timestamp]
      ,[edited_by]
      ,[edited_timestamp]
      ,[type]
      ,[body_xml]
      ,[identities]
  FROM 
       [dbo].[Messages]
  WHERE
      [author] LIKE @author
	  AND [timestamp] BETWEEN @startdate AND @enddate

END