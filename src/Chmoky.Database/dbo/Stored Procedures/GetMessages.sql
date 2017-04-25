





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

	SELECT
	   1000 AS [RowNum]
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
	FROM [dbo].[Messages] m 
	    INNER JOIN [dbo].[vAuthorNames] a ON m.[author] = a.[author]
		LEFT OUTER JOIN [dbo].[SkypeUsers] s ON s.[author] = m.[author]  
	WHERE
		(@author IS NULL OR a.[author] LIKE @author)
		AND (@startdate IS NULL OR [timestamp] >= @startdate)
		AND (@enddate IS NULL OR [timestamp] <= @enddate)
	ORDER BY [timestamp]
	OFFSET @OffSet ROWS
	FETCH NEXT @Limit ROWS ONLY

END