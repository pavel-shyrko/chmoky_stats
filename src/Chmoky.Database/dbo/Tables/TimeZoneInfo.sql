CREATE TABLE [dbo].[TimeZoneInfo] (
    [TimeZoneID]   INT            IDENTITY (1, 1) NOT NULL,
    [Display]      NVARCHAR (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [Bias]         SMALLINT       NOT NULL,
    [StdBias]      SMALLINT       NOT NULL,
    [DltBias]      SMALLINT       NOT NULL,
    [StdMonth]     SMALLINT       NOT NULL,
    [StdDayOfWeek] SMALLINT       NOT NULL,
    [StdWeek]      SMALLINT       NOT NULL,
    [StdHour]      SMALLINT       NOT NULL,
    [DltMonth]     SMALLINT       NOT NULL,
    [DltDayOfWeek] SMALLINT       NOT NULL,
    [DltWeek]      SMALLINT       NOT NULL,
    [DltHour]      SMALLINT       NOT NULL,
    CONSTRAINT [PK_tbTimeZoneInfo] PRIMARY KEY CLUSTERED ([TimeZoneID] ASC)
);

