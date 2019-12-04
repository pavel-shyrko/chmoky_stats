CREATE TABLE [dbo].[Messages] (
    [MessageID]        BIGINT         IDENTITY (1, 1) NOT NULL,
    [id]               BIGINT         NOT NULL,
    [author]           NVARCHAR (128) NULL,
    [from_dispname]    NVARCHAR (256) NULL,
    [timestamp]        DATETIME       NULL,
    [type]             INT            NULL,
    [edited_by]        NVARCHAR (256) NULL,
    [edited_timestamp] DATETIME       NULL,
    [body_xml]         NVARCHAR (MAX) NULL,
    [identities]       NVARCHAR (256) NULL,
    [just_text]        AS             ([dbo].[NormalizeString]([body_xml])) PERSISTED,
    [len_just_text]    AS             (len([dbo].[NormalizeString]([body_xml]))) PERSISTED,
    [just_html_text]   AS             ([dbo].[NormalizeStringKeepHtml]([body_xml])) PERSISTED,
    CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED ([MessageID] ASC)
);
























GO



GO
CREATE NONCLUSTERED INDEX [IX_Messages_Author]
    ON [dbo].[Messages]([author] ASC);

