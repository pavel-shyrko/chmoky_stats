


-- =============================================
-- Author:		P.Shyrko
-- Create date: 2017-03-31
-- =============================================
CREATE PROCEDURE [dbo].[SelectMessagesByAthor]
	@author nvarchar(max),
	@startdate datetime,
	@enddate datetime,
	@Page int,
	@PageSize int,
	@SortColumn nvarchar(20),
	@SortDirection nvarchar(10)
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- please check this article https://sqlperformance.com/2012/08/t-sql-queries/conditional-order-by
	DECLARE @OffSet int = (@Page - 1) * @PageSize

	SELECT
	   [id]
      ,[author]
      ,[from_dispname]
      ,[timestamp]
      ,[edited_by]
      ,[edited_timestamp]
      ,[type]
      ,[identities]
      ,[original]
      ,[just_text]
      ,[len_original]
      ,[len_just_text]
	FROM.[dbo].[vNormalizedMessages]
	WHERE
		[author] LIKE @author
		AND (@startdate IS NULL OR [timestamp] >= @startdate)
		AND (@enddate IS NULL OR [timestamp] <= @enddate)
	ORDER BY [timestamp]
	OFFSET @OffSet ROWS
	FETCH NEXT @PageSize ROWS ONLY

END
