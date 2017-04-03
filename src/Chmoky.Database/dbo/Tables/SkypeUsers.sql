CREATE TABLE [dbo].[SkypeUsers] (
    [author]            NVARCHAR (128) NOT NULL,
    [FirstName]         NVARCHAR (100) NULL,
    [LastName]          NVARCHAR (100) NULL,
    [DispName]          NVARCHAR (256) NOT NULL,
    [CompanyDepartment] NVARCHAR (100) NULL,
    [JobTitle]          NVARCHAR (255) NULL,
    [Dismissed]         BIT            NULL,
    [City]              NVARCHAR (255) NULL,
    [Country]           NVARCHAR (255) NULL,
    [Account]           NVARCHAR (255) NULL,
    [EmailDisplayName]  NVARCHAR (255) NULL,
    [ManagersName]      NVARCHAR (255) NULL,
    [OfficeLocation]    NVARCHAR (255) NULL,
    CONSTRAINT [PK_SkypeUsers] PRIMARY KEY CLUSTERED ([author] ASC)
);





