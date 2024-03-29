CREATE DATABASE [G3Triangle]
GO

USE [G3Triangle]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/19/2022 1:24:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NameVN] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Categorys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/19/2022 1:24:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Photo] [nvarchar](max) NOT NULL,
	[Activated] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/19/2022 1:24:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_dbo.OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/19/2022 1:24:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Amount] [float] NOT NULL,
	[Desciption] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/19/2022 1:24:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[ProductDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NOT NULL,
	[ViewCount] [int] NOT NULL,
	[Special] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (8, N'Women''s Fashion', N'Thời trang nữ')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (9, N'Men''s Fashion', N'Thời trang nam')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (10, N'Couple clothes', N'Đồ đôi')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (11, N'Men''s shoes', N'Giày dép nam')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (12, N'Women''s shoes', N'Giày dép nữ')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (13, N'Stylist accessories', N'Phụ kiện')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (14, N'Unisex', N'Unisex')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (15, N'Streetwear', N'Streetwear')
SET IDENTITY_INSERT [dbo].[Categories] OFF
INSERT [dbo].[Customers] ([Id], [Password], [FullName], [Email], [Photo], [Activated], [Admin]) VALUES (N'admin', N'1234', N'Trần Nhật Quang', N'trannhatquang107@gmail.com', N'admin.jpg', 1, 1)
INSERT [dbo].[Customers] ([Id], [Password], [FullName], [Email], [Photo], [Activated], [Admin]) VALUES (N'quangtran2k1', N'1234', N'Trần Nhật Quang', N'trannhatquang107@gmail.com', N'user-default.jpg', 1, 0)
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (2, N'Áo khoác kaki hai lớp mangto', 450000, N'ao-khoac-kaki-hai-lop-mangto.jpg', CAST(N'2022-12-14' AS Date), 1, 9, 1000, NULL, 0, 4, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (3, N'Áo thun nam dài tay', 350000, N'ao-thun-nam-giarasv.jpg', CAST(N'2022-12-14' AS Date), 1, 9, 1000, NULL, 0, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (4, N'Áo vest công sở', 500000, N'ao-vest-cong-so.jpg', CAST(N'2022-12-14' AS Date), 1, 8, 1000, NULL, 0, 15, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (5, N'Đầm thời trang công sở', 450000, N'dam-thoi-trang-cong-so.jpg', CAST(N'2022-12-14' AS Date), 1, 8, 1000, NULL, 0, 18, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (6, N'Đồng hồ nam Economicxi', 700000, N'dong-ho-nam-economicxi.jpg', CAST(N'2022-12-14' AS Date), 1, 13, 1000, NULL, 0, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (8, N'Giày cao gót nữ', 300000, N'giay-cao-got-nu.jpg', CAST(N'2022-12-14' AS Date), 1, 12, 1000, NULL, 0, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (9, N'Giày da nam cao cấp', 1000000, N'giay-da-nam-cao-cap.jpg', CAST(N'2022-12-14' AS Date), 1, 11, 1000, NULL, 0.2, 11, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (10, N'Giày da nam cổ thấp', 750000, N'giay-da-nam-co-thap.jpg', CAST(N'2022-12-14' AS Date), 1, 11, 1000, NULL, 0, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (11, N'Quần jean nữ', 650000, N'quan-jean-nu.jpg', CAST(N'2022-12-14' AS Date), 1, 8, 1000, NULL, 0, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (12, N'Quần jean nam', 600000, N'quan-jean-nam.jpg', CAST(N'2022-12-14' AS Date), 1, 9, 1000, NULL, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
