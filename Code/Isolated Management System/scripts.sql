USE [master]
GO
/****** Object:  Database [swp]    Script Date: 3/4/2022 8:10:19 PM ******/
CREATE DATABASE [swp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'swp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\swp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'swp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\swp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [swp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [swp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [swp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [swp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [swp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [swp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [swp] SET ARITHABORT OFF 
GO
ALTER DATABASE [swp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [swp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [swp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [swp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [swp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [swp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [swp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [swp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [swp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [swp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [swp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [swp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [swp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [swp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [swp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [swp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [swp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [swp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [swp] SET  MULTI_USER 
GO
ALTER DATABASE [swp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [swp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [swp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [swp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [swp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [swp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'swp', N'ON'
GO
ALTER DATABASE [swp] SET QUERY_STORE = OFF
GO
USE [swp]
GO
/****** Object:  Table [dbo].[account]    Script Date: 3/4/2022 8:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[id_type] [int] NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[avatar] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_tai_khoan] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[account_type]    Script Date: 3/4/2022 8:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account_type](
	[account_type_id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [nvarchar](255) NULL,
 CONSTRAINT [PK_loai_tai_khoan] PRIMARY KEY CLUSTERED 
(
	[account_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[area]    Script Date: 3/4/2022 8:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[area](
	[area_id] [int] IDENTITY(1,1) NOT NULL,
	[area_name] [nvarchar](255) NULL,
	[area_address] [nvarchar](255) NULL,
	[contact] [nvarchar](45) NULL,
 CONSTRAINT [PK_khu_cach_ly] PRIMARY KEY CLUSTERED 
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 3/4/2022 8:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id_category] [int] NOT NULL,
	[category_name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category_medicine]    Script Date: 3/4/2022 8:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_medicine](
	[category_id] [int] NOT NULL,
	[medicine_id] [int] NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_category_medicine] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doctor]    Script Date: 3/4/2022 8:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctor](
	[id_doctor] [int] IDENTITY(1,1) NOT NULL,
	[doctor_name] [nvarchar](255) NOT NULL,
	[phone] [int] NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[id_account] [int] NOT NULL,
	[address] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_doctor] PRIMARY KEY CLUSTERED 
(
	[id_doctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doctor_patient]    Script Date: 3/4/2022 8:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctor_patient](
	[patient_id] [int] NOT NULL,
	[id_doctor] [int] NOT NULL,
	[id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medicine]    Script Date: 3/4/2022 8:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medicine](
	[id_medicine] [int] NOT NULL,
	[medicine_name] [nvarchar](255) NOT NULL,
	[quantity] [int] NOT NULL,
	[image] [text] NULL,
 CONSTRAINT [PK_medicine] PRIMARY KEY CLUSTERED 
(
	[id_medicine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nurse]    Script Date: 3/4/2022 8:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nurse](
	[id_nurse] [int] IDENTITY(1,1) NOT NULL,
	[name_nurse] [nvarchar](255) NOT NULL,
	[phone] [int] NOT NULL,
	[id_account] [int] NOT NULL,
	[address] [nvarchar](255) NULL,
	[id_area] [int] NULL,
	[fullname] [nvarchar](255) NULL,
 CONSTRAINT [PK_nurse] PRIMARY KEY CLUSTERED 
(
	[id_nurse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nurse_patient]    Script Date: 3/4/2022 8:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nurse_patient](
	[patient_id] [int] NOT NULL,
	[id_nurse] [int] NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_nurse_patient] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patient]    Script Date: 3/4/2022 8:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient](
	[patient_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](255) NULL,
	[age] [int] NULL,
	[gender] [nvarchar](50) NULL,
	[address] [nvarchar](255) NULL,
	[partpost] [nvarchar](50) NULL,
	[phone] [int] NULL,
	[region] [nvarchar](50) NULL,
	[suspicion_level] [nvarchar](50) NOT NULL,
	[time_in] [datetime] NOT NULL,
	[time_out] [datetime] NULL,
	[room_id] [int] NOT NULL,
	[area_id] [int] NULL,
	[account_id] [int] NULL,
 CONSTRAINT [PK_nguoi_cach_ly] PRIMARY KEY CLUSTERED 
(
	[patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patient_room]    Script Date: 3/4/2022 8:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient_room](
	[id_patient_room] [int] NULL,
	[id_patient] [int] NULL,
	[id_room] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prescription]    Script Date: 3/4/2022 8:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prescription](
	[id_prescription] [int] IDENTITY(1,1) NOT NULL,
	[medicine_name] [nvarchar](255) NULL,
	[create_date] [datetime] NULL,
	[id_patient] [int] NOT NULL,
	[id_doctor] [int] NOT NULL,
	[id_medicine] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_don_thuoc] PRIMARY KEY CLUSTERED 
(
	[id_prescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report]    Script Date: 3/4/2022 8:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report](
	[id_report] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](255) NULL,
	[create_date] [datetime] NULL,
	[id_patient] [int] NOT NULL,
 CONSTRAINT [PK_bao_cao] PRIMARY KEY CLUSTERED 
(
	[id_report] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room]    Script Date: 3/4/2022 8:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[room_name] [nvarchar](50) NULL,
	[bed_number] int NULL,
	[note] [nvarchar](255) NULL,
	[area_id] [int] NULL,
 CONSTRAINT [PK_phong] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_result]    Script Date: 3/4/2022 8:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_result](
	[test_result_id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NULL,
	[test_name] [nvarchar](45) NULL,
	[result] [nvarchar](255) NULL,
	[create_date] [datetime] NULL,
 CONSTRAINT [PK_kq_xet_nghiem] PRIMARY KEY CLUSTERED 
(
	[test_result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 
GO
INSERT [dbo].[account] ([account_id], [id_type], [username], [password], [avatar], [email]) VALUES (7, 3, N'danggiang', N'9c7a274a488966e9372b2e5fd3ff41a4', NULL, NULL)
GO
INSERT [dbo].[account] ([account_id], [id_type], [username], [password], [avatar], [email]) VALUES (28, 3, N'huy', N'9c7a274a488966e9372b2e5fd3ff41a4', N'avatar-default.png', NULL)
GO
INSERT [dbo].[account] ([account_id], [id_type], [username], [password], [avatar], [email]) VALUES (30, 3, N'minh', N'9c7a274a488966e9372b2e5fd3ff41a4', N'avatar-default.png', NULL)
GO
INSERT [dbo].[account] ([account_id], [id_type], [username], [password], [avatar], [email]) VALUES (31, 3, N'hai', N'9c7a274a488966e9372b2e5fd3ff41a4', N'avatar-default.png', NULL)
GO
INSERT [dbo].[account] ([account_id], [id_type], [username], [password], [avatar], [email]) VALUES (32, 2, N'hailuu', N'61582879c26f6cb9113ce125fc529e19', N'avatar-default.png', N'hoanghai.luu.71@gmail.com')
GO
INSERT [dbo].[account] ([account_id], [id_type], [username], [password], [avatar], [email]) VALUES (34, 3, N'luuhai', N'e10adc3949ba59abbe56e057f20f883e', N'avatar-default.png', N'hoanghai.luu.71@gmail.com')
GO
INSERT [dbo].[account] ([account_id], [id_type], [username], [password], [avatar], [email]) VALUES (35, 3, N'hailuu1103', N'e10adc3949ba59abbe56e057f20f883e', N'avatar-default.png', N'hoanghai.luu.71@gmail.com')
GO
INSERT [dbo].[account] ([account_id], [id_type], [username], [password], [avatar], [email]) VALUES (37, 3, N'quyenngu2306', N'e10adc3949ba59abbe56e057f20f883e', N'avatar-default.png', N'hoanghai.luu.71@gmail.com')
GO
INSERT [dbo].[account] ([account_id], [id_type], [username], [password], [avatar], [email]) VALUES (39, 3, N'hailuualo', N'e10adc3949ba59abbe56e057f20f883e', N'avatar-default.png', N'hoanghai.luu.71@gmail.com')
GO
INSERT [dbo].[account] ([account_id], [id_type], [username], [password], [avatar], [email]) VALUES (40, 3, N'longcute1234', N'82ffd1d1eece1b3f861d191416c5dcb8', N'avatar-default.png', N'hailhhe153224@fpt.edu.vn')
GO
INSERT [dbo].[account] ([account_id], [id_type], [username], [password], [avatar], [email]) VALUES (43, 3, N'maiquyen2306', N'56a432174617c43eddf93b782f2f9138', N'avatar-default.png', N'quyenutc0306@gmail.com')
GO
INSERT [dbo].[account] ([account_id], [id_type], [username], [password], [avatar], [email]) VALUES (45, 1, N'admin', N'e10adc3949ba59abbe56e057f20f883e', N'avatar-default.png', N'hoanghai.luu.71@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[account_type] ON 
GO
INSERT [dbo].[account_type] ([account_type_id], [type_name]) VALUES (1, N'manager')
GO
INSERT [dbo].[account_type] ([account_type_id], [type_name]) VALUES (2, N'nurse')
GO
INSERT [dbo].[account_type] ([account_type_id], [type_name]) VALUES (3, N'patient')
GO
INSERT [dbo].[account_type] ([account_type_id], [type_name]) VALUES (4, N'doctor')
GO
SET IDENTITY_INSERT [dbo].[account_type] OFF
GO
SET IDENTITY_INSERT [dbo].[area] ON 
GO
INSERT [dbo].[area] ([area_id], [area_name], [area_address], [contact]) VALUES (1, N'Khu cách ly Nghĩa Hiệp', N'Số 25, Trần Hưng Đạo, Hà Nội', N'0987654321')
GO
INSERT [dbo].[area] ([area_id], [area_name], [area_address], [contact]) VALUES (2, N'Khu cách ly Bình Tân', N'Số 12, Quận 1, Thành phố Hồ Chí Minh', N'0912345678')
GO
INSERT [dbo].[area] ([area_id], [area_name], [area_address], [contact]) VALUES (3, N'Khu cách ly Xã Đàn', N'Số 1, Lê Duẩn, Hà Nội', N'0123459876')
GO
INSERT [dbo].[area] ([area_id], [area_name], [area_address], [contact]) VALUES (4, N'Khu cách ly FPT', N'Km29 Đại Lộ Thăng Long, Thạch Thất, Hà Nội', N'0888100015')
GO
SET IDENTITY_INSERT [dbo].[area] OFF
GO
INSERT [dbo].[nurse] ([id_nurse], [name_nurse], [phone], [id_account], [address], [id_area], [fullname]) VALUES (1, N'Hải Lưu', 888100105, 32, N'36 ngô gia tự', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[patient] ON 
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (1, N'Nguy?n T? Ðang Giang', 18, N'Nam', N'hà nội', N'001200020739', 988025083, N'vietnam', N'F1', CAST(N'2022-06-04T01:02:03.000' AS DateTime), CAST(N'2022-01-08T23:38:35.000' AS DateTime), 1, 1, NULL)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (2, N'van huy', 18, N'nu', N'ha noi', N'09880834959834984', 987654321, N'vietnam', N'F1', CAST(N'2021-06-04T01:02:03.000' AS DateTime), NULL, 1, 1, NULL)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (5, N'Minh Linh Tinh', 18, N'Nam', N'ha noi', N'944359379847539873', 987654321, N'vietnam', N'F1', CAST(N'2021-05-12T01:02:03.000' AS DateTime), NULL, 1, 1, 30)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (7, N'hai', 18, N'nam', N'ha noi', N'7987357933329', 489784972, N'vietnam', N'F1', CAST(N'2021-05-12T01:02:03.000' AS DateTime), NULL, 1, 1, 31)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (9, N'hailuu', 22, N'nam', N'ha dong', N'0888100105', 888100105, N'vietnam', N'F2', CAST(N'2001-11-03T00:00:00.000' AS DateTime), NULL, 1, 1, 34)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (10, N'Hải Lưu', 23, N'Nam', N'36 Ngô Gia Tự', N'0888100105', 888100105, N'vietnam', N'F0', CAST(N'2022-02-17T00:08:00.300' AS DateTime), CAST(N'2022-02-17T00:08:00.300' AS DateTime), 1, 1, 32)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (11, N'hải lưu', 44, N'Nam', N'alo', N'0888100105', 888100105, N'alo', N'F1', CAST(N'2001-11-03T00:00:00.000' AS DateTime), NULL, 1, 1, NULL)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (13, N'quyên ngu', 22, N'Nam', N'hà đông', N'0888100105', 888100105, N'ola', N'F0', CAST(N'2001-11-04T00:00:00.000' AS DateTime), NULL, 1, 1, 39)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (14, N'Long Ngu', 44, N'Nam', N'Germany', N'0888100105', 888100105, N'germany', N'F2', CAST(N'2002-11-02T00:00:00.000' AS DateTime), NULL, 2, 2, 40)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (16, N'Mai Quyên', 65, N'Nữ', N'Hà Nội', N'0888100105', 888100105, N'vietnam', N'F4', CAST(N'2022-02-17T00:00:00.000' AS DateTime), NULL, 2, 2, NULL)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (17, N'Đức Lê', 44, N'Nam', N'Hà Đông', N'0888100105', 888100105, N'vietnam', N'F2', CAST(N'2022-02-17T00:00:00.000' AS DateTime), NULL, 2, 3, NULL)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (18, N'Phạm Tuân', 17, N'Nam', N'Hà Nội', N'0888100105', 888100105, N'vietnam', N'F3', CAST(N'2022-02-17T00:00:00.000' AS DateTime), NULL, 2, 3, NULL)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (20, N'Doctor', 44, N'Nam', N'36 Ngô Gia Tự, Đồng Hới, Quảng Bình', N'45151421312421', 888100105, N'Quảng Bình', N'F4', CAST(N'2022-02-20T10:09:34.000' AS DateTime), NULL, 1, 1, 30)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (21, N'AccountType', 63, N'Nam', N'36 Ngô Gia Tự, Đồng Hới, Quảng Bình', N'53141231231241', 888100105, N'Germany', N'F4', CAST(N'2022-02-20T10:09:55.000' AS DateTime), NULL, 1, 1, 30)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (22, N'Long cute1234', 22, N'Nam', N'36 Ngô Gia Tự, Đồng Hới, Quảng Bình', N'32121124124214', 888100105, N'Thailand', N'F4', CAST(N'2022-02-20T10:11:35.000' AS DateTime), NULL, 1, 1, 30)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (23, N'Simon Leviev', 44, N'Nam', N'36 Ngô Gia Tự, Đồng Hới, Quảng Bình', N'45151421312421', 888100105, N'VietNam', N'F4', CAST(N'2022-02-21T14:38:49.000' AS DateTime), NULL, 1, 1, 30)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (24, N'Long Hoàng', 55, N'Nam', N'36 Ngô Gia Tự, Đồng Hới, Quảng Bình', N'53141231231241', 888100105, N'Germany', N'F4', CAST(N'2022-02-21T20:31:32.000' AS DateTime), NULL, 1, 1, 30)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (25, N'Phùng Hưng', 63, N'Nam', N'36 Ngô Gia Tự, Đồng Hới, Quảng Bình', N'53141231231241', 888100105, N'VietNam', N'F4', CAST(N'2022-02-22T15:45:14.000' AS DateTime), NULL, 1, 1, 30)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (26, N'Lưu Hoàng Hải', 20, N'Nam', N'36 Ngô Gia Tự, Đồng Hới, Quảng Bình', N'45151421312421', 888100105, N'Quảng Bình', N'F4', CAST(N'2022-03-02T16:39:27.000' AS DateTime), NULL, 1, 1, 30)
GO
INSERT [dbo].[patient] ([patient_id], [full_name], [age], [gender], [address], [partpost], [phone], [region], [suspicion_level], [time_in], [time_out], [room_id], [area_id], [account_id]) VALUES (27, N'Lưu Hoàng Hải 123', 20, N'Nam', N'36 Ngô Gia Tự, Đồng Hới, Quảng Bình', N'45151421312421', 888100105, N'US', N'F4', CAST(N'2022-03-04T16:47:58.000' AS DateTime), NULL, 1, 1, 30)
GO
SET IDENTITY_INSERT [dbo].[patient] OFF
GO
SET IDENTITY_INSERT [dbo].[report] ON 
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (1, N'ok', CAST(N'2022-02-10T00:00:00.000' AS DateTime), 5)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (2, N'ok', CAST(N'2022-02-10T00:00:00.000' AS DateTime), 5)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (3, N'ho sot', CAST(N'2022-02-11T00:00:00.000' AS DateTime), 7)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (7, N'Fall in love', CAST(N'2022-02-21T00:00:00.000' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (9, N'single love', CAST(N'2022-02-21T00:00:00.000' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (10, N'zcxcc', CAST(N'2022-02-21T00:00:00.000' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (12, N'2 cộng 3 bằng 5', CAST(N'2022-02-21T00:00:00.000' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (13, N'vã lắm rồi', CAST(N'2022-02-21T00:00:00.000' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (14, N'ac', CAST(N'2022-02-23T00:00:00.000' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (15, N'hôm nay tôi dính F0, làm ơn cứu tôi', CAST(N'2022-02-23T00:00:00.000' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (16, N'hôm nay là thứ mấy', CAST(N'2022-02-23T00:00:00.000' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (18, N'alulllll', CAST(N'2022-02-23T16:43:34.250' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (19, N'hello world', CAST(N'2022-02-23T16:45:04.750' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (21, N'hallo hallo', CAST(N'2022-02-23T17:42:17.640' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (22, N'alu', CAST(N'2022-02-23T00:00:00.000' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (23, N'tôi sắp chết', CAST(N'2022-02-23T22:29:59.167' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (24, N'tôi chưa chết', CAST(N'2022-02-23T22:34:18.747' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (25, N'aluluulluluul', CAST(N'2022-02-23T23:34:46.413' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (26, N'xinh thế', CAST(N'2022-02-23T23:43:59.450' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (27, N'hôm nay là thứ 4', CAST(N'2022-02-23T23:50:16.043' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (28, N'null pointer', CAST(N'2022-02-23T23:51:19.200' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (29, N'alo', CAST(N'2022-02-23T23:52:48.517' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (31, N'hay lắm quin', CAST(N'2022-02-23T23:55:41.537' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (32, N'cuối tuần đi chơi', CAST(N'2022-02-23T23:56:56.900' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (33, N'copy and paste', CAST(N'2022-02-24T00:03:48.300' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (34, N'ông nào', CAST(N'2022-02-24T00:04:25.637' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (35, N'cczxczxcz', CAST(N'2022-02-24T00:07:36.357' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (36, N'bãi đổ xăng cách có 2 cây', CAST(N'2022-02-24T09:04:39.963' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (37, N'worthy', CAST(N'2022-02-24T09:10:13.133' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (38, N'abbbbbbbbbbbb', CAST(N'2022-02-24T09:13:15.843' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (39, N'hold on i still need you', CAST(N'2022-02-24T09:13:57.637' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (40, N'aloooo', CAST(N'2022-02-24T09:15:42.977' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (41, N'alulululullululululuul', CAST(N'2022-02-24T09:18:35.020' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (43, N'thấy em với bạn tôi
', CAST(N'2022-02-24T09:21:24.537' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (46, N'accccccc', CAST(N'2022-02-24T09:57:26.580' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (47, N'avvvvvvv', CAST(N'2022-02-24T09:58:58.053' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (48, N'noone', CAST(N'2022-02-24T10:02:40.337' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (49, N'delegate', CAST(N'2022-02-24T10:05:07.720' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (50, N'it you', CAST(N'2022-02-24T10:05:16.667' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (52, N'afafafafafacxzcxzczxcxzcxz', CAST(N'2022-02-24T10:17:25.867' AS DateTime), 9)
GO
INSERT [dbo].[report] ([id_report], [content], [create_date], [id_patient]) VALUES (53, N'đâsdasdsadsadsasad', CAST(N'2022-02-25T16:34:51.040' AS DateTime), 9)
GO
SET IDENTITY_INSERT [dbo].[report] OFF
GO
SET IDENTITY_INSERT [dbo].[test_result] ON 
GO
INSERT [dbo].[test_result] ([test_result_id], [patient_id], [test_name], [result], [create_date]) VALUES (1, 1, N'test covid', N'duong tinh', CAST(N'2021-06-04T01:02:03.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[test_result] OFF
GO
ALTER TABLE [dbo].[category_medicine]  WITH CHECK ADD  CONSTRAINT [FK_category_medicine_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id_category])
GO
ALTER TABLE [dbo].[category_medicine] CHECK CONSTRAINT [FK_category_medicine_category]
GO
ALTER TABLE [dbo].[category_medicine]  WITH CHECK ADD  CONSTRAINT [FK_category_medicine_medicine] FOREIGN KEY([medicine_id])
REFERENCES [dbo].[medicine] ([id_medicine])
GO
ALTER TABLE [dbo].[category_medicine] CHECK CONSTRAINT [FK_category_medicine_medicine]
GO
ALTER TABLE [dbo].[doctor]  WITH CHECK ADD FOREIGN KEY([id_account])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[doctor_patient]  WITH CHECK ADD  CONSTRAINT [FK_doctor_patient_doctor] FOREIGN KEY([id_doctor])
REFERENCES [dbo].[doctor] ([id_doctor])
GO
ALTER TABLE [dbo].[doctor_patient] CHECK CONSTRAINT [FK_doctor_patient_doctor]
GO
ALTER TABLE [dbo].[doctor_patient]  WITH CHECK ADD  CONSTRAINT [FK_doctor_patient_patient] FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient] ([patient_id])
GO
ALTER TABLE [dbo].[doctor_patient] CHECK CONSTRAINT [FK_doctor_patient_patient]
GO
ALTER TABLE [dbo].[nurse]  WITH CHECK ADD FOREIGN KEY([id_account])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[nurse]  WITH CHECK ADD  CONSTRAINT [FK_nurse_area] FOREIGN KEY([id_area])
REFERENCES [dbo].[area] ([area_id])
GO
ALTER TABLE [dbo].[nurse] CHECK CONSTRAINT [FK_nurse_area]
GO
ALTER TABLE [dbo].[nurse_patient]  WITH CHECK ADD  CONSTRAINT [FK_nurse_patient_nurse] FOREIGN KEY([id_nurse])
REFERENCES [dbo].[nurse] ([id_nurse])
GO
ALTER TABLE [dbo].[nurse_patient] CHECK CONSTRAINT [FK_nurse_patient_nurse]
GO
ALTER TABLE [dbo].[nurse_patient]  WITH CHECK ADD  CONSTRAINT [FK_nurse_patient_patient] FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient] ([patient_id])
GO
ALTER TABLE [dbo].[nurse_patient] CHECK CONSTRAINT [FK_nurse_patient_patient]
GO
ALTER TABLE [dbo].[patient]  WITH CHECK ADD  CONSTRAINT [FK_patient_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[patient] CHECK CONSTRAINT [FK_patient_account]
GO
ALTER TABLE [dbo].[patient_room]  WITH CHECK ADD  CONSTRAINT [FK_patient_room_patient] FOREIGN KEY([id_patient])
REFERENCES [dbo].[patient] ([patient_id])
GO
ALTER TABLE [dbo].[patient_room] CHECK CONSTRAINT [FK_patient_room_patient]
GO
ALTER TABLE [dbo].[patient_room]  WITH CHECK ADD  CONSTRAINT [FK_patient_room_room] FOREIGN KEY([id_room])
REFERENCES [dbo].[room] ([room_id])
GO
ALTER TABLE [dbo].[patient_room] CHECK CONSTRAINT [FK_patient_room_room]
GO
ALTER TABLE [dbo].[prescription]  WITH CHECK ADD  CONSTRAINT [FK_prescription_doctor] FOREIGN KEY([id_doctor])
REFERENCES [dbo].[doctor] ([id_doctor])
GO
ALTER TABLE [dbo].[prescription] CHECK CONSTRAINT [FK_prescription_doctor]
GO
ALTER TABLE [dbo].[prescription]  WITH CHECK ADD  CONSTRAINT [FK_prescription_medicine] FOREIGN KEY([id_medicine])
REFERENCES [dbo].[medicine] ([id_medicine])
GO
ALTER TABLE [dbo].[prescription] CHECK CONSTRAINT [FK_prescription_medicine]
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FK__bao_cao__id_nguo__589C25F3] FOREIGN KEY([id_patient])
REFERENCES [dbo].[patient] ([patient_id])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FK__bao_cao__id_nguo__589C25F3]
GO
ALTER TABLE [dbo].[room]  WITH CHECK ADD  CONSTRAINT [FK__phong__id_khu_ca__56B3DD81] FOREIGN KEY([area_id])
REFERENCES [dbo].[area] ([area_id])
GO
ALTER TABLE [dbo].[room] CHECK CONSTRAINT [FK__phong__id_khu_ca__56B3DD81]
GO
ALTER TABLE [dbo].[test_result]  WITH CHECK ADD  CONSTRAINT [FK__kq_xet_ng__id_ng__54CB950F] FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient] ([patient_id])
GO
ALTER TABLE [dbo].[test_result] CHECK CONSTRAINT [FK__kq_xet_ng__id_ng__54CB950F]
GO
USE [master]
GO
ALTER DATABASE [swp] SET  READ_WRITE 
GO
