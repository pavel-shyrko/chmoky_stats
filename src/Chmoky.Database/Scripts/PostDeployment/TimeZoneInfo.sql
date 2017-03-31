
/*
--------------------------------------------------------------------------------------
   FieldTypes Records
--------------------------------------------------------------------------------------
*/

SET IDENTITY_INSERT [dbo].[TimeZoneInfo] ON;
GO

MERGE INTO [dbo].[TimeZoneInfo] AS Target 
USING (VALUES 
(1, N'(GMT-12:00) International Date Line West', 720, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(2, N'(GMT-11:00) Midway Island, Samoa', 660, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(3, N'(GMT-10:00) Hawaii', 600, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(4, N'(GMT-09:00) Alaska', 540, 0, -60, 10, 0, 5, 2, 4, 0, 1, 2),
(5, N'(GMT-08:00) Pacific Time (US & Canada); Tijuana', 480, 0, -60, 10, 0, 5, 2, 4, 0, 1, 2),
(6, N'(GMT-07:00) Chihuahua, La Paz, Mazatlan', 420, 0, -60, 10, 0, 5, 2, 4, 0, 1, 2),
(7, N'(GMT-07:00) Mountain Time (US & Canada)', 420, 0, -60, 10, 0, 5, 2, 4, 0, 1, 2),
(8, N'(GMT-07:00) Arizona', 420, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(9, N'(GMT-06:00) Guadalajara, Mexico City, Monterrey', 360, 0, -60, 10, 0, 5, 2, 4, 0, 1, 2),
(10, N'(GMT-06:00) Saskatchewan', 360, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(11, N'(GMT-06:00) Central America', 360, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(12, N'(GMT-06:00) Central Time (US & Canada)', 360, 0, -60, 10, 0, 5, 2, 4, 0, 1, 2),
(13, N'(GMT-05:00) Eastern Time (US & Canada)', 300, 0, -60, 10, 0, 5, 2, 4, 0, 1, 2),
(14, N'(GMT-05:00) Bota, Lima, Quito', 300, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(15, N'(GMT-05:00) Indiana (East)', 300, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(16, N'(GMT-04:00) Caracas, La Paz', 240, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(17, N'(GMT-04:00) Santia', 240, 0, -60, 3, 6, 2, 0, 10, 6, 2, 0),
(18, N'(GMT-04:00) Atlantic Time (Canada)', 240, 0, -60, 10, 0, 5, 2, 4, 0, 1, 2),
(19, N'(GMT-03:30) Newfoundland', 210, 0, -60, 10, 0, 5, 2, 4, 0, 1, 2),
(20, N'(GMT-03:00) Buenos Aires, Georgetown', 180, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(21, N'(GMT-03:00) Brasilia', 180, 0, -60, 2, 0, 2, 2, 10, 0, 3, 2),
(22, N'(GMT-03:00) Greenland', 180, 0, -60, 10, 0, 5, 2, 4, 0, 1, 2),
(23, N'(GMT-02:00) Mid-Atlantic', 120, 0, -60, 9, 0, 5, 2, 3, 0, 5, 2),
(24, N'(GMT-01:00) Azores', 60, 0, -60, 10, 0, 5, 3, 3, 0, 5, 2),
(25, N'(GMT-01:00) Cape Verde Is.', 60, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(26, N'(GMT) Casablanca, Monrovia', 0, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(27, N'(GMT) Greenwich Mean Time : Dublin, Edinburgh, Lisbon, London', 0, 0, -60, 10, 0, 5, 2, 3, 0, 5, 1),
(28, N'(GMT+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague', -60, 0, -60, 10, 0, 5, 3, 3, 0, 5, 2),
(29, N'(GMT+01:00) Sarajevo, Skopje, Warsaw, Zagreb', -60, 0, -60, 10, 0, 5, 3, 3, 0, 5, 2),
(30, N'(GMT+01:00) Brussels, Copenhagen, Madrid, Paris', -60, 0, -60, 10, 0, 5, 3, 3, 0, 5, 2),
(31, N'(GMT+01:00) West Central Africa', -60, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(32, N'(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna', -60, 0, -60, 10, 0, 5, 3, 3, 0, 5, 2),
(33, N'(GMT+02:00) Harare, Pretoria', -120, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(34, N'(GMT+02:00) Jerusalem', -120, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(35, N'(GMT+02:00) Athens, Beirut, Istanbul', -120, 0, -60, 10, 0, 5, 3, 3, 0, 5, 2),
(36, N'(GMT+02:00) Helsinki, Kyiv, Riga, Sofia, Tallinn, Vilnius', -120, 0, -60, 10, 0, 5, 4, 3, 0, 5, 3),
(37, N'(GMT+02:00) Bucharest', -120, 0, -60, 10, 0, 5, 1, 3, 0, 5, 0),
(38, N'(GMT+02:00) Cairo', -120, 0, -60, 9, 3, 5, 2, 5, 5, 1, 2),
(39, N'(GMT+03:00) Nairobi', -180, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(40, N'(GMT+03:00) Kuwait, Riyadh', -180, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(41, N'(GMT+03:00) Baghdad', -180, 0, -60, 10, 0, 1, 4, 4, 0, 1, 3),
(42, N'(GMT+03:00) Minsk', -180, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(43, N'(GMT+03:00) Moscow, St. Petersburg, Volgrad', -180, 0, -60, 10, 0, 5, 3, 3, 0, 5, 2),
(44, N'(GMT+03:30) Tehran', -210, 0, -60, 9, 2, 4, 2, 3, 0, 1, 2),
(45, N'(GMT+04:00) Abu Dhabi, Muscat', -240, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(46, N'(GMT+04:00) Baku, Tbilisi, Yerevan', -240, 0, -60, 10, 0, 5, 3, 3, 0, 5, 2),
(47, N'(GMT+04:30) Kabul', -270, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(48, N'(GMT+05:00) Ekaterinburg', -300, 0, -60, 10, 0, 5, 3, 3, 0, 5, 2),
(49, N'(GMT+05:00) Islamabad, Karachi, Tashkent', -300, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(50, N'(GMT+05:30) Chennai, Kolkata, Mumbai, New Delhi', -330, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(51, N'(GMT+05:45) Kathmandu', -345, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(52, N'(GMT+06:00) Almaty, Novosibirsk', -360, 0, -60, 10, 0, 5, 3, 3, 0, 5, 2),
(53, N'(GMT+06:00) Sri Jayawardenepura', -360, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(54, N'(GMT+06:00) Astana, Dhaka', -360, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(55, N'(GMT+06:30) Ranon', -390, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(56, N'(GMT+07:00) Krasnoyarsk', -420, 0, -60, 10, 0, 5, 3, 3, 0, 5, 2),
(57, N'(GMT+07:00) Bangkok, Hanoi, Jakarta', -420, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(58, N'(GMT+08:00) Kuala Lumpur, Singapore', -480, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(59, N'(GMT+08:00) Taipei', -480, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(60, N'(GMT+08:00) Irkutsk, Ulaan Bataar', -480, 0, -60, 10, 0, 5, 3, 3, 0, 5, 2),
(61, N'(GMT+08:00) Beijing, Chongqing, Hong Kong, Urumqi', -480, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(62, N'(GMT+08:00) Perth', -480, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(63, N'(GMT+09:00) Yakutsk', -540, 0, -60, 10, 0, 5, 3, 3, 0, 5, 2),
(64, N'(GMT+09:00) Seoul', -540, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(65, N'(GMT+09:00) Osaka, Sapporo, Tokyo', -540, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(66, N'(GMT+09:30) Darwin', -570, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(67, N'(GMT+09:30) Adelaide', -570, 0, -60, 3, 0, 5, 3, 10, 0, 5, 2),
(68, N'(GMT+10:00) Canberra, Melbourne, Sydney', -600, 0, -60, 3, 0, 5, 3, 10, 0, 5, 2),
(69, N'(GMT+10:00) Brisbane', -600, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(70, N'(GMT+10:00) Guam, Port Moresby', -600, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(71, N'(GMT+10:00) Hobart', -600, 0, -60, 3, 0, 5, 3, 10, 0, 1, 2),
(72, N'(GMT+10:00) Vladivostok', -600, 0, -60, 10, 0, 5, 3, 3, 0, 5, 2),
(73, N'(GMT+11:00) Magadan, Solomon Is., New Caledonia', -660, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(74, N'(GMT+12:00) Fiji, Kamchatka, Marshall Is.', -720, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0),
(75, N'(GMT+12:00) Auckland, Wellington', -720, 0, -60, 3, 0, 3, 2, 10, 0, 1, 2),
(76, N'(GMT+13:00) Nuku''alofa', -780, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0)
)
AS Source ([TimeZoneID], [Display], [Bias], [StdBias], [DltBias], [StdMonth], [StdDayOfWeek], [StdWeek], [StdHour], [DltMonth], [DltDayOfWeek], [DltWeek], [DltHour]) 
ON Target.[TimeZoneID] = Source.[TimeZoneID] 
-- update matched rows 
WHEN MATCHED THEN 
UPDATE SET
	[Display]		= Source.[Display],
	[Bias]			= Source.[Bias], 
	[StdBias]		= Source.[StdBias], 
	[DltBias]		= Source.[DltBias], 
	[StdMonth]		= Source.[StdMonth],
	[StdDayOfWeek]	= Source.[StdDayOfWeek],
	[StdWeek]		= Source.[StdWeek],
	[StdHour]		= Source.[StdHour],
	[DltMonth]		= Source.[DltMonth],
	[DltDayOfWeek]	= Source.[DltDayOfWeek],
	[DltWeek]		= Source.[DltWeek],
	[DltHour]		= Source.[DltHour] 
-- insert new rows 
WHEN NOT MATCHED BY TARGET THEN 
INSERT ([TimeZoneID], [Display], [Bias], [StdBias], [DltBias], [StdMonth], [StdDayOfWeek], [StdWeek], [StdHour], [DltMonth], [DltDayOfWeek], [DltWeek], [DltHour])
VALUES ([TimeZoneID], [Display], [Bias], [StdBias], [DltBias], [StdMonth], [StdDayOfWeek], [StdWeek], [StdHour], [DltMonth], [DltDayOfWeek], [DltWeek], [DltHour])
-- delete rows that are in the target but not the source 
WHEN NOT MATCHED BY SOURCE THEN 
DELETE;
GO

SET IDENTITY_INSERT [dbo].[TimeZoneInfo] OFF;
GO
