USE [MyDB]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2023/2/15 上午 09:34:28 ******/
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
/****** Object:  Table [dbo].[HolidayDetails]    Script Date: 2023/2/15 上午 09:34:28 ******/
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
/****** Object:  Table [dbo].[Holidays]    Script Date: 2023/2/15 上午 09:34:28 ******/
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

INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [BeginDate], [EndDate], [Allow], [Remark], [Prove], [UsedDays]) VALUES (6, N'E002', 2, CAST(N'2023-03-08' AS Date), CAST(N'2023-03-10' AS Date), 0, N'私事待辦', N'3', 3)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [BeginDate], [EndDate], [Allow], [Remark], [Prove], [UsedDays]) VALUES (2019, N'E001', 1, CAST(N'2023-02-14' AS Date), CAST(N'2023-02-18' AS Date), 0, N'私事待辦', NULL, 3)
SET IDENTITY_INSERT [dbo].[HolidayDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Holidays] ON 

INSERT [dbo].[Holidays] ([Id], [Title], [TotalDays], [ProveType]) VALUES (1, N'特休', 3, 0)
INSERT [dbo].[Holidays] ([Id], [Title], [TotalDays], [ProveType]) VALUES (2, N'事假', 14, 1)
INSERT [dbo].[Holidays] ([Id], [Title], [TotalDays], [ProveType]) VALUES (3, N'病假', 30, 0)
INSERT [dbo].[Holidays] ([Id], [Title], [TotalDays], [ProveType]) VALUES (4, N'生理假', 12, 0)
SET IDENTITY_INSERT [dbo].[Holidays] OFF
GO
ALTER TABLE [dbo].[HolidayDetails]  WITH CHECK ADD  CONSTRAINT [FK_HolidayDetail_Employees] FOREIGN KEY([EId])
REFERENCES [dbo].[Employees] ([EId])
GO
ALTER TABLE [dbo].[HolidayDetails] CHECK CONSTRAINT [FK_HolidayDetail_Employees]
GO
ALTER TABLE [dbo].[HolidayDetails]  WITH CHECK ADD  CONSTRAINT [FK_LeaveDetail_Leave] FOREIGN KEY([HId])
REFERENCES [dbo].[Holidays] ([Id])
GO
ALTER TABLE [dbo].[HolidayDetails] CHECK CONSTRAINT [FK_LeaveDetail_Leave]
GO
