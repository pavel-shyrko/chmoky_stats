BULK INSERT OutlookUsers
FROM 'D:\Contacts.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    ERRORFILE = 'D:\ContactsErr.csv',
    TABLOCK
)