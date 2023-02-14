USE [MyDB]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2023/2/11 下午 11:34:27 ******/
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
	[Shift] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HolidayDetails]    Script Date: 2023/2/11 下午 11:34:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HolidayDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EId] [nvarchar](50) NOT NULL,
	[HId] [int] NOT NULL,
	[UsedHours] [float] NULL,
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Allow] [bit] NOT NULL,
	[Remark] [nvarchar](max) NULL,
	[UsedDays] [float] NOT NULL,
 CONSTRAINT [PK_LeaveDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holidays]    Script Date: 2023/2/11 下午 11:34:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holidays](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[TotalDays] [float] NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_Leave] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Employees] ([EId], [Name], [Image], [Branch], [Title], [Rank], [Sex], [Email], [Phone], [EnglishName], [Password], [Shift]) VALUES (N'E001', N'黃曉薇', N'123.jpg', N'人資部', N'助理', 2, N'女', N'aa.xx@mail.com', N'0912-345-678', N'Alice', N'A123456789', N'A')
INSERT [dbo].[Employees] ([EId], [Name], [Image], [Branch], [Title], [Rank], [Sex], [Email], [Phone], [EnglishName], [Password], [Shift]) VALUES (N'E002', N'張裕翔', N'321.png', N'製造部', N'高級技術員', 1, N'男', N'cc.aa@mail.com', N'0925-112-637', N'John', N'C123456789', N'A')
INSERT [dbo].[Employees] ([EId], [Name], [Image], [Branch], [Title], [Rank], [Sex], [Email], [Phone], [EnglishName], [Password], [Shift]) VALUES (N'E003', N'陳菲', N'123.jpg', N'製程部', N'工程師', 1, N'女', N'zz.ss@mail.com', N'0913-975-666', N'Christine', N'F123456789', N'B')
INSERT [dbo].[Employees] ([EId], [Name], [Image], [Branch], [Title], [Rank], [Sex], [Email], [Phone], [EnglishName], [Password], [Shift]) VALUES (N'E004', N'王健康', N'321.png', N'製造部', N'技術員', 2, N'男', N'bb.oo@mail.com', N'0933-276-336', N'Ken', N'O123456789', N'B')
GO
SET IDENTITY_INSERT [dbo].[HolidayDetails] ON 

INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [Allow], [Remark], [UsedDays]) VALUES (1, N'E001', 1, 4, CAST(N'2023-01-19T08:00:00.000' AS DateTime), CAST(N'2023-01-19T12:00:00.000' AS DateTime), 1, N'私事待辦', 0.5)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [Allow], [Remark], [UsedDays]) VALUES (4, N'E001', 4, 8, CAST(N'2023-01-08T08:00:00.000' AS DateTime), CAST(N'2023-01-08T16:00:00.000' AS DateTime), 1, N'生理痛', 1)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [Allow], [Remark], [UsedDays]) VALUES (5, N'E001', 2, 48, CAST(N'2023-02-01T08:00:00.000' AS DateTime), CAST(N'2023-02-06T16:00:00.000' AS DateTime), 0, N'私事待辦', 6)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [Allow], [Remark], [UsedDays]) VALUES (6, N'E002', 2, 24, CAST(N'2023-03-08T08:00:00.000' AS DateTime), CAST(N'2023-03-10T16:00:00.000' AS DateTime), 0, N'私事待辦', 3)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [Allow], [Remark], [UsedDays]) VALUES (7, N'E001', 3, 112, CAST(N'2023-01-09T08:00:00.000' AS DateTime), CAST(N'2023-01-22T16:00:00.000' AS DateTime), 1, N'身體不適', 14)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [Allow], [Remark], [UsedDays]) VALUES (8, N'E001', 1, 224, CAST(N'2022-07-07T00:00:00.000' AS DateTime), CAST(N'2022-08-05T00:00:00.000' AS DateTime), 1, N'私事待辦', 28)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [Allow], [Remark], [UsedDays]) VALUES (9, N'E001', 1, 0, CAST(N'2023-02-02T00:00:00.000' AS DateTime), CAST(N'2023-02-22T00:00:00.000' AS DateTime), 0, N'私事代辦', 11)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [Allow], [Remark], [UsedDays]) VALUES (10, N'E001', 2, NULL, CAST(N'2023-02-27T00:00:00.000' AS DateTime), CAST(N'2023-03-02T00:00:00.000' AS DateTime), 0, N'私事待辦', 2)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [Allow], [Remark], [UsedDays]) VALUES (11, N'E001', 2, NULL, CAST(N'2023-03-03T00:00:00.000' AS DateTime), CAST(N'2023-03-03T00:00:00.000' AS DateTime), 0, N'私事待辦', 1)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [Allow], [Remark], [UsedDays]) VALUES (12, N'E001', 3, NULL, CAST(N'2023-05-02T00:00:00.000' AS DateTime), CAST(N'2023-05-09T00:00:00.000' AS DateTime), 0, N'身體不適', 4)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [Allow], [Remark], [UsedDays]) VALUES (13, N'E001', 3, NULL, CAST(N'2023-05-10T00:00:00.000' AS DateTime), CAST(N'2023-05-14T00:00:00.000' AS DateTime), 0, N'開刀', 3)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [Allow], [Remark], [UsedDays]) VALUES (14, N'E001', 1, NULL, CAST(N'2023-03-06T00:00:00.000' AS DateTime), CAST(N'2023-03-06T00:00:00.000' AS DateTime), 0, N'私事待辦', 1)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [Allow], [Remark], [UsedDays]) VALUES (15, N'E001', 3, NULL, CAST(N'2023-03-14T00:00:00.000' AS DateTime), CAST(N'2023-03-19T00:00:00.000' AS DateTime), 0, N'身體不適', 4)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [Allow], [Remark], [UsedDays]) VALUES (16, N'E001', 3, NULL, CAST(N'2023-03-30T00:00:00.000' AS DateTime), CAST(N'2023-03-30T00:00:00.000' AS DateTime), 0, N'身體不適', 1)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [Allow], [Remark], [UsedDays]) VALUES (17, N'E001', 4, NULL, CAST(N'2023-03-31T00:00:00.000' AS DateTime), CAST(N'2023-04-04T00:00:00.000' AS DateTime), 0, N'生理痛', 3)
SET IDENTITY_INSERT [dbo].[HolidayDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Holidays] ON 

INSERT [dbo].[Holidays] ([Id], [Title], [TotalDays], [Type]) VALUES (1, N'特休', 14, 2)
INSERT [dbo].[Holidays] ([Id], [Title], [TotalDays], [Type]) VALUES (2, N'事假', 14, 2)
INSERT [dbo].[Holidays] ([Id], [Title], [TotalDays], [Type]) VALUES (3, N'病假', 40, 2)
INSERT [dbo].[Holidays] ([Id], [Title], [TotalDays], [Type]) VALUES (4, N'生理假', 12, 0)
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
