USE [master]
GO
/****** Object:  Database [BTCK1]    Script Date: 17/11/2023 5:03:25 CH ******/
CREATE DATABASE [BTCK1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BTCK1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER02\MSSQL\DATA\BTCK1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BTCK1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER02\MSSQL\DATA\BTCK1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BTCK1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BTCK1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BTCK1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BTCK1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BTCK1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BTCK1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BTCK1] SET ARITHABORT OFF 
GO
ALTER DATABASE [BTCK1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BTCK1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BTCK1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BTCK1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BTCK1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BTCK1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BTCK1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BTCK1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BTCK1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BTCK1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BTCK1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BTCK1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BTCK1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BTCK1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BTCK1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BTCK1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BTCK1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BTCK1] SET RECOVERY FULL 
GO
ALTER DATABASE [BTCK1] SET  MULTI_USER 
GO
ALTER DATABASE [BTCK1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BTCK1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BTCK1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BTCK1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BTCK1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BTCK1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BTCK1', N'ON'
GO
ALTER DATABASE [BTCK1] SET QUERY_STORE = OFF
GO
USE [BTCK1]
GO
/****** Object:  Table [dbo].[Adv]    Script Date: 17/11/2023 5:03:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adv](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Photo] [nvarchar](500) NULL,
	[Position] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 17/11/2023 5:03:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[Name] [nvarchar](500) NULL,
	[DisplayHomePage] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriesProducts]    Script Date: 17/11/2023 5:03:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriesProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_CategoriesProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 17/11/2023 5:03:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 17/11/2023 5:03:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Description] [ntext] NULL,
	[Content] [ntext] NULL,
	[Hot] [int] NULL,
	[Photo] [nvarchar](500) NULL,
 CONSTRAINT [PK_News_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 17/11/2023 5:03:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[Create] [date] NULL,
	[Price] [float] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetail]    Script Date: 17/11/2023 5:03:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_orders_detail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 17/11/2023 5:03:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](4000) NULL,
	[Description] [nvarchar](4000) NULL,
	[Content] [ntext] NULL,
	[Photo] [nvarchar](4000) NULL,
	[Hot] [int] NULL,
	[Price] [float] NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_news] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 17/11/2023 5:03:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Star] [int] NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slides]    Script Date: 17/11/2023 5:03:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slides](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Photo] [nvarchar](500) NULL,
	[Title] [nvarchar](500) NULL,
	[SubTitle] [nvarchar](500) NULL,
	[Info] [nvarchar](500) NULL,
	[Link] [nvarchar](500) NULL,
 CONSTRAINT [PK_Slides] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 17/11/2023 5:03:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagsProducts]    Script Date: 17/11/2023 5:03:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TagId] [int] NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_TagsProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/11/2023 5:03:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Email] [nvarchar](500) NULL,
	[Password] [nvarchar](500) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adv] ON 

INSERT [dbo].[Adv] ([Id], [Name], [Photo], [Position]) VALUES (2, N'Quảng cáo - trang sản phẩm (dưới Popular products)', N'133347666529861774_3-slide-banner-2.jpg', 5)
INSERT [dbo].[Adv] ([Id], [Name], [Photo], [Position]) VALUES (3, N'Quảng cáo - trang sản phẩm (dưới TAGS)', N'133347666436813850_3-slide-banner-1.jpg', 4)
INSERT [dbo].[Adv] ([Id], [Name], [Photo], [Position]) VALUES (4, N'Trang sản phẩm - banner', N'133347666187463886_digital-electronic-banner.jpg', 3)
INSERT [dbo].[Adv] ([Id], [Name], [Photo], [Position]) VALUES (6, N'Trang chủ - Ảnh Quảng cáo dưới slide show', N'133347665832198160_blog-article-4.jpg', 2)
INSERT [dbo].[Adv] ([Id], [Name], [Photo], [Position]) VALUES (7, N'Trang chủ - Quảng cáo dưới slide show', N'133347665775300265_blog-article-5.jpg', 1)
SET IDENTITY_INSERT [dbo].[Adv] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (4, 0, N'Áo nam', 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (5, 0, N'Quần nam', 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (10, 5, N'Quần thun', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (11, 5, N'Quần Short', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (12, 5, N'Quần jeans', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (13, 4, N'Thể thao', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (14, 4, N'Áo tank', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (15, 4, N'Áo sơ mi', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (20, 0, N'Mũ', 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (21, 4, N'Áo thun', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (24, 20, N'Mũ Bucket', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (25, 20, N'Lưỡi chai', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (26, 0, N'Nước Hoa', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (27, 26, N'Nước hoa nữ', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (28, 26, N'Nước hoa nam', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (29, 0, N'Quần Jeans', 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (30, 29, N'Dáng OG Slim', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (31, 29, N'Dáng Straight', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (32, 29, N'Dáng Slimft', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (34, 5, N'Quần dài', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (35, 5, N'Quần thể thao', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (40, 0, N'Quần Short', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (41, 40, N'Quần Short đi biển', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (42, 40, N'Quần Short thể thao', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (43, 0, N'Áo thun', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (44, 43, N'Áo thun in', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (45, 43, N'Áo thun trơn', 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoriesProducts] ON 

INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (267, 19, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (268, 9, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (269, 4, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (270, 15, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (271, 14, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (272, 13, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (273, 3, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (274, 18, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (275, 17, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (276, 16, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (277, 20, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (278, 19, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (279, 9, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (280, 5, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (281, 12, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (282, 11, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (283, 10, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (284, 4, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (285, 15, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (286, 14, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (287, 13, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (295, 20, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (296, 19, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (297, 9, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (298, 5, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (299, 12, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (300, 11, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (301, 10, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (302, 20, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (303, 19, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (304, 4, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (305, 15, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (306, 14, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (307, 13, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (308, 3, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (309, 18, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (310, 17, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (311, 16, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (312, 19, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (313, 9, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (314, 5, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (315, 12, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (316, 11, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (317, 10, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (318, 19, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (319, 9, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (320, 5, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (321, 11, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (322, 10, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (323, 4, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (324, 14, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (325, 13, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1235, 20, 14)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1236, 25, 14)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1237, 19, 14)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1241, 31, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1242, 5, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1243, 12, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1244, 10, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1253, 29, 18)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1254, 32, 18)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1255, 30, 18)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1256, 5, 18)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1257, 12, 18)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1258, 29, 19)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1259, 32, 19)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1260, 5, 19)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1261, 12, 19)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1268, 36, 21)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1269, 38, 21)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1270, 37, 21)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1271, 5, 21)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1272, 11, 21)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1273, 36, 22)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1274, 38, 22)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1275, 37, 22)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1276, 5, 22)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1277, 11, 22)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1284, 5, 20)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1285, 35, 20)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1286, 11, 20)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1317, 40, 23)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1318, 42, 23)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1319, 5, 23)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1320, 35, 23)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1321, 11, 23)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1322, 29, 24)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1323, 31, 24)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1324, 5, 24)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1325, 12, 24)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1326, 29, 25)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1327, 31, 25)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1328, 30, 25)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1329, 5, 25)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1330, 12, 25)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1331, 29, 26)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1332, 32, 26)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1333, 5, 26)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1334, 12, 26)
GO
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1335, 29, 27)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1336, 32, 27)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1337, 5, 27)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1338, 12, 27)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1366, 43, 30)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1382, 4, 34)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1383, 15, 34)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1399, 20, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1400, 25, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1401, 20, 16)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1402, 25, 16)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1407, 20, 17)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1408, 25, 17)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2232, 20, 35)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2233, 25, 35)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2234, 43, 33)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2235, 45, 33)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2236, 4, 33)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2237, 21, 33)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2238, 13, 33)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2239, 43, 32)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2240, 45, 32)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2241, 4, 32)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2242, 21, 32)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2243, 13, 32)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2244, 43, 31)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2245, 45, 31)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2246, 4, 31)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2247, 21, 31)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2248, 13, 31)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2249, 43, 29)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2250, 45, 29)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2251, 4, 29)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2252, 21, 29)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2253, 13, 29)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2254, 43, 28)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2255, 45, 28)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2256, 4, 28)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2257, 21, 28)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2258, 20, 8)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (2259, 24, 8)
SET IDENTITY_INSERT [dbo].[CategoriesProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Name], [Email], [Address], [Phone], [Password]) VALUES (6, N'Nguyễn VănA', N'nva@gmail.com', N'Hà Nội', N'123456789', N'$2b$10$CbCd.UWBy0eV1NDtTphozuu2fRqnwj8UiRlIGFRo2mN6hJP0ycbGG')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Address], [Phone], [Password]) VALUES (7, N'Nguyễn Văn B', N'nvb@gmail.com', N'Hà Nội', N'123456789', N'$2b$10$JBH9AVugb.qcr64YqaNSieOBby80U6ZvFzAkq8SSUh4wAYeRp69iO')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Address], [Phone], [Password]) VALUES (8, N'Duong The C', N'Thedoan123@gmail.com', N'1dsdsd', N'333333', N'$2a$11$N4doNBTBxMGOgRUiA2tXHugzho86fJov4dk5c5EiGDOr89QoBLKtO')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Address], [Phone], [Password]) VALUES (9, N'1', N'Thedoan1231@gmail.com', N'1', N'1', N'$2a$11$h4WThL0Js0cX/PRMcpZai.chqkT4MnMrpTdUM7T9FY1LNLSLxRHNu')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Name], [Description], [Content], [Hot], [Photo]) VALUES (2, N'Rút một vị trí, Chính phủ còn 4 Phó Thủ tướng được giới thiệu tái cử', N'<p>Chiều 17/7/2021, Tổng Thư ký Quốc hội Bùi Văn Cường chủ trì cuộc họp báo về dự kiến chương trình kỳ họp thứ nhất, Quốc hội khóa XV.</p><p>Tại họp báo, giới thiệu nội dung dự kiến chương trình kỳ họp thứ nhất Quốc hội khóa XV, Phó Chủ nhiệm Văn phòng Quốc hội Vũ Minh Tuấn nêu, về thời gian, Quốc hội họp phiên trù bị vào chiều 19/7, khai mạc sáng 20/7 và sẽ kết thúc vào ngày 31/7. Quốc hội có 11,5 ngày làm việc, trong đó, thời gian cho công tác nhân sự chiếm 3 ngày, thời gian dành cho việc xem xét, quyết định các vấn đề quan trọng khác là 8,5 ngày.</p>', N'<p>Chiều 17/7/2021, Tổng Thư ký Quốc hội Bùi Văn Cường chủ trì cuộc họp báo về dự kiến chương trình kỳ họp thứ nhất, Quốc hội khóa XV.</p><p>Tại họp báo, giới thiệu nội dung dự kiến chương trình kỳ họp thứ nhất Quốc hội khóa XV, Phó Chủ nhiệm Văn phòng Quốc hội Vũ Minh Tuấn nêu, về thời gian, Quốc hội họp phiên trù bị vào chiều 19/7, khai mạc sáng 20/7 và sẽ kết thúc vào ngày 31/7. Quốc hội có 11,5 ngày làm việc, trong đó, thời gian cho công tác nhân sự chiếm 3 ngày, thời gian dành cho việc xem xét, quyết định các vấn đề quan trọng khác là 8,5 ngày.</p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/17/bui-van-cuong-2-1626510268448.jpg" alt="Rút một vị trí, Chính phủ còn 4 Phó Thủ tướng được giới thiệu tái cử - 1"></p><p>Nhấn để phóng to ảnh</p><p>Tổng thư ký Quốc hội Bùi Văn Cường chủ trì họp báo trước kỳ họp thứ nhất, Quốc hội khóa XV.</p><p><strong>Vì sao kỳ họp này không thể thực hiện trực tuyến?</strong></p><p>Trong bối cảnh dịch bệnh&nbsp;<a href="https://dantri.com.vn/suc-khoe/dai-dich-covid-19.htm">Covid-19</a>&nbsp;diễn biến phức tạp trên cả nước, Quốc hội đã chuẩn bị các biện pháp phòng ngừa, đảm bảo an toàn cho kỳ họp.</p><p>Tổng Thư ký Quốc hội Bùi Văn Cường nhấn mạnh bối cảnh kỳ họp thứ nhất diễn ra khi dịch bệnh Covid-19 trong đợt bùng phát thứ 4 đang diễn ra phức tạp trên nhiều địa bàn khắp cả nước, đặc biệt tại TPCHM và một số tỉnh phía Nam, số ca mắc tăng rất cao hàng ngày. Ông Cường khái quát, dù nhiều địa phương trong cả nước phải đang tập trung chống dịch nhưng theo quy định của Hiến pháp, chậm nhất 60 ngày sau bầu cử, Quốc hội phải tiến hành họp kỳ họp thứ nhất nên UB Thường vụ Quốc hội vẫn quyết định triệu tập kỳ họp từ 20/7.</p><p>Kỳ họp đầu tiên, Quốc hội phải tập trung làm công tác nhân sự, ông Cường lý giải, nội dung này không thể họp trực tuyến vì có hoạt động bỏ phiếu kín. Vậy nên cơ quan tổ chức cũng đã cố gắng để tổ chức kỳ họp nhanh, gọn, hiệu quả. Cụ thể, UB Thường vụ Quốc hội đã thống nhất sắp xếp lịch để có thể giảm bớt 5 ngày làm việc (theo dự kiến ban đầu, kỳ họp thứ nhất kéo dài đến 5/8, nay đã được thu gọn lại, kết thúc vào 31/7).</p><p>"Cuộc bầu cử có tới gần 70 triệu cử tri đi bỏ phiếu cuối tháng 5 vừa qua cả nước còn tổ chức được thành công thì không có lý gì kỳ họp Quốc hội với chỉ 499 đại biểu không thể tổ chức thành công" - Tổng Thư ký Quốc hội nói.</p><p>Tại kỳ họp, theo ông Vũ Minh Tuấn, Quốc hội nghe báo cáo tổng kết cuộc bầu cử vừa qua, nghe báo cáo xác nhận tư cách đại biểu Quốc hội khóa XV.</p><p>Công tác nhân sự, quyết định số Phó Chủ tịch Quốc hội, Ủy viên UB Thường vụ Quốc hội, bầu Chủ tịch Quốc hội, các Phó Chủ tịch Quốc hội, Chủ tịch Hội đồng dân tộc, Chủ nhiệm các UB của Quốc hội, Tổng Kiểm toán nhà nước.</p><p>Quốc hội cũng bầu Chủ tịch nước, Thủ tướng Chính phủ, Phó Chủ tịch nước, Chánh án TAND tối cao, Viện trưởng VKSND tối cao.</p><p>Theo quy định, ngay sau khi được bầu, các chức danh Chủ tịch Quốc hội, Chủ tịch nước, Thủ tướng, Chánh án TAND tối cao sẽ tuyên thệ nhậm chức trước Quốc hội.</p><p>Ngoài ra, Quốc hội còn tiến hành phê chuẩn bổ nhiệm các thành viên Chính phủ theo đề nghị của Thủ tướng Chính phủ (sau khi được bầu).</p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/17/bui-van-cuong-1-1626510269534.jpg" alt="Rút một vị trí, Chính phủ còn 4 Phó Thủ tướng được giới thiệu tái cử - 2"></p><p>Nhấn để phóng to ảnh</p><p>Tổng Thư ký Bùi Văn Cường thông tin, trong cơ cấu Chính phủ kỳ này sẽ rút bớt vị trí một Phó Thủ tướng.</p><p>Vấn đề đặt ra trong nội dung công tác nhân sự, theo cơ cấu hiện tại, số lượng các cơ cấu lãnh đạo nhà nước gồm 51 vị trí. Tuy nhiên, tại Hội nghị Trung ương 3 vừa qua, Ban Chấp hành Trung ương thống nhất chỉ giới thiệu 50 vị trí.</p><p>Trao đổi về việc này, Tổng Thư ký Quốc hội Bùi Văn Cường khẳng định, kỳ họp này, Quốc hội tiến hành kiện toàn tất cả các chức danh lãnh đạo các cơ quan nhà nước theo quy định của pháp luật, cụ thể là 50 vị trí.</p><p>Khối Quốc hội, Quốc hội kiện toàn toàn bộ các chức danh lãnh đạo Quốc hội, lãnh đạo các cơ quan của Quốc hội, của UB Thường vụ Quốc hội.</p><p>Khối cơ quan Chính phủ, Tổng Thư ký Bùi Văn Cường cho biết: "Trước đây, theo thông lệ, Chính phủ có 5 Phó Thủ tướng nhưng kỳ họp này, Quốc hội sẽ chỉ kiện toàn 4 vị trí, đều là các Phó Thủ tướng tái cử. Theo đó, một vị trí chức danh lãnh đạo nhà nước được rút đợt này chính là một Phó Thủ tướng Chính phủ".</p><p><strong>Bộ máy Chính phủ sẽ kiện toàn 27 chức danh</strong></p><p>Trình bày thêm về việc thực hiện quy trình công tác nhân sự tại kỳ họp, Trưởng Ban Công tác đại biểu của UB Thường vụ Quốc hội Nguyễn Thị Thanh nhận định, theo quy định của luật Tổ chức Quốc hội, Tổ chức Chính phủ, công tác nhân sự là một trong những nhiệm vụ trọng tâm Quốc hội phải thực hiện trong kỳ họp đầu nhiệm kỳ, để bắt đầu cho hoạt động của cả khóa.</p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/17/2106560993518048030173631056501586342098038n-1626512343776.jpg" alt="Rút một vị trí, Chính phủ còn 4 Phó Thủ tướng được giới thiệu tái cử - 3"></p><p>Nhấn để phóng to ảnh</p><p>Bà Nguyễn Thị Thanh giải thích về các chức danh được kiện toàn trong kỳ họp lần này.</p><p>Về các chức danh được kiện toàn trong kỳ họp lần này, bà Thanh giải thích, sau Đại hội XIII của Đảng, để đảm bảo tính đồng bộ, tổng thể, liên thông về công tác cán bộ, tại kỳ họp 11 khóa XIV, Quốc hội đã kiện toàn một bước công tác nhân sự. Do cách thức tổ chức, các cơ quan nhà nước hoạt động theo nhiệm kỳ nên đến kỳ họp thứ nhất đầu nhiệm kỳ mới, Quốc hội khóa XV, việc kiện toàn các chức danh lãnh đạo cơ quan nhà nước cần thực hiện theo đúng quy trình, quy định của Hiến pháp, pháp luật.</p><p>"Các nhân sự được kiện toàn lần này không thay đổi so với kỳ họp 11 của Quốc hội khóa XIV thì đây vẫn là việc phải làm theo quy định. Việc thực hiện quy trình bầu, phê chuẩn, thực hiện tuyên thệ với các chức danh lãnh đạo chủ chốt tại Quốc hội kỳ này sẽ càng thể hiện trách nhiệm của các chức danh trước Quốc hội và cử tri, nhân dân cả nước" - bà Thanh phát biểu.</p><p>Cũng theo Trưởng Ban Công tác đại biểu, các chức danh được kiện toàn kỳ này đã được báo cáo Bộ Chính trị, ban chấp hành Trung ương, liên quan đến cơ cấu tổ chức của các khối cơ quan. Với khối Chính phủ, bà Thanh cho biết, Bộ máy Chính phủ kỳ này sẽ kiện toàn 27 chức danh, gồm Thủ tướng, 4 Phó Thủ tướng, 18 Bộ trưởng và 4 Thủ trưởng cơ quan ngang bộ.</p><p>"Đề án cơ cấu tổ chức Chính phủ đã được xem xét cụ thể cẩn thận trên cơ sở cân nhắc tổng thể về công tác cán bộ. Theo đó, Bộ Chính trị, Ban Chấp hành Trung ương đã cho ý kiến về cơ cấu Chính phủ, trước mắt có 4 Phó Thủ tướng" - Trưởng Ban Công tác đại biểu thông tin.</p><p>Bà Nguyễn Thị Thanh cũng nói thêm, trước đây, Chính phủ có một Phó Thủ tướng kiêm Bộ trưởng Ngoại giao. Đến nay, vị trí này được tách ra, Phó Thủ tướng Phạm Bình Minh không còn kiêm nhiệm chức danh Bộ trưởng Ngoại giao, ông Bùi Thanh Sơn đã được phê chuẩn bổ nhiệm làm Bộ trưởng Ngoại giao tại kỳ họp cuối cùng của Quốc hội khóa trước. Theo đó, cơ cấu Chính phủ kỳ này sẽ được kiện toàn theo hướng này.</p>', 1, N'133347664196041622_blog-article-4.jpg')
INSERT [dbo].[News] ([Id], [Name], [Description], [Content], [Hot], [Photo]) VALUES (3, N'Phó Thủ tướng: Cán bộ chống dịch thiếu trách nhiệm, sẵn sàng có người thay', N'<p>Ngày 17/7, Phó Thủ tướng Vũ Đức Đam, Trưởng Ban Chỉ đạo quốc gia phòng, chống dịch&nbsp;<a href="https://dantri.com.vn/suc-khoe/dai-dich-covid-19.htm">Covid-19</a>&nbsp;dự giao ban trực tuyến ngắn với TPHCM để triển khai các biện pháp phòng, chống dịch.</p><p>Ngày 17/7, Phó Thủ tướng Vũ Đức Đam, Trưởng Ban Chỉ đạo quốc gia phòng, chống dịch&nbsp;<a href="https://dantri.com.vn/suc-khoe/dai-dich-covid-19.htm">Covid-19</a>&nbsp;dự giao ban trực tuyến ngắn với TPHCM để triển khai các biện pháp phòng, chống dịch.</p>', N'<p>Ngày 17/7, Phó Thủ tướng Vũ Đức Đam, Trưởng Ban Chỉ đạo quốc gia phòng, chống dịch&nbsp;<a href="https://dantri.com.vn/suc-khoe/dai-dich-covid-19.htm">Covid-19</a>&nbsp;dự giao ban trực tuyến ngắn với TPHCM để triển khai các biện pháp phòng, chống dịch.</p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/17/vu-duc-dam-1-1626519560689.jpg" alt="Phó Thủ tướng: Cán bộ chống dịch thiếu trách nhiệm, sẵn sàng có người thay - 1"></p><p>Nhấn để phóng to ảnh</p><p>Phó Thủ tướng Vũ Đức Đam cùng lãnh đạo TPHCM họp giao ban về tình hình chống dịch Covid-19 tại thành phố (ảnh: VGP).</p><p><strong>Trung tâm cấp cứu điều phối các "tầng" điều trị</strong></p><p>Cập nhật tình hình thành phố, Chủ tịch UBND TPHCM Nguyễn Thành Phong cho biết, trong vòng 24 giờ qua (tính đến 6h ngày 17/7), Thành phố ghi nhận hơn 2.800 ca mắc Covid-19, trong đó, phần lớn phát hiện trong các khu cách ly, phong tỏa (chiếm hơn 81% tổng số ca mắc), khoảng 420 ca qua sàng lọc ở bệnh viện.</p><p>Hiện thành phố đang tập trung điều trị cho các ca F0 nặng nhằm giảm số ca tử vong.</p><p>Bí thư Thành ủy TPHCM Nguyễn Văn Nên xác nhận, số ca F0, F1 ngày càng tăng cao, cả trong khu cách ly, phong tỏa, ngoài cộng đồng và phát sinh ca nhiễm trong một số khu công nghiệp, chế xuất có đông công nhân. Hệ thống y tế nhiều nơi bị quá tải.</p><p>Thành phố đã xây dựng bản đồ các khu cách ly tạm thời, bệnh viện dã chiến điều trị các F0 ở các mức độ khác nhau; đẩy mạnh ứng dụng công nghệ để thiết lập hệ thống quản lý, điều phối ca F0 trên địa bàn, giao Trung tâm cấp cứu quản lý, vận hành hệ thống này, nhằm kịp thời điều phối F0 đến các bệnh viện phù hợp nhanh nhất, giải quyết tình hình ca F0 trở nặng tăng lên hiện nay.</p><p>Bí thư Nên nhận định, những vấn đề về nhân lực, cơ sở vật chất, máy móc, sinh phẩm… đã và đang được khắc phục.</p><p>Chủ tịch UBND TPHCM Nguyễn Thành Phong cũng đề cập, hiện còn tình trạng lây nhiễm chéo trong các khu phong tỏa do vẫn các gia đình vẫn tiếp xúc với nhau. Do đó, Chủ tịch UBND TPHCM yêu cầu siết chặt các biện pháp, bảo đảm tuân thủ giãn cách trong các khu phong tỏa, phát huy vai trò của các Tổ Covid-19 cộng đồng để tăng cường kiểm tra, giám sát, xử lý nghiêm nếu có vi phạm, bảo đảm thực hiện nghiêm Chỉ thị 16.</p><p>Trước tình trạng người dân tụ tập đông người, dễ lây nhiễm trong cộng đồng, Bí thư Thành ủy Nguyễn Văn Nên quán triệt: "Qua kiểm tra, phát hiện, những nơi không thực hiện nghiêm, không chấp hành chỉ đạo cấp trên, phải xử lý nghiêm khắc, thậm chí đề nghị cách chức những lãnh đạo không thực hiện nghiêm các chỉ đạo. Từ đó, việc chấp hành phải nghiêm hơn, toàn diện hơn, đặc biệt đối với những nơi có nguy cơ lây nhiễm cao".</p><p><strong>Các bộ chống dịch thiếu trách nhiệm sẵn sàng có người thay</strong></p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/17/vu-duc-dam-2-1626519556095.jpg" alt="Phó Thủ tướng: Cán bộ chống dịch thiếu trách nhiệm, sẵn sàng có người thay - 2"></p><p>Nhấn để phóng to ảnh</p><p>Phó Thủ tướng: "Nếu giãn cách, phong tỏa mà ở dưới vẫn giao lưu với nhau thì cũng bằng thừa".</p><p>Đồng tình với quan điểm cương quyết của lãnh đạo TPHCM, Phó Thủ tướng Vũ Đức Đam nhấn mạnh Thành phố phải siết chặt quản lý, không để lây nhiễm chéo trong khu phong tỏa, cách ly.</p><p>Chia sẻ với thành phố có địa bàn rộng, dân số đông nên việc kiểm soát rất khó khăn nhưng Phó Thủ tướng đề nghị TPHCM phải thực hiện rất quyết liệt, huy động hệ thống chính trị vào cuộc, từ các cấp chính quyền, đến mọi tổ chức, đoàn thể. Phó Thủ tướng tán thành quan điểm, nơi nào để xảy ra lây nhiễm trong khu phong tỏa, khu cách ly phải xử lý toàn diện lãnh đạo nơi đó.</p><p>Theo Phó Thủ tướng, dịch bệnh kéo dài khiến lực lượng tham gia chống dịch căng thẳng, cần được động viên, nhưng không có nghĩa là không xử lý các trường hợp lơ là, không thực hiện nghiêm quy định.</p><p>"Tôi tin là ở các đơn vị, cán bộ nào thiếu trách nhiệm sẵn sàng có người khác thay. Nếu giãn cách, phong tỏa mà ở dưới vẫn giao lưu với nhau thì cũng bằng thừa, phải rất quyết liệt. Đây là lúc cả hệ thống chính trị phải rất trách nhiệm" - Phó Thủ tướng nói.</p><p>Về công tác điều trị, Phó Thủ tướng lưu ý thành phố tăng cường vận chuyển ca F0 đến cơ sở điều trị, đặc biệt những trường hợp có triệu chứng nặng lên. Lãnh đạo Chính phủ yêu cầu TPHCM chủ động trang bị, tuyệt đối không để các bệnh viện thiếu.</p><p>"Bây giờ, các bệnh viện vẫn rỉ tai nhau là thiếu. Đề nghị phải làm ngay, chấn chỉnh ngay cho toàn bộ anh em bên dưới yên tâm" - Phó Thủ tướng nói.</p><p>Phó Thủ tướng cho rằng việc cung ứng hàng hóa, hoạt động của các doanh nghiệp cũng phải "chấp nhận thương đau", đảm bảo tuyệt đối an toàn, nếu không thì nỗ lực phòng chống dịch sẽ đổ sông đổ biển. Theo ông, thành phố cần động viên người dân chịu khó vất vả, chia sẻ khó khăn tạm thời trước mắt để tuân thủ nghiêm các quy định giãn cách xã hội.</p>', 1, N'133347664108725619_blog-article-3.jpg')
INSERT [dbo].[News] ([Id], [Name], [Description], [Content], [Hot], [Photo]) VALUES (4, N'Vì sao Hà Nội xuất hiện nhiều chùm ca bệnh chưa rõ nguồn lây?', N'<p>Sáng 17/7, Hà Nội vừa ghi nhận thêm 13 trường hợp dương tính với&nbsp;<a href="https://dantri.com.vn/suc-khoe/dai-dich-covid-19.htm">SARS-CoV-2</a>&nbsp;, trong đó có 6 F1 của bệnh nhân T.T.H. thuộc chùm ca bệnh liên quan đến chung cư Sunshine.&nbsp;</p><p>Bên cạnh ổ dịch Công ty SEI - Khu công nghiệp Thăng Long (Đông Anh) và xã An Mỹ (huyện Mỹ Đức), Hà Nội đang phải đối mặt với các chùm ca bệnh phức tạp khác gồm: Nhóm nhân viên ngân hàng có địa chỉ tại 25 Lý Thường Kiệt (quận Hoàn Kiếm), nhân viên giao pizza tại cửa hàng số 30 Đoàn Trần Nghiệp (Hai Bà Trưng); 3 cán bộ Viện Cơ khí Năng lượng và Mỏ (Thanh Xuân).</p>', N'<p>Sáng 17/7, Hà Nội vừa ghi nhận thêm 13 trường hợp dương tính với&nbsp;<a href="https://dantri.com.vn/suc-khoe/dai-dich-covid-19.htm">SARS-CoV-2</a>&nbsp;, trong đó có 6 F1 của bệnh nhân T.T.H. thuộc chùm ca bệnh liên quan đến chung cư Sunshine.&nbsp;</p><p>Bên cạnh ổ dịch Công ty SEI - Khu công nghiệp Thăng Long (Đông Anh) và xã An Mỹ (huyện Mỹ Đức), Hà Nội đang phải đối mặt với các chùm ca bệnh phức tạp khác gồm: Nhóm nhân viên ngân hàng có địa chỉ tại 25 Lý Thường Kiệt (quận Hoàn Kiếm), nhân viên giao pizza tại cửa hàng số 30 Đoàn Trần Nghiệp (Hai Bà Trưng); 3 cán bộ Viện Cơ khí Năng lượng và Mỏ (Thanh Xuân).</p><p>Như vậy, sau khoảng thời gian ngắn dịch bệnh lắng xuống, Hà Nội đang phải đối mặt với đợt dịch mới phức tạp, khó lường hơn.</p><p><strong>Nguy cơ bùng dịch đến từ nhiều nguồn</strong></p><p>Chiều 17/7, trao đổi với phóng viên&nbsp;<i>Dân trí</i>, ông Khổng Minh Tuấn, Phó Giám đốc CDC Hà Nội đã có những lý giải về việc, Hà Nội liên tiếp xuất hiện các chùm ca bệnh mới, chưa rõ nguồn lây trong những ngày qua.</p><p>Theo ông Tuấn, hiện chùm ca bệnh không rõ nguồn lây phức tạp nhất ở Hà Nội hiện là nhóm nhân viên ngân hàng có địa chỉ tại 25 Lý Thường Kiệt (quận Hoàn Kiếm). Ca bệnh chỉ điểm là nữ nhân viên H., không có lịch trình liên quan đến các tỉnh, vùng dịch và 2 tháng nay không đi khỏi Hà Nội.</p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/17/2phongtoa25ngoquyenbocongthuongjpg1626427374889-1626512126634.jpg" alt="Vì sao Hà Nội xuất hiện nhiều chùm ca bệnh chưa rõ nguồn lây? - 2"></p><p>Nhấn để phóng to ảnh</p><p>Trụ sở Bộ Công Thương tại 25 Ngô Quyền phải phong tỏa do liên quan ca bệnh tại Viện Cơ khí Năng lượng và Mỏ.</p><p>Theo báo cáo dịch tễ, ngày 14/7, bà H. sốt 38,5 độ C, đau họng. Ngày 16/7, bà đến Bệnh viện Đại học Y Hà Nội khám và được chuyển vào khu sàng lọc người ho sốt.</p><p>Sau khi lấy mẫu và làm xét nghiệm Covid-19, bà nhận kết quả dương tính. Theo lãnh đạo quận Hoàn Kiếm, phòng làm việc người này có trên 20 người, đã xác định 21 F1 cùng cơ quan.</p><p>"Trong chiều nay 17/7, chúng tôi sẽ tiến hành xác định xem nguồn lây của chùm ca bệnh này xuất phát từ đâu, qua đó đưa ra phương hướng xử lý, phong tỏa và truy vết các F liên quan", ông Tuấn nói.</p><p>Chùm ca bệnh thứ hai chưa xác định nguồn lây là nhân viên giao pizza của cửa hàng số 30 Đoàn Trần Nghiệp (quận Hai Bà Trưng). Theo CDC Hà Nội, cửa hàng này gần với tòa nhà 189 Bà Triệu là nơi có 5 người mắc&nbsp;<a href="https://dantri.com.vn/suc-khoe/dai-dich-covid-19.htm">Covid-19</a>&nbsp;(đến từ TP.HCM) làm việc. Tuy nhiên, đơn vị này thừa nhận chưa có sự liên hệ rõ ràng nào của nhân viên giao pizza với nhóm ca bệnh từ TP.HCM.</p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/17/33333-1626502402357.jpg" alt="Vì sao Hà Nội xuất hiện nhiều chùm ca bệnh chưa rõ nguồn lây? - 3"></p><p>Nhấn để phóng to ảnh</p><p>Ngày 17/7, lực lượng chức năng đã phong tỏa khu F3, ngõ 171 Thái Hà với hơn 10 hộ dân, nơi bệnh nhân T.C.T., 31 tuổi, sinh sống.</p><p>Còn chùm ca bệnh liên quan đến Viện Cơ khí Năng lượng và Mỏ (Thanh Xuân), theo ông Tuấn đây là chùm ca bệnh có nguồn lây đến từ tỉnh Bắc Ninh.</p><p>Chùm ca bệnh Khu công nghiệp Thăng Long có nguồn lây từ Bắc Giang, và các ổ dịch rải rác tại Hai Bà Trưng, Bắc Từ Liêm, Quốc Oai... có nguồn lây đến từ TP.HCM.</p><p><strong>Chỉ cần lọt 1-2 trường hợp là có thể thành ổ dịch</strong></p><p>Ông Khổng Minh Tuấn, Phó giám đốc CDC Hà Nội nhận định, thành phố đang trong đợt dịch phức tạp, nguy cơ bùng dịch đến từ nhiều nguồn với nhiều cách thức đa dạng.</p><p>"Nguy cơ tại Hà Nội luôn ở mức rất cao, do là địa bàn trung tâm, đầu não của cả nước, nhiều trường hợp đi từ vùng dịch về nếu không kiểm soát hết, thì chỉ cần lọt 1-2 người là cũng có thể bùng phát thành ổ dịch mới", ông Tuấn chia sẻ.</p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/15/chc7330-1626335483956.jpg" alt="Vì sao Hà Nội xuất hiện nhiều chùm ca bệnh chưa rõ nguồn lây? - 4"></p><p>Nhấn để phóng to ảnh</p><p>Khu công nghiệp Thăng Long thường xuyên ghi nhận ca nhiễm mới trong 2 tuần qua.&nbsp;</p><p>Theo lãnh đạo CDC Hà Nội, hiện ổ dịch tại Công ty SEI - KCN Thăng Long đang được kiểm soát tốt, không có ca lây nhiễm ngoài cộng đồng, chủ yếu là các F1 đã được cách ly trước đó.</p><p>Nguyên nhân chủ yếu khiến ổ dịch này tiếp tục phát sinh ca nhiễm mới là số lượng công nhân làm việc cùng phân xưởng với ca F0 lớn, liên tục trong nhiều ngày, nên khả năng lây lan mạnh.</p><p>Theo thống kê, tổng số ca dương tính&nbsp;<a href="https://dantri.com.vn/suc-khoe/dai-dich-covid-19.htm">SARS-CoV-2</a>&nbsp;tại Hà Nội từ ngày 29/4 đến nay là 376 trường hợp. Riêng từ ngày 5/7 đến nay là 117 trường hợp thuộc 5 chùm ca bệnh. Chùm ca bệnh liên quan đến Bắc Giang có 54 trường hợp, chùm ca bệnh liên quan đến TPHCM (Hoa Vôi- Quốc Oai: 18; Nguyễn Du- Hai Bà Trưng: 7; Hòa Xá-Ứng Hòa: 5; các quận, huyện khác: 10); chùm ca bệnh tại An Mỹ - Mỹ Đức: 10 trường hợp; chùm ca bệnh liên quan đến chung cư Sunshine, Hoàng Mai: 9 trường hợp; Tân Mai - Hoàng Mai: một trường hợp; chùm ca bệnh liên quan đến Bắc Ninh: 3 trường hợp.</p>', 1, N'133347664032164143_blog-article-2.jpg')
INSERT [dbo].[News] ([Id], [Name], [Description], [Content], [Hot], [Photo]) VALUES (5, N'HLV Park Hang Seo có danh sách sơ bộ đội tuyển Việt Nam', N'<p>Sau khi rà soát, danh sách trên có thể được HLV&nbsp;<a href="https://dantri.com.vn/hlv-park-hang-seo.tag">Park Hang Seo</a>&nbsp;rút gọn xuống còn hơn 30 cầu thủ. Do thời gian qua V-League không diễn ra, đồng nghĩa với việc HLV Park Hang Seo không thể đánh giá phong độ của các cầu thủ cũng như tìm kiếm nhân tố mới.</p><p>Vì thế, nhiều khả năng chiến lược gia người Hàn Quốc vẫn triệu tập những gương mặt cũ đã cùng mình tham dự vòng loại thứ 2 World Cup 2022 ở UAE vừa qua.</p>', N'<p>Sau khi rà soát, danh sách trên có thể được HLV&nbsp;<a href="https://dantri.com.vn/hlv-park-hang-seo.tag">Park Hang Seo</a>&nbsp;rút gọn xuống còn hơn 30 cầu thủ. Do thời gian qua V-League không diễn ra, đồng nghĩa với việc HLV Park Hang Seo không thể đánh giá phong độ của các cầu thủ cũng như tìm kiếm nhân tố mới.</p><p>Vì thế, nhiều khả năng chiến lược gia người Hàn Quốc vẫn triệu tập những gương mặt cũ đã cùng mình tham dự vòng loại thứ 2 World Cup 2022 ở UAE vừa qua.</p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/17/danhsachdtvndocx-1626516704681.jpeg" alt="HLV Park Hang Seo có danh sách sơ bộ đội tuyển Việt Nam - 1"></p><p>Nhấn để phóng to ảnh</p><p>Đội tuyển Việt Nam nhiều khả năng không có sự thay đổi về nhân sự.</p><p>Như vậy, những cái tên như Duy Mạnh, Quế Ngọc Hải, Bùi Tiến Dũng, Văn Thanh, Văn Hậu, Trọng Hoàng, Tuấn Anh, Xuân Trường, Quang Hải, Văn Toàn, Công Phượng, Tiến Linh… chắc chắn có tên. Ngoài ra, một số gương mặt trẻ hoặc ít được sử dụng như Việt Anh, Hai Long, Cao Văn Triền, Thanh Bình… cũng được HLV người Hàn Quốc tiếp tục trao cho cơ hội lên tuyển.</p><p>Với trường hợp của thủ thành Đặng Văn Lâm, nhiều khả năng&nbsp;<a href="https://dantri.com.vn/hlv-park-hang-seo.tag">HLV Park Hang Seo</a>&nbsp;sẽ triệu tập trong đợt tập trung lần này. Trước đó, đến phút cuối ông Park đã phải loại Đặng Văn Lâm ở chiến dịch vòng loại 2 World Cup 2022 khu vực châu Á, do thủ thành Việt Kiều là F1 của ca F0 Covid-19 tại Nhật Bản.</p><p>Trong thời gian qua, Đặng Văn Lâm đã thể hiện sự cố gắng để thể hiện mình tại Cerezo Osaka. Thủ thành Việt Nam đã có 2 lần được bắt chính trong trận Cerezo Osaka thắng 2-0 Gainare Tottori ở vòng 2 Cúp Hoàng Đế và mới đây là lượt trận thứ 5 AFC Champions League 2021, khi đội bóng Nhật Bản thắng 5-0 trước Guangzhou FC.</p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/17/danhsachdtvndocx-1626516704791.jpeg" alt="HLV Park Hang Seo có danh sách sơ bộ đội tuyển Việt Nam - 2"></p><p>Nhấn để phóng to ảnh</p><p>Văn Lâm sẽ trở lại đội tuyển Việt Nam.</p><p>"Mục tiêu của tôi thời gian tới vẫn là tiếp tục tập luyện chăm chỉ mỗi ngày, cố gắng học hỏi nhiều hơn nữa ở môi trường có tính chuyên nghiệp cao, gồm những cầu thủ đẳng cấp và các bài tập chất lượng của HLV thủ môn.</p><p>Tôi sẽ nỗ lực hết sức mình nếu có cơ hội tập trung cùng đội tuyển Việt Nam, cố gắng cống hiến những gì tốt nhất trong khả năng của bản thân", Đặng Văn Lâm mong muốn được trở lại đội tuyển Việt Nam.</p><p>Trước các trận vòng loại thứ 2 World Cup 2022 diễn ra ở UAE, Văn Lâm luôn là số 1 trong khung gỗ đội tuyển Việt Nam. Nhưng ở thời điểm này, anh chắc chắn phải cạnh tranh khốc liệt với Tấn Trường nếu muốn giành suất bắt chính.</p><p>Về công tác chuẩn bị cho vòng loại thứ 3 World Cup 2022 khu vực châu Á vào tháng 9 tới, VFF đang lên kế hoạch tập trung sớm cho đội tuyển Việt Nam. Mới đây, VPF tạm dừng kế hoạch tổ chức giai đoạn 2 V-League 2021 do ảnh hưởng dịch Covid-19. BTC giải thậm chí đề xuất lùi giải tới tháng 2/2022. VFF và ông Park vì vậy cũng phải điều chỉnh kế hoạch tập trung của đội tuyển Việt Nam.</p><p>"Yêu cầu đặt ra là các cầu thủ cần được đảm bảo điều kiện tốt nhất để duy trì thể lực cũng như phong độ, cảm giác bóng, qua đó chuẩn bị tốt nhất cho Vòng loại World Cup. Để đạt mục tiêu, kế hoạch của đội tuyển Việt Nam càng cụ thể, chi tiết càng tốt bởi khoảng cách các trận sân nhà và sân khách rất ngắn.</p><p>Nếu không chuẩn bị kỹ, chúng ta sẽ khó đảm bảo sự khoa học và hiệu quả", Phó Chủ tịch VFF Trần Quốc Tuấn cho biết.</p><p>HLV Park Hang Seo vừa qua đã trở về Hàn Quốc để lo việc gia đình. Dự kiến cuối tháng 7 này, ông Park sẽ trở về Việt Nam, và sẽ bắt tay vào công tác chuẩn bị cho đội tuyển.</p>', 1, N'133347663938673035_blog-article-1.jpg')
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (6, 6, CAST(N'2023-08-08' AS Date), 30000000, 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (7, 6, CAST(N'2023-08-08' AS Date), 27000000, 2)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (8, 9, CAST(N'2023-11-08' AS Date), 60000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (9, 9, CAST(N'2023-11-08' AS Date), 31000000, 2)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (10, 9, CAST(N'2023-11-08' AS Date), 30000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (11, 9, CAST(N'2023-11-08' AS Date), 30000000, 2)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (12, 9, CAST(N'2023-11-08' AS Date), 30000000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (13, 9, CAST(N'2023-11-17' AS Date), 520000, 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdersDetail] ON 

INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (10, 6, 10, 1, 22500000)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (11, 7, 8, 1, 18900000)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (12, 8, 14, 2, 30000000)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (13, 9, 4, 1, 9300000)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (14, 10, 14, 1, 30000000)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (15, 11, 14, 1, 30000000)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (16, 12, 16, 1, 30000000)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (17, 13, 19, 1, 468000)
SET IDENTITY_INSERT [dbo].[OrdersDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (8, N'Bucket Hat Care & Share', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'133441004698828971_d4.webp', 1, 27000000, 30)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (10, N'Jeans Copper Densim', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'133440853223421512_Quan_Jeans_dai1.webp', 1, 359000, 11)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (12, N'Mũ Classic Cap', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'133441007095949886_Simple_cap_den_1.webp', 1, 1390000, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (14, N'Mũ lưỡi chai Tech Cap', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'133440849448574403_mu-classic1.webp', 1, 13900000, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (18, N'Quần Jean  Copper Denim OG Slim', N'', N'', N'133440857952705466_Quan_Jeans_dang4.jpg', 1, 520000, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (19, N'Jeans Copper Densim Slim Fit', N'', N'', N'133440859998664990_Quan_Jeans_dang3.webp', 0, 520000, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (20, N'Short New French', N'', N'', N'133440973237117820_Short_hai_lop_Power_-_Reu_1.webp', 1, 199000, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (21, N'test', N'', N'', N'133440864251328778_quanshort3.webp', 0, 199000, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (22, N'Daily Short Excool', N'', N'', N'133440864251328778_quanshort3.webp', 0, 199000, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (23, N'Daily Short Excool T', N'', N'', N'133440978342889585_Cotton_Short_6in_Reu_8.jpg', 1, 199000, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (24, N'Jeans Copper Denim Straight', N'', N'', N'133440981490001532_Quan_Jeans_dang2.webp', 1, 519000, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (25, N'Jeans dáng Slim Fit V2', N'', N'', N'133440981953909493_Quan_Jeans_dang2.webp', 0, 500000, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (26, N'Jeans Copper Denim OG Slim', N'', N'', N'133440982497389957_Quan_Jeans_dang3.webp', 0, 500000, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (27, N'Jeans Copper Denim Slim Fit', N'', N'', N'133440983227823530_Quan_Jeans_dang_Slim_Fit-thumb-2.jpg', 0, 500000, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (28, N'T-Shirt Cotton Team Whales', N'', N'', N'133440990048728746_Ao_tron_forest_1_copy.webp', 0, 200000, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (29, N'T-Shirt phối Jeans', N'', N'', N'133440989971847022_tshirtxcool-19-copy.webp', 0, 200000, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (31, N'T-Shirt Excool cổ tròn', N'', N'', N'133440996948225955_tshirtxcool-13-copy_65.jpg', 0, 200000, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (32, N'T-Shirt Cotton Compact', N'', N'', N'133440997668406973_T-Shirt_Cotton_Compact.2.jpg', 0, 200000, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (33, N'T-Shirt Cotton Compact', N'', N'', N'133440998008332864_IMG_6130_91.webp', 1, 200000, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (34, N'Sơ mi dài tay Café-DriS', N'', N'', N'133441000012287249_somicfxam4.webp', 0, 400000, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (35, N'Mũ lưỡi trai Simple Cool V2', N'', N'', N'133441009153974779_Simple_cap_navy_1.jpg', 0, 200000, 10)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([Id], [ProductId], [Star]) VALUES (13, 10, 5)
INSERT [dbo].[Rating] ([Id], [ProductId], [Star]) VALUES (14, 10, 5)
SET IDENTITY_INSERT [dbo].[Rating] OFF
GO
SET IDENTITY_INSERT [dbo].[Slides] ON 

INSERT [dbo].[Slides] ([Id], [Name], [Photo], [Title], [SubTitle], [Info], [Link]) VALUES (1, N'Slide 1', N'133347667163565643_main-slider-1-3.jpg', N'Kid Smart Watches', N'Compra todos tus productos Smart por internet.', N'Info slide 1', N'http://dantri.com.vn')
INSERT [dbo].[Slides] ([Id], [Name], [Photo], [Title], [SubTitle], [Info], [Link]) VALUES (2, N'Slide 2', N'133347667081514630_main-slider-1-2.jpg', N'Title slide 2', N'Sub Title slide 2', N'Info slide 2', N'http://dantri.com.vn')
INSERT [dbo].[Slides] ([Id], [Name], [Photo], [Title], [SubTitle], [Info], [Link]) VALUES (3, N'Slide 3', N'133347666970334267_main-slider-1-1.jpg', N'Title slide 3', N'Sub Title slide 3', N'Info slide 3', N'http://dantri.com.vn')
SET IDENTITY_INSERT [dbo].[Slides] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([Id], [Name]) VALUES (3, N'Nước hoa')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (4, N'Mặc hàng ngày')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (5, N'Đồ thể thao')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (6, N'Đồ lót')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (7, N'Phụ kiện nam')
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[TagsProducts] ON 

INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (4, 4, 19)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (5, 3, 19)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (6, 2, 19)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (153, 5, 6)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (154, 4, 6)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (155, 3, 6)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (156, 2, 6)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (157, 4, 9)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (158, 3, 9)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (159, 2, 9)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (163, 4, 7)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (164, 3, 7)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (165, 2, 7)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (166, 1, 7)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (167, 6, 5)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (168, 5, 5)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (169, 4, 5)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (170, 3, 5)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (171, 2, 5)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (172, 1, 5)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (173, 4, 4)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (174, 3, 4)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (175, 2, 4)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (176, 1, 4)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1132, 6, 14)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1133, 5, 14)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1134, 4, 14)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1135, 3, 14)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1136, 2, 14)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1137, 1, 14)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1140, 3, 10)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1145, 1, 18)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1146, 2, 22)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1151, 4, 20)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1152, 2, 20)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1168, 1, 12)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1169, 4, 16)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1170, 3, 16)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1175, 6, 17)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1176, 3, 17)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (2128, 7, 35)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (2129, 5, 33)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (2130, 4, 33)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (2131, 5, 32)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (2132, 4, 32)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (2133, 5, 31)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (2134, 4, 31)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (2135, 5, 29)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (2136, 4, 29)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (2137, 7, 28)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (2138, 5, 28)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (2139, 4, 28)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (2140, 7, 8)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (2141, 3, 8)
SET IDENTITY_INSERT [dbo].[TagsProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (1, N'Duong The A', N'Thedoan123@gmail.com', N'$2a$11$dasevf51HduKOzrVeH2s0.Y9MCX9yuyugk0liYu6LbpkiFg1/NBpO')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (2, N'Duong The C', N'Thedoan125@gmail.com', N'$2a$11$dasevf51HduKOzrVeH2s0.Y9MCX9yuyugk0liYu6LbpkiFg1/NBpO')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (3, N'Duong The D', N'Thedoan127@gmail.com', N'$2a$11$dasevf51HduKOzrVeH2s0.Y9MCX9yuyugk0liYu6LbpkiFg1/NBpO')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (4, N'Duong The KKL', N'Thedoan127@gmail.com', N'$2a$11$dasevf51HduKOzrVeH2s0.Y9MCX9yuyugk0liYu6LbpkiFg1/NBpO')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_DisplayHomePage]  DEFAULT ((0)) FOR [DisplayHomePage]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_news_hot]  DEFAULT ((0)) FOR [Hot]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Discount_1]  DEFAULT ((0)) FOR [Discount]
GO
USE [master]
GO
ALTER DATABASE [BTCK1] SET  READ_WRITE 
GO
