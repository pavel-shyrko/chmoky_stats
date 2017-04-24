
-- =============================================
-- Author:		P.Shyrko
-- Create date: 2017-03-31
-- =============================================
CREATE PROCEDURE [dbo].[GetStatistics]
	@startdate datetime,
	@enddate datetime,
	@OffSet int,
	@Limit int,
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
			--[body_xml] IS NOT NULL AND
			--[body_xml] <> '' AND
			(@startdate IS NULL OR [timestamp] >= @startdate) AND
			(@enddate IS NULL OR [timestamp] < @enddate)
		GROUP BY [author]) m

	DECLARE @orderBy nvarchar(max);

	SET @orderBy = 'ORDER BY m.' 
	
	+ 
	
	CASE 
		WHEN @SortColumn LIKE 'count' THEN '[count]'
		WHEN @SortColumn LIKE 'total_just_text' THEN '[total_just_text]'
		WHEN @SortColumn LIKE 'min_just_text' THEN '[min_just_text]'
		WHEN @SortColumn LIKE 'max_just_text' THEN '[max_just_text]'
		WHEN @SortColumn LIKE 'avg_just_text' THEN '[avg_just_text]'
		ELSE '[total_just_text]'
	END	
	
	+
		
	CASE WHEN @SortDirection LIKE 'desc' THEN ' DESC' ELSE ' ASC' END 

	DECLARE @sql nvarchar(max);

	SET @sql = N'
	SELECT
		ROW_NUMBER() OVER(' + @orderBy + ') AS [RowNum],
		s.[FirstName],
		s.[LastName],
		a.[DispNames] AS [DispName],
		m.[author],
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
			--[body_xml] IS NOT NULL 
			--AND [body_xml] <> ''''
			'
			
			+
			
			CASE 
				WHEN @startdate IS NOT NULL THEN '/*AND*/ ([timestamp] >= N''' + convert(varchar(25),@startdate,121) + ''')
			'
				ELSE ''
			END
			
			+
			
			CASE 
				WHEN @enddate IS NOT NULL THEN 'AND ([timestamp] < N''' + convert(varchar(25),@enddate,121) + ''')
			'
				ELSE ''
			END
			+
			
			'
		GROUP BY [author]) m
	INNER JOIN [dbo].[vAuthorNames] a ON m.[author] = a.[author]
	LEFT OUTER JOIN [dbo].[SkypeUsers] s ON m.[author] = s.[author] 
	'
	
	+ 
	
	@orderBy
	
	+ 
	
	'
	OFFSET ' + CAST(@OffSet as varchar(15)) + ' ROWS
	FETCH NEXT ' + CAST(@Limit as varchar(15)) + ' ROWS ONLY
	';

	EXECUTE sp_executesql @Sql;

END