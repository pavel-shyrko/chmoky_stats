CREATE TABLE [dbo].[Messages] (
    [MessageID]                      BIGINT         IDENTITY (1, 1) NOT NULL,
    [id]                             BIGINT         NOT NULL,
    [is_permanent]                   INT            NULL,
    [convo_id]                       INT            NULL,
    [chatname]                       NVARCHAR (256) NULL,
    [author]                         NVARCHAR (128) NULL,
    [from_dispname]                  NVARCHAR (256) NULL,
    [author_was_live]                INT            NULL,
    [guid]                           NVARCHAR (128) NULL,
    [dialog_partner]                 NVARCHAR (256) NULL,
    [timestamp]                      DATETIME       NULL,
    [type]                           INT            NULL,
    [sending_status]                 INT            NULL,
    [consumption_status]             INT            NULL,
    [edited_by]                      NVARCHAR (256) NULL,
    [edited_timestamp]               DATETIME       NULL,
    [param_key]                      INT            NULL,
    [param_value]                    INT            NULL,
    [body_xml]                       NVARCHAR (MAX) NULL,
    [identities]                     NVARCHAR (256) NULL,
    [reason]                         NVARCHAR (256) NULL,
    [leavereason]                    INT            NULL,
    [participant_count]              INT            NULL,
    [error_code]                     INT            NULL,
    [chatmsg_type]                   INT            NULL,
    [chatmsg_status]                 INT            NULL,
    [body_is_rawxml]                 INT            NULL,
    [oldoptions]                     INT            NULL,
    [newoptions]                     INT            NULL,
    [newrole]                        INT            NULL,
    [pk_id]                          BIGINT         NULL,
    [crc]                            BIGINT         NULL,
    [remote_id]                      BIGINT         NULL,
    [call_guid]                      NVARCHAR (256) NULL,
    [extprop_contact_review_date]    NVARCHAR (256) NULL,
    [extprop_contact_received_stamp] BIGINT         NULL,
    [extprop_contact_reviewed]       BIGINT         NULL,
    [option_bits]                    INT            NULL,
    [server_id]                      BIGINT         NULL,
    [annotation_version]             BIGINT         NULL,
    [timestamp__ms]                  BIGINT         NULL,
    [language]                       NVARCHAR (256) NULL,
    [bots_settings]                  NVARCHAR (256) NULL,
    [reaction_thread]                NVARCHAR (256) NULL,
    [content_flags]                  INT            NULL,
    [just_text]                      AS             ([dbo].[NormalizeString]([body_xml])) PERSISTED,
    [len_just_text]                  AS             (len([dbo].[NormalizeString]([body_xml]))) PERSISTED,
    [just_html_text]                 AS             ([dbo].[NormalizeStringKeepHtml]([body_xml])) PERSISTED,
    CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED ([MessageID] ASC),
    CONSTRAINT [UQ_Messages_Guid] UNIQUE NONCLUSTERED ([guid] ASC)
);




















GO



GO
CREATE NONCLUSTERED INDEX [IX_Messages_Author]
    ON [dbo].[Messages]([author] ASC);

