CREATE TABLE [dbo].[Messages] (
    [id]               BIGINT         NOT NULL,
    [author]           NVARCHAR (128) NULL,
    [from_dispname]    NVARCHAR (256) NULL,
    [timestamp]        DATETIME       NULL,
    [edited_by]        NVARCHAR (128) NULL,
    [edited_timestamp] DATETIME       NULL,
    [type]             INT            NULL,
    [body_xml]         NVARCHAR (MAX) NULL,
    [identities]       NVARCHAR (256) NULL,
    [just_text]        AS             ([dbo].[NormalizeString]([body_xml])) PERSISTED,
    [just_html_text]   AS             ([dbo].[NormalizeStringKeepHtml]([body_xml])) PERSISTED,
    [len_just_text]    AS             (len([dbo].[NormalizeString]([body_xml]))) PERSISTED,
    [len_original]     AS             (len([body_xml])),
    CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED ([id] ASC)
);
















GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Messages_ID]
    ON [dbo].[Messages]([id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Messages_Author]
    ON [dbo].[Messages]([author] ASC);

