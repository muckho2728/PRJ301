USE [master]
GO
/****** Object:  Database [CosmeticEcommerce]    Script Date: 10/3/2024 9:21:53 PM ******/
CREATE DATABASE [CosmeticEcommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CosmeticEcommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.KHOADA\MSSQL\DATA\CosmeticEcommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CosmeticEcommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.KHOADA\MSSQL\DATA\CosmeticEcommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CosmeticEcommerce] SET COMPATIBILITY_LEVEL = 160
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
ALTER DATABASE [CosmeticEcommerce] SET QUERY_STORE = ON
GO
ALTER DATABASE [CosmeticEcommerce] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CosmeticEcommerce]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 10/3/2024 9:21:53 PM ******/
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
/****** Object:  Table [dbo].[tblOrders]    Script Date: 10/3/2024 9:21:53 PM ******/
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
/****** Object:  Table [dbo].[tblProducts]    Script Date: 10/3/2024 9:21:53 PM ******/
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
	[supplierID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSuppliers]    Script Date: 10/3/2024 9:21:53 PM ******/
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
/****** Object:  Table [dbo].[tblUsers]    Script Date: 10/3/2024 9:21:53 PM ******/
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
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 

INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (2, N'ORD001', N'P001', 2, CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (3, N'ORD001', N'P005', 2, CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (4, N'ORD001', N'P005', 2, CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (5, N'ORD001', N'P005', 2, CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (6, N'c85e4c57-55b0-4ab6-8ea3-f629a714df56', N'123123123', 1, CAST(123123.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (7, N'c85e4c57-55b0-4ab6-8ea3-f629a714df56', N'P001', 1, CAST(200000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (8, N'c85e4c57-55b0-4ab6-8ea3-f629a714df56', N'P002', 1, CAST(350006.04 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (9, N'c85e4c57-55b0-4ab6-8ea3-f629a714df56', N'P003', 1, CAST(500000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (10, N'c85e4c57-55b0-4ab6-8ea3-f629a714df56', N'P005', 1, CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (11, N'e3a002cf-a82d-4973-8853-def00e81a80c', N'123123123', 1, CAST(123123.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (12, N'e3a002cf-a82d-4973-8853-def00e81a80c', N'P001', 1, CAST(200000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (13, N'e3a002cf-a82d-4973-8853-def00e81a80c', N'P002', 1, CAST(350006.04 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (14, N'e3a002cf-a82d-4973-8853-def00e81a80c', N'P003', 2, CAST(500000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (15, N'd7386099-a1d9-4724-9373-e9fb5a693a42', N'123123123', 1, CAST(123123.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (16, N'd7386099-a1d9-4724-9373-e9fb5a693a42', N'P001', 1, CAST(200000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (17, N'd7386099-a1d9-4724-9373-e9fb5a693a42', N'P002', 1, CAST(350006.04 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (18, N'd7386099-a1d9-4724-9373-e9fb5a693a42', N'P003', 1, CAST(500000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (19, N'b7c21b29-7bb5-457d-b829-8978c714f7b3', N'123123123', 3, CAST(123123.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (20, N'9cb76d62-b038-476e-8a97-fb645f697165', N'123123123', 4, CAST(123123.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (21, N'9cb76d62-b038-476e-8a97-fb645f697165', N'P001', 1, CAST(200000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (22, N'9cb76d62-b038-476e-8a97-fb645f697165', N'P002', 1, CAST(350006.04 AS Decimal(18, 2)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (23, N'9cb76d62-b038-476e-8a97-fb645f697165', N'P003', 1, CAST(500000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
GO
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [totalAmount]) VALUES (N'9cb76d62-b038-476e-8a97-fb645f697165', N'asdasd', CAST(N'2024-10-03' AS Date), CAST(1542498.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [totalAmount]) VALUES (N'b7c21b29-7bb5-457d-b829-8978c714f7b3', N'khoa', CAST(N'2024-10-03' AS Date), CAST(369369.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [totalAmount]) VALUES (N'c85e4c57-55b0-4ab6-8ea3-f629a714df56', NULL, CAST(N'2024-10-03' AS Date), CAST(1273129.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [totalAmount]) VALUES (N'd7386099-a1d9-4724-9373-e9fb5a693a42', N'khoa', CAST(N'2024-10-03' AS Date), CAST(1173129.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [totalAmount]) VALUES (N'e3a002cf-a82d-4973-8853-def00e81a80c', N'khoa', CAST(N'2024-10-03' AS Date), CAST(1673129.00 AS Decimal(18, 2)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [orderDate], [totalAmount]) VALUES (N'ORD001', N'user1', CAST(N'2024-10-02' AS Date), CAST(2000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [price], [quantity], [category], [supplierID]) VALUES (N'123123123', N'qwesad', N'asdasd', CAST(123123.00 AS Decimal(18, 2)), 12312, N'Makeup', N'SUP001')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [price], [quantity], [category], [supplierID]) VALUES (N'P001', N'Lipstick 11', N'Red lipstick, lead-free', CAST(200000.00 AS Decimal(18, 2)), 100, N'Makeup', N'SUP001')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [price], [quantity], [category], [supplierID]) VALUES (N'P002', N'Moisturizing Cream 22', N'Night moisturizing cream, deep hydration', CAST(350006.04 AS Decimal(18, 2)), 50, N'Skincare', N'SUP002')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [price], [quantity], [category], [supplierID]) VALUES (N'P003', N'Perfume', N'Fruit-scented perfume, long-lasting fragrance', CAST(500000.00 AS Decimal(18, 2)), 75, N'Perfume', N'SUP003')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [price], [quantity], [category], [supplierID]) VALUES (N'P005', N'Updated Product', N'This is a new product', CAST(100000.00 AS Decimal(18, 2)), 50, N'NewCategory', N'SUP001')
GO
INSERT [dbo].[tblSuppliers] ([supplierID], [supplierName], [contactName], [phoneNumber], [email], [address]) VALUES (N'ghnxcvasd', N'adqwsdasdzxc', N'zxcqwdas', N'dxzczc', N'carol@gmail.com', N'asdasd')
INSERT [dbo].[tblSuppliers] ([supplierID], [supplierName], [contactName], [phoneNumber], [email], [address]) VALUES (N'SUP001', N'Beauty Co. 11', N'Alice Johnson', N'1234567890', N'alice@beautyco.com', N'123 Beauty Street, New York, NY')
INSERT [dbo].[tblSuppliers] ([supplierID], [supplierName], [contactName], [phoneNumber], [email], [address]) VALUES (N'SUP002', N'Glamour Supplies', N'Bob Smith', N'0987654321', N'bob@glamoursupplies.com', N'456 Glamour Ave, Los Angeles, CA')
INSERT [dbo].[tblSuppliers] ([supplierID], [supplierName], [contactName], [phoneNumber], [email], [address]) VALUES (N'SUP003', N'Cosmetic Partners', N'Carol Davis', N'1122334455', N'carol@cosmeticpartners.com', N'789 Cosmetic Blvd, Chicago, IL')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [email], [phoneNumber], [roleID], [password]) VALUES (N'admin', N'Admin User', N'admin@example.com', N'1122334455', N'ADM', N'adminpass')
INSERT [dbo].[tblUsers] ([userID], [fullName], [email], [phoneNumber], [roleID], [password]) VALUES (N'asdasd', N'asdasd', N'asdasd@gmail.com', N'asd', N'USR', N'asd')
INSERT [dbo].[tblUsers] ([userID], [fullName], [email], [phoneNumber], [roleID], [password]) VALUES (N'khoa', N'khoa', N'qwe@gmail.com', N'123', N'USR', N'123')
INSERT [dbo].[tblUsers] ([userID], [fullName], [email], [phoneNumber], [roleID], [password]) VALUES (N'user1', N'John Doe', N'john@example.com', N'1234567890', N'USR', N'password1')
INSERT [dbo].[tblUsers] ([userID], [fullName], [email], [phoneNumber], [roleID], [password]) VALUES (N'user2', N'Jane Smith', N'jane@example.com', N'0987654321', N'USR', N'password2')
INSERT [dbo].[tblUsers] ([userID], [fullName], [email], [phoneNumber], [roleID], [password]) VALUES (N'user3', N'Alice Wonderland', N'alice@example.com', N'1234567890', N'USR', N'alicepass')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblSuppl__AB6E61641DE02F33]    Script Date: 10/3/2024 9:21:54 PM ******/
ALTER TABLE [dbo].[tblSuppliers] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblUsers__AB6E61648C135F32]    Script Date: 10/3/2024 9:21:54 PM ******/
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
