CREATE FULLTEXT INDEX ON [dbo].[Messages]
    ([body_xml] LANGUAGE 1049)
    KEY INDEX [UQ_Messages_ID]
    ON [MessagesCat];

