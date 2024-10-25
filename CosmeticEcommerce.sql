USE [master]
GO
/****** Object:  Database [CosmeticEcommerce]    Script Date: 10/11/2024 1:58:46 PM ******/
CREATE DATABASE [CosmeticEcommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CosmeticEcommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CosmeticEcommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CosmeticEcommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CosmeticEcommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CosmeticEcommerce] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CosmeticEcommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CosmeticEcommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CosmeticEcommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CosmeticEcommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CosmeticEcommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CosmeticEcommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [CosmeticEcommerce] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CosmeticEcommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CosmeticEcommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CosmeticEcommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CosmeticEcommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CosmeticEcommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CosmeticEcommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CosmeticEcommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CosmeticEcommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CosmeticEcommerce] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CosmeticEcommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CosmeticEcommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CosmeticEcommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CosmeticEcommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CosmeticEcommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CosmeticEcommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CosmeticEcommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CosmeticEcommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CosmeticEcommerce] SET  MULTI_USER 
GO
ALTER DATABASE [CosmeticEcommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CosmeticEcommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CosmeticEcommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CosmeticEcommerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CosmeticEcommerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CosmeticEcommerce] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CosmeticEcommerce] SET QUERY_STORE = OFF
GO
USE [CosmeticEcommerce]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 10/11/2024 1:58:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [varchar](50) NULL,
	[productID] [varchar](50) NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 10/11/2024 1:58:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [varchar](50) NOT NULL,
	[userID] [varchar](50) NULL,
	[orderDate] [date] NOT NULL,
	[totalAmount] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 10/11/2024 1:58:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [varchar](50) NOT NULL,
	[productName] [nvarchar](200) NOT NULL,
	[description] [nvarchar](1000) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[quantity] [int] NOT NULL,
	[category] [nvarchar](100) NOT NULL,
	[supplierID] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSuppliers]    Script Date: 10/11/2024 1:58:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSuppliers](
	[supplierID] [varchar](50) NOT NULL,
	[supplierName] [nvarchar](200) NOT NULL,
	[contactName] [nvarchar](200) NOT NULL,
	[phoneNumber] [varchar](15) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[supplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 10/11/2024 1:58:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](50) NOT NULL,
	[fullName] [nvarchar](500) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phoneNumber] [varchar](15) NOT NULL,
	[roleID] [nvarchar](5) NOT NULL,
	[password] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [price], [quantity], [category], [supplierID]) VALUES (N'P001', N'Lipstick', N'Red lipstick, lead-free', CAST(200000.00 AS Decimal(18, 2)), 100, N'Makeup', N'SUP001')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [price], [quantity], [category], [supplierID]) VALUES (N'P002', N'Moisturizing Cream', N'Night moisturizing cream, deep hydration', CAST(350000.00 AS Decimal(18, 2)), 50, N'Skincare', N'SUP002')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [price], [quantity], [category], [supplierID]) VALUES (N'P003', N'Perfume', N'Fruit-scented perfume, long-lasting fragrance', CAST(500000.00 AS Decimal(18, 2)), 75, N'Perfume', N'SUP003')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [price], [quantity], [category], [supplierID]) VALUES (N'P004', N'Facial Cleanser', N'Facial cleanser for sensitive skin', CAST(150000.00 AS Decimal(18, 2)), 30, N'Skincare', N'SUP001')
GO
INSERT [dbo].[tblSuppliers] ([supplierID], [supplierName], [contactName], [phoneNumber], [email], [address]) VALUES (N'SUP001', N'Beauty Co.', N'Alice Johnson', N'1234567890', N'alice@beautyco.com', N'123 Beauty Street, NY')
INSERT [dbo].[tblSuppliers] ([supplierID], [supplierName], [contactName], [phoneNumber], [email], [address]) VALUES (N'SUP002', N'Glamour Supplies', N'Bob Smith', N'0987654321', N'bob@glamoursupplies.com', N'456 Glamour Ave, LA')
INSERT [dbo].[tblSuppliers] ([supplierID], [supplierName], [contactName], [phoneNumber], [email], [address]) VALUES (N'SUP003', N'Cosmetic Partners', N'Carol Davis', N'1122334455', N'carol@cosmeticpartners.com', N'789 Cosmetic Blvd, Chicago, IL')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [email], [phoneNumber], [roleID], [password]) VALUES (N'admin', N'Admin User', N'admin@example.com', N'1122334455', N'ADM', N'adminpass')
INSERT [dbo].[tblUsers] ([userID], [fullName], [email], [phoneNumber], [roleID], [password]) VALUES (N'user1', N'John Doe', N'john@example.com', N'1234567890', N'USR', N'password1')
INSERT [dbo].[tblUsers] ([userID], [fullName], [email], [phoneNumber], [roleID], [password]) VALUES (N'user2', N'Jane Smith', N'jane@example.com', N'0987654321', N'USR', N'password2')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblSuppl__AB6E6164E1A0141C]    Script Date: 10/11/2024 1:58:46 PM ******/
ALTER TABLE [dbo].[tblSuppliers] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblUsers__AB6E6164964C50C8]    Script Date: 10/11/2024 1:58:46 PM ******/
ALTER TABLE [dbo].[tblUsers] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD FOREIGN KEY([supplierID])
REFERENCES [dbo].[tblSuppliers] ([supplierID])
GO
USE [master]
GO
ALTER DATABASE [CosmeticEcommerce] SET  READ_WRITE 
GO
