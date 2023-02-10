USE [master]
GO
/****** Object:  Database [MyDB]    Script Date: 2023/2/10 下午 08:03:51 ******/
CREATE DATABASE [MyDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyDB', FILENAME = N'D:\DataBase\MyDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyDB_log', FILENAME = N'D:\DataBase\MyDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MyDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyDB] SET  MULTI_USER 
GO
ALTER DATABASE [MyDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MyDB] SET QUERY_STORE = OFF
GO
USE [MyDB]
GO
/****** Object:  Table [dbo].[Calendars]    Script Date: 2023/2/10 下午 08:03:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [nvarchar](50) NOT NULL,
	[Info] [nvarchar](max) NOT NULL,
	[Color] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2023/2/10 下午 08:03:51 ******/
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
/****** Object:  Table [dbo].[HolidayDetails]    Script Date: 2023/2/10 下午 08:03:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HolidayDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EId] [nvarchar](50) NOT NULL,
	[HId] [int] NOT NULL,
	[UsedHours] [float] NOT NULL,
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[State] [bit] NOT NULL,
	[Remark] [nvarchar](max) NULL,
	[UsedDays] [float] NOT NULL,
 CONSTRAINT [PK_LeaveDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holidays]    Script Date: 2023/2/10 下午 08:03:51 ******/
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
/****** Object:  Table [dbo].[Members]    Script Date: 2023/2/10 下午 08:03:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Birthday] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schools]    Script Date: 2023/2/10 下午 08:03:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schools](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[SchoolName] [nvarchar](50) NOT NULL,
	[PostalCode] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Telephone] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Calendars] ON 

INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (2, N'2023/1/12', N'打球', N'#d3eb24')
INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (3, N'2023/1/1', N'喝咖啡', N'#c0a5a5')
INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (4, N'2023/1/1', N'下午喝茶', N'#43d9fe')
INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (5, N'2023/2/7', N'旅遊', N'#e2cfe3')
INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (6, N'2023/2/2', N'跟家人去泡湯', N'#dbffe2')
INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (7, N'2023/1/7', N'寫程式', N'#FFFF00')
INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (9, N'2023/1/15', N'女兒剪頭髮', N'#e6b3e1')
INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (10, N'2023/1/20', N'準備放年假囉!!', N'#ff8585')
INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (12, N'2023/1/22', N'全家去義大', N'#e4de95')
INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (14, N'2023/1/12', N'喝咖啡', N'#df90ea')
INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (15, N'2023/1/12', N'寫程式', N'#c29494')
INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (17, N'2023/1/18', N'買年貨', N'#e87669')
INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (18, N'2023/2/15', N'吃火鍋', N'#8b6f82')
INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (19, N'2023/2/3', N'睡覺', N'#73d5e2')
INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (1002, N'2023/1/9', N'讀書', N'#FFCC99')
INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (1005, N'2022/12/14', N'旅行', N'#a0c224')
INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (1006, N'2023/2/14', N'喝咖啡', N'#FFCC99')
INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (1007, N'2023/2/12', N'打球', N'#FFCC99')
INSERT [dbo].[Calendars] ([Id], [Date], [Info], [Color]) VALUES (1008, N'2023/1/24', N'看電影', N'#c45a5a')
SET IDENTITY_INSERT [dbo].[Calendars] OFF
GO
INSERT [dbo].[Employees] ([EId], [Name], [Image], [Branch], [Title], [Rank], [Sex], [Email], [Phone], [EnglishName], [Password], [Shift]) VALUES (N'E001', N'黃曉薇', N'123.jpg', N'人資部', N'助理', 2, N'女', N'aa.xx@mail.com', N'0912-345-678', N'Alice', N'A123456789', N'A')
INSERT [dbo].[Employees] ([EId], [Name], [Image], [Branch], [Title], [Rank], [Sex], [Email], [Phone], [EnglishName], [Password], [Shift]) VALUES (N'E002', N'張裕翔', N'321.png', N'製造部', N'高級技術員', 1, N'男', N'cc.aa@mail.com', N'0925-112-637', N'John', N'C123456789', N'A')
INSERT [dbo].[Employees] ([EId], [Name], [Image], [Branch], [Title], [Rank], [Sex], [Email], [Phone], [EnglishName], [Password], [Shift]) VALUES (N'E003', N'陳菲', N'123.jpg', N'製程部', N'工程師', 1, N'女', N'zz.ss@mail.com', N'0913-975-666', N'Christine', N'F123456789', N'B')
INSERT [dbo].[Employees] ([EId], [Name], [Image], [Branch], [Title], [Rank], [Sex], [Email], [Phone], [EnglishName], [Password], [Shift]) VALUES (N'E004', N'王健康', N'321.png', N'製造部', N'技術員', 2, N'男', N'bb.oo@mail.com', N'0933-276-336', N'Ken', N'O123456789', N'B')
GO
SET IDENTITY_INSERT [dbo].[HolidayDetails] ON 

INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [State], [Remark], [UsedDays]) VALUES (1, N'E001', 1, 4, CAST(N'2023-01-19T08:00:00.000' AS DateTime), CAST(N'2023-01-19T12:00:00.000' AS DateTime), 1, N'私事待辦', 0.5)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [State], [Remark], [UsedDays]) VALUES (4, N'E001', 4, 8, CAST(N'2023-01-08T08:00:00.000' AS DateTime), CAST(N'2023-01-08T16:00:00.000' AS DateTime), 1, N'生理痛', 1)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [State], [Remark], [UsedDays]) VALUES (5, N'E001', 2, 48, CAST(N'2023-02-01T08:00:00.000' AS DateTime), CAST(N'2023-02-06T16:00:00.000' AS DateTime), 0, N'私事待辦', 6)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [State], [Remark], [UsedDays]) VALUES (6, N'E002', 2, 24, CAST(N'2023-03-08T08:00:00.000' AS DateTime), CAST(N'2023-03-10T16:00:00.000' AS DateTime), 0, N'私事待辦', 3)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [State], [Remark], [UsedDays]) VALUES (7, N'E001', 3, 112, CAST(N'2023-01-09T08:00:00.000' AS DateTime), CAST(N'2023-01-22T16:00:00.000' AS DateTime), 1, N'身體不適', 14)
INSERT [dbo].[HolidayDetails] ([Id], [EId], [HId], [UsedHours], [BeginDate], [EndDate], [State], [Remark], [UsedDays]) VALUES (8, N'E001', 1, 224, CAST(N'2022-07-07T00:00:00.000' AS DateTime), CAST(N'2022-08-05T00:00:00.000' AS DateTime), 1, N'私事待辦', 28)
SET IDENTITY_INSERT [dbo].[HolidayDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Holidays] ON 

INSERT [dbo].[Holidays] ([Id], [Title], [TotalDays], [Type]) VALUES (1, N'特休', 14, 2)
INSERT [dbo].[Holidays] ([Id], [Title], [TotalDays], [Type]) VALUES (2, N'事假', 14, 2)
INSERT [dbo].[Holidays] ([Id], [Title], [TotalDays], [Type]) VALUES (3, N'病假', 30, 2)
INSERT [dbo].[Holidays] ([Id], [Title], [TotalDays], [Type]) VALUES (4, N'生理假', 12, 0)
SET IDENTITY_INSERT [dbo].[Holidays] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [UserName], [Password], [Account], [Birthday]) VALUES (1014, N'Adelina', N'123', N'Adelina', N'2009-05-13')
INSERT [dbo].[Members] ([Id], [UserName], [Password], [Account], [Birthday]) VALUES (1015, N'Adelaide', N'123', N'Adelaide', N'2019-11-11')
INSERT [dbo].[Members] ([Id], [UserName], [Password], [Account], [Birthday]) VALUES (1016, N'Celestine', N'123', N'	
Celestine', N'2015-12-16')
INSERT [dbo].[Members] ([Id], [UserName], [Password], [Account], [Birthday]) VALUES (1017, N'	Nadia', N'123', N'Nadia', N'1985-02-17')
INSERT [dbo].[Members] ([Id], [UserName], [Password], [Account], [Birthday]) VALUES (1018, N'Ruth', N'1123', N'Ruth', N'1971-11-26')
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[Schools] ON 

INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (2, N'國小', N'國立北教大實小', N'106', N'臺北市大安區龍淵里和平東路2段94號', N'02-2735-6186')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (3, N'國小', N'國立政大實小', N'116', N'臺北市文山區指南路三段12號', N'02-2939-3610')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (4, N'國小', N'松山國小', N'105', N'臺北市松山區八德路四段746號', N'02-2767-2907')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (5, N'國小', N'西松國小', N'105', N'臺北市松山區東光里三民路5號', N'02-2760-9221')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (6, N'國小', N'敦化國小', N'105', N'臺北市松山區中正里敦化北路2號', N'02-2741-4065')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (7, N'國小', N'民生國小', N'105', N'臺北市松山區敦化北路199巷18號', N'02-2712-2452')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (8, N'國小', N'民權國小', N'105', N'臺北市松山區民權東路四段200號', N'02-2765-2327')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (9, N'國小', N'民族國小', N'105', N'臺北市松山區民生東路4段97巷7號', N'02-2712-4872')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (10, N'國小', N'三民國小', N'105', N'臺北市松山區莊敬里民權東路五段1號', N'02-2764-6080')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (11, N'國小', N'健康國小', N'105', N'臺北市松山區延壽街168號', N'02-2528-2814')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (12, N'國小', N'興雅國小', N'110', N'臺北市信義區雅祥里基隆路1段83巷9號', N'02-2761-8156')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (13, N'國小', N'永春國小', N'110', N'臺北市信義區永春里松山路225巷48號', N'02-2764-1314')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (14, N'國小', N'光復國小', N'110', N'臺北市信義區光復南路271號', N'02-2758-5076')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (15, N'國小', N'三興國小', N'110', N'臺北市信義區景聯里基隆路2段99號', N'02-2738-5488')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (16, N'國小', N'信義國小', N'110', N'臺北市信義區松勤街60號', N'02-2720-4005')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (17, N'國小', N'吳興國小', N'110', N'臺北市信義區松仁路226號', N'02-2720-0226')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (18, N'國小', N'福德國小', N'110', N'臺北市信義區中行里褔德街253號', N'02-2727-7992')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (19, N'國小', N'永吉國小', N'110', N'臺北市信義區永春里松山路287巷5號', N'02-8785-8111')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (20, N'國小', N'博愛國小', N'110', N'臺北市信義區松仁路22鄰95巷20號', N'02-2345-0616')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (21, N'國小', N'龍安國小', N'106', N'臺北市大安區龍門里新生南路3段33號', N'02-2363-2077')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (22, N'國小', N'大安國小', N'106', N'臺北市大安區芳和里臥龍街129號', N'02-2732-2332')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (23, N'國小', N'幸安國小', N'106', N'臺北市大安區民炤里仁愛路3段22號', N'02-2707-4191')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (24, N'國小', N'建安國小', N'106', N'臺北市大安區龍雲里大安路2段99號', N'02-2707-7119')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (25, N'國小', N'仁愛國小', N'106', N'臺北市大安區敦安里安和路1段60號', N'02-2709-5010')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (26, N'國小', N'金華國小', N'106', N'臺北市大安區永康里愛國東路79巷11號', N'02-2391-7402')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (27, N'國小', N'古亭國小', N'106', N'臺北市大安區古風里羅斯福路3段201號', N'02-2363-9795')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (28, N'國小', N'銘傳國小', N'106', N'臺北市大安區農場里羅斯褔路四段21號', N'02-2363-9815')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (29, N'國小', N'公館國小', N'106', N'臺北市大安區基隆路4段41巷68弄2號', N'02-2735-1734')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (30, N'國小', N'新生國小', N'106', N'臺北市大安區新生南路二段36號', N'02-2391-3122')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (31, N'國小', N'和平實小', N'106', N'臺北市大安區敦南街76巷28號', N'02-2733-5900')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (32, N'國小', N'中山國小', N'104', N'臺北市中山區恆安里民權東路1段69號', N'02-2591-4085')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (33, N'國小', N'中正國小', N'104', N'臺北市中山區力行里龍江路62號', N'02-2507-0932')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (34, N'國小', N'長安國小', N'104', N'臺北市中山區興亞里吉林路15號', N'02-2561-7600')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (35, N'國小', N'長春國小', N'104', N'臺北市中山區中央里長春路165號', N'02-2502-4366')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (36, N'國小', N'大直國小', N'104', N'臺北市中山區大直里大直街2號', N'02-2533-3953')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (37, N'國小', N'大佳國小', N'104', N'臺北市中山區大佳里6鄰濱江街107號', N'02-2503-5816')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (38, N'國小', N'五常國小', N'104', N'臺北市中山區下埤里五常街16號', N'02-2502-3416')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (39, N'國小', N'吉林國小', N'104', N'臺北市中山區中原里長春路116號', N'02-2521-9196')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (40, N'國小', N'懷生國小', N'104', N'臺北市中山區埤頭里安東街16巷2號', N'02-2771-0846')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (41, N'國小', N'永安國小', N'104', N'臺北市中山區明水路397巷19弄1號', N'02-2533-5672')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (42, N'國小', N'濱江國小', N'104', N'臺北市中山區樂群二路266巷99號', N'02-8502-1571')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (43, N'國小', N'螢橋國小', N'100', N'臺北市中正區螢雪里詔安街29號', N'02-2305-4620')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (44, N'國小', N'河堤國小', N'100', N'臺北市中正區汀州路二段180號', N'02-2367-7144')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (45, N'國小', N'忠義國小', N'100', N'臺北市中正區中華路二段307巷17號', N'02-2303-8752')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (46, N'國小', N'國語實小', N'100', N'臺北市中正區龍光里南海路58號', N'02-2303-3555')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (47, N'國小', N'南門國小', N'100', N'臺北市中正區南門里廣州街6號', N'02-2371-5052')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (48, N'國小', N'東門國小', N'100', N'臺北市中正區東門里仁愛路一段2-4號', N'02-2341-2822')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (49, N'國小', N'忠孝國小', N'100', N'臺北市中正區梅花里忠孝東路2段101號', N'02-2391-8170')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (50, N'國小', N'市大附小', N'100', N'臺北市中正區黎明里公園路29號', N'02-2311-0395')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (51, N'國小', N'蓬萊國小', N'103', N'臺北市大同區星明里寧夏路35號', N'02-2556-9835')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (52, N'國小', N'日新國小', N'103', N'臺北市大同區星明里太原路151號', N'02-2558-4819')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (53, N'國小', N'太平國小', N'103', N'臺北市大同區南芳里延平北路2段239號', N'02-2553-2229')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (54, N'國小', N'永樂國小', N'103', N'臺北市大同區南芳里延平北路2段266號', N'02-2553-4882')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (55, N'國小', N'雙蓮國小', N'103', N'臺北市大同區民權里錦西街51號', N'02-2557-0309')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (56, N'國小', N'大同國小', N'103', N'臺北市大同區蓬萊里大龍街51號', N'02-2596-5407')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (57, N'國小', N'大龍國小', N'103', N'臺北市大同區保安里哈密街47號', N'02-2594-2635')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (58, N'國小', N'延平國小', N'103', N'臺北市大同區大龍街187巷1號', N'02-2594-2439')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (59, N'國小', N'大橋國小', N'103', N'臺北市大同區隆和里重慶北路3段2號', N'02-2594-4413')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (60, N'國小', N'新和國小', N'108', N'臺北市萬華區西藏路125巷31號', N'02-2303-8298')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (61, N'國小', N'雙園國小', N'108', N'臺北市萬華區雙園里莒光路315號', N'02-2306-1893')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (62, N'國小', N'東園國小', N'108', N'臺北市萬華區全德里東園街195號', N'02-2303-4803')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (63, N'國小', N'大理國小', N'108', N'臺北市萬華區綠堤里艋舺大道389號', N'02-2306-4311')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (64, N'國小', N'西園國小', N'108', N'臺北市萬華區日善里東園街73巷65號', N'02-2303-0257')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (65, N'國小', N'萬大國小', N'108', N'臺北市萬華區全德里萬大路346號', N'02-2303-7654')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (66, N'國小', N'華江國小', N'108', N'臺北市萬華區環河南路2段250巷42弄2號', N'02-2306-4352')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (67, N'國小', N'西門國小', N'108', N'臺北市萬華區西門里成都路98號', N'02-2311-3519')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (68, N'國小', N'老松國小', N'108', N'臺北市萬華區福音里桂林路64號', N'02-2336-1266')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (69, N'國小', N'龍山國小', N'108', N'臺北市萬華區青山里和平西路三段235號', N'02-2308-2977')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (70, N'國小', N'福星國小', N'108', N'臺北市萬華區福星里中華路一段66號', N'02-2314-4668')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (71, N'國小', N'景美國小', N'116', N'臺北市文山區景行里景文街108號', N'02-2932-2151')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (72, N'國小', N'武功國小', N'116', N'臺北市文山區萬祥里興隆路1段68號', N'02-2931-4360')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (73, N'國小', N'興德國小', N'116', N'臺北市文山區興邦里興隆路2段235號', N'02-2932-9431')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (74, N'國小', N'溪口國小', N'116', N'臺北市文山區景慶里景福街225號', N'02-2935-0955')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (75, N'國小', N'興隆國小', N'116', N'臺北市文山區興望里福興路2號', N'02-2932-3131')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (76, N'國小', N'志清國小', N'116', N'臺北市文山區景仁里景福街21巷5號', N'02-2932-3875')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (77, N'國小', N'景興國小', N'116', N'臺北市文山區興安里景華街150巷21號', N'02-2932-9439')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (78, N'國小', N'木柵國小', N'116', N'臺北市文山區木柵里木柵路3段191號', N'02-2939-1234')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (79, N'國小', N'永建國小', N'116', N'臺北市文山區木柵路四段159巷14-1號', N'02-2236-3855')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (80, N'國小', N'實踐國小', N'116', N'臺北市文山區樟文里忠順街1段4號', N'02-2936-0725')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (81, N'國小', N'博嘉實小', N'116', N'臺北市文山區木柵路4段159巷14號之1', N'02-2230-2585')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (82, N'國小', N'指南國小', N'116', N'臺北市文山區指南路三段38巷5-2號', N'02-2939-3546')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (83, N'國小', N'明道國小', N'116', N'臺北市文山區明興里木柵路2段138巷61號', N'02-2939-2821')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (84, N'國小', N'萬芳國小', N'116', N'臺北市文山區萬芳里萬和街1號', N'02-2230-1232')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (85, N'國小', N'力行國小', N'116', N'臺北市文山區樟腳里木新路3段155巷7號', N'02-2936-3995')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (86, N'國小', N'萬興國小', N'116', N'臺北市文山區萬興里秀明路2段114號', N'02-2938-1721')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (87, N'國小', N'萬福國小', N'116', N'臺北市文山區羅斯福5段170巷32號', N'02-2935-3123')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (88, N'國小', N'興華國小', N'116', N'臺北市文山區興光里興隆路3段125巷6號', N'02-2239-3070')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (89, N'國小', N'辛亥國小', N'116', N'臺北市文山區興昌里辛亥路4段103號', N'02-2935-7282')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (90, N'國小', N'南港國小', N'115', N'臺北市南港區三重里惠民街67號', N'02-2783-4678')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (91, N'國小', N'舊莊國小', N'115', N'臺北市南港區舊莊里舊莊街1段100號', N'02-2782-1418')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (92, N'國小', N'玉成國小', N'115', N'臺北市南港區西新里向陽路31號', N'02-2783-6049')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (93, N'國小', N'成德國小', N'115', N'臺北市南港區聯成里東新街65號', N'02-2785-1376')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (94, N'國小', N'胡適國小', N'115', N'臺北市南港區中研里舊莊街1段1號', N'02-2782-4949')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (95, N'國小', N'東新國小', N'115', N'臺北市南港區東新里興南街62號', N'02-2783-7577')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (96, N'國小', N'修德國小', N'115', N'臺北市南港區東新街118巷86號', N'02-2788-0500')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (97, N'國小', N'內湖國小', N'114', N'臺北市內湖區港富里內湖路二段41號', N'02-2799-8085')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (98, N'國小', N'碧湖國小', N'114', N'臺北市內湖區內湖里金龍路100號', N'02-2790-7161')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (99, N'國小', N'潭美國小', N'114', N'臺北市內湖區行善路179號', N'02-2791-7334')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (100, N'國小', N'東湖國小', N'114', N'臺北市內湖區東湖里東湖路115號', N'02-2633-9984')
GO
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (101, N'國小', N'西湖國小', N'114', N'臺北市內湖區西湖里環山路1段25號', N'02-2797-1267')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (102, N'國小', N'康寧國小', N'114', N'臺北市內湖區清白里星雲街121號', N'02-2790-1237')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (103, N'國小', N'明湖國小', N'114', N'臺北市內湖區東湖里康寧路3段105號', N'02-2632-3477')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (104, N'國小', N'麗山國小', N'114', N'臺北市內湖區港都里港華街100號', N'02-2657-4158')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (105, N'國小', N'新湖國小', N'114', N'臺北市內湖區湖興里民權東路6段138號', N'02-2796-3721')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (106, N'國小', N'文湖國小', N'114', N'臺北市內湖區西康里文湖街15號', N'02-2658-3515')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (107, N'國小', N'大湖國小', N'114', N'臺北市內湖區大湖里大湖山莊街170號', N'02-2791-5870')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (108, N'國小', N'南湖國小', N'114', N'臺北市內湖區葫洲里康寧路3段200號', N'02-2632-1296')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (109, N'國小', N'麗湖國小', N'114', N'臺北市內湖區金湖路363巷8號', N'02-2634-3888')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (110, N'國小', N'士林國小', N'111', N'臺北市士林區福德里大東路165號', N'02-2881-2231')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (111, N'國小', N'士東國小', N'111', N'臺北市士林區蘭雅里中山北路6段392號', N'02-2871-0064')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (112, N'國小', N'福林國小', N'111', N'臺北市士林區福志里福志路75號', N'02-2831-6293')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (113, N'國小', N'陽明山國小', N'111', N'臺北市士林區新安里仰德大道3段61號', N'02-2861-6366')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (114, N'國小', N'社子國小', N'111', N'臺北市士林區永倫里延平北路六段308號', N'02-2812-6195')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (115, N'國小', N'雨聲國小', N'111', N'臺北市士林區岩山里至誠路1段62巷70號', N'02-2831-1004')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (116, N'國小', N'富安國小', N'111', N'臺北市士林區富洲里延平北路8段135號', N'02-2810-3192')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (117, N'國小', N'劍潭國小', N'111', N'臺北市士林區明勝里通河街16號', N'02-2885-5491')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (118, N'國小', N'溪山國小', N'111', N'臺北市士林區溪山里至善路3段199號', N'02-2841-1010')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (119, N'國小', N'平等國小', N'111', N'臺北市士林區平等里平菁街101號', N'02-2861-0503')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (120, N'國小', N'百齡國小', N'111', N'臺北市士林區福中里福港街205號', N'02-2881-7683')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (121, N'國小', N'雙溪國小', N'111', N'臺北市士林區翠山里中社路2段66號', N'02-2841-1038')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (122, N'國小', N'葫蘆國小', N'111', N'臺北市士林區環河北路3段95號', N'02-2812-9586')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (123, N'國小', N'雨農國小', N'111', N'臺北市士林區名山里忠義街1號', N'02-2832-9700')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (124, N'國小', N'天母國小', N'111', N'臺北市士林區天玉里天玉街12號', N'02-2872-3336')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (125, N'國小', N'文昌國小', N'111', N'臺北市士林區文林路615巷20號', N'02-2836-5411')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (126, N'國小', N'芝山國小', N'111', N'臺北市士林區芝山里德行東路285號', N'02-2831-6115')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (127, N'國小', N'蘭雅國小', N'111', N'臺北市士林區蘭興里磺溪街57號', N'02-2836-6052')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (128, N'國小', N'三玉國小', N'111', N'臺北市士林區三玉里天母東路116號', N'02-2875-1369')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (129, N'國小', N'北投國小', N'112', N'臺北市北投區長安里中央北路1段73號', N'02-2891-2052')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (130, N'國小', N'逸仙國小', N'112', N'臺北市北投區中心里新民路2號', N'02-2891-4537')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (131, N'國小', N'石牌國小', N'112', N'臺北市北投區吉利里致遠二路80號', N'02-2822-7484')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (132, N'國小', N'關渡國小', N'112', N'臺北市北投區一德里中央北路4段581號', N'02-2891-2847')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (133, N'國小', N'湖田國小', N'112', N'臺北市北投區湖田里竹子湖路17之2號', N'02-2861-6963')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (134, N'國小', N'清江國小', N'112', N'臺北市北投區奇岩里公館路220號', N'02-2891-2764')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (135, N'國小', N'泉源實小', N'112', N'臺北市北投區泉源里東昇路34號', N'02-2895-1258')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (136, N'國小', N'大屯國小', N'112', N'臺北市北投區大屯里復興三路312號', N'02-2891-4353')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (137, N'國小', N'湖山國小', N'112', N'臺北市北投區湖山里湖底路11號', N'02-2861-0148')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (138, N'國小', N'桃源國小', N'112', N'臺北市北投區中央北路3段40巷45號', N'02-2894-1208')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (139, N'國小', N'文林國小', N'112', N'臺北市北投區建民里文林北路155號', N'02-2823-4212')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (140, N'國小', N'義方國小', N'112', N'臺北市北投區珠海路155號', N'02-2891-7433')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (141, N'國小', N'立農國小', N'112', N'臺北市北投區立農里立農街1段250號', N'02-2821-0702')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (142, N'國小', N'明德國小', N'112', N'臺北市北投區榮華里明德路190號', N'02-2822-9651')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (143, N'國小', N'文化國小', N'112', N'臺北市北投區文化里文化三路1號', N'02-2893-3828')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (144, N'國小', N'私立復興實驗高中附小', N'106', N'臺北市大安區仁愛里敦化南路1段262號', N'02-2771-5859')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (145, N'國小', N'私立立人國際國民中小學', N'106', N'臺北市大安區義榮里安和路二段99號', N'02-2736-1388')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (146, N'國小', N'私立新民小學', N'106', N'臺北市大安區龍坡里辛亥路1段113號', N'02-2363-0450')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (147, N'國小', N'私立光仁小學', N'108', N'臺北市萬華區壽德里萬大路423巷15號', N'02-2303-2874')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (148, N'國小', N'私立靜心小學', N'116', N'臺北市文山區興福里興隆路2段46號', N'02-2932-3118')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (149, N'國小', N'私立中山小學', N'116', N'臺北市文山區木柵路1段292號', N'02-2936-0935')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (150, N'國小', N'私立再興小學', N'116', N'臺北市文山區明義里興隆路4段2號', N'02-2937-1118')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (151, N'國小', N'私立華興小學', N'111', N'臺北市士林區芝山里仰德大道1段101號', N'02-2831-6834')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (152, N'國小', N'私立薇閣小學', N'112', N'臺北市北投區長安里育仁路106號', N'02-2891-2668')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (153, N'國小', N'私立奎山中學附小', N'112', N'臺北市北投區榮華里明德路200號', N'02-2821-2009')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (154, N'國中', N'市立介壽國中', N'105', N'臺北市松山區介壽里延壽街401號', N'02-2767-4496')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (155, N'國中', N'市立民生國中', N'105', N'臺北市松山區新東里新東街30巷1號', N'02-2765-3433')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (156, N'國中', N'市立中山國中', N'105', N'臺北市松山區復興北路361巷7號', N'02-2712-6701')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (157, N'國中', N'市立敦化國中', N'105', N'臺北市松山區南京東路三段300號', N'02-8771-7890')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (158, N'國中', N'市立興雅國中', N'110', N'臺北市信義區松德路168巷15號', N'02-2723-2771')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (159, N'國中', N'市立永吉國中', N'110', N'臺北市信義區四育里8鄰松隆路161號', N'02-2764-9066')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (160, N'國中', N'市立?公國中', N'110', N'臺北市信義區福德街221巷15號', N'02-2726-1481')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (161, N'國中', N'市立信義國中', N'110', N'臺北市信義區松仁路158巷1號', N'02-2723-6771')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (162, N'國中', N'市立仁愛國中', N'106', N'臺北市大安區敦安里仁愛路4段130號', N'02-2325-5823')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (163, N'國中', N'市立大安國中', N'106', N'臺北市大安區大安路2段63號', N'02-2755-7131')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (164, N'國中', N'市立芳和國中', N'106', N'臺北市大安區芳和里臥龍街170號', N'02-2732-1961')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (165, N'國中', N'市立金華國中', N'106', N'臺北市大安區福住里新生南路2段32號', N'02-3393-1799')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (166, N'國中', N'市立懷生國中', N'106', N'臺北市大安區忠孝東路三段248巷30號', N'02-2721-5078')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (167, N'國中', N'市立民族國中', N'106', N'臺北市大安區羅斯福路4段113巷13號', N'02-2732-2935')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (168, N'國中', N'市立龍門國中', N'106', N'臺北市大安區建國南路二段269號', N'02-2733-0299')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (169, N'國中', N'市立長安國中', N'104', N'臺北市中山區興亞里松江路70巷11號', N'02-2511-2382')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (170, N'國中', N'市立北安國中', N'104', N'臺北市中山區劍潭里明水路325號', N'02-2533-3888')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (171, N'國中', N'市立新興國中', N'104', N'臺北市中山區聚葉里林森北路511號', N'02-2571-4211')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (172, N'國中', N'市立五常國中', N'104', N'臺北市中山區下埤里復興北路430巷1號', N'02-2501-4320')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (173, N'國中', N'市立濱江國中', N'104', N'臺北市中山區樂群二路262號', N'02-8502-0126')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (174, N'國中', N'市立螢橋國中', N'100', N'臺北市中正區林興里汀州街3段4號', N'02-2368-8667')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (175, N'國中', N'市立古亭國中', N'100', N'臺北市中正區中華路2段465號', N'02-2309-0986')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (176, N'國中', N'市立南門國中', N'100', N'臺北市中正區南門里廣州街6號', N'02-2314-2775')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (177, N'國中', N'市立弘道國中', N'100', N'臺北市中正區公園路21號', N'02-2371-5520')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (178, N'國中', N'市立中正國中', N'100', N'臺北市中正區新營里愛國東路158號', N'02-2391-6697')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (179, N'國中', N'市立建成國中', N'103', N'臺北市大同區長安西路37之1號', N'02-2558-7042')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (180, N'國中', N'市立忠孝國中', N'103', N'臺北市大同區玉泉里西寧北路32號', N'02-2552-4890')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (181, N'國中', N'市立民權國中', N'103', N'臺北市大同區重慶北路三段1號', N'02-2593-1951')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (182, N'國中', N'市立蘭州國中', N'103', N'臺北市大同區至聖里大龍街187巷1號', N'02-2591-8269')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (183, N'國中', N'市立重慶國中', N'103', N'臺北市大同區重慶里敦煌路19號', N'02-2594-8631')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (184, N'國中', N'市立萬華國中', N'108', N'臺北市萬華區日善里西藏路201號', N'02-2339-4567')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (185, N'國中', N'市立雙園國中', N'108', N'臺北市萬華區和德里興義街2號', N'02-2303-0827')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (186, N'國中', N'市立龍山國中', N'108', N'臺北市萬華區富裕里南寧路46號', N'02-2336-2789')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (187, N'國中', N'市立木柵國中', N'116', N'臺北市文山區木柵路3段102巷12號', N'02-2939-3031')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (188, N'國中', N'市立實踐國中', N'116', N'臺北市文山區樟林里辛亥路七段67號', N'02-2236-2852')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (189, N'國中', N'市立北政國中', N'116', N'臺北市文山區指南里指南路3段2巷14號', N'02-2939-3651')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (190, N'國中', N'市立景美國中', N'116', N'臺北市文山區景華里景中街27號', N'02-9353-130')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (191, N'國中', N'市立興福國中', N'116', N'臺北市文山區興旺里福興路80號', N'02-2932-2024')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (192, N'國中', N'市立景興國中', N'116', N'臺北市文山區景華里景興路46巷2號', N'02-2932-3794')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (193, N'國中', N'市立誠正國中', N'115', N'臺北市南港區新富里富康街1巷24號', N'02-2782-8094')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (194, N'國中', N'市立成德國中', N'115', N'臺北市南港區成福里東新街108巷23號', N'02-2651-5635')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (195, N'國中', N'市立內湖國中', N'114', N'臺北市內湖區紫陽里陽光街1號', N'02-2790-0843')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (196, N'國中', N'市立麗山國中', N'114', N'臺北市內湖區內湖路1段629巷42號', N'02-2799-1867')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (197, N'國中', N'市立三民國中', N'114', N'臺北市內湖區湖興里民權東路6段45號', N'02-2792-4772')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (198, N'國中', N'市立西湖國中', N'114', N'臺北市內湖區西湖里環山路1段27號', N'02-2799-1817')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (199, N'國中', N'市立東湖國中', N'114', N'臺北市內湖區樂康里康樂街131號', N'02-2633-0373')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (200, N'國中', N'市立明湖國中', N'114', N'臺北市內湖區葫洲里康寧路3段60號', N'02-2632-0616')
GO
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (201, N'國中', N'市立士林國中', N'111', N'臺北市士林區福德里中正路345號', N'02-8861-3411')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (202, N'國中', N'市立蘭雅國中', N'111', N'臺北市士林區三玉里忠誠路2段51號', N'02-2832-9377')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (203, N'國中', N'市立至善國中', N'111', N'臺北市士林區臨溪里至善路2段360號', N'02-2841-1350')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (204, N'國中', N'市立格致國中', N'111', N'臺北市士林區陽明里仰德大道四段75號', N'02-2861-0079')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (205, N'國中', N'市立福安國中', N'111', N'臺北市士林區福安里延平北路7段250號', N'02-2810-8766')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (206, N'國中', N'市立天母國中', N'111', N'臺北市士林區天和里天母東路120號', N'02-2875-4864')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (207, N'國中', N'市立北投國中', N'112', N'臺北市北投區溫泉里溫泉路62號', N'02-2891-2091')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (208, N'國中', N'市立新民國中', N'112', N'臺北市北投區林泉里新民路10號', N'02-2897-9001')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (209, N'國中', N'市立明德國中', N'112', N'臺北市北投區建民里明德路50號', N'02-2823-2539')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (210, N'國中', N'市立桃源國中', N'112', N'臺北市北投區一德里中央北路4段48號', N'02-2892-9633')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (211, N'國中', N'市立石牌國中', N'112', N'臺北市北投區吉利里石牌路1段139號', N'02-2822-4682')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (212, N'國中', N'市立關渡國中', N'112', N'臺北市北投區關渡里知行路212號', N'02-2858-1770')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (213, N'國中', N'私立立人國際國民中小學', N'106', N'臺北市大安區義榮里安和路二段99號', N'02-2738-1188')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (214, N'國中', N'私立靜心中學', N'116', N'臺北市文山區興福里興隆路2段46號', N'02-2932-3118')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (215, N'國中', N'私立奎山中學', N'112', N'臺北市北投區榮華里明德路200號', N'02-2821-2009')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (216, N'高中', N'國立師大附中', N'106', N'臺北市大安區和安里信義路3段143號', N'02-2707-5215')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (217, N'高中', N'國立政大附中', N'116', N'臺北市文山區政大一街353號', N'02-8237-7500')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (218, N'高中', N'市立西松高中', N'105', N'臺北市松山區鵬程里健康路325巷7號', N'02-2528-6618')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (219, N'高中', N'市立中崙高中', N'105', N'臺北市八德路四段101號', N'02-2753-5316')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (220, N'高中', N'市立松山高中', N'110', N'臺北市信義區基隆路一段156號', N'02-2753-5968')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (221, N'高中', N'市立永春高中', N'110', N'臺北市信義區松隆里松山路654號', N'02-2727-2983')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (222, N'高中', N'市立和平高中', N'106', N'臺北市大安區芳和里臥龍街100號', N'02-2732-4300')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (223, N'高中', N'市立中山女中', N'104', N'臺北市中山區力行里長安東路2段141號', N'02-2507-3148')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (224, N'高中', N'市立大同高中', N'104', N'臺北市中山區中央里長春路167號', N'02-2505-4269')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (225, N'高中', N'市立大直高中', N'104', N'臺北市中山區劍潭里北安路420號', N'02-2533-4017')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (226, N'高中', N'市立建國中學', N'100', N'臺北市中正區龍光里南海路56號', N'02-2303-4381')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (227, N'高中', N'市立成功中學', N'100', N'臺北市中正區幸福里濟南路1段71號', N'02-2321-6256')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (228, N'高中', N'市立北一女中', N'100', N'臺北市中正區黎明里重慶南路1段165號', N'02-2382-0484')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (229, N'高中', N'市立明倫高中', N'103', N'臺北市大同區保安里承德路3段336號', N'02-2596-1567')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (230, N'高中', N'市立成淵高中', N'103', N'臺北市大同區承德路二段235號', N'02-2553-1969')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (231, N'高中', N'市立華江高中', N'108', N'臺北市萬華區日善里西藏路213號', N'02-2301-9946')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (232, N'高中', N'市立大理高中', N'108', N'臺北市萬華區綠堤里長順街2號', N'02-2302-6959')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (233, N'高中', N'市立景美女中', N'116', N'臺北市文山區樟新里木新路3段312號', N'02-2936-8847')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (234, N'高中', N'市立萬芳高中', N'116', N'臺北市文山區興隆路3段115巷1號', N'02-2230-9585')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (235, N'高中', N'市立南港高中', N'115', N'臺北市南港區西新里向陽路21號', N'02-2783-7863')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (236, N'高中', N'市立育成高中', N'115', N'臺北市南港區重陽路366號', N'02-2653-0475')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (237, N'高中', N'市立內湖高中', N'114', N'臺北市內湖區紫陽里文德路218號', N'02-2797-7035')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (238, N'高中', N'市立麗山高中', N'114', N'臺北市內湖區環山路二段100號', N'02-2657-0435')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (239, N'高中', N'市立南湖高中', N'114', N'臺北市內湖區康寧路三段220號', N'02-2630-8889')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (240, N'高中', N'市立陽明高中', N'111', N'臺北市士林區後港里中正路510號', N'02-2831-6675')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (241, N'高中', N'市立百齡高中', N'111', N'臺北市士林區義信里承德路4段177號', N'02-2883-1568')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (242, N'高中', N'市立復興高中', N'112', N'臺北市北投區復興四路70號', N'02-2891-4131')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (243, N'高中', N'市立中正高中', N'112', N'臺北市北投區文林北路77號', N'02-2823-4811')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (244, N'高中', N'私立祐德中學', N'110', N'臺北市信義區忠孝東路5段790巷27號', N'02-2727-8280')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (245, N'高中', N'私立延平中學', N'106', N'臺北市大安區和安里建國南路1段275號', N'02-2707-1478')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (246, N'高中', N'私立金甌女中', N'106', N'臺北市大安區光明里杭州南路2段1號', N'02-2321-4765')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (247, N'高中', N'私立復興實驗高中', N'106', N'臺北市大安區敦化南路1段262 號', N'02-2771-5859')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (248, N'高中', N'私立中興中學', N'104', N'臺北市中山區力行里朱崙街42號', N'02-2741-2542')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (249, N'高中', N'私立大同高中', N'104', N'臺北市中山區聚英里中山北路3段40號', N'02-2592-5252')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (250, N'高中', N'私立強恕中學', N'100', N'臺北市中正區板溪里汀州路二段143號', N'02-2365-6574')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (251, N'高中', N'私立靜修女中', N'103', N'臺北市大同區雙連里寧夏路59號', N'02-2557-4345')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (252, N'高中', N'私立立人高中', N'108', N'臺北市萬華區桂林路171號', N'02-2311-3423')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (253, N'高中', N'私立東山高中', N'116', N'臺北市文山區老泉里老泉街26巷3號', N'02-2939-5826')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (254, N'高中', N'私立滬江高中', N'116', N'臺北市文山區景美里羅斯福路6段336號', N'02-8663-1122')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (255, N'高中', N'私立大誠高中', N'116', N'臺北市文山區萬興里秀明路2段175號', N'02-2234-8989 ')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (256, N'高中', N'私立再興中學', N'116', N'臺北市文山區明義里興隆路4段2號', N'02-2936-6803')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (257, N'高中', N'私立景文高中', N'116', N'臺北市文山區木新里保儀路127號', N'02-2939-0310')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (258, N'高中', N'私立文德女中', N'114', N'臺北市內湖區紫陽里成功路3段70號', N'02-2790-4570')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (259, N'高中', N'私立方濟中學', N'114', N'臺北市內湖區紫星里成功路三段61號', N'02-2791-0278')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (260, N'高中', N'私立達人女中', N'114', N'臺北市內湖區湖濱里內湖路2段314號', N'02-2795-6899')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (261, N'高中', N'私立泰北高中', N'111', N'臺北市士林區福林里福林路240號', N'02-2882-5560')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (262, N'高中', N'私立衛理女中', N'111', N'臺北市士林區翠山里至善路2段321號', N'02-2841-1487')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (263, N'高中', N'私立華興中學', N'111', N'臺北市士林區芝山里仰德大道1段101號', N'02-2831-6834')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (264, N'高中', N'私立薇閣高中', N'112', N'臺北市北投區中心里珠海路50號', N'02-2892-5332')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (265, N'高中', N'私立十信高中', N'112', N'臺北市北投區北投路二段55號', N'02-2892-1166')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (266, N'高職', N'市立松山家商', N'110', N'臺北市信義區松山路655號', N'02-2726-1118')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (267, N'高職', N'市立松山工農', N'110', N'臺北市信義區忠孝東路5段236巷15號', N'02-2722-6616')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (268, N'高職', N'市立大安高工', N'106', N'臺北市大安區龍圖里復興南路2段52號', N'02-2709-1630')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (269, N'高職', N'市立木柵高工', N'116', N'臺北市文山區萬芳里木柵路4段77號', N'02-2230-0506')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (270, N'高職', N'市立南港高工', N'115', N'臺北市南港區南港里興中路29號', N'02-2782-5432')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (271, N'高職', N'市立內湖高工', N'114', N'臺北市內湖區港墘里內湖路1段520號', N'02-2657-4874')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (272, N'高職', N'市立士林高商', N'111', N'臺北市士林區後港里士商路150號', N'02-2831-3114')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (273, N'高職', N'私立育達家商', N'105', N'臺北市松山區美仁里寧安街12號', N'02-2570-6767')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (274, N'高職', N'私立協和工商', N'110', N'臺北市信義區忠孝東路5段790巷27號', N'02-2726-5775')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (275, N'高職', N'私立東方工商', N'106', N'臺北市大安區信義路四段186巷8號', N'02-2755-4616')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (276, N'高職', N'私立喬治工商', N'106', N'臺北市大安區基隆路2段172號', N'02-2738-6515')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (277, N'高職', N'私立開平餐飲', N'106', N'臺北市大安區復興南路2段148巷24號', N'02-2755-6939')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (278, N'高職', N'私立稻江護家', N'104', N'臺北市中山區新生北路三段55號', N'02-2595-5161')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (279, N'高職', N'私立開南商工', N'100', N'臺北市中正區東門里濟南路1段6號', N'02-2321-2666')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (280, N'高職', N'私立稻江高商', N'103', N'臺北市大同區國昌里民權西路225巷24號', N'02-2591-2001')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (281, N'高職', N'私立華岡藝校', N'111', N'臺北市士林區建業路73巷8號', N'02-2861-2354')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (282, N'高職', N'私立惇敘工商', N'112', N'臺北市北投區泉源路221號', N'02-2891-2630')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (283, N'特教學校', N'臺北市 市立啟聰學校', N'103', N'臺北市大同區重慶北路三段320號', N'02-2592-4446')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (284, N'特教學校', N'臺北市 市立啟智學校', N'111', N'臺北市士林區忠誠路二段207巷3號', N'02-2874-9117')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (285, N'特教學校', N'臺北市 市立啟明學校', N'111', N'臺北市士林區忠誠路二段207巷1號', N'02-2874-0670')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (286, N'特教學校', N'臺北市 市立文山特殊教育學校', N'116', N'臺北市文山區秀明路一段169號', N'02-8661-5183')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (287, N'市立大專校院', N'臺北市立大學（博愛校區）', N'100', N'臺北市中正區愛國西路1號', N'02-2311-3040')
INSERT [dbo].[Schools] ([Id], [Type], [SchoolName], [PostalCode], [Address], [Telephone]) VALUES (288, N'市立大專校院', N'臺北市立大學（天母校區）', N'111', N'臺北市士林區忠誠路二段101號', N'02-2871-8288')
SET IDENTITY_INSERT [dbo].[Schools] OFF
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
/****** Object:  StoredProcedure [dbo].[GetMemberById]    Script Date: 2023/2/10 下午 08:03:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMemberById]
		(@id int)
AS
BEGIN
	SELECT * FROM Members WHERE Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[MemberLogin]    Script Date: 2023/2/10 下午 08:03:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MemberLogin]
		(@account nvarchar(50) , @pwd nvarchar(50))
AS
BEGIN
	SELECT * FROM Members WHERE Account = @account AND Password = @pwd
END
GO
USE [master]
GO
ALTER DATABASE [MyDB] SET  READ_WRITE 
GO
