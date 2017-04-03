

-- =============================================
-- Author:		P.Shyrko
-- Create date: 2017-03-31
-- =============================================
CREATE PROCEDURE [dbo].[SelectStatistics]
	@startdate datetime,
	@enddate datetime,
	@Page int,
	@PageSize int,
	@SortColumn nvarchar(20),
	@SortDirection nvarchar(10),
	@Total int out,
	@TextLength int out,
	@Count int out,
	@Min int out,
	@Max int out,
	@Avg int out
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- please check this article https://sqlperformance.com/2012/08/t-sql-queries/conditional-order-by
	DECLARE @OffSet int = (@Page - 1) * @PageSize	

	SELECT
		@Total = COUNT([author]),
		@Count = SUM([count]),
		@TextLength	= SUM([total_just_text]),
		@Min = MIN([min_just_text]),
		@Max = MAX([max_just_text]),
		@Avg = AVG([avg_just_text])
	FROM
		(SELECT
			 [author]
			,COUNT([ID]) AS [count]
			,SUM([len_just_text]) AS [total_just_text]
			,MIN([len_just_text]) AS [min_just_text]
			,MAX([len_just_text]) AS [max_just_text]
			,AVG([len_just_text]) AS [avg_just_text]
		FROM [dbo].[Messages] m		
		WHERE
			[body_xml] IS NOT NULL 
			AND [body_xml] <> ''
			AND (@startdate IS NULL OR [timestamp] >= @startdate)
			AND (@enddate IS NULL OR [timestamp] < @enddate)
		GROUP BY [author]) m

	SELECT
		a.[FirstName],
		a.[LastName],
		a.[DispName],
		a.[author],
		m.[count],
		m.[total_just_text],
		m.[min_just_text],
		m.[max_just_text],
		m.[avg_just_text] 
	FROM
		(SELECT
			 [author]
			,COUNT([ID]) AS [count]
			,SUM([len_just_text]) AS [total_just_text]
			,MIN([len_just_text]) AS [min_just_text]
			,MAX([len_just_text]) AS [max_just_text]
			,AVG([len_just_text]) AS [avg_just_text]
		FROM [dbo].[Messages] m		
		WHERE
			[body_xml] IS NOT NULL 
			AND [body_xml] <> ''
			AND (@startdate IS NULL OR [timestamp] >= @startdate)
			AND (@enddate IS NULL OR [timestamp] < @enddate)
		GROUP BY [author]) m
	INNER JOIN [dbo].[SkypeUsers] a ON m.[author] = a.[author] 
	ORDER BY m.[total_just_text] DESC
	OFFSET @OffSet ROWS
	FETCH NEXT @PageSize ROWS ONLY

END