
CREATE VIEW [dbo].[vAuthors]
WITH SCHEMABINDING 
AS

	SELECT
		 [author]
		,COUNT_BIG(*) AS [Count] 
	FROM [dbo].[Messages]
	GROUP BY [author]
GO
CREATE UNIQUE CLUSTERED INDEX [vAuthors_author]
    ON [dbo].[vAuthors]([author] ASC);

