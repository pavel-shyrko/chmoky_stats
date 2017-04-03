
INSERT INTO [dbo].[SkypeUsers]
           ([author]
           ,[FirstName]
           ,[LastName]
           ,[DispName]
           ,[CompanyDepartment]
           ,[JobTitle]
           ,[MobilePhone])
SELECT DISTINCT
		a.[author]
      ,o.[FirstName]
      ,o.[LastName]
      ,N''
      ,o.[CompanyDepartment]
      ,o.[JobTitle]
      ,o.[MobilePhone]
FROM vAuthorDisplayNames a
LEFT JOIN OutlookUsers o ON 
a.from_dispname LIKE o.FirstName + ' ' + o.LastName


OR a.author LIKE SUBSTRING(o.FirstName, 1, 1) + '_' + o.LastName + '%'
OR a.author LIKE SUBSTRING(o.FirstName, 1, 1) + '.' + o.LastName + '%'
OR a.author LIKE SUBSTRING(o.FirstName, 1, 1) + '' + o.LastName + '%'

OR a.author LIKE o.FirstName + '_' + o.LastName + '%'
OR a.author LIKE o.FirstName + '.' + o.LastName + '%'
OR a.author LIKE o.FirstName + '' + o.LastName + '%'


OR a.author LIKE o.LastName + '_' + o.FirstName + '%'
OR a.author LIKE o.LastName + '.' + o.FirstName + '%'
OR a.author LIKE o.LastName + '' + o.FirstName + '%'

OR a.author LIKE o.LastName + '_' + SUBSTRING(o.FirstName, 1, 1) + '%'
OR a.author LIKE o.LastName + '.' + SUBSTRING(o.FirstName, 1, 1)+ '%'
OR a.author LIKE o.LastName + '' + SUBSTRING(o.FirstName, 1, 1) + '%'

WHERE o.FirstName IS NOT NULL

GO

INSERT INTO [dbo].[SkypeUsers]
           ([author]
           ,[DispName])
SELECT DISTINCT
	 a.[author]
    ,a.DispNames
FROM 
vAuthorNames a
LEFT OUTER JOIN SkypeUsers s ON a.author = s.author
where s.author is null

GO


SELECT 
	   o.[Title]
      ,o.[FirstName]
      ,o.[LastName]
      ,o.[Suffix]
	  ,o.[CompanyDepartment]
      ,o.[JobTitle]
      ,o.[MobilePhone]      
  FROM [dbo].[OutlookUsers] o
	LEFT OUTER JOIN SkypeUsers s ON o.FirstName = s.FirstName and o.LastName = s.LastName
	WHERE s.author IS NULL
	AND o.[FirstName] IS NOT NULL
    AND o.[LastName] IS NOT NULL
--	and o.lastname like 'Allakaeva'
  ORDER BY [LastName]
GO


SELECT        TOP (200) author, FirstName, LastName, DispName, CompanyDepartment, JobTitle, MobilePhone
FROM            SkypeUsers
WHERE        (FirstName IS NULL)
ORDER BY DispName
GO


