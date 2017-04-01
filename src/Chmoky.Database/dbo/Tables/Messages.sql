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
    PRIMARY KEY CLUSTERED ([id] ASC)
);












GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Messages_ID]
    ON [dbo].[Messages]([id] ASC);

