









CREATE VIEW [dbo].[vNormalizedMessages]
--WITH SCHEMABINDING 
AS

	SELECT
	   [id]
      ,[author]
      ,[from_dispname]
      ,[timestamp]
      ,[edited_by]
      ,[edited_timestamp]
      ,[type]
      ,[body_xml]
      ,[identities]
	  ,[dbo].[RemoveTagKeepInnerText]([dbo].[NormalizeString]([body_xml]), N'quote') AS [body_xml_wo_tags]
	  ,[dbo].[RemoveTag]([dbo].[NormalizeString]([body_xml]), 'quote') AS [body_xml_wo_tags_wo_qoute]
	  ,[dbo].HasTag([body_xml], 'a') AS [has_link]
	  ,[dbo].HasTag([body_xml], 'quote') AS [has_quote]
	  ,[dbo].HasTag([body_xml], 'URIObject') AS [has_uriobject]
	  ,LEN([body_xml]) AS [body_xml_len]
	  ,LEN([dbo].[RemoveTagKeepInnerText]([dbo].[NormalizeString]([body_xml]), N'quote')) AS [body_xml_wo_tags_len]
	  ,LEN([dbo].[RemoveTag]([dbo].[NormalizeString]([body_xml]), 'quote')) AS [body_xml_wo_tags_wo_qoute_len]
	FROM [dbo].[Messages]