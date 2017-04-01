
-- =============================================
-- Author:		P.Shyrko
-- Create date: 2017-03-31
-- =============================================
CREATE PROCEDURE [dbo].[SelectMessagesCountByMonth]
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
		 [author]
		,COUNT([id]) AS [Count]
		,MIN(LEN([body_xml])) AS [MinLength]
		,MAX(LEN([body_xml])) AS [MaxLength]
	FROM 
		[dbo].[Messages]
	WHERE
		[body_xml] IS NOT NULL 
		AND [body_xml] <> ''
		AND (@startdate IS NULL OR [timestamp] >= @startdate)
		AND (@enddate IS NULL OR [timestamp] < @enddate)
	GROUP BY [author]

END