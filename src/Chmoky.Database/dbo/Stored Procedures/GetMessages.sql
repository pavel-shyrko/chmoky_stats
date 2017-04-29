
-- =============================================
-- Author:		P.Shyrko
-- Create date: 2017-03-31
-- =============================================
CREATE PROCEDURE [dbo].[GetMessages]
	@author nvarchar(128),
	@startdate datetime,
	@enddate datetime,
	@OffSet int,
	@Limit int,
	@SortColumn nvarchar(20),
	@SortDirection nvarchar(10),
    @Participants int out,
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
		@Participants = COUNT(DISTINCT [author]),
		@Count = COUNT([ID]),
		@TextLength	= SUM([len_just_text]),
		@Min = MIN([len_just_text]),
		@Max = MAX([len_just_text]),
		@Avg = AVG([len_just_text])
	FROM [dbo].[Messages]
	WHERE
		(@author IS NULL OR [author] LIKE @author)
		AND (@startdate IS NULL OR [timestamp] >= @startdate)
		AND (@enddate IS NULL OR [timestamp] <= @enddate)

	DECLARE @orderBy nvarchar(max);

	SET @orderBy = 'ORDER BY m.' 
	
	+ 
	
	CASE 
		WHEN @SortColumn LIKE 'time' OR @SortColumn LIKE 'timestamp' THEN '[timestamp]'
		WHEN @SortColumn LIKE 'len' OR @SortColumn LIKE 'len_just_text' THEN '[len_just_text]'
		ELSE '[timestamp]'
	END	
	
	+
		
	CASE WHEN @SortDirection LIKE 'desc' THEN ' DESC' ELSE ' ASC' END 

	DECLARE @sql nvarchar(max);

	SET @sql = N'
	SELECT
		ROW_NUMBER() OVER(' + @orderBy + ') AS [RowNum]
	  ,[id]
      ,s.[FirstName]
	  ,s.[LastName]
	  ,m.[author] 
	  ,a.[DispNames] AS [DispName]	  
      ,[timestamp]    
      ,[type]
      ,[identities]
      ,[just_html_text]
      ,[len_just_text]
	  ,edited_by
	  ,body_xml
	FROM [dbo].[Messages] m 
	    INNER JOIN [dbo].[vAuthorNames] a ON m.[author] = a.[author]
		LEFT OUTER JOIN [dbo].[SkypeUsers] s ON s.[author] = m.[author]  
	WHERE
		-- fake condition
		(1 = 1)
		'
		+
			
		CASE 
			WHEN @author IS NOT NULL THEN 'AND (a.[author] LIKE N''' + @author + ''')
		'
			ELSE ''
		END
			
		+
			
		CASE 
			WHEN @startdate IS NOT NULL THEN 'AND ([timestamp] >= N''' + convert(varchar(25),@startdate,121) + ''')
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
	
	@orderBy
	
	+ 
	
	'
	OFFSET ' + CAST(@OffSet as varchar(15)) + ' ROWS
	FETCH NEXT ' + CAST(@Limit as varchar(15)) + ' ROWS ONLY
	';

	EXECUTE sp_executesql @Sql;

END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GetMessages] TO PUBLIC
    AS [dbo];

