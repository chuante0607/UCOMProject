USE [MyDB]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2023/2/17 下午 11:11:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EId] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Branch] [nvarchar](50) NOT NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
	[JobRank] [int] NOT NULL,
	[Sex] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[EnglishName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Shift] [nvarchar](50) NOT NULL,
	[StartDate] [date] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HolidayDetails]    Script Date: 2023/2/17 下午 11:11:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HolidayDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EId] [nvarchar](50) NOT NULL,
	[HId] [int] NOT NULL,
	[BeginDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Allow] [bit] NOT NULL,
	[Remark] [nvarchar](max) NULL,
	[Prove] [nvarchar](max) NULL,
	[UsedDays] [int] NOT NULL,
	[BelongYear] [int] NOT NULL,
 CONSTRAINT [PK_LeaveDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holidays]    Script Date: 2023/2/17 下午 11:11:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holidays](
	[HId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[TotalDays] [int] NOT NULL,
	[ProveType] [bit] NOT NULL,
 CONSTRAINT [PK_Leave] PRIMARY KEY CLUSTERED 
(
	[HId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Employees] ([EId], [Name], [Image], [Branch], [JobTitle], [JobRank], [Sex], [Email], [Phone], [EnglishName], [Password], [Shift], [StartDate]) VALUES (N'E001', N'黃曉薇', N'123.jpg', N'製造部', N'組長', 2, N'女', N'aa.xx@mail.com', N'0912-345-678', N'Alice', N'A123456789', N'A', CAST(N'2010-02-26' AS Date))
INSERT [dbo].[Employees] ([EId], [Name], [Image], [Branch], [JobTitle], [JobRank], [Sex], [Email], [Phone], [EnglishName], [Password], [Shift], [StartDate]) VALUES (N'E002', N'張裕翔', N'321.png', N'製造部', N'作業員', 1, N'男', N'cc.aa@mail.com', N'0925-112-637', N'John', N'C123456789', N'A', CAST(N'2018-09-13' AS Date))
INSERT [dbo].[Employees] ([EId], [Name], [Image], [Branch], [JobTitle], [JobRank], [Sex], [Email], [Phone], [EnglishName], [Password], [Shift], [StartDate]) VALUES (N'E003', N'陳菲', N'123.jpg', N'製程部', N'作業員', 1, N'女', N'zz.ss@mail.com', N'0913-975-666', N'Christine', N'F123456789', N'B', CAST(N'2002-05-05' AS Date))
INSERT [dbo].[Employees] ([EId], [Name], [Image], [Branch], [JobTitle], [JobRank], [Sex], [Email], [Phone], [EnglishName], [Password], [Shift], [StartDate]) VALUES (N'E004', N'王健康', N'321.png', N'製造部', N'組長', 2, N'男', N'bb.oo@mail.com', N'0933-276-336', N'Ken', N'O123456789', N'B', CAST(N'2015-06-08' AS Date))
GO
SET IDENTITY_INSERT [dbo].[HolidayDetails] ON 

INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [BeginDate], [EndDate], [Allow], [Remark], [Prove], [UsedDays], [BelongYear]) VALUES (3025, N'E001', 3, CAST(N'2023-02-02' AS Date), CAST(N'2023-02-07' AS Date), 0, N'身體不適', N'638121724651236702螢幕擷取畫面_20230205_091411.png,638121724651236702螢幕擷取畫面_20230205_093822.png,638121724651236702螢幕擷取畫面_20230205_093822_new.png', 4, 2023)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [BeginDate], [EndDate], [Allow], [Remark], [Prove], [UsedDays], [BelongYear]) VALUES (3026, N'E001', 1, CAST(N'2022-10-08' AS Date), CAST(N'2022-10-16' AS Date), 1, N'私事代辦', NULL, 5, 2022)
SET IDENTITY_INSERT [dbo].[HolidayDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Holidays] ON 

INSERT [dbo].[Holidays] ([HId], [Title], [TotalDays], [ProveType]) VALUES (1, N'特休', 3, 0)
INSERT [dbo].[Holidays] ([HId], [Title], [TotalDays], [ProveType]) VALUES (2, N'事假', 14, 0)
INSERT [dbo].[Holidays] ([HId], [Title], [TotalDays], [ProveType]) VALUES (3, N'病假', 30, 1)
INSERT [dbo].[Holidays] ([HId], [Title], [TotalDays], [ProveType]) VALUES (4, N'生理假', 12, 0)
SET IDENTITY_INSERT [dbo].[Holidays] OFF
GO
ALTER TABLE [dbo].[HolidayDetails]  WITH CHECK ADD  CONSTRAINT [FK_HolidayDetails_Employees] FOREIGN KEY([EId])
REFERENCES [dbo].[Employees] ([EId])
GO
ALTER TABLE [dbo].[HolidayDetails] CHECK CONSTRAINT [FK_HolidayDetails_Employees]
GO
ALTER TABLE [dbo].[HolidayDetails]  WITH CHECK ADD  CONSTRAINT [FK_HolidayDetails_Holidays1] FOREIGN KEY([HId])
REFERENCES [dbo].[Holidays] ([HId])
GO
ALTER TABLE [dbo].[HolidayDetails] CHECK CONSTRAINT [FK_HolidayDetails_Holidays1]
GO
