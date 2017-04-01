

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
		,COUNT([ID]) AS [count]
		,SUM([len_original]) AS [total_original]
		,MIN([len_original]) AS [min_original]
		,MAX([len_original]) AS [max_original]
		,AVG([len_original]) AS [avg_original]
		,SUM([len_just_text]) AS [total_just_text]
		,MIN([len_just_text]) AS [min_just_text]
		,MAX([len_just_text]) AS [max_just_text]
		,AVG([len_just_text]) AS [avg_just_text]
	FROM [dbo].[vNormalizedMessages]
	WHERE
		[just_text] IS NOT NULL
		AND [just_text] <> N''
		--[body_xml] IS NOT NULL 
		--AND [body_xml] <> ''
		AND (@startdate IS NULL OR [timestamp] >= @startdate)
		AND (@enddate IS NULL OR [timestamp] < @enddate)
	GROUP BY [author]

END