USE [MyDB]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2023/2/15 下午 06:33:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EId] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Branch] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Rank] [int] NOT NULL,
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
/****** Object:  Table [dbo].[HolidayDetails]    Script Date: 2023/2/15 下午 06:33:15 ******/
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
 CONSTRAINT [PK_LeaveDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holidays]    Script Date: 2023/2/15 下午 06:33:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holidays](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[TotalDays] [int] NOT NULL,
	[ProveType] [bit] NOT NULL,
 CONSTRAINT [PK_Leave] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Employees] ([EId], [Name], [Image], [Branch], [Title], [Rank], [Sex], [Email], [Phone], [EnglishName], [Password], [Shift], [StartDate]) VALUES (N'E001', N'黃曉薇', N'123.jpg', N'人資部', N'助理', 2, N'女', N'aa.xx@mail.com', N'0912-345-678', N'Alice', N'A123456789', N'A', CAST(N'2010-01-01' AS Date))
INSERT [dbo].[Employees] ([EId], [Name], [Image], [Branch], [Title], [Rank], [Sex], [Email], [Phone], [EnglishName], [Password], [Shift], [StartDate]) VALUES (N'E002', N'張裕翔', N'321.png', N'製造部', N'高級技術員', 1, N'男', N'cc.aa@mail.com', N'0925-112-637', N'John', N'C123456789', N'A', CAST(N'2018-01-01' AS Date))
INSERT [dbo].[Employees] ([EId], [Name], [Image], [Branch], [Title], [Rank], [Sex], [Email], [Phone], [EnglishName], [Password], [Shift], [StartDate]) VALUES (N'E003', N'陳菲', N'123.jpg', N'製程部', N'工程師', 1, N'女', N'zz.ss@mail.com', N'0913-975-666', N'Christine', N'F123456789', N'B', CAST(N'2002-01-01' AS Date))
INSERT [dbo].[Employees] ([EId], [Name], [Image], [Branch], [Title], [Rank], [Sex], [Email], [Phone], [EnglishName], [Password], [Shift], [StartDate]) VALUES (N'E004', N'王健康', N'321.png', N'製造部', N'技術員', 2, N'男', N'bb.oo@mail.com', N'0933-276-336', N'Ken', N'O123456789', N'B', CAST(N'2023-01-01' AS Date))
GO
SET IDENTITY_INSERT [dbo].[HolidayDetails] ON 

INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [BeginDate], [EndDate], [Allow], [Remark], [Prove], [UsedDays]) VALUES (3017, N'E001', 3, CAST(N'2023-03-03' AS Date), CAST(N'2023-03-06' AS Date), 0, N'身體不適', N'638120741294674855螢幕擷取畫面_20230201_030000.png,638120741333562173螢幕擷取畫面_20230201_030028.png,638120741349175608螢幕擷取畫面_20230205_085939.png,638120741365825712螢幕擷取畫面_20230205_090116.png,638120741382367800螢幕擷取畫面_20230205_091411.png,638120741403306505螢幕擷取畫面_20230205_093822.png,638120741423697398螢幕擷取畫面_20230205_093822_new.png,638120741457820215螢幕擷取畫面_20230210_081218.png,638120741637534975螢幕擷取畫面_20230213_114354.png', 2)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [BeginDate], [EndDate], [Allow], [Remark], [Prove], [UsedDays]) VALUES (3018, N'E001', 3, CAST(N'2023-03-07' AS Date), CAST(N'2023-03-07' AS Date), 0, N'123', N'638120772190264519螢幕擷取畫面_20230101_081333.png,638120772190264519螢幕擷取畫面_20230101_082016.png,638120772190264519螢幕擷取畫面_20230101_082022.png', 1)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [BeginDate], [EndDate], [Allow], [Remark], [Prove], [UsedDays]) VALUES (3019, N'E001', 1, CAST(N'2023-02-03' AS Date), CAST(N'2023-02-06' AS Date), 0, N'123', NULL, 2)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [BeginDate], [EndDate], [Allow], [Remark], [Prove], [UsedDays]) VALUES (3020, N'E001', 3, CAST(N'2023-02-07' AS Date), CAST(N'2023-02-10' AS Date), 0, N'身體不適', N'638120810471676006螢幕擷取畫面_20230205_091411.png,638120810471676006螢幕擷取畫面_20230205_093822.png', 2)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [BeginDate], [EndDate], [Allow], [Remark], [Prove], [UsedDays]) VALUES (3021, N'E001', 3, CAST(N'2023-02-11' AS Date), CAST(N'2023-02-14' AS Date), 0, N'身體不適', N'638120813423052289螢幕擷取畫面_20230205_093822.png,638120813423052289螢幕擷取畫面_20230205_093822_new.png,638120813423052289螢幕擷取畫面_20230210_081218.png', 2)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [BeginDate], [EndDate], [Allow], [Remark], [Prove], [UsedDays]) VALUES (3022, N'E001', 3, CAST(N'2023-04-07' AS Date), CAST(N'2023-04-11' AS Date), 0, N'123', N'638120815094975563螢幕擷取畫面_20230205_091411.png,638120815094975563螢幕擷取畫面_20230205_093822.png,638120815094975563螢幕擷取畫面_20230205_093822_new.png', 3)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [BeginDate], [EndDate], [Allow], [Remark], [Prove], [UsedDays]) VALUES (3023, N'E001', 3, CAST(N'2023-01-05' AS Date), CAST(N'2023-01-10' AS Date), 0, N'12312', N'638120816861661742螢幕擷取畫面_20230205_091411.png,638120816861661742螢幕擷取畫面_20230205_093822.png,638120816861661742螢幕擷取畫面_20230205_093822_new.png,638120816861661742螢幕擷取畫面_20230210_081218.png,638120816861661742螢幕擷取畫面_20230213_114354.png', 4)
SET IDENTITY_INSERT [dbo].[HolidayDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Holidays] ON 

INSERT [dbo].[Holidays] ([Id], [Title], [TotalDays], [ProveType]) VALUES (1, N'特休', 3, 0)
INSERT [dbo].[Holidays] ([Id], [Title], [TotalDays], [ProveType]) VALUES (2, N'事假', 14, 1)
INSERT [dbo].[Holidays] ([Id], [Title], [TotalDays], [ProveType]) VALUES (3, N'病假', 30, 0)
INSERT [dbo].[Holidays] ([Id], [Title], [TotalDays], [ProveType]) VALUES (4, N'生理假', 12, 0)
SET IDENTITY_INSERT [dbo].[Holidays] OFF
GO
ALTER TABLE [dbo].[HolidayDetails]  WITH CHECK ADD  CONSTRAINT [FK_HolidayDetails_Employees] FOREIGN KEY([EId])
REFERENCES [dbo].[Employees] ([EId])
GO
ALTER TABLE [dbo].[HolidayDetails] CHECK CONSTRAINT [FK_HolidayDetails_Employees]
GO
ALTER TABLE [dbo].[HolidayDetails]  WITH CHECK ADD  CONSTRAINT [FK_HolidayDetails_Holidays] FOREIGN KEY([HId])
REFERENCES [dbo].[Holidays] ([Id])
GO
ALTER TABLE [dbo].[HolidayDetails] CHECK CONSTRAINT [FK_HolidayDetails_Holidays]
GO
