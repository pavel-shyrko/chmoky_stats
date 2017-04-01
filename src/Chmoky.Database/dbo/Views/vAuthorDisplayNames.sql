
CREATE VIEW [dbo].[vAuthorDisplayNames]
WITH SCHEMABINDING 
AS

	SELECT 
		[author],
		[from_dispname],
		COUNT_BIG(*) AS [Count] 
	FROM [dbo].[Messages]
	GROUP BY [author], [from_dispname]
GO
CREATE UNIQUE CLUSTERED INDEX [vAuthorDisplayNames_author]
    ON [dbo].[vAuthorDisplayNames]([author] ASC, [from_dispname] ASC);

