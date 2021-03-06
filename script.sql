USE [master]
GO
/****** Object:  Database [TS]    Script Date: 04/01/21 10:18:27 AM ******/
CREATE DATABASE [TS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TS] SET ARITHABORT OFF 
GO
ALTER DATABASE [TS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TS] SET RECOVERY FULL 
GO
ALTER DATABASE [TS] SET  MULTI_USER 
GO
ALTER DATABASE [TS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TS', N'ON'
GO
ALTER DATABASE [TS] SET QUERY_STORE = OFF
GO
USE [TS]
GO
/****** Object:  Table [dbo].[account]    Script Date: 04/01/21 10:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[username] [nvarchar](50) NOT NULL,
	[pass] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[phonenumber] [nvarchar](50) NULL,
	[permissionid] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permission]    Script Date: 04/01/21 10:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permission](
	[permissionid] [nvarchar](10) NOT NULL,
	[permission] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[permissionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[schedule]    Script Date: 04/01/21 10:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schedule](
	[trainid] [nvarchar](10) NOT NULL,
	[stationid] [nvarchar](10) NOT NULL,
	[arrivaltime] [time](7) NULL,
	[departuretime] [time](7) NULL,
	[trip] [nvarchar](20) NULL,
	[i] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[trainid] ASC,
	[stationid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stations]    Script Date: 04/01/21 10:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stations](
	[stationid] [nvarchar](10) NOT NULL,
	[city] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[stationid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 04/01/21 10:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket](
	[codeticket] [nvarchar](50) NOT NULL,
	[username] [nvarchar](50) NULL,
	[noidi] [nvarchar](10) NULL,
	[noiden] [nvarchar](10) NULL,
	[trainid] [nvarchar](10) NULL,
	[seatno] [nvarchar](10) NULL,
	[traincar] [nvarchar](10) NULL,
	[departuretime] [time](7) NULL,
	[arrivaltime] [time](7) NULL,
	[price] [money] NULL,
	[date] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[codeticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trains]    Script Date: 04/01/21 10:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trains](
	[trainid] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[trainid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[account] ([username], [pass], [fullname], [Email], [phonenumber], [permissionid]) VALUES (N'1', N'1', N'1', N'asdasdsadsad', N'asdaa', N'admin')
INSERT [dbo].[account] ([username], [pass], [fullname], [Email], [phonenumber], [permissionid]) VALUES (N'12345', N'1', N'1', N'1', N'1', N'member')
INSERT [dbo].[account] ([username], [pass], [fullname], [Email], [phonenumber], [permissionid]) VALUES (N'2', N'2', N'222', N'222', N'222', N'member')
INSERT [dbo].[account] ([username], [pass], [fullname], [Email], [phonenumber], [permissionid]) VALUES (N'3', N'3', N'zXZ', N'ssss', N'sss', N'member')
INSERT [dbo].[account] ([username], [pass], [fullname], [Email], [phonenumber], [permissionid]) VALUES (N'abc123', N'abc', N'HEHEHE', N'tu1den10@gmail.com', N'19191', N'member')
INSERT [dbo].[account] ([username], [pass], [fullname], [Email], [phonenumber], [permissionid]) VALUES (N'member', N'member', N'member', N'member@gmail.com', N'123456789', N'member')
INSERT [dbo].[account] ([username], [pass], [fullname], [Email], [phonenumber], [permissionid]) VALUES (N'mtr123', N'mtr123', N'Tran Vu Minh Triet', N'tranvuminhtriet@gmail.com', N'0382499318', N'admin')
INSERT [dbo].[account] ([username], [pass], [fullname], [Email], [phonenumber], [permissionid]) VALUES (N'phuong15032000', N'15032000', N'Tran Diep Phuong', N'0354892727aewqe', N'dphuong15032000@gmail.com', N'admin')
INSERT [dbo].[account] ([username], [pass], [fullname], [Email], [phonenumber], [permissionid]) VALUES (N'phuong150320000', N'1', N'1', N'1', N'1', N'member')
INSERT [dbo].[account] ([username], [pass], [fullname], [Email], [phonenumber], [permissionid]) VALUES (N'phuonggg', N'phung', N'phuongp', N'iopiop', N'98098', N'member')
INSERT [dbo].[account] ([username], [pass], [fullname], [Email], [phonenumber], [permissionid]) VALUES (N'phuongggg', N'phuong', N'tran diep phuong', N'ahsdhjkh', N'kjhjkj', N'member')
INSERT [dbo].[account] ([username], [pass], [fullname], [Email], [phonenumber], [permissionid]) VALUES (N'tu', N'tu', N'da doi', N'da doi', N'da doi', N'member')
GO
INSERT [dbo].[permission] ([permissionid], [permission]) VALUES (N'admin', N'admin')
INSERT [dbo].[permission] ([permissionid], [permission]) VALUES (N'member', N'member')
GO
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE1', N'Bien Hoa', CAST(N'05:07:00' AS Time), CAST(N'05:22:00' AS Time), N'Bien Hoa SE1', 8)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE1', N'Binh Thuan', CAST(N'02:37:00' AS Time), CAST(N'02:52:00' AS Time), N'Binh Thuan SE1', 7)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE1', N'Da Nang', CAST(N'13:45:00' AS Time), CAST(N'14:00:00' AS Time), N'Da Nang SE1', 1)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE1', N'Dieu Tri', CAST(N'18:51:00' AS Time), CAST(N'19:06:00' AS Time), N'Dieu Tri SE1', 4)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE1', N'Nha Trang', CAST(N'22:26:00' AS Time), CAST(N'22:41:00' AS Time), N'Nha Trang SE1', 6)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE1', N'Quang Ngai', CAST(N'16:01:00' AS Time), CAST(N'16:16:00' AS Time), N'Quang Ngai SE1', 3)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE1', N'Sai Gon', CAST(N'05:45:00' AS Time), CAST(N'06:00:00' AS Time), N'Sai Gon SE1', 9)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE1', N'Tam Ky', CAST(N'14:56:00' AS Time), CAST(N'15:09:00' AS Time), N'Tam Ky SE1', 2)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE1', N'Tuy Hoa', CAST(N'20:29:00' AS Time), CAST(N'20:44:00' AS Time), N'Tuy Hoa SE1', 5)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE10', N'Cho Sy', CAST(N'21:41:00' AS Time), CAST(N'21:56:00' AS Time), N'Cho Sy SE10', 9)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE10', N'Da Nang', CAST(N'10:03:00' AS Time), CAST(N'10:18:00' AS Time), N'Da Nang SE10', 1)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE10', N'Dong Ha', CAST(N'14:22:00' AS Time), CAST(N'14:37:00' AS Time), N'Dong Ha SE10', 3)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE10', N'Dong Hoi', CAST(N'16:25:00' AS Time), CAST(N'16:40:00' AS Time), N'Dong Hoi SE10', 4)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE10', N'Dong Le', CAST(N'18:09:00' AS Time), CAST(N'18:24:00' AS Time), N'Dong Le SE10', 5)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE10', N'Ha Noi', CAST(N'03:55:00' AS Time), CAST(N'04:10:00' AS Time), N'Ha Noi SE10', 10)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE10', N'Hue', CAST(N'13:05:00' AS Time), CAST(N'13:20:00' AS Time), N'Hue SE10', 2)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE10', N'Huong Pho', CAST(N'19:14:00' AS Time), CAST(N'19:29:00' AS Time), N'Huong Pho SE10', 6)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE10', N'Minh Khoi', CAST(N'23:19:00' AS Time), CAST(N'23:34:00' AS Time), N'Minh Khoi SE10', 10)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE10', N'Nam Dinh', CAST(N'02:16:00' AS Time), CAST(N'02:31:00' AS Time), N'Nam Dinh SE10', 10)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE10', N'Thanh Hoa', CAST(N'00:11:00' AS Time), CAST(N'00:26:00' AS Time), N'Thanh Hoa SE10', 10)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE10', N'Vinh', CAST(N'20:58:00' AS Time), CAST(N'21:13:00' AS Time), N'Vinh SE10', 8)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE10', N'Yen Trung', CAST(N'20:11:00' AS Time), CAST(N'20:26:00' AS Time), N'Yen Trung SE10', 7)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE2', N'Da Nang', CAST(N'13:55:00' AS Time), CAST(N'14:10:00' AS Time), N'Da Nang SE2', 1)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE2', N'Dong Ha', CAST(N'17:41:00' AS Time), CAST(N'17:56:00' AS Time), N'Dong Ha SE2', 3)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE2', N'Dong Hoi', CAST(N'19:40:00' AS Time), CAST(N'19:55:00' AS Time), N'Dong Hoi SE2', 4)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE2', N'Dong Le', CAST(N'21:16:00' AS Time), CAST(N'21:31:00' AS Time), N'Dong Le SE2', 5)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE2', N'Ha Noi', CAST(N'05:30:00' AS Time), CAST(N'05:45:00' AS Time), N'Ha Noi SE2', 12)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE2', N'Hue', CAST(N'16:26:00' AS Time), CAST(N'16:41:00' AS Time), N'Hue SE2', 2)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE2', N'Huong Pho', CAST(N'22:19:00' AS Time), CAST(N'22:24:00' AS Time), N'Huong Pho SE2', 6)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE2', N'Nam Dinh', CAST(N'03:52:00' AS Time), CAST(N'03:07:00' AS Time), N'Nam Dinh SE2', 10)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE2', N'Ninh Binh', CAST(N'03:20:00' AS Time), CAST(N'03:35:00' AS Time), N'Ninh Binh SE2', 9)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE2', N'Phu Ly', CAST(N'04:26:00' AS Time), CAST(N'04:41:00' AS Time), N'Phu Ly SE2', 11)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE2', N'Thanh Hoa', CAST(N'02:17:00' AS Time), CAST(N'02:32:00' AS Time), N'Thanh Hoa SE2', 8)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE2', N'Vinh', CAST(N'23:42:00' AS Time), CAST(N'23:57:00' AS Time), N'Vinh SE2', 7)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE3', N'Bien Hoa', CAST(N'04:00:00' AS Time), CAST(N'04:15:00' AS Time), N'Bien Hoa SE3', 11)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE3', N'Binh Thuan', CAST(N'01:13:00' AS Time), CAST(N'01:28:00' AS Time), N'Binh Thuan SE3', 9)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE3', N'Bong Son', CAST(N'15:58:00' AS Time), CAST(N'16:13:00' AS Time), N'Bong Son SE3', 4)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE3', N'Da Nang', CAST(N'11:25:00' AS Time), CAST(N'11:40:00' AS Time), N'Da Nang SE3', 1)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE3', N'Di An', CAST(N'04:15:00' AS Time), CAST(N'04:30:00' AS Time), N'Di An SE3', 12)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE3', N'Dieu Tri', CAST(N'17:31:00' AS Time), CAST(N'17:46:00' AS Time), N'Dieu Tri SE3', 5)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE3', N'Long Khanh', CAST(N'03:00:00' AS Time), CAST(N'03:15:00' AS Time), N'Long Khanh SE3', 10)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE3', N'Nha Trang', CAST(N'21:12:00' AS Time), CAST(N'21:27:00' AS Time), N'Nha Trang SE3', 7)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE3', N'Quang Ngai', CAST(N'14:27:00' AS Time), CAST(N'14:42:00' AS Time), N'Quang Ngai SE3', 3)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE3', N'Sai Gon', CAST(N'04:45:00' AS Time), CAST(N'05:00:00' AS Time), N'Sai Gon SE3', 13)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE3', N'Tam Ky', CAST(N'13:17:00' AS Time), CAST(N'13:32:00' AS Time), N'Tam Ky SE3', 2)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE3', N'Thap Cham', CAST(N'22:46:00' AS Time), CAST(N'23:01:00' AS Time), N'Thap Cham SE3', 8)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE3', N'Tuy Hoa', CAST(N'19:12:00' AS Time), CAST(N'19:27:00' AS Time), N'Tuy Hoa SE3', 6)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE4', N'Da Nang', CAST(N'12:49:00' AS Time), CAST(N'13:04:00' AS Time), N'Da Nang SE4', 1)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE4', N'Dong Ha', CAST(N'16:46:00' AS Time), CAST(N'17:01:00' AS Time), N'Dong Ha SE4', 3)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE4', N'Dong Hoi', CAST(N'18:40:00' AS Time), CAST(N'18:55:00' AS Time), N'Dong Hoi SE4', 4)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE4', N'Dong Le', CAST(N'20:18:00' AS Time), CAST(N'20:33:00' AS Time), N'Dong Le SE4', 5)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE4', N'Ha Noi', CAST(N'04:50:00' AS Time), CAST(N'05:05:00' AS Time), N'Ha Noi SE4', 12)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE4', N'Hue', CAST(N'15:31:00' AS Time), CAST(N'15:46:00' AS Time), N'Hue SE4', 2)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE4', N'Huong Pho', CAST(N'21:22:00' AS Time), CAST(N'21:37:00' AS Time), N'Huong Pho SE4', 6)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE4', N'Nam Dinh', CAST(N'03:07:00' AS Time), CAST(N'03:22:00' AS Time), N'Nam Dinh SE4', 10)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE4', N'Phu Ly', CAST(N'03:44:00' AS Time), CAST(N'03:59:00' AS Time), N'Phu Ly SE4', 11)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE4', N'Thanh Hoa', CAST(N'01:28:00' AS Time), CAST(N'01:43:00' AS Time), N'Thanh Hoa SE4', 9)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE4', N'Vinh', CAST(N'22:47:00' AS Time), CAST(N'23:02:00' AS Time), N'Vinh SE4', 8)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE4', N'Yen Trung', CAST(N'22:19:00' AS Time), CAST(N'22:34:00' AS Time), N'Yen Trung SE4', 7)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE5', N'Bien Hoa', CAST(N'17:57:00' AS Time), CAST(N'18:12:00' AS Time), N'Bien Hoa SE5', 9)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE5', N'Binh Thuan', CAST(N'15:12:00' AS Time), CAST(N'15:27:00' AS Time), N'Binh Thuan SE5', 7)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE5', N'Da Nang', CAST(N'01:21:00' AS Time), CAST(N'01:36:00' AS Time), N'Da Nang SE5', 1)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE5', N'Dieu Tri', CAST(N'07:00:00' AS Time), CAST(N'07:15:00' AS Time), N'Dieu Tri SE5', 3)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE5', N'Long Khanh', CAST(N'16:57:00' AS Time), CAST(N'17:12:00' AS Time), N'Long Khanh SE5', 8)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE5', N'Nha Trang', CAST(N'10:51:00' AS Time), CAST(N'11:06:00' AS Time), N'Nha Trang SE5', 5)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE5', N'Quang Ngai', CAST(N'03:56:00' AS Time), CAST(N'04:11:00' AS Time), N'Quang Ngai SE5', 2)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE5', N'Sai Gon', CAST(N'18:38:00' AS Time), CAST(N'18:53:00' AS Time), N'Sai Gon SE5', 10)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE5', N'Thap Cham', CAST(N'12:43:00' AS Time), CAST(N'12:58:00' AS Time), N'Thap Cham SE5', 6)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE5', N'Tuy Hoa', CAST(N'08:50:00' AS Time), CAST(N'09:05:00' AS Time), N'Tuy Hoa SE5', 4)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE6', N'Bim Son', CAST(N'16:16:00' AS Time), CAST(N'16:29:00' AS Time), N'Bim Son SE6', 12)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE6', N'Cho Sy', CAST(N'13:35:00' AS Time), CAST(N'13:50:00' AS Time), N'Cho Sy SE6', 9)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE6', N'Da Nang', CAST(N'02:23:00' AS Time), CAST(N'02:38:00' AS Time), N'Da Nang SE6', 1)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE6', N'Dong Ha', CAST(N'06:17:00' AS Time), CAST(N'06:32:00' AS Time), N'Dong Ha SE6', 3)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE6', N'Dong Hoi', CAST(N'08:42:00' AS Time), CAST(N'08:57:00' AS Time), N'Dong Hoi SE6', 4)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE6', N'Dong Le', CAST(N'10:18:00' AS Time), CAST(N'10:33:00' AS Time), N'Dong Le SE6', 5)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE6', N'Ha Noi', CAST(N'19:12:00' AS Time), CAST(N'19:27:00' AS Time), N'Ha Noi SE6', 16)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE6', N'Hue', CAST(N'05:00:00' AS Time), CAST(N'05:15:00' AS Time), N'Hue SE6', 2)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE6', N'Huong Pho', CAST(N'11:22:00' AS Time), CAST(N'11:37:00' AS Time), N'Huong Pho SE6', 6)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE6', N'Minh Khoi', CAST(N'15:07:00' AS Time), CAST(N'15:22:00' AS Time), N'Minh Khoi SE6', 10)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE6', N'Nam Dinh', CAST(N'17:27:00' AS Time), CAST(N'17:42:00' AS Time), N'Nam Dinh SE6', 14)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE6', N'Ninh Binh', CAST(N'16:51:00' AS Time), CAST(N'16:06:00' AS Time), N'Ninh Binh SE6', 13)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE6', N'Phu Ly', CAST(N'18:04:00' AS Time), CAST(N'18:19:00' AS Time), N'Phu Ly SE6', 15)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE6', N'Thanh Hoa', CAST(N'15:35:00' AS Time), CAST(N'15:50:00' AS Time), N'Thanh Hoa SE6', 11)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE6', N'Vinh', CAST(N'12:51:00' AS Time), CAST(N'13:06:00' AS Time), N'Vinh SE6', 8)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE6', N'Yen Trung', CAST(N'12:19:00' AS Time), CAST(N'12:34:00' AS Time), N'Yen Trung SE6', 7)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE7', N'Bien Hoa', CAST(N'15:25:00' AS Time), CAST(N'15:40:00' AS Time), N'Bien Hoa SE7', 12)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE7', N'Binh Thuan', CAST(N'12:33:00' AS Time), CAST(N'12:48:00' AS Time), N'Binh Thuan SE7', 9)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE7', N'Da Nang', CAST(N'22:36:00' AS Time), CAST(N'22:49:00' AS Time), N'Da Nang SE7', 1)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE7', N'Di An', CAST(N'15:40:00' AS Time), CAST(N'15:55:00' AS Time), N'Di An SE7', 13)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE7', N'Dieu Tri', CAST(N'04:32:00' AS Time), CAST(N'04:47:00' AS Time), N'Dieu Tri SE7', 4)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE7', N'Long Khanh', CAST(N'14:22:00' AS Time), CAST(N'14:37:00' AS Time), N'Long Khanh SE7', 11)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE7', N'Nha Trang', CAST(N'08:39:00' AS Time), CAST(N'08:54:00' AS Time), N'Nha Trang SE7', 7)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE7', N'Ninh Hoa', CAST(N'07:51:10' AS Time), CAST(N'08:06:00' AS Time), N'Ninh Hoa SE7', 6)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE7', N'Quang Ngai', CAST(N'01:32:00' AS Time), CAST(N'01:47:00' AS Time), N'Quang Ngai SE7', 3)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE7', N'Sai Gon', CAST(N'16:10:00' AS Time), CAST(N'16:25:00' AS Time), N'Sai Gon SE7', 14)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE7', N'Suoi Kiet', CAST(N'13:34:00' AS Time), CAST(N'13:49:00' AS Time), N'Suoi Kiet SE7', 10)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE7', N'Tam Ky', CAST(N'00:04:00' AS Time), CAST(N'00:19:00' AS Time), N'Tam Ky SE7', 2)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE7', N'Thap Cham', CAST(N'10:13:00' AS Time), CAST(N'10:28:00' AS Time), N'Thap Cham SE7', 8)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE7', N'Tuy Hoa', CAST(N'06:18:00' AS Time), CAST(N'06:33:00' AS Time), N'Tuy Hoa SE7', 5)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE8', N'Cho Sy', CAST(N'10:11:00' AS Time), CAST(N'10:26:00' AS Time), N'Cho Sy SE8', 11)
GO
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE8', N'Da Nang', CAST(N'23:04:00' AS Time), CAST(N'23:19:00' AS Time), N'Da Nang SE8', 1)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE8', N'Dong Ha', CAST(N'02:56:00' AS Time), CAST(N'02:11:00' AS Time), N'Dong Ha SE8', 3)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE8', N'Dong Hoi', CAST(N'04:55:00' AS Time), CAST(N'05:10:00' AS Time), N'Dong Hoi SE8', 5)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE8', N'Dong Le', CAST(N'06:55:00' AS Time), CAST(N'06:10:00' AS Time), N'Dong Le SE8', 7)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE8', N'Ha Noi', CAST(N'15:30:00' AS Time), CAST(N'15:45:00' AS Time), N'Ha Noi SE8', 17)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE8', N'Hue', CAST(N'01:39:00' AS Time), CAST(N'01:54:00' AS Time), N'Hue SE8', 2)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE8', N'Huong Pho', CAST(N'08:00:00' AS Time), CAST(N'08:15:00' AS Time), N'Huong Pho SE8', 8)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE8', N'Minh Khoi', CAST(N'11:31:00' AS Time), CAST(N'11:46:00' AS Time), N'Minh Khoi SE8', 12)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE8', N'Minh Le', CAST(N'05:54:00' AS Time), CAST(N'06:09:00' AS Time), N'Minh Le SE8', 6)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE8', N'My Duc', CAST(N'04:10:00' AS Time), CAST(N'04:25:00' AS Time), N'My Duc SE8', 4)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE8', N'Nam Dinh', CAST(N'13:47:00' AS Time), CAST(N'14:02:00' AS Time), N'Nam Dinh SE8', 15)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE8', N'Ninh Binh', CAST(N'13:12:00' AS Time), CAST(N'13:37:00' AS Time), N'Ninh Binh SE8', 14)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE8', N'Phu Ly', CAST(N'14:24:00' AS Time), CAST(N'14:39:00' AS Time), N'Phu Ly SE8', 16)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE8', N'Thanh Hoa', CAST(N'11:56:00' AS Time), CAST(N'11:09:00' AS Time), N'Thanh Hoa SE8', 13)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE8', N'Vinh', CAST(N'09:28:00' AS Time), CAST(N'09:43:00' AS Time), N'Vinh SE8', 10)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE8', N'Yen Trung', CAST(N'08:57:00' AS Time), CAST(N'09:12:00' AS Time), N'Yen Trung SE8', 9)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE9', N'Bien Hoa', CAST(N'02:00:00' AS Time), CAST(N'02:15:00' AS Time), N'Bien Hoa SE9', 15)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE9', N'Binh Thuan', CAST(N'22:32:00' AS Time), CAST(N'22:47:00' AS Time), N'Binh Thuan SE9', 14)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE9', N'Bong Son', CAST(N'12:26:00' AS Time), CAST(N'12:41:00' AS Time), N'Bong Son SE9', 6)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE9', N'Da Nang', CAST(N'07:50:00' AS Time), CAST(N'08:05:00' AS Time), N'Da Nang SE9', 1)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE9', N'Di An', CAST(N'02:15:00' AS Time), CAST(N'02:30:00' AS Time), N'Di An SE9', 16)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE9', N'Dieu Tri', CAST(N'13:56:00' AS Time), CAST(N'14:11:00' AS Time), N'Dieu Tri SE9', 7)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE9', N'Duc Pho', CAST(N'11:36:00' AS Time), CAST(N'11:51:00' AS Time), N'Duc Pho SE9', 5)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE9', N'Gia', CAST(N'16:54:00' AS Time), CAST(N'17:09:00' AS Time), N'Gia SE9', 9)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE9', N'Nha Trang', CAST(N'18:19:00' AS Time), CAST(N'18:34:00' AS Time), N'Nha Trang SE9', 11)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE9', N'Ninh Hoa', CAST(N'17:30:00' AS Time), CAST(N'17:45:00' AS Time), N'Ninh Hoa SE9', 10)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE9', N'Nui Thanh', CAST(N'09:41:00' AS Time), CAST(N'09:56:00' AS Time), N'Nui Thanh SE9', 3)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE9', N'Quang Ngai', CAST(N'10:35:00' AS Time), CAST(N'10:50:00' AS Time), N'Quang Ngai SE9', 4)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE9', N'Sai Gon', CAST(N'02:47:00' AS Time), CAST(N'03:02:00' AS Time), N'Sai Gon SE9', 17)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE9', N'Song Mao', CAST(N'21:26:00' AS Time), CAST(N'21:41:00' AS Time), N'Song Mao SE9', 13)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE9', N'Tam Ky', CAST(N'09:11:00' AS Time), CAST(N'09:26:00' AS Time), N'Tam Ky SE9', 2)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE9', N'Thap Cham', CAST(N'20:10:00' AS Time), CAST(N'21:25:00' AS Time), N'Thap Cham SE9', 12)
INSERT [dbo].[schedule] ([trainid], [stationid], [arrivaltime], [departuretime], [trip], [i]) VALUES (N'SE9', N'Tuy Hoa', CAST(N'15:40:00' AS Time), CAST(N'15:55:00' AS Time), N'Tuy Hoa SE9', 8)
GO
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Bien Hoa', N'Dong Nai')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Bim Son', N'Thanh Hoa')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Binh Thuan', N'Binh Thuan')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Bong Son', N'Binh Dinh')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Cho sy', N'Nghe An')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Da Nang', N'Da Nang')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Di An', N'Binh Duong')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Dieu Tri', N'Binh Dinh')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Dong Ha', N'Quang Tri')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Dong Hoi', N'Quang Binh')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Dong Le', N'Quang Binh')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Duc Pho', N'Quang Ngai')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Gia', N'Khanh Hoa')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Ha Noi', N'Ha Noi')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Hue', N'Hue')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Huong Pho', N'Ha Tinh')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Long Khanh', N'Dong Nai')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Minh Khoi', N'Thanh Hoa')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Minh Le', N'Quang Binh')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'My Duc', N'Quang Binh')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Nam Dinh', N'Nam Dinh')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Nha Trang', N'Nha Trang')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Ninh Binh', N'Ninh Binh')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Ninh Hoa', N'Khanh Hoa')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Nui Thanh', N'Quang Nam')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Phu Ly', N'Ha Nam')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Quang Ngai', N'Quang Ngai')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Sai Gon', N'Thanh pho Ho Chi Minh')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Song Mao', N'Binh Thuan')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Suoi Kiet', N'Binh Thuan')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Tam Ky', N'Quang Nam')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Thanh Hoa', N'Thanh Hoa')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Thap Cham', N'Ninh Thuan')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Tuy Hoa', N'Phu Yen')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Vinh', N'Vinh')
INSERT [dbo].[stations] ([stationid], [city]) VALUES (N'Yen Trung', N'Ha Tinh')
GO
INSERT [dbo].[ticket] ([codeticket], [username], [noidi], [noiden], [trainid], [seatno], [traincar], [departuretime], [arrivaltime], [price], [date]) VALUES (N'C8PNP1RX', N'2', N'Da Nang', N'My Duc', N'SE8', N'07', N'Car 5', CAST(N'23:04:00' AS Time), CAST(N'04:10:00' AS Time), 639000.0000, N'07/02/20')
INSERT [dbo].[ticket] ([codeticket], [username], [noidi], [noiden], [trainid], [seatno], [traincar], [departuretime], [arrivaltime], [price], [date]) VALUES (N'D1IWA9NO', N'1', N'Da Nang', N'Tuy Hoa', N'SE1', N'08', N'Car 3', CAST(N'13:45:00' AS Time), CAST(N'20:29:00' AS Time), 399000.0000, N'06/07/20')
INSERT [dbo].[ticket] ([codeticket], [username], [noidi], [noiden], [trainid], [seatno], [traincar], [departuretime], [arrivaltime], [price], [date]) VALUES (N'D6DGN8XH', N'abc123', N'Da Nang', N'Di An', N'SE3', N'13', N'Car 2', CAST(N'11:25:00' AS Time), CAST(N'04:15:00' AS Time), 420000.0000, N'06/09/20')
INSERT [dbo].[ticket] ([codeticket], [username], [noidi], [noiden], [trainid], [seatno], [traincar], [departuretime], [arrivaltime], [price], [date]) VALUES (N'D6ESL4QJ', N'1', N'Da Nang', N'Cho sy', N'SE10', N'16', N'Car 7', CAST(N'10:03:00' AS Time), CAST(N'21:41:00' AS Time), 1399000.0000, N'06/28/20')
INSERT [dbo].[ticket] ([codeticket], [username], [noidi], [noiden], [trainid], [seatno], [traincar], [departuretime], [arrivaltime], [price], [date]) VALUES (N'H6UES6BY', N'3', N'Da Nang', N'Dieu Tri', N'SE1', N'08', N'Car 3', CAST(N'13:45:00' AS Time), CAST(N'18:51:00' AS Time), 399000.0000, N'07/09/20')
INSERT [dbo].[ticket] ([codeticket], [username], [noidi], [noiden], [trainid], [seatno], [traincar], [departuretime], [arrivaltime], [price], [date]) VALUES (N'L2RSA6DA', N'2', N'Da Nang', N'Sai Gon', N'SE1', N'20', N'Car 4', CAST(N'13:45:00' AS Time), CAST(N'05:45:00' AS Time), 999000.0000, N'07/01/20')
INSERT [dbo].[ticket] ([codeticket], [username], [noidi], [noiden], [trainid], [seatno], [traincar], [departuretime], [arrivaltime], [price], [date]) VALUES (N'L5SKM4FY', N'3', N'Da Nang', N'Ha Noi', N'SE4', N'06', N'Car 3', CAST(N'12:49:00' AS Time), CAST(N'04:50:00' AS Time), 890000.0000, N'07/09/20')
INSERT [dbo].[ticket] ([codeticket], [username], [noidi], [noiden], [trainid], [seatno], [traincar], [departuretime], [arrivaltime], [price], [date]) VALUES (N'O6KML5NN', N'1', N'Da Nang', N'Dong Le', N'SE10', N'05', N'Car 3', CAST(N'10:03:00' AS Time), CAST(N'18:09:00' AS Time), 890000.0000, N'06/09/20')
INSERT [dbo].[ticket] ([codeticket], [username], [noidi], [noiden], [trainid], [seatno], [traincar], [departuretime], [arrivaltime], [price], [date]) VALUES (N'Q3JHU2XO', N'2', N'Da Nang', N'Ninh Binh', N'SE2', N'11', N'Car 4', CAST(N'13:55:00' AS Time), CAST(N'03:20:00' AS Time), 420000.0000, N'06/28/20')
INSERT [dbo].[ticket] ([codeticket], [username], [noidi], [noiden], [trainid], [seatno], [traincar], [departuretime], [arrivaltime], [price], [date]) VALUES (N'V2DDA2IV', N'3', N'Da Nang', N'Ha Noi', N'SE4', N'08', N'Car 3', CAST(N'12:49:00' AS Time), CAST(N'04:50:00' AS Time), 399000.0000, N'07/09/20')
INSERT [dbo].[ticket] ([codeticket], [username], [noidi], [noiden], [trainid], [seatno], [traincar], [departuretime], [arrivaltime], [price], [date]) VALUES (N'V2FPJ1IF', N'2', N'Da Nang', N'Ninh Hoa', N'SE9', N'18', N'Car 5', CAST(N'07:50:00' AS Time), CAST(N'17:30:00' AS Time), 1399000.0000, N'06/28/20')
INSERT [dbo].[ticket] ([codeticket], [username], [noidi], [noiden], [trainid], [seatno], [traincar], [departuretime], [arrivaltime], [price], [date]) VALUES (N'W9TJC9CA', N'abc123', N'Da Nang', N'Di An', N'SE3', N'11', N'Car 2', CAST(N'11:25:00' AS Time), CAST(N'04:15:00' AS Time), 420000.0000, N'06/09/20')
INSERT [dbo].[ticket] ([codeticket], [username], [noidi], [noiden], [trainid], [seatno], [traincar], [departuretime], [arrivaltime], [price], [date]) VALUES (N'Y6OKY3KM', N'abc123', N'Da Nang', N'Nam Dinh', N'SE10', N'13', N'Car 3', CAST(N'10:03:00' AS Time), CAST(N'02:16:00' AS Time), 420000.0000, N'04/01/21')
GO
INSERT [dbo].[trains] ([trainid]) VALUES (N'SE1')
INSERT [dbo].[trains] ([trainid]) VALUES (N'SE10')
INSERT [dbo].[trains] ([trainid]) VALUES (N'SE2')
INSERT [dbo].[trains] ([trainid]) VALUES (N'SE3')
INSERT [dbo].[trains] ([trainid]) VALUES (N'SE4')
INSERT [dbo].[trains] ([trainid]) VALUES (N'SE5')
INSERT [dbo].[trains] ([trainid]) VALUES (N'SE6')
INSERT [dbo].[trains] ([trainid]) VALUES (N'SE7')
INSERT [dbo].[trains] ([trainid]) VALUES (N'SE8')
INSERT [dbo].[trains] ([trainid]) VALUES (N'SE9')
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD FOREIGN KEY([permissionid])
REFERENCES [dbo].[permission] ([permissionid])
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD FOREIGN KEY([stationid])
REFERENCES [dbo].[stations] ([stationid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD FOREIGN KEY([trainid])
REFERENCES [dbo].[trains] ([trainid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD FOREIGN KEY([trainid], [noiden])
REFERENCES [dbo].[schedule] ([trainid], [stationid])
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[account] ([username])
GO
/****** Object:  StoredProcedure [dbo].[USP_ChangePass]    Script Date: 04/01/21 10:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_ChangePass]
@userName NVARCHAR(100), @password NVARCHAR(100), @newPassword NVARCHAR(100)
AS
BEGIN
	DECLARE @isRightPass INT = 0
	
	SELECT @isRightPass = COUNT(*) FROM dbo.Account WHERE username = @userName AND pass = @password
	
	IF (@isRightPass = 1)
	BEGIN
		
			UPDATE dbo.Account SET pass = @newPassword WHERE UserName = @userName
	end
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateAccount]    Script Date: 04/01/21 10:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateAccount]
@userName NVARCHAR(50), @fullName NVARCHAR(50), @phonenumber NVARCHAR(50), @email NVARCHAR(50)
AS
BEGIN
	DECLARE @isRightPass INT = 0
	
	SELECT @isRightPass = COUNT(*) FROM dbo.Account WHERE username = @userName
	
	IF (@isRightPass = 1)
	BEGIN
			UPDATE dbo.Account SET fullname = @fullName, Email=@email, phonenumber=@phonenumber WHERE UserName = @userName
	end
END
GO
USE [master]
GO
ALTER DATABASE [TS] SET  READ_WRITE 
GO
