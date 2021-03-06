USE [master]
GO
/****** Object:  Database [QuanLyKho]    Script Date: 10/13/2017 6:52:12 PM ******/
CREATE DATABASE [QuanLyKho]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyKho', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QuanLyKho.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyKho_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QuanLyKho_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyKho] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyKho].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyKho] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyKho] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyKho] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyKho] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyKho] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyKho] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyKho] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyKho] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyKho] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyKho] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyKho] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyKho] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyKho] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyKho] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyKho] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyKho] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyKho] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyKho] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyKho] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyKho] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyKho] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyKho] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyKho] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyKho] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyKho] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyKho] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyKho] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyKho] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyKho', N'ON'
GO
USE [QuanLyKho]
GO
/****** Object:  UserDefinedFunction [dbo].[GetProByIDWH]    Script Date: 10/13/2017 6:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[GetProByIDWH] (@IDWH int )
returns @Table_Pro table (
							ID int,
							Product nvarchar(50),
							IDCompany int,
							Price float,
							OrdinaryPrice float
						 )
as 
begin
		insert into  @Table_Pro
			select p.ID, p.Product, p.IDCompany, p.Price, p.OrdinaryPrice  
			from Product p, ProductDetail pd 
			where p.ID = pd.IDProduct and pd.IDWareHouse =@IDWH  
		return
end 
GO
/****** Object:  Table [dbo].[Client]    Script Date: 10/13/2017 6:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Client] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
	[Money] [float] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 10/13/2017 6:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Company] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
	[Money] [float] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExportBill]    Script Date: 10/13/2017 6:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExportBill](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDWareHouse] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[IDClient] [int] NULL,
	[Date] [date] NULL,
	[Bill] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [float] NULL,
 CONSTRAINT [PK_PHIEUKHO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ImportBill]    Script Date: 10/13/2017 6:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportBill](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDWareHouse] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[Bill] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [float] NULL,
 CONSTRAINT [PK_ImportBill] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/13/2017 6:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Product] [nvarchar](50) NULL,
	[IDCompany] [int] NULL,
	[Price] [float] NULL,
	[OrdinaryPrice] [float] NULL,
 CONSTRAINT [PK_SANPHAM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 10/13/2017 6:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDProduct] [int] NULL,
	[Quantity] [int] NULL,
	[IDExBill] [int] NULL,
	[IDImBill] [int] NULL,
 CONSTRAINT [PK_ProductDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WareHouse]    Script Date: 10/13/2017 6:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WareHouse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Warehouse] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[Capacity] [int] NULL,
 CONSTRAINT [PK_KHO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [Client], [Location], [Money]) VALUES (1, N'Nguyễn Thế Hùng', N'Hà Nội', NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([ID], [Company], [Location], [Money]) VALUES (1, N'Adidas', N'Hà Nội', 0)
INSERT [dbo].[Company] ([ID], [Company], [Location], [Money]) VALUES (2, N'Toyota', N'Hồ Chí Minh', 0)
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[ExportBill] ON 

INSERT [dbo].[ExportBill] ([ID], [IDWareHouse], [Status], [IDClient], [Date], [Bill], [Quantity], [TotalPrice]) VALUES (2, 1, NULL, NULL, CAST(N'2017-10-30' AS Date), N'Phiếu xuất 1.1', 2, 1600000)
INSERT [dbo].[ExportBill] ([ID], [IDWareHouse], [Status], [IDClient], [Date], [Bill], [Quantity], [TotalPrice]) VALUES (3, 7, NULL, NULL, CAST(N'2017-10-30' AS Date), N'Kho 2.1', 1, 300000)
INSERT [dbo].[ExportBill] ([ID], [IDWareHouse], [Status], [IDClient], [Date], [Bill], [Quantity], [TotalPrice]) VALUES (4, 8, NULL, NULL, CAST(N'2017-10-30' AS Date), N'Phiếu xuất 3.1', 1, 400000000)
SET IDENTITY_INSERT [dbo].[ExportBill] OFF
SET IDENTITY_INSERT [dbo].[ImportBill] ON 

INSERT [dbo].[ImportBill] ([ID], [IDWareHouse], [Status], [Date], [Bill], [Quantity], [TotalPrice]) VALUES (1, 1, N'1', CAST(N'2017-12-01' AS Date), N'Phiếu 2', 12, 9600000)
INSERT [dbo].[ImportBill] ([ID], [IDWareHouse], [Status], [Date], [Bill], [Quantity], [TotalPrice]) VALUES (2, 1, NULL, CAST(N'2017-12-02' AS Date), N'Phiếu 1', 2, 2500000)
INSERT [dbo].[ImportBill] ([ID], [IDWareHouse], [Status], [Date], [Bill], [Quantity], [TotalPrice]) VALUES (1004, 7, NULL, CAST(N'2017-12-14' AS Date), N'P2.1', 7, 4500000)
INSERT [dbo].[ImportBill] ([ID], [IDWareHouse], [Status], [Date], [Bill], [Quantity], [TotalPrice]) VALUES (1006, 8, NULL, CAST(N'2017-10-30' AS Date), N'Phiếu 4.1', 3, 1200000000)
SET IDENTITY_INSERT [dbo].[ImportBill] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Product], [IDCompany], [Price], [OrdinaryPrice]) VALUES (1, N'Giày Adidas', 1, 1300000, 800000)
INSERT [dbo].[Product] ([ID], [Product], [IDCompany], [Price], [OrdinaryPrice]) VALUES (2, N'Áo owen', 1, 500000, 300000)
INSERT [dbo].[Product] ([ID], [Product], [IDCompany], [Price], [OrdinaryPrice]) VALUES (3, N'Vios', 2, 800000000, 400000000)
INSERT [dbo].[Product] ([ID], [Product], [IDCompany], [Price], [OrdinaryPrice]) VALUES (4, N'Áo khoác Adidas', 1, 1400000, 900000)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductDetail] ON 

INSERT [dbo].[ProductDetail] ([ID], [IDProduct], [Quantity], [IDExBill], [IDImBill]) VALUES (4, 1, 10, NULL, 1)
INSERT [dbo].[ProductDetail] ([ID], [IDProduct], [Quantity], [IDExBill], [IDImBill]) VALUES (8, 1, 2, NULL, 2)
INSERT [dbo].[ProductDetail] ([ID], [IDProduct], [Quantity], [IDExBill], [IDImBill]) VALUES (1020, 2, 3, NULL, 1004)
INSERT [dbo].[ProductDetail] ([ID], [IDProduct], [Quantity], [IDExBill], [IDImBill]) VALUES (1021, 4, 4, NULL, 1004)
INSERT [dbo].[ProductDetail] ([ID], [IDProduct], [Quantity], [IDExBill], [IDImBill]) VALUES (1023, 3, 3, NULL, 1006)
INSERT [dbo].[ProductDetail] ([ID], [IDProduct], [Quantity], [IDExBill], [IDImBill]) VALUES (1024, 1, 2, 2, NULL)
INSERT [dbo].[ProductDetail] ([ID], [IDProduct], [Quantity], [IDExBill], [IDImBill]) VALUES (1025, 2, 1, 3, NULL)
INSERT [dbo].[ProductDetail] ([ID], [IDProduct], [Quantity], [IDExBill], [IDImBill]) VALUES (1026, 3, 1, 4, NULL)
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
SET IDENTITY_INSERT [dbo].[WareHouse] ON 

INSERT [dbo].[WareHouse] ([ID], [Warehouse], [Location], [Quantity], [Capacity]) VALUES (1, N'Kho 1', N'Hà Nội ', 2, 4600)
INSERT [dbo].[WareHouse] ([ID], [Warehouse], [Location], [Quantity], [Capacity]) VALUES (7, N'Kho 2', N'Hà Nội ', 1, 4500)
INSERT [dbo].[WareHouse] ([ID], [Warehouse], [Location], [Quantity], [Capacity]) VALUES (8, N'Kho 4', N'Định Công', 3, 1600)
SET IDENTITY_INSERT [dbo].[WareHouse] OFF
ALTER TABLE [dbo].[ExportBill]  WITH CHECK ADD  CONSTRAINT [FK_ExportBill_Client] FOREIGN KEY([IDClient])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ExportBill] CHECK CONSTRAINT [FK_ExportBill_Client]
GO
ALTER TABLE [dbo].[ExportBill]  WITH CHECK ADD  CONSTRAINT [FK_ExportBill_WareHouse] FOREIGN KEY([IDWareHouse])
REFERENCES [dbo].[WareHouse] ([ID])
GO
ALTER TABLE [dbo].[ExportBill] CHECK CONSTRAINT [FK_ExportBill_WareHouse]
GO
ALTER TABLE [dbo].[ImportBill]  WITH CHECK ADD  CONSTRAINT [FK_ImportBill_WareHouse] FOREIGN KEY([IDWareHouse])
REFERENCES [dbo].[WareHouse] ([ID])
GO
ALTER TABLE [dbo].[ImportBill] CHECK CONSTRAINT [FK_ImportBill_WareHouse]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Company] FOREIGN KEY([IDCompany])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Company]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail_ExportBill] FOREIGN KEY([IDExBill])
REFERENCES [dbo].[ExportBill] ([ID])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_ProductDetail_ExportBill]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail_ImportBill] FOREIGN KEY([IDImBill])
REFERENCES [dbo].[ImportBill] ([ID])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_ProductDetail_ImportBill]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail_Product] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_ProductDetail_Product]
GO
USE [master]
GO
ALTER DATABASE [QuanLyKho] SET  READ_WRITE 
GO
