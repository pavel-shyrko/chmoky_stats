

CREATE VIEW [dbo].[vNormalizedMessages]
WITH SCHEMABINDING 
AS

	SELECT
	   [id]
      ,[author]
      ,[from_dispname]
      ,[timestamp]
      ,[edited_by]
      ,[edited_timestamp]
      ,[type]
	  ,[identities]
      ,[body_xml] as [original]
      ,[dbo].[NormalizeString]([body_xml]) AS [just_text]
	  ,LEN([body_xml]) as [len_original]
      ,LEN([dbo].[NormalizeString]([body_xml])) AS [len_just_text]
	  --,[dbo].HasTag([body_xml], 'a') AS [has_link]
	  --,[dbo].HasTag([body_xml], 'quote') AS [has_quote]
	  --,[dbo].HasTag([body_xml], 'URIObject') AS [has_uriobject]
	  --,LEN([body_xml]) AS [original_len]
	  --,LEN([dbo].[RemoveTagKeepInnerText]([dbo].[NormalizeString]([body_xml]), N'quote')) AS [just_text_len]
	FROM [dbo].[Messages]
GO
CREATE UNIQUE CLUSTERED INDEX [vNormalizedMessages_id]
    ON [dbo].[vNormalizedMessages]([id] ASC);


GO
CREATE NONCLUSTERED INDEX [vNormalizedMessages_timestamp]
    ON [dbo].[vNormalizedMessages]([timestamp] ASC);

