


CREATE VIEW [dbo].[vAuthorNames]
WITH SCHEMABINDING 
AS

	SELECT a2.[author], 
		SUBSTRING(
        (
            --SELECT ',' + CASE WHEN a1.[from_dispname] LIKE a2.[author] THEN N'' ELSE a1.[from_dispname] END AS [text()]
			SELECT ',' + a1.[from_dispname] AS [text()]
            From [dbo].[vAuthorDisplayNames] a1 WITH (NOEXPAND)
            Where a1.[author] = a2.[author]
            ORDER BY a1.[author]
            For XML PATH ('')
        ), 2, 1000) [DispNames]
	FROM [dbo].[vAuthors] a2  WITH (NOEXPAND)