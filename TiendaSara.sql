USE [master]
GO
/****** Object:  Database [TiendaSara]    Script Date: 18/06/2023 22:25:40 ******/
CREATE DATABASE [TiendaSara]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TiendaSara', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TiendaSara.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TiendaSara_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TiendaSara_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TiendaSara] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TiendaSara].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TiendaSara] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TiendaSara] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TiendaSara] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TiendaSara] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TiendaSara] SET ARITHABORT OFF 
GO
ALTER DATABASE [TiendaSara] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TiendaSara] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TiendaSara] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TiendaSara] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TiendaSara] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TiendaSara] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TiendaSara] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TiendaSara] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TiendaSara] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TiendaSara] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TiendaSara] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TiendaSara] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TiendaSara] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TiendaSara] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TiendaSara] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TiendaSara] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TiendaSara] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TiendaSara] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TiendaSara] SET  MULTI_USER 
GO
ALTER DATABASE [TiendaSara] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TiendaSara] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TiendaSara] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TiendaSara] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TiendaSara] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TiendaSara] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TiendaSara] SET QUERY_STORE = OFF
GO
USE [TiendaSara]
GO
/****** Object:  Table [dbo].[Carrito]    Script Date: 18/06/2023 22:25:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FolioVenta] [int] NOT NULL,
	[TotalCompra] [decimal](18, 2) NOT NULL,
	[Estatus] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_Carrito] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarritoDetalle]    Script Date: 18/06/2023 22:25:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarritoDetalle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCarrito] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Subtotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_CarritoDetalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 18/06/2023 22:25:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 18/06/2023 22:25:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 18/06/2023 22:25:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdMarca] [int] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tutorials]    Script Date: 18/06/2023 22:25:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutorials](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[published] [int] NOT NULL,
 CONSTRAINT [PK_tutorials] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Carrito] ON 

INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (1, 90001, CAST(1998.00 AS Decimal(18, 2)), 1, CAST(N'2023-05-03' AS Date))
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (3, 90002, CAST(998.00 AS Decimal(18, 2)), 0, CAST(N'2023-05-08' AS Date))
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (4, 90003, CAST(1598.00 AS Decimal(18, 2)), 0, CAST(N'2023-05-12' AS Date))
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (5, 90004, CAST(998.00 AS Decimal(18, 2)), 1, CAST(N'2023-05-14' AS Date))
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (6, 90005, CAST(7198.00 AS Decimal(18, 2)), 0, CAST(N'2023-05-15' AS Date))
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (7, 90006, CAST(578.00 AS Decimal(18, 2)), 0, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (8, 90007, CAST(718.00 AS Decimal(18, 2)), 0, CAST(N'2023-05-18' AS Date))
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (9, 90008, CAST(4499.00 AS Decimal(18, 2)), 1, CAST(N'2023-05-20' AS Date))
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (10, 90009, CAST(2958.00 AS Decimal(18, 2)), 1, CAST(N'2023-05-25' AS Date))
INSERT [dbo].[Carrito] ([Id], [FolioVenta], [TotalCompra], [Estatus], [Fecha]) VALUES (11, 90010, CAST(7299.00 AS Decimal(18, 2)), 1, CAST(N'2023-05-26' AS Date))
SET IDENTITY_INSERT [dbo].[Carrito] OFF
GO
SET IDENTITY_INSERT [dbo].[CarritoDetalle] ON 

INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (1, 1, 1, 2, CAST(1998.00 AS Decimal(18, 2)))
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (2, 3, 3, 2, CAST(998.00 AS Decimal(18, 2)))
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (3, 4, 5, 2, CAST(1598.00 AS Decimal(18, 2)))
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (4, 5, 7, 2, CAST(998.00 AS Decimal(18, 2)))
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (5, 6, 9, 2, CAST(7198.00 AS Decimal(18, 2)))
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (6, 7, 2, 2, CAST(578.00 AS Decimal(18, 2)))
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (7, 8, 4, 2, CAST(718.00 AS Decimal(18, 2)))
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (8, 9, 6, 1, CAST(4499.00 AS Decimal(18, 2)))
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (9, 10, 8, 2, CAST(2958.00 AS Decimal(18, 2)))
INSERT [dbo].[CarritoDetalle] ([Id], [IdCarrito], [IdProducto], [Cantidad], [Subtotal]) VALUES (10, 11, 10, 1, CAST(7299.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[CarritoDetalle] OFF
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (1, N'Caballero')
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (2, N'Dama')
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (3, N'Infantil')
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (4, N'Jugueteria')
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (5, N'Zapateria')
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (6, N'Electronica')
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (7, N'Linea Blanca')
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (8, N'Muebles')
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (9, N'Electrodomesticos')
INSERT [dbo].[Categorias] ([Id], [Descripcion]) VALUES (10, N'Joyeria')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Marcas] ON 

INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (1, N'Levi''s')
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (2, N'Nike')
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (3, N'Refill')
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (4, N'Hasbro')
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (5, N'Adidas')
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (6, N'LG')
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (7, N'Mabe')
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (8, N'Dico')
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (9, N'Whirpool')
INSERT [dbo].[Marcas] ([Id], [Descripcion]) VALUES (10, N'Harry Winston')
SET IDENTITY_INSERT [dbo].[Marcas] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (1, N'Tennis Taquetes', CAST(999.00 AS Decimal(18, 2)), 10, 5, 5)
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (2, N'Figura de accion', CAST(289.00 AS Decimal(18, 2)), 5, 4, 4)
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (3, N'Pantalon', CAST(499.00 AS Decimal(18, 2)), 6, 3, 3)
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (4, N'Maleta de mano', CAST(359.00 AS Decimal(18, 2)), 4, 2, 2)
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (5, N'Saco', CAST(799.00 AS Decimal(18, 2)), 5, 1, 1)
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (6, N'Anillo', CAST(4499.00 AS Decimal(18, 2)), 2, 10, 10)
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (7, N'Licuadora', CAST(499.00 AS Decimal(18, 2)), 3, 9, 9)
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (8, N'Escritorio', CAST(1299.00 AS Decimal(18, 2)), 2, 8, 8)
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (9, N'Estufa', CAST(3599.00 AS Decimal(18, 2)), 3, 7, 7)
INSERT [dbo].[Productos] ([Id], [Descripcion], [Precio], [Cantidad], [IdCategoria], [IdMarca]) VALUES (10, N'Pantalla', CAST(7299.00 AS Decimal(18, 2)), 4, 6, 6)
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[tutorials] ON 

INSERT [dbo].[tutorials] ([id], [title], [description], [published]) VALUES (1, N'1', N'1', 1)
INSERT [dbo].[tutorials] ([id], [title], [description], [published]) VALUES (2, N'2', N'2', 0)
INSERT [dbo].[tutorials] ([id], [title], [description], [published]) VALUES (3, N'3', N'3', 1)
SET IDENTITY_INSERT [dbo].[tutorials] OFF
GO
ALTER TABLE [dbo].[CarritoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CarritoDetalle_Carrito] FOREIGN KEY([IdCarrito])
REFERENCES [dbo].[Carrito] ([Id])
GO
ALTER TABLE [dbo].[CarritoDetalle] CHECK CONSTRAINT [FK_CarritoDetalle_Carrito]
GO
ALTER TABLE [dbo].[CarritoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CarritoDetalle_Productos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[CarritoDetalle] CHECK CONSTRAINT [FK_CarritoDetalle_Productos]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([Id])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Marcas] FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marcas] ([Id])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Marcas]
GO
USE [master]
GO
ALTER DATABASE [TiendaSara] SET  READ_WRITE 
GO
