CREATE TABLE [dbo].[Messages] (
    [id]               BIGINT         NOT NULL,
    [author]           NVARCHAR (MAX) NULL,
    [from_dispname]    NVARCHAR (MAX) NULL,
    [timestamp]        DATETIME       NULL,
    [edited_by]        NVARCHAR (MAX) NULL,
    [edited_timestamp] DATETIME       NULL,
    [type]             INT            NULL,
    [body_xml]         NVARCHAR (MAX) NULL,
    [identities]       NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

