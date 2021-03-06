USE [master]
GO
/****** Object:  Database [SocialNetworkDeveloper]    Script Date: 07/05/2021 11:43:33 ******/
CREATE DATABASE [SocialNetworkDeveloper]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SocialNetworkDeveloper', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SocialNetworkDeveloper.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SocialNetworkDeveloper_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SocialNetworkDeveloper_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SocialNetworkDeveloper] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SocialNetworkDeveloper].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SocialNetworkDeveloper] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET ARITHABORT OFF 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET  MULTI_USER 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SocialNetworkDeveloper] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SocialNetworkDeveloper] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SocialNetworkDeveloper] SET QUERY_STORE = OFF
GO
USE [SocialNetworkDeveloper]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 07/05/2021 11:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombreCategoria] [nvarchar](100) NULL,
	[estadoCategoria] [int] NULL,
 CONSTRAINT [pk_categorias] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 07/05/2021 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[idDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[Departamento] [nvarchar](150) NULL,
	[estado] [int] NULL,
 CONSTRAINT [pk_departamentos] PRIMARY KEY CLUSTERED 
(
	[idDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoPublicacion]    Script Date: 07/05/2021 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoPublicacion](
	[idEstadoPublicacion] [int] IDENTITY(1,1) NOT NULL,
	[estado] [nvarchar](100) NULL,
 CONSTRAINT [pk_estado_publicacion] PRIMARY KEY CLUSTERED 
(
	[idEstadoPublicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipios]    Script Date: 07/05/2021 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipios](
	[idMunicipio] [int] IDENTITY(1,1) NOT NULL,
	[Municipio] [nvarchar](255) NULL,
	[idDepartamento] [int] NULL,
 CONSTRAINT [pk_municipios] PRIMARY KEY CLUSTERED 
(
	[idMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenesCompras]    Script Date: 07/05/2021 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenesCompras](
	[idOrdenCompra] [int] IDENTITY(1,1) NOT NULL,
	[idPublicacion] [int] NULL,
	[idUsuario] [int] NULL,
	[idOrdenVenta] [int] NULL,
	[fechaHoraOrdenCompra] [datetime] NULL,
	[totalCompra] [decimal](14, 2) NULL,
	[estadoOrdenCompra] [int] NULL,
	[Cantidad] [int] NULL,
 CONSTRAINT [PK_OrdenesCompras] PRIMARY KEY CLUSTERED 
(
	[idOrdenCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenesVentas]    Script Date: 07/05/2021 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenesVentas](
	[idOrdenVenta] [int] IDENTITY(1,1) NOT NULL,
	[idPublicacion] [int] NULL,
	[estadoOrdenVenta] [int] NULL,
	[fechaHoraOrdenVenta] [datetime] NULL,
	[totalVenta] [decimal](14, 2) NULL,
	[Cantidad] [int] NULL,
 CONSTRAINT [PK_OrdenesNegocios] PRIMARY KEY CLUSTERED 
(
	[idOrdenVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publicaciones]    Script Date: 07/05/2021 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publicaciones](
	[idPublicacion] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](150) NULL,
	[Imagen] [image] NULL,
	[Raiting] [int] NULL,
	[fechaCreacion] [datetime] NULL,
	[idCategoria] [int] NULL,
	[fechaPublicacion] [datetime] NULL,
	[idSubCategoria] [int] NULL,
	[idTipoPublicacion] [int] NULL,
	[idDepartamento] [int] NULL,
	[idMunicipio] [int] NULL,
	[Descripcion] [nvarchar](250) NULL,
	[Precio] [decimal](14, 2) NULL,
	[idEstadoPublicacion] [int] NULL,
	[idUsuario] [int] NULL,
	[Delivery] [char](1) NULL,
 CONSTRAINT [pk_pulicaciones] PRIMARY KEY CLUSTERED 
(
	[idPublicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 07/05/2021 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[idRating] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [int] NULL,
	[fechaHoraCreacion] [datetime] NULL,
	[idPublicacion] [int] NULL,
	[idUsuario] [int] NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[idRating] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 07/05/2021 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[Rol] [nvarchar](25) NULL,
 CONSTRAINT [pk_roles] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategorias]    Script Date: 07/05/2021 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategorias](
	[idSubCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombreSubCategoria] [nvarchar](100) NULL,
	[idCategoria] [int] NULL,
	[estadoSubCategoria] [int] NULL,
 CONSTRAINT [pk_subcategorias] PRIMARY KEY CLUSTERED 
(
	[idSubCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPublicacion]    Script Date: 07/05/2021 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPublicacion](
	[idTipoPublicacion] [int] IDENTITY(1,1) NOT NULL,
	[tipoPublicacion] [nvarchar](100) NULL,
 CONSTRAINT [pk_tipo_publicacion] PRIMARY KEY CLUSTERED 
(
	[idTipoPublicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 07/05/2021 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NULL,
	[nombreCompleto] [nvarchar](250) NULL,
	[Nombres] [nvarchar](125) NULL,
	[Apellidos] [nvarchar](125) NULL,
	[Dui] [nvarchar](10) NULL,
	[Nit] [nvarchar](16) NULL,
	[telefonoContacto] [nvarchar](15) NULL,
	[correoElectronico] [nvarchar](150) NULL,
	[Contrasena] [nvarchar](25) NULL,
	[idDepartamento] [int] NULL,
	[idMunicipio] [int] NULL,
	[Direccion] [nvarchar](300) NULL,
	[Vendedor] [char](1) NULL,
	[Comprador] [char](1) NULL,
	[estadoUsuario] [int] NULL,
	[contribuyente] [char](1) NULL,
 CONSTRAINT [pk_usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 07/05/2021 11:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[idWhislist] [int] IDENTITY(1,1) NOT NULL,
	[idPublicacion] [int] NULL,
	[idUsuario] [int] NULL,
	[fechaCreacion] [datetime] NULL,
	[estadoWishlist] [int] NULL,
 CONSTRAINT [pk_whislist] PRIMARY KEY CLUSTERED 
(
	[idWhislist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([idCategoria], [nombreCategoria], [estadoCategoria]) VALUES (1, N'Productos', 1)
INSERT [dbo].[Categorias] ([idCategoria], [nombreCategoria], [estadoCategoria]) VALUES (2, N'Servicios', 1)
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Departamentos] ON 

INSERT [dbo].[Departamentos] ([idDepartamento], [Departamento], [estado]) VALUES (1, N'Ahuachapán', 0)
INSERT [dbo].[Departamentos] ([idDepartamento], [Departamento], [estado]) VALUES (2, N'Cabañas', 0)
INSERT [dbo].[Departamentos] ([idDepartamento], [Departamento], [estado]) VALUES (3, N'Chalatenango', 0)
INSERT [dbo].[Departamentos] ([idDepartamento], [Departamento], [estado]) VALUES (4, N'Cuscatlán', 0)
INSERT [dbo].[Departamentos] ([idDepartamento], [Departamento], [estado]) VALUES (5, N'La Libertad', 0)
INSERT [dbo].[Departamentos] ([idDepartamento], [Departamento], [estado]) VALUES (6, N'La Paz', 0)
INSERT [dbo].[Departamentos] ([idDepartamento], [Departamento], [estado]) VALUES (7, N'La Unión', 0)
INSERT [dbo].[Departamentos] ([idDepartamento], [Departamento], [estado]) VALUES (8, N'Morazán', 0)
INSERT [dbo].[Departamentos] ([idDepartamento], [Departamento], [estado]) VALUES (9, N'San Miguel', 0)
INSERT [dbo].[Departamentos] ([idDepartamento], [Departamento], [estado]) VALUES (10, N'San Salvador', 0)
INSERT [dbo].[Departamentos] ([idDepartamento], [Departamento], [estado]) VALUES (11, N'San Vicente', 0)
INSERT [dbo].[Departamentos] ([idDepartamento], [Departamento], [estado]) VALUES (12, N'Santa Ana', 0)
INSERT [dbo].[Departamentos] ([idDepartamento], [Departamento], [estado]) VALUES (13, N'Sonsonate', 0)
INSERT [dbo].[Departamentos] ([idDepartamento], [Departamento], [estado]) VALUES (14, N'Usulután', 0)
SET IDENTITY_INSERT [dbo].[Departamentos] OFF
GO
SET IDENTITY_INSERT [dbo].[EstadoPublicacion] ON 

INSERT [dbo].[EstadoPublicacion] ([idEstadoPublicacion], [estado]) VALUES (1, N'Activa')
INSERT [dbo].[EstadoPublicacion] ([idEstadoPublicacion], [estado]) VALUES (2, N'Desactivada')
SET IDENTITY_INSERT [dbo].[EstadoPublicacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Municipios] ON 

INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (1, N'Ahuachapán', 1)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (2, N'Jujutla', 1)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (3, N'Atiquizaya', 1)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (4, N'Concepción de Ataco', 1)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (5, N'El Refugio', 1)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (6, N'Guaymango', 1)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (7, N'Apaneca', 1)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (8, N'San Francisco Menéndez', 1)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (9, N'San Lorenzo', 1)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (10, N'San Pedro Puxtla', 1)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (11, N'Tacuba', 1)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (12, N'Turín', 1)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (13, N'Cinquera', 2)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (14, N'Villa Dolores', 2)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (15, N'Guacotecti', 2)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (16, N'Ilobasco', 2)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (17, N'Jutiapa', 2)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (18, N'San Isidro', 2)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (19, N'Sensuntepeque', 2)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (20, N'Ciudad de Tejutepeque', 2)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (21, N'Victoria', 2)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (22, N'Agua Caliente', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (23, N'Arcatao', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (24, N'Azacualpa', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (25, N'Chalatenango', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (26, N'Citalá', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (27, N'Comalapa', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (28, N'Concepción Quezaltepeque', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (29, N'Dulce Nombre de María', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (30, N'El Carrizal', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (31, N'El Paraíso', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (32, N'La Laguna', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (33, N'La Palma', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (34, N'La Reina', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (35, N'Las Vueltas', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (36, N'Nombre de Jesús', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (37, N'Nueva Concepción', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (38, N'Nueva Trinidad', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (39, N'Ojos de Agua', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (40, N'Potonico', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (41, N'San Antonio de la Cruz', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (42, N'San Antonio Los Ranchos', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (43, N'San Fernando', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (44, N'San Francisco Lempa', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (45, N'San Francisco Morazán', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (46, N'San Ignacio', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (47, N'San Isidro Labrador', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (48, N'San José Cancasque', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (49, N'San José Las Flores', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (50, N'San Luis del Carmen', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (51, N'San Miguel de Mercedes', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (52, N'San Rafael', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (53, N'Santa Rita', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (54, N'Tejutla', 3)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (55, N'Candelaria', 4)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (56, N'Cojutepeque', 4)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (57, N'El Carmen', 4)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (58, N'El Rosario', 4)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (59, N'Monte San Juan', 4)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (60, N'Oratorio de Concepción', 4)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (61, N'San Bartolomé Perulapía', 4)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (62, N'San Cristóbal', 4)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (63, N'San José Guayabal', 4)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (64, N'San Pedro Perulapán', 4)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (65, N'San Rafael Cedros', 4)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (66, N'San Ramón', 4)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (67, N'Santa Cruz Analquito', 4)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (68, N'Santa Cruz Michapa', 4)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (69, N'Suchitoto', 4)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (70, N'Tenancingo', 4)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (71, N'Antiguo Cuscatlán', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (72, N'Chiltiupán', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (73, N'Ciudad Arce', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (74, N'Colón', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (75, N'Comasagua', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (76, N'Huizúcar', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (77, N'Jayaque', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (78, N'Jicalapa', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (79, N'La Libertad', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (80, N'Santa Tecla', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (81, N'Nuevo Cuscatlán', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (82, N'San Juan Opico', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (83, N'Quezaltepeque', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (84, N'Sacacoyo', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (85, N'San José Villanueva', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (86, N'San Matías', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (87, N'San Pablo Tacachico', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (88, N'Talnique', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (89, N'Tamanique', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (90, N'Teotepeque', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (91, N'Tepecoyo', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (92, N'Zaragoza', 5)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (93, N'Cuyultitán', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (94, N'El Rosario', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (95, N'Jerusalén', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (96, N'Mercedes La Ceiba', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (97, N'Olocuilta', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (98, N'Paraíso de Osorio', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (99, N'San Antonio Masahuat', 6)
GO
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (100, N'San Emigdio', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (101, N'San Francisco Chinameca', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (102, N'San Juan Nonualco', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (103, N'San Juan Talpa', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (104, N'San Juan Tepezontes', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (105, N'San Luis La Herradura', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (106, N'San Luis Talpa', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (107, N'San Miguel Tepezontes', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (108, N'San Pedro Masahuat', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (109, N'San Pedro Nonualco', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (110, N'San Rafael Obrajuelo', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (111, N'Santa María Ostuma', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (112, N'Santiago Nonualco', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (113, N'Tapalhuaca', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (114, N'Zacatecoluca', 6)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (115, N'Anamorós', 7)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (116, N'Bolívar', 7)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (117, N'Concepción de Oriente', 7)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (118, N'Conchagua', 7)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (119, N'El Carmen', 7)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (120, N'El Sauce', 7)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (121, N'Intipucá', 7)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (122, N'La Unión', 7)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (123, N'Lislique', 7)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (124, N'Meanguera del Golfo', 7)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (125, N'Nueva Esparta', 7)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (126, N'Pasaquina', 7)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (127, N'Polorós', 7)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (128, N'San Alejo', 7)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (129, N'San José', 7)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (130, N'Santa Rosa de Lima', 7)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (131, N'Yayantique', 7)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (132, N'Yucuayquín', 7)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (133, N'Arambala', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (134, N'Cacaopera', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (135, N'Chilanga', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (136, N'Corinto', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (137, N'Delicias de Concepción', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (138, N'El Divisadero', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (139, N'El Rosario', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (140, N'Gualococti', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (141, N'Guatajiagua', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (142, N'Joateca', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (143, N'Jocoaitique', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (144, N'Jocoro', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (145, N'Lolotiquillo', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (146, N'Meanguera', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (147, N'Osicala', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (148, N'Perquín', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (149, N'San Carlos', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (150, N'San Fernando', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (151, N'San Francisco Gotera', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (152, N'San Isidro', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (153, N'San Simón', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (154, N'Sensembra', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (155, N'Sociedad', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (156, N'Torola', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (157, N'Yamabal', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (158, N'Yoloaiquín', 8)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (159, N'Carolina', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (160, N'Chapeltique', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (161, N'Chinameca', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (162, N'Chirilagua', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (163, N'Ciudad Barrios', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (164, N'Comacarán', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (165, N'El Tránsito', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (166, N'Lolotique', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (167, N'Moncagua', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (168, N'Nueva Guadalupe', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (169, N'Nuevo Edén de San Juan', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (170, N'Quelepa', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (171, N'San Antonio', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (172, N'San Gerardo', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (173, N'San Jorge', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (174, N'San Luis de la Reina', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (175, N'San Miguel', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (176, N'San Rafael', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (177, N'Sesori', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (178, N'Uluazapa', 9)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (179, N'Aguilares', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (180, N'Apopa', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (181, N'Ayutuxtepeque', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (182, N'Cuscatancingo', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (183, N'Delgado', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (184, N'El Paisnal', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (185, N'Guazapa', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (186, N'Ilopango', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (187, N'Mejicanos', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (188, N'Nejapa', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (189, N'Panchimalco', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (190, N'Rosario de Mora', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (191, N'San Marcos', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (192, N'San Martín', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (193, N'San Salvador', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (194, N'Santiago Texacuangos', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (195, N'Santo Tomás', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (196, N'Soyapango', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (197, N'Tonacatepeque', 10)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (198, N'Apastepeque', 11)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (199, N'Guadalupe', 11)
GO
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (200, N'San Cayetano Istepeque', 11)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (201, N'San Esteban Catarina', 11)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (202, N'San Ildefonso', 11)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (203, N'San Lorenzo', 11)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (204, N'San Sebastián', 11)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (205, N'Santa Clara', 11)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (206, N'Santo Domingo', 11)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (207, N'San Vicente', 11)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (208, N'Tecoluca', 11)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (209, N'Tepetitán', 11)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (210, N'Verapaz', 11)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (211, N'Candelaria de la Frontera', 12)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (212, N'Chalchuapa', 12)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (213, N'Coatepeque', 12)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (214, N'El Congo', 12)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (215, N'El Porvenir', 12)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (216, N'Masahuat', 12)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (217, N'Metapán', 12)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (218, N'San Antonio Pajonal', 12)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (219, N'San Sebastián Salitrillo', 12)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (220, N'Santa Ana', 12)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (221, N'Santa Rosa Guachipilín', 12)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (222, N'Santiago de la Frontera', 12)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (223, N'Texistepeque', 12)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (224, N'Acajutla', 13)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (225, N'Armenia', 13)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (226, N'Caluco', 13)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (227, N'Cuisnahuat', 13)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (228, N'Izalco', 13)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (229, N'Juayúa', 13)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (230, N'Nahuizalco', 13)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (231, N'Nahulingo', 13)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (232, N'Salcoatitán', 13)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (233, N'San Antonio del Monte', 13)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (234, N'San Julián', 13)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (235, N'Santa Catarina Masahuat', 13)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (236, N'Santa Isabel Ishuatán', 13)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (237, N'Santo Domingo', 13)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (238, N'Sonsonate', 13)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (239, N'Sonzacate', 13)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (240, N'Alegría', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (241, N'Berlín', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (242, N'California', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (243, N'Concepción Batres', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (244, N'El Triunfo', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (245, N'Ereguayquín', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (246, N'Estanzuelas', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (247, N'Jiquilisco', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (248, N'Jucuapa', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (249, N'Jucuarán', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (250, N'Mercedes Umaña', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (251, N'Nueva Granada', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (252, N'Ozatlán', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (253, N'Puerto El Triunfo', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (254, N'San Agustín', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (255, N'San Buenaventura', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (256, N'San Dionisio', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (257, N'San Francisco Javier', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (258, N'Santa Elena', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (259, N'Santa María', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (260, N'Santiago de María', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (261, N'Tecapán', 14)
INSERT [dbo].[Municipios] ([idMunicipio], [Municipio], [idDepartamento]) VALUES (262, N'Usulután', 14)
SET IDENTITY_INSERT [dbo].[Municipios] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdenesCompras] ON 

INSERT [dbo].[OrdenesCompras] ([idOrdenCompra], [idPublicacion], [idUsuario], [idOrdenVenta], [fechaHoraOrdenCompra], [totalCompra], [estadoOrdenCompra], [Cantidad]) VALUES (1, 1, 9, 1, CAST(N'2021-05-07T17:09:00.583' AS DateTime), CAST(200.00 AS Decimal(14, 2)), 4, 1)
INSERT [dbo].[OrdenesCompras] ([idOrdenCompra], [idPublicacion], [idUsuario], [idOrdenVenta], [fechaHoraOrdenCompra], [totalCompra], [estadoOrdenCompra], [Cantidad]) VALUES (2, 1, 4, 2, CAST(N'2021-05-07T17:09:33.727' AS DateTime), CAST(200.00 AS Decimal(14, 2)), 1, 1)
INSERT [dbo].[OrdenesCompras] ([idOrdenCompra], [idPublicacion], [idUsuario], [idOrdenVenta], [fechaHoraOrdenCompra], [totalCompra], [estadoOrdenCompra], [Cantidad]) VALUES (3, 1, 10, 3, CAST(N'2021-05-07T17:17:51.373' AS DateTime), CAST(400.00 AS Decimal(14, 2)), 1, 2)
SET IDENTITY_INSERT [dbo].[OrdenesCompras] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdenesVentas] ON 

INSERT [dbo].[OrdenesVentas] ([idOrdenVenta], [idPublicacion], [estadoOrdenVenta], [fechaHoraOrdenVenta], [totalVenta], [Cantidad]) VALUES (1, 1, 4, CAST(N'2021-05-07T17:09:00.500' AS DateTime), CAST(200.00 AS Decimal(14, 2)), 1)
INSERT [dbo].[OrdenesVentas] ([idOrdenVenta], [idPublicacion], [estadoOrdenVenta], [fechaHoraOrdenVenta], [totalVenta], [Cantidad]) VALUES (2, 1, 1, CAST(N'2021-05-07T17:09:33.703' AS DateTime), CAST(200.00 AS Decimal(14, 2)), 1)
INSERT [dbo].[OrdenesVentas] ([idOrdenVenta], [idPublicacion], [estadoOrdenVenta], [fechaHoraOrdenVenta], [totalVenta], [Cantidad]) VALUES (3, 1, 1, CAST(N'2021-05-07T17:17:51.367' AS DateTime), CAST(400.00 AS Decimal(14, 2)), 2)
SET IDENTITY_INSERT [dbo].[OrdenesVentas] OFF
GO
SET IDENTITY_INSERT [dbo].[Publicaciones] ON 

INSERT [dbo].[Publicaciones] ([idPublicacion], [Titulo], [Imagen], [Raiting], [fechaCreacion], [idCategoria], [fechaPublicacion], [idSubCategoria], [idTipoPublicacion], [idDepartamento], [idMunicipio], [Descripcion], [Precio], [idEstadoPublicacion], [idUsuario], [Delivery]) VALUES (1, N'Vendo Huawei Y9 Prime 2019', 0xFFD8FFE10D414578696600004D4D002A00000008000C010000030000000101E000000101000300000001012C000001020003000000030000009E010600030000000100020000011200030000000100010000011500030000000100030000011A000500000001000000A4011B000500000001000000AC012800030000000100020000013100020000001D000000B40132000200000014000000D18769000400000001000000E800000120000800080008000AFC8000002710000AFC800000271041646F62652050686F746F73686F70204343202857696E646F77732900323031393A30363A32362031343A34383A3536000000000004900000070000000430323231A001000300000001FFFF0000A002000400000001000001E0A0030004000000010000012C0000000000000006010300030000000100060000011A0005000000010000016E011B0005000000010000017601280003000000010002000002010004000000010000017E020200040000000100000BBB0000000000000048000000010000004800000001FFD8FFED000C41646F62655F434D0002FFEE000E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108006400A003012200021101031101FFDD0004000AFFC4013F0000010501010101010100000000000000030001020405060708090A0B0100010501010101010100000000000000010002030405060708090A0B1000010401030204020507060805030C33010002110304211231054151611322718132061491A1B14223241552C16233347282D14307259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7F711000202010204040304050607070605350100021103213112044151617122130532819114A1B14223C152D1F0332462E1728292435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F5549249252924979875DA6FEA9D47A86565655ED65393663D6D6DB632BA2AA3633F434D0E67AB7E5BBE9EF4FC58CE497082078C92012680B2FA7A4BC46CAEA7D9FABD992DADBA7BB22E2E77F29DFA5F6FF656F740FAB78B998B6E4E55B90E1258D6B722F05863F9C3B6E1B95B9FC333431F1CE508FF0056E5C5AFF80D29F3F86390E38DE4AFD287C9F4F7381F5049795BFEA8E7D566E63ACCCA60E8CCCBAB3C4367D4B377B575DF505F9E3A564E1E7DB65B6E065D98EC373B7D8181B5DACADF6EBEA6CF57D9FC8F6283372C714448CE1304D7A0D9FAC65C2C9839A8E691888CA342FD61E99249250361492E67EBD7ACEC3C1A2BBEEC71919B4D763E8B1D538B5C7639BBEB2D76DDAE5B1D1AC7DBD3306EB097596E2D4F7B89925C58C25CE77E7235A5AC1901C8615B012FB5BC924920BD4924924A5249249294924924A7FFD0F55492492529798FDA2B775BEB1D3AF80DBF32E754E3C6F98DBFDA5E9CBC6BAD127EB07546830E1996B987CE55BE4717BB9650BA3C065197EECA32870AC9F3279631CB5C51BE19C7F7B1CBE64805DD2338B9EC2EA5D21DA765D2747CC0EB43B108B05835AC1D5C07EE37F3DCCFE4AC2A7ACFDAA914E453EB583DA44C3C9F22FF00658EFE459E9BFF00E12D4263319CF23A7DD171D4E2BC41246B06A7FB9AF5AA64671E0CF1E0C80571FCD8A7FD668F31F0EC7927F79E466242ECE1BE0CD0FEAC44BE67BB77A170241D8EEFD88FEB3513EA888775904CC752B35FFAD632E47A3FD64C9B721B8B9C0B9A4EDDEED6C612766E167D37D6D77F3B5DBEA7FA4F53FC12EB3EA8070B7ADB4F6EA2FD3FEB542CCE7B0CF154647C46BC51AF065E4CF17A8463D632908F06413FDC9BD124924A9371E6BEBB7F35D2FF00F0FD1FF5416AF4311D23A703DB129FFA862CCFAE401674C0448FB6D67E601705A9D17FE49E9FFF00856AFF00A86277E88F3608FF00BA27FDC87FD29B7D24924D675249249294924924A524924929FFD1F55492492529788F5FC815FD6AEA8C77D13956107C0CF2BDB978B7D66C517756EA6F03DEDCDBA0FCC2D0F84FFBA4FF00725F9C5ABCE988C404B694845AF7B5CD67AECD5CC1EF03F39A8832EEBABA0D8F80CB86CB881BC068DDB7D4FA5F9EC41C0BF7D3B5FAB99ED783E09ECA836A7D63501C1CCF84396ECE3131A3BF43E6E6E1C871CC83D3FE747B3D07D5CE9EECDCDBB3DC09AEB700D27873BE9BFF00EF8BB1FAA5FCF75B1F9DFB45F27FEB58EA87D5EC618FD1E968105C4BCFC5DEE5A3F553F9DEB7FF00A72B3FF3D632E779DCBEE64DEC0F4C3C218BD1FF0039D910E099801423EB9F79E5E63D7C47FB98E1EDBBE92492A8BDE6FEBA6EF4FA6ED307EDB5FDC277FF00D05A9D24BC747C23580E78C4AF6B49804EC66D05D0EDBFE6AC9FAF1FCC74DFFC3D4FFD52D8E8FA74BC0FFC2B57FD4313BF4479B047FDD13FEE43FE94DAD40FACF5B00BBECB73F6B5AE74B9A3786ED7DC21BF41F67E93D0FF00C1959FF2C3F1F29AEF46ABCFA8DC47B248FA2D18F6DA2CFA2EF57D473EBFD2ABC926B3B94F6FD613EA80FA448BC545BAEA4B0E13B6BDBF98CF56BBBDDFF0BFF048D77EDD361F43ECADAC8101FEA38B4ED1BFDCD2CF53F49B99F42AFDFF00E42BE924A4747AFE8D7F68DA2FDA3D5D93B7747BB66EF76DDC889249294924924A7FFFD2F55492492529790F5823F6B75569FF00B9B7FE55EBCBC67AE5DB3AFF00556F63996FE557FE15FEE93FDC97E7169FC4637847F78396F6BA9B7D5671F9C3C42B6D69CA0C14FB9CE3B5A3B99FCCFEB2AEE783CA974FCA3D3F3AACA68DCC63A4B7C0F1BDBFCA67E6ADE94AC1ADFA79B9F080998F11AA2013FD4EAFA37D5ECB665F47A2C69D5A035E3C1CDF63FF00E935687D53FE73AD7FE9CACFFCF58CB96E9D9ACC3BDF9547BB072CEEC8ADBA963CFF0087AC7E731FFE11751F545EDB0F59B18439AFEA3639AE1A820D38CB9AE6F19864DBD37230FEECFD5C3FDEC6EF48890E23F3931193FBD18CBD7FDCC9FA2F4092492AEB5E67EBCFF47E9BFF0087A9FF00AA5B3D274E9B823FEEB57FF52C58DF5E7FA374EFFC3D4FE55B5D2C7F93F0C7FDD7AFFEA589DFA23CD863FEE89FF721FF004A6DC4924935994924924A5249249294924924A7FFD3F5549249252978BF5CC675FF00587AA86B835DF6CB1AD0675265FF009BF476B2B7B97B42F14FAD597FB2FEB4755C7CB6DF51BAEF5EB34E81F5BFDEC7EE2D77F537B7FF004A56ADF2190433126423E922CEDBC58399871400ABD7A357EC6F2F2C363667DA7F79A031CF7C8F67B1B6B3F3FF00EB9F9E80FF00658FA9E412C7169238D3C156B3AD53B89A2CC86871DCFDE26483FA3FA0D637DACF6ED41FDA5438973CD85CE325C586495A839AC77672C3FC68B50E13D212FB0BB7D3FA8BF0CEC74BA83E1CB67F77FF0022BD17FC5DBEBB3A6F50B2A20D6FCFB4B48E23652BC8E8EA9802D67DA3D6346E1EA8ADB0FDBF9FE9B9FB99BFFAEBD5FF00C57349FABB6E436B7D7464E5DD6E37A9F48D5ED631EEDBEDFCCFCD553E239B14F1C7824252E2B3C26F4E1936396F707A663D23E5E21EAFEEFF0075EC12492596DA798FAF5FD1BA77FE1DABF2ADCE99FD030FFF000BD7FF0052C581FE302EA68C1C0B6E7B6AADB9B54B9E434733CB96FF004E118589FF0010CFFA96277E88F3618FF3F3FEE47F3936D24924D665249249294924924A524924929FFFD4F5549249252909D587407B5AF89DBB849828AA966F4AC4CDBABBEFDFBEA6B98CDAF2D1B5F1EB30B5BF4DB76C636CDE9293FA15FF00A3AFFCD1FDCA2598ED706B9B507188040075D02A6CFABD82C7B2C0FBCBD85A771B5C4BB63BD467ACEFF0DEEFF096FE9BFE1159B3A6E35B636CB017399B76F1A6D78C91B74FF4ECA9EFFF0088A9252414D4E1A57591C703B69E08A03811C000440541DD0F09CCDAE3648B2CB43C3CB5C1F6BBD4B1EDF4F66DF7FD15630B031F058F663EE0DB1DBC8738BA0C06FB777D1FA2929B2A81EBBD25A2D2EC86B3D073D9607020CD45CDB76B5C3759EE63FF009BFA6AFA13B1715E21F4D6E13BA0B41D4EE3BB8FA5FA4B3FEDC494D0CBEA9D02DC7032EDA6EADCD160A5E0584F71FA087BF7FF002766F52775EE8B5B2CB4E4B00AC12E2012486B596BBD2DA3F4FB596B3F99F53FF03B15A3D3F00820E3544176F20B1BAB8FE7FD1FA7FCA513D2FA6199C4A0CF3FA366BFF47C92550DD6C9EAB8188F35DF6EC70AADBC8DAE3FA3A7F9F7FB1AEFA13F47FC27F83513D67A5340DD955B658DB4073A0ED70DCC743BF79AE562CC5C5B0CD94D6F22402E683C997723F392FB2E3401E8B21B1B7DA3481B5B1A7EEA4A5E9BA9C8A9B750F6D953C4B5ED3208F8A228B18CADA195B431A386B440D7C82924A5249249294924924A7FFFD5F55497CAA924A7EAA497CAA924A7EAA497CAA924A7EAA497CAA924A7EAA497CAA924A7EAA497CAA924A7EAA497CAA924A7EAA497CAA924A7EAA497CAA924A7EAA497CAA924A7FFD9FFED154850686F746F73686F7020332E30003842494D04040000000000171C015A00031B25471C015A00031B25471C020000020000003842494D0425000000000010C75D17E574B56EF5DBBE3994C0E9795C3842494D043A0000000000D7000000100000000100000000000B7072696E744F7574707574000000050000000050737453626F6F6C0100000000496E7465656E756D00000000496E746500000000496D67200000000F7072696E745369787465656E426974626F6F6C000000000B7072696E7465724E616D65544558540000000100000000000F7072696E7450726F6F6653657475704F626A6300000005682168378BBE7F6E00000000000A70726F6F6653657475700000000100000000426C746E656E756D0000000C6275696C74696E50726F6F660000000970726F6F66434D594B003842494D043B00000000022D00000010000000010000000000127072696E744F75747075744F7074696F6E7300000017000000004370746E626F6F6C0000000000436C6272626F6F6C00000000005267734D626F6F6C000000000043726E43626F6F6C0000000000436E7443626F6F6C00000000004C626C73626F6F6C00000000004E677476626F6F6C0000000000456D6C44626F6F6C0000000000496E7472626F6F6C000000000042636B674F626A630000000100000000000052474243000000030000000052642020646F7562406FE000000000000000000047726E20646F7562406FE0000000000000000000426C2020646F7562406FE000000000000000000042726454556E744623526C74000000000000000000000000426C6420556E744623526C7400000000000000000000000052736C74556E74462350786C40520000000000000000000A766563746F7244617461626F6F6C010000000050675073656E756D00000000506750730000000050675043000000004C656674556E744623526C74000000000000000000000000546F7020556E744623526C7400000000000000000000000053636C20556E74462350726340590000000000000000001063726F705768656E5072696E74696E67626F6F6C000000000E63726F7052656374426F74746F6D6C6F6E67000000000000000C63726F70526563744C6566746C6F6E67000000000000000D63726F705265637452696768746C6F6E67000000000000000B63726F7052656374546F706C6F6E6700000000003842494D03ED000000000010004800000001000200480000000100023842494D042600000000000E000000000000000000003F8000003842494D03F200000000000A0000FFFFFFFFFFFF00003842494D040D0000000000040000001E3842494D04190000000000040000001E3842494D03F3000000000009000000000000000001003842494D271000000000000A000100000000000000013842494D03F5000000000048002F66660001006C66660006000000000001002F6666000100A1999A0006000000000001003200000001005A00000006000000000001003500000001002D000000060000000000013842494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800003842494D040000000000000200033842494D040200000000000800000000000000003842494D0430000000000004010101013842494D042D0000000000060001000000053842494D0408000000000010000000010000024000000240000000003842494D041E000000000004000000003842494D041A0000000003670000000600000000000000000000012C000001E00000001900790039002D007000720069006D0065002D0032003000310039002D00640069006D006100670065002D00300035003000390000000100000000000000000000000000000000000000010000000000000000000001E00000012C00000000000000000000000000000000010000000000000000000000000000000000000010000000010000000000006E756C6C0000000200000006626F756E64734F626A6300000001000000000000526374310000000400000000546F70206C6F6E6700000000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E670000012C00000000526768746C6F6E67000001E000000006736C69636573566C4C73000000014F626A6300000001000000000005736C6963650000001200000007736C69636549446C6F6E67000000000000000767726F757049446C6F6E6700000000000000066F726967696E656E756D0000000C45536C6963654F726967696E0000000D6175746F47656E6572617465640000000054797065656E756D0000000A45536C6963655479706500000000496D672000000006626F756E64734F626A6300000001000000000000526374310000000400000000546F70206C6F6E6700000000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E670000012C00000000526768746C6F6E67000001E00000000375726C54455854000000010000000000006E756C6C54455854000000010000000000004D7367655445585400000001000000000006616C74546167544558540000000100000000000E63656C6C54657874497348544D4C626F6F6C010000000863656C6C546578745445585400000001000000000009686F727A416C69676E656E756D0000000F45536C696365486F727A416C69676E0000000764656661756C740000000976657274416C69676E656E756D0000000F45536C69636556657274416C69676E0000000764656661756C740000000B6267436F6C6F7254797065656E756D0000001145536C6963654247436F6C6F7254797065000000004E6F6E6500000009746F704F75747365746C6F6E67000000000000000A6C6566744F75747365746C6F6E67000000000000000C626F74746F6D4F75747365746C6F6E67000000000000000B72696768744F75747365746C6F6E6700000000003842494D042800000000000C000000023FF00000000000003842494D041100000000000101003842494D0414000000000004000000053842494D040C000000000BD700000001000000A000000064000001E00000BB8000000BBB00180001FFD8FFED000C41646F62655F434D0002FFEE000E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108006400A003012200021101031101FFDD0004000AFFC4013F0000010501010101010100000000000000030001020405060708090A0B0100010501010101010100000000000000010002030405060708090A0B1000010401030204020507060805030C33010002110304211231054151611322718132061491A1B14223241552C16233347282D14307259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7F711000202010204040304050607070605350100021103213112044151617122130532819114A1B14223C152D1F0332462E1728292435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F5549249252924979875DA6FEA9D47A86565655ED65393663D6D6DB632BA2AA3633F434D0E67AB7E5BBE9EF4FC58CE497082078C92012680B2FA7A4BC46CAEA7D9FABD992DADBA7BB22E2E77F29DFA5F6FF656F740FAB78B998B6E4E55B90E1258D6B722F05863F9C3B6E1B95B9FC333431F1CE508FF0056E5C5AFF80D29F3F86390E38DE4AFD287C9F4F7381F5049795BFEA8E7D566E63ACCCA60E8CCCBAB3C4367D4B377B575DF505F9E3A564E1E7DB65B6E065D98EC373B7D8181B5DACADF6EBEA6CF57D9FC8F6283372C714448CE1304D7A0D9FAC65C2C9839A8E691888CA342FD61E99249250361492E67EBD7ACEC3C1A2BBEEC71919B4D763E8B1D538B5C7639BBEB2D76DDAE5B1D1AC7DBD3306EB097596E2D4F7B89925C58C25CE77E7235A5AC1901C8615B012FB5BC924920BD4924924A5249249294924924A7FFD0F55492492529798FDA2B775BEB1D3AF80DBF32E754E3C6F98DBFDA5E9CBC6BAD127EB07546830E1996B987CE55BE4717BB9650BA3C065197EECA32870AC9F3279631CB5C51BE19C7F7B1CBE64805DD2338B9EC2EA5D21DA765D2747CC0EB43B108B05835AC1D5C07EE37F3DCCFE4AC2A7ACFDAA914E453EB583DA44C3C9F22FF00658EFE459E9BFF00E12D4263319CF23A7DD171D4E2BC41246B06A7FB9AF5AA64671E0CF1E0C80571FCD8A7FD668F31F0EC7927F79E466242ECE1BE0CD0FEAC44BE67BB77A170241D8EEFD88FEB3513EA888775904CC752B35FFAD632E47A3FD64C9B721B8B9C0B9A4EDDEED6C612766E167D37D6D77F3B5DBEA7FA4F53FC12EB3EA8070B7ADB4F6EA2FD3FEB542CCE7B0CF154647C46BC51AF065E4CF17A8463D632908F06413FDC9BD124924A9371E6BEBB7F35D2FF00F0FD1FF5416AF4311D23A703DB129FFA862CCFAE401674C0448FB6D67E601705A9D17FE49E9FFF00856AFF00A86277E88F3608FF00BA27FDC87FD29B7D24924D675249249294924924A524924929FFD1F55492492529788F5FC815FD6AEA8C77D13956107C0CF2BDB978B7D66C517756EA6F03DEDCDBA0FCC2D0F84FFBA4FF00725F9C5ABCE988C404B694845AF7B5CD67AECD5CC1EF03F39A8832EEBABA0D8F80CB86CB881BC068DDB7D4FA5F9EC41C0BF7D3B5FAB99ED783E09ECA836A7D63501C1CCF84396ECE3131A3BF43E6E6E1C871CC83D3FE747B3D07D5CE9EECDCDBB3DC09AEB700D27873BE9BFF00EF8BB1FAA5FCF75B1F9DFB45F27FEB58EA87D5EC618FD1E968105C4BCFC5DEE5A3F553F9DEB7FF00A72B3FF3D632E779DCBEE64DEC0F4C3C218BD1FF0039D910E099801423EB9F79E5E63D7C47FB98E1EDBBE92492A8BDE6FEBA6EF4FA6ED307EDB5FDC277FF00D05A9D24BC747C23580E78C4AF6B49804EC66D05D0EDBFE6AC9FAF1FCC74DFFC3D4FFD52D8E8FA74BC0FFC2B57FD4313BF4479B047FDD13FEE43FE94DAD40FACF5B00BBECB73F6B5AE74B9A3786ED7DC21BF41F67E93D0FF00C1959FF2C3F1F29AEF46ABCFA8DC47B248FA2D18F6DA2CFA2EF57D473EBFD2ABC926B3B94F6FD613EA80FA448BC545BAEA4B0E13B6BDBF98CF56BBBDDFF0BFF048D77EDD361F43ECADAC8101FEA38B4ED1BFDCD2CF53F49B99F42AFDFF00E42BE924A4747AFE8D7F68DA2FDA3D5D93B7747BB66EF76DDC889249294924924A7FFFD2F55492492529790F5823F6B75569FF00B9B7FE55EBCBC67AE5DB3AFF00556F63996FE557FE15FEE93FDC97E7169FC4637847F78396F6BA9B7D5671F9C3C42B6D69CA0C14FB9CE3B5A3B99FCCFEB2AEE783CA974FCA3D3F3AACA68DCC63A4B7C0F1BDBFCA67E6ADE94AC1ADFA79B9F080998F11AA2013FD4EAFA37D5ECB665F47A2C69D5A035E3C1CDF63FF00E935687D53FE73AD7FE9CACFFCF58CB96E9D9ACC3BDF9547BB072CEEC8ADBA963CFF0087AC7E731FFE11751F545EDB0F59B18439AFEA3639AE1A820D38CB9AE6F19864DBD37230FEECFD5C3FDEC6EF48890E23F3931193FBD18CBD7FDCC9FA2F4092492AEB5E67EBCFF47E9BFF0087A9FF00AA5B3D274E9B823FEEB57FF52C58DF5E7FA374EFFC3D4FE55B5D2C7F93F0C7FDD7AFFEA589DFA23CD863FEE89FF721FF004A6DC4924935994924924A5249249294924924A7FFD3F5549249252978BF5CC675FF00587AA86B835DF6CB1AD0675265FF009BF476B2B7B97B42F14FAD597FB2FEB4755C7CB6DF51BAEF5EB34E81F5BFDEC7EE2D77F537B7FF004A56ADF2190433126423E922CEDBC58399871400ABD7A357EC6F2F2C363667DA7F79A031CF7C8F67B1B6B3F3FF00EB9F9E80FF00658FA9E412C7169238D3C156B3AD53B89A2CC86871DCFDE26483FA3FA0D637DACF6ED41FDA5438973CD85CE325C586495A839AC77672C3FC68B50E13D212FB0BB7D3FA8BF0CEC74BA83E1CB67F77FF0022BD17FC5DBEBB3A6F50B2A20D6FCFB4B48E23652BC8E8EA9802D67DA3D6346E1EA8ADB0FDBF9FE9B9FB99BFFAEBD5FF00C57349FABB6E436B7D7464E5DD6E37A9F48D5ED631EEDBEDFCCFCD553E239B14F1C7824252E2B3C26F4E1936396F707A663D23E5E21EAFEEFF0075EC12492596DA798FAF5FD1BA77FE1DABF2ADCE99FD030FFF000BD7FF0052C581FE302EA68C1C0B6E7B6AADB9B54B9E434733CB96FF004E118589FF0010CFFA96277E88F3618FF3F3FEE47F3936D24924D665249249294924924A524924929FFFD4F5549249252909D587407B5AF89DBB849828AA966F4AC4CDBABBEFDFBEA6B98CDAF2D1B5F1EB30B5BF4DB76C636CDE9293FA15FF00A3AFFCD1FDCA2598ED706B9B507188040075D02A6CFABD82C7B2C0FBCBD85A771B5C4BB63BD467ACEFF0DEEFF096FE9BFE1159B3A6E35B636CB017399B76F1A6D78C91B74FF4ECA9EFFF0088A9252414D4E1A57591C703B69E08A03811C000440541DD0F09CCDAE3648B2CB43C3CB5C1F6BBD4B1EDF4F66DF7FD15630B031F058F663EE0DB1DBC8738BA0C06FB777D1FA2929B2A81EBBD25A2D2EC86B3D073D9607020CD45CDB76B5C3759EE63FF009BFA6AFA13B1715E21F4D6E13BA0B41D4EE3BB8FA5FA4B3FEDC494D0CBEA9D02DC7032EDA6EADCD160A5E0584F71FA087BF7FF002766F52775EE8B5B2CB4E4B00AC12E2012486B596BBD2DA3F4FB596B3F99F53FF03B15A3D3F00820E3544176F20B1BAB8FE7FD1FA7FCA513D2FA6199C4A0CF3FA366BFF47C92550DD6C9EAB8188F35DF6EC70AADBC8DAE3FA3A7F9F7FB1AEFA13F47FC27F83513D67A5340DD955B658DB4073A0ED70DCC743BF79AE562CC5C5B0CD94D6F22402E683C997723F392FB2E3401E8B21B1B7DA3481B5B1A7EEA4A5E9BA9C8A9B750F6D953C4B5ED3208F8A228B18CADA195B431A386B440D7C82924A5249249294924924A7FFFD5F55497CAA924A7EAA497CAA924A7EAA497CAA924A7EAA497CAA924A7EAA497CAA924A7EAA497CAA924A7EAA497CAA924A7EAA497CAA924A7EAA497CAA924A7EAA497CAA924A7FFD9003842494D042100000000005300000001010000000F00410064006F00620065002000500068006F0074006F00730068006F00700000001200410064006F00620065002000500068006F0074006F00730068006F007000200043004300000001003842494D04060000000000070004010100010100FFE10F6C687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B633964223F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F726520352E352D633031342037392E3135313438312C20323031332F30332F31332D31323A30393A31352020202020202020223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E7323223E203C7264663A4465736372697074696F6E207264663A61626F75743D222220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73744576743D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F5265736F757263654576656E74232220786D6C6E733A64633D22687474703A2F2F7075726C2E6F72672F64632F656C656D656E74732F312E312F2220786D6C6E733A70686F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F746F73686F702F312E302F2220786D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D704D4D3A446F63756D656E7449443D2261646F62653A646F6369643A70686F746F73686F703A37353137346166322D633837372D663734362D393661322D3462383534666664623437622220786D704D4D3A496E7374616E636549443D22786D702E6969643A34346666396465652D613430382D393034662D393933392D6539396633343066663133302220786D704D4D3A4F726967696E616C446F63756D656E7449443D223435384437354533443246323836414634323639363432363746454441303838222064633A666F726D61743D22696D6167652F6A706567222070686F746F73686F703A4C6567616379495054434469676573743D224344434646413744413843374245303930353730373641454146303543333445222070686F746F73686F703A436F6C6F724D6F64653D22332220786D703A437265617465446174653D22323031392D30352D30395431363A35313A31342B30383A30302220786D703A4D6F64696679446174653D22323031392D30362D32365431343A34383A35362B30383A30302220786D703A4D65746164617461446174653D22323031392D30362D32365431343A34383A35362B30383A30302220786D703A43726561746F72546F6F6C3D2241646F62652050686F746F73686F702043432032303139202857696E646F777329223E203C786D704D4D3A486973746F72793E203C7264663A5365713E203C7264663A6C692073744576743A616374696F6E3D227361766564222073744576743A696E7374616E636549443D22786D702E6969643A64346535373462332D633061302D303434312D623262362D646434333436663232643839222073744576743A7768656E3D22323031392D30352D30395431363A35343A35322B30383A3030222073744576743A736F6674776172654167656E743D2241646F62652050686F746F73686F702043432032303139202857696E646F777329222073744576743A6368616E6765643D222F222F3E203C7264663A6C692073744576743A616374696F6E3D227361766564222073744576743A696E7374616E636549443D22786D702E6969643A34346666396465652D613430382D393034662D393933392D653939663334306666313330222073744576743A7768656E3D22323031392D30362D32365431343A34383A35362B30383A3030222073744576743A736F6674776172654167656E743D2241646F62652050686F746F73686F70204343202857696E646F777329222073744576743A6368616E6765643D222F222F3E203C2F7264663A5365713E203C2F786D704D4D3A486973746F72793E203C70686F746F73686F703A546578744C61796572733E203C7264663A4261673E203C7264663A6C692070686F746F73686F703A4C617965724E616D653D22416E63686F203A2037372E33206D6D222070686F746F73686F703A4C61796572546578743D22416E63686F203A2037372E33206D6D222F3E203C7264663A6C692070686F746F73686F703A4C617965724E616D653D22416C74757261203A203136332E35206D6D222070686F746F73686F703A4C61796572546578743D22416C74757261203A203136332E35206D6D222F3E203C7264663A6C692070686F746F73686F703A4C617965724E616D653D2250726F66756E6469646164203A20382E38206D6D222070686F746F73686F703A4C61796572546578743D2250726F66756E6469646164203A20382E38206D6D222F3E203C2F7264663A4261673E203C2F70686F746F73686F703A546578744C61796572733E203C2F7264663A4465736372697074696F6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203C3F787061636B657420656E643D2277223F3EFFEE002141646F62650064000000000103001003020306000000000000000000000000FFDB0084000604040405040605050609060506090B080606080B0C0A0A0B0A0A0C100C0C0C0C0C0C100C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010707070D0C0D18101018140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC2001108012C01E003011100021101031101FFC4010000010002030101010000000000000000000006070304050208010101000203010100000000000000000000000304020506010710000103030204030605040301010000000102030400110506073050123231333710211314340822153536174070231620242780411100020102030305060F0C060806030000010203000411120521130631412232B25142727314741030506171915262D223B3B41575B52081A1B1D182A23343939436C192C2243466406383A3D395167670805344658525C54612000003020A070505080301000000000000010211121030502131223272B203206142528292D2F0819162134171A2C2A3708051E2233393B3F27383C3FFDA000C03010102110311000000FAA40000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008CFB87CA963CD4B9865AB7F1CB5F159D4F879B3879D583DE4D9C7CFB93CF263ACD87D55158F4000003887CD97395FA02B6FE4785BDB00000000000000000000000005059451DED66E743B1FDC6588753F34C92EA736385A5CED9976B6D555D1EA231772EDD2B912D3EDBEBAE3BA89479280000212F690BDC1DC35BAA9EC5B1CE0000000000000000000000000F9E338B6BA0DD46EDE500EAFE639B3D66EC506F458DDBC8F4FB9845E3DC35F38F956A1816BF6F7CE87A39579200000210F69BBBC2DAB5FA59FC5B4CE0000000000000000000000000F9D648B6EEF6F1DDDEAE05D57CC76B3D158BA5A1FAF3B94B6D37D4747E3D8F426835A4C2074365746A7792AF2400000421ED377785B56BF4D3F8B679C0000000000000000000000001F39CB0473A1E866BAADED79D6F1517DEF0531A3A4966BB0CF86520A1BA926BB7D922BDA915FACEA5DB9B0A12AF2400000421ED397785B56BF513E8B639C0000000000000000000000001F3A4B5AAEFA268ECEE17EAB9EDA09D4713C0DBF1B23ABA6976B73976B369B914DB70D8CD1D9AEEA6C6DFA17A55E4800000843DA72EF0B6DD6EAA711DFCE0000000000000000000000000F9CE5AF57FD3F86C9A9EB6D4E3BE8DEED7B14DEF3F19DDF13925E6A47473986A37B28D75DF326BA054EE5C7AADDCBFC9400001087B515DE0ED6ADD6CDE3BD9C0000000000000000000000001F39CB5EA8FA8F11FB865BD476D2FE73BDCB1EDB3588F99B1E7237BAE231CFA9EC53B76DF25DCC3AA6B6E1D66C265E4C00000843DAB6F7016555EC2711DECE0000000000000000000000000F9CA6AF50FD4B8CE8475F43DB5BD0BB1A9E8F4E2DE6D6367BB1670AE9BE7B8AE6B2CCE63A5DDE43A9B62BEBA65E4C00000843DAB6F70165D5EC26F1DECE0000000000000000000000000F9C65829CFAAF21BD856DA8E2E5E577A3143DAA5B8D8ADBAE14B53A59C71EDEF316FF0011F41F3CF5BB621D7CC7C9400001087B545DE0AD0ADD7CDE3BB9CD4364F40184F07906C9E800000000000000003E70960A0FEABCFC931D5EEE15CF78766EECC51EE54DBFAD7DFE8C99F432D7DC9C07D261F77E7F6E6BB632EF2600000425ED3D7785B66B759378EEF34A58ED1BA6B167914386633B07548B9FA4A898000000000000000F9C6583E76FA9E93A79D594C5A9DAF22E259BDA59C9DCA16B5AA6C36FCD9DCFCBECE654F515DA85A9AEDACCBC9800001097B555EE02CDABD8CDE3BB9C0000000000000000000000001F39CB5E94FAA729C2F2FC9BDD57663A9EB38F8366FF004E858E4E59CAF5BD4FD11C3EF3D6C7E7F5C6B7A0B6ABC92CF2500000425ED3B7785B6AB757378EF6700000000000000000000000007CE92D6ACBEA7C14532DD6325B86A76318B4A49FDD5BBCE9E1B2B9BFA15D3CCFB8EFF195BF3DDA5B93D09579200000212F69ABBC2DBD5BAC9B477731FA0000000000000000000000007CE92D6AFBEA3F3BE149B08F63B4EEFBAEEA475B330D38B65825AB6F715F5BB4759A6F16F99AD79AED6DABDA79579280000212F69ABBC2DC15BAC9A477731FA0000000000000000000000007CE92D683FD43E71CACED7073D8E8F9664986AB6B18F571B383D5D9C07D82C4ADA1F36B435AF35D75B3B0D24ABC9400001097B4CDDE16E2ABD64CF0BB9C0000000000000000000000001F3A4B5A0DF4EF9E68492F2E4B1CB5EFDF3DEFC7ACF5E39D8DDB578DFA45B7A77EDAD0D69CFF00456D5ED24ABC9400001097B4CDDE16E4ABD64C70BB9C0000000000000000000000001F3A4B5ABFFA7701AB949A594BA9949CF5CD8C62ED6343AF4B75AF5F61F43F03DEEDDEE76B5D5ECADA974D2AF2500000425ED337785B96AF5930C2EE700000000000000000000000007CE72D7ACFE9DC379F1AD97B8BD975D37396773D82DCD1F41C49EBCCB8FECEC1AD8D731436EE3AA9579280000212F698BBC2DD157AD97617331FA0000000000000000000000007CE52D7A87E9FC5678F2C4F3C7B978F73C5E4DA394B37A7B69FEAF73169F436AF0DF408B67ABB7F0D4CABC9400001097B4BDDE16EAABD64B70BB9C0000000000000000000000001F394B5E97FA771B963CFF71797BE7DF4931FB262CF29F6BFA29553B3CF8E864E3BA4BD9A59579280000212F698BBC35D757AC95E173380000000000000000000000003E7296BD27F4BE43CE3964C72FDC7DF07AF72F7EE58B2F7267ECEF5FD3772BCF17D655FA739A9255E4A0000084BDA5AEF0D7754EB2558DCCE0000000000000000000000000F9CA5AF4DFD1795F584BE4C9865E71F75F3F3CC98FBC9E32F32489C50E975F4573E9BE6EBCABC9400001097B4B5DE1AEFA9D64A71B998FD0000000000000000000000003E7296BD55F40E67AD5ADEABDE7E78F6EACDC59A3E1D9AF9B3F3DE787E678FE66E8F3DBFFAFF0091B92AF2500000425ED2B7786BC6AF5928C2E6700000000000000000000000007CE52D7A8BE85CBE686C6AF9EF8F32C98E5A5961AB9E3FBEF9933C32E787A93CC7A4D97DA5C76E655E4A0000084BDA52EF0D79D4EB24F8DCCE0000000000000000000000000F9D328691EEB9CEB67979C7DE3CB868E788C98E5EFCF5EE3EF2C66B4E7E069F67F6073F7657E4A0000084BDA4EEF0F7B54EAE4B8DCCE0000000000000000000000000AF7D8FE18CDF999E3F3D1EBC7E9F87E83F1E4C637DE18E7B4F4000010B7BF33DDE33EA0ABD34970B99C000000000000000000000000188E77B868BD000000FD79D9F32CAF72800000F04165D5CCE3D87BF24CE0000000000000000000000000D63D000000000C66D800000000000000000000000000000000FC07E988C80C4650734FD360DA00000FC2B03AA710EB198E41E0FC32964158120364E41E89012300000000000000000000AB8C06039C77CB008D980E312C21E689651DD001A06238C64360D53118CD924671C1B86B9AC750E88000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FFDA0008010200010500FEDE814CC771CA561E504AE23A9A671921CAFC86657E4532978594908C7BEA57E472EBF2199470730538DA92AE1040A7000791817A84CA7A664F150F1CB74B2C25B17A52AC26CCEA532F96D6CCF6D7417460B45CD4AD24B4AF1E0834F77723478CA965231F1C5329B055758A795712814AC281A29A43CE2293917856526B8EB478429EEEE46DF8CABA5D8322985DC3C0F4AD441EB3525AEA0A05243B6A4BA93574D4FB741E10A7BBB91B5DD98866F11FB1852A90A0A1263D14DA8D3ECD291441A5134E1551E10A7BBB91B5DD318F88896C16D51255439A292E2554F46A719BD2DE5A0ABA154A6ED45AA96DD9278429DEEE46D771F719F042E9F8EA6551E55479A45332C1A5B495D3F1CD9DC6DE94A5B65242AA70FC078429DEEE46D77115E352620507F1A014B0E229B9045313C8A62485D2A3A555262254997194C2E5B9D4D2BC78229DEEE46CF75285034E300D3AC74D1436E57E5EAA0B5B2A88F75A549B8CA2416DE57B95E3C114EF77236BB88A3EC14EB37A5C7BD068A4C96C29AC69B0EAB0CACC492B04A0F0853BDDC8DAEE0688A342929BD3AD814B45D734D8C3F7566267C269054EAE580107849A77BB91B5DD43DF445BD8D1A77B5AF3263375362D59B97F11711AE94CCED578F0453BDDC8DAEEF1AF0A50F6215627DE126CE3E2E1E73A12AFF2382A63DF8F8429DEEE46D77034450A23D885D2FDCE1F78C93B64B03F15E9E5F5493C214EF77236BB81A1EC23DAF0AFFF0032AEFE28F57A4AAF238429DEEE46D77503ECB51146942E07BC657DCEB07DC4FB99F3B8429DEEE46D77524D0F61A3EC41B1D40C1438CAAAFEE6C59FE10A77BB91B5DD40D0357ABD1F64973A0E5E3090C34AA49B85A2CEF0853BDDC8DAEE340D5EAF57ABD78D4E5952A0BF598865879B5DE9D1EFE10A77BB91B5DC6AF57ABD5EAF40D4B66F452526434996DB8DA985ACDC70853BDDC8DAEE346AF57ABD5E81A069F63A685D266C244A42DA5B4AE10A77BB91B5DD7A346AF57ABD5E81AF7283CC949170735D2A6B8429CEEE46D7738E25012FA0A50F2574EBE84529F4A421C0A00D5E81AF7283CC94D663CAE10A73BB91B5DCEF7BE7DE16AEB6CFF910542A39340D0340D0340D67DA0967849A73BB91B5DCF37D55F2F7086882E344A8C7B0437D22AF40D0340D6A03FE0E1269CEEE46936A62407D050E901B77A5B4A80B55A88AB7B054D69E5A72AF90C9E10A73BB918A4B8B457CCBB5F32ED7CCBB5F32ED7CCB95F32E57CCB95F32E57CCB95F34ED1249E1022EE77724BD5CD5EAF57ABD5EAF57ABD5E89E1879544DFFF00AFFF00FFDA0008010300010500FEDEAD56A0C15523A14B6F16E2EA5C6F9707251057E67128E5A18A5E4E2240CBC335F9AC4AFCCE21A42C74F040A5BCA221BAA5B7C8FC5C92F96D38BC67427259F662A72193764A8AAF4A36A662921F8E1C41696DD05035F3AB0DE9D70FC467B7803C64A6CC62CDD9E463CCC7C0EA393905299AE152D66BE20AF882F1C85B6B6CA68394A8EDAE8E39B35848A1B79AEDE00F197E5627C9E469F322805BC8C5EA1918C50B9293D2055AB1F2BA08B2C2A2F552A1AC57C37056282BE2B5DBC01E32FCAC5793C8C9B2F093D2E21E6EE3318DEB1218282F325040BD004543956A6DE14DAD269A4A4D38DB610D76F0078CBF27162CCF2373C70792F82A8920389911C2865F0E5552212914E30534D281A1012A082E2290FDE912D42A1C92B5B5DBC01E32FC9C6F93C8D7DC83D2711992D545948792EB00D4DC5A5753F0EA417A314966596CC798DAE8C06DCA9119C64E28DDD64FE1E00F196AFF001E3BC9E46BEE7134DAAA0E51C8EA819D0E8129A59762A5553F06972A76256C931AA24F718545750FA23C331E4B1DBC01E32BB71DE4F235F7788F0285050EB5366065FAA9B98F3549CEB74F25A928C833F096EA3A93A6895B729B14C76F0078CAEDC7793C8CF73A8E92B17A0AB5255D63B0C59AA4507FE222138A4C9CEB60951B0D35885B31273C90E33DBC01E32D27A31FE4F233DEE22E1D474950BD34E58A91D41AB8A65DE863122F5906FAEB0B8C12A5E4E6A19443794EBEC9FC3C01E32C8F858FF27919EEF710FB770A162A1519DBD2BDCA70FF00D7C5BC025E2023011FE0B79E9BF11CC6798C76F0078CBEDC7F95C8D7E31247B8FBC496ED445255D254AB806ECC472CA08F8824B818656A24E3A304B0D76F0078CB03E163FC9E46E78B2BB532EDC3C8EA0458A934CAAE1B3FE2695638B67AAB36BB208A6D1D311AEDE00F197E4E3FC9E46E78A0D30E5A92AB892DD89A1EE31CDE927DF8B6ACD668DE822E6426CCB5DBC01E32FC9C7F93C8DCF14D36699729690A0B4149351D76245958C378D944DCB68FC733CB6BB7803C65F938FF002791B9E2052452156A6DCA79B0B045A926969EA469893F162E41AF7A5BB2E6794D76F0078CBF271FE4F2373C6D49A14936A42A9F66F44562501D4E0661892A7357A75AB1906ECB5DBC01E32FCAC7F93C8D7DC0574D0A149349553CC5EB110C36DE5E2915859E25C792CD8BC7FC4D76F0078CBF2B1FE4F235F70145356A029349A06B172024AD008656E639F6DD4496E5A3A52D76F0078CBF2B1FE4F235770140574D5A80A143D90667C50F349588721C82E4B7DB79A6BB7803C6579503C9E46AEE0280F65AAD56A1EC4ACA4C39897D2E36141964B6A6BB7803C6579503C9E46AEE69B2A2595052DA5229B694AA4B2A254D949B7B0D25452614F4BC1429AEDE00F195E540F2791ABB99364B1E0A00A1570D902CF817B51147DB8F98B70B5DBC01E32BCA81E4F2357732E74D7CC7BD6F021A780097FDEB5F51F611447B317E6B5DBC01E327CA81E4F23B5D6E35F056971B145C45D64123D80FB0D115196DA4C36C1719EDE00F193E5C0F2791AC7BFF0002EBE5D15F0515F0515F0135F0135F0135F0535F0135F0135F011448A48B0E027C5D8AE29B81E4F242849AE84D7426BA135D09AE84D7426BA135D09AE84D7C34D0481C35625B25B6D284FF00F5F7FFDA0008010100010500FEDEEE06B7C7E8DD39377AF76755E61DD7FBB8D3AC6B5DE59024EBCDDF8D4371F76949FE42DE3A87AD37B25BB2B27BFB162AF5E6EFA2BF9077768EE06EE8ADACFB8DD511B3095050E06B1D428D39A5DFDEFDD877506DC6A497AA74584ADB99C8BEE5724FAA49C444D278889A766E4656572B8FC7B521D7A5BC96FA447654EAF46E964B113258A67218ECE68DCDC152D9710A6758EA3670791658FCF36C9F7DED05C0DE8514ED66031ECC8DDDD88742B6FD7F5FC8BEE44819F722B5365EA5C9BA2A4BAA5BD1D268C37AD8C8A50FE9971A7F16EB0E3652F8152B178A981ED0DA5DC3BA1A530F8946D87EC4E06F5FA55A57D54D86FD82BFAFE45F72C6D9AD3EFA24E3F5063944CE654D3D8675B12A234C3AC18680AD3F9054575879B7DB7A12174F457DBAF98712777DF0E44DB0FD89C0DEBF4AB4AFAA9B0C3FF3D5FD7F22FB9C2465347EA24B5272B092EB59EC4AAE42D8734EEA00A4B4FA1D08B8388C92934D494A92A28507E2249DE364A23ED87EC4E06F5FA55A57D55D854B836E97F5FC8BEE6FF550F8833B49679B96CE5F12163378176E599119785D481550B36966A1E3F193E3B47211699989700955BD2EA570B6C3F627037AFD2AD2BEAAEC5FA66BFAFE45F739EECA396799C2E44C777099F6F209C86292AAC96050A3330CEB4A81999B08E2F2ED9771FB8AB62997F19928EA2EB55BC07FEAED4BDF1B41F037AFD2AD2F11C4EE3EC57A64BFAFE45F73BFA9C577F1CA685B1598532DC3D45968ECB7ABB09394EC58EE097848CE8C9415C2546D472D8386CECB8D2B4DEA08D9CC6EF0B65B63683D3EE06F5FA55A6BF79EC4FA60BFAFE45F73BFA9DFA5C490E36F21C8EE4098E255F062E6909919EC338DEB78D51DA8B998595C5AE1C984FAE3C8D1321717516F3A2D03683D3EE06F5FA55A6BF796C4FA5EBFAFE45F741EEC8C47D2FA232CA0ADA4B89790E467A3CC2B6E0EA50A4E471785950B4CE70C3C9EA07D1294CB65E7F48629DFCC379D44C0DA56D6DE81E06F57A55A664B275DEC4FA5CBFAFA772F8A6A0A1C6D7FF099361428F3F298CC736BCC6211332398C46312D3ADBADFF4FF00743F5F12529B5C37D1210CA8A4CD8A1D69321C8EEB8F2497243E74F6021A3A722A4846DF61C4B99888262C6DE6491036ADD439A1381BD5E9569665D1B9BB13E962FEBF58E6DFC1E98186D47A5B4BCE7E5273F92D6F949F037433F9CD3D1B2721930B7E70D0F25B57B9CBCAC0D71AD27B3264EE04DC0C9773796D42ADA9D4C355E26B372B58393B6EA565D6BFE93EE805F207ADB731B2CA16CB8979A6540A7370BA568EA5333DABE9BC6643E0210A5CAAD01A6130B1A5900EF67BA06D07A7BC0DEAF4AB4DFEF4D8BF4B57F5FC8BEE705F2B9BC57E3415B4BC2CC0B0836549652FB0DB5F0DD67A9CD3E1043FA631C646431ECA58877ADEB3FF00436B9294E84E06F57A55A59D70EE6EC5FA58BFAFE45F737FAB4E602AB250FA1CC6C82CBED3816DB2E564A300B85D3F22EA007340430B90D8B4629F76F60B43DB0FD89C0DEAF4AB4B7AA5B183FF002B5FD7A471C9B0FE8BEE6BF5692D5EA7C6EA0FB2A69CC34C0E3495105603ACC33F0E4BA9B8DBF8804200066D5BE03FEA6D87EC4E06F57A55A5BD52D8F16DAC5FD78F1E31FE8FEE67F57753531B153E37508EEAE3BD15F4BCDB6AB54C4A90A2B0A46DF292AC378B691F8B7C3E8F6C3F627037ABD2AD2FEA96C90B6D6AFEBFDB7ABFF5DF735FAC3AABD4AF7D4845EA546F7C094A616DB895A576500D29B1B51944BB8C615D6C0F71DEFF00A4DB0FD89C0DEAF4AB4C7AA3B282DB5CBFAFE45F737FAB38E5C3AAB874034F357A7DBE938F9C5B52161430786194674865DCC06A5C5BE16C93EFDF0B7CA6D87EC4E06F57A55A67D50D9716DAF5FD7F22FB9CF7651B90154E2C52D572A34EB6141E6D48540C8A915B7D1E3C6C6EBDD3B65ED9EA9F9EC6A9E0A4EF5A82A06D87EC4E06F57A55A68FFE9FB322DB5EBFAF1C8BEE77F536DF295176E0AE8AA89A7501616D942F456A1534112589AC3B026E9FCA699D41172B077A0110B6C3F627037ABD2AD39EA6ECD8B6D82FEBC722FB9EFD4CAAC50EDC75D1557555E9C4021A5A9A734EE7CC94079896C473370F3B71F50C6CB62B6C3F627037ABD2AD3BEA5ECF7BB6C57F5FC8BEE7BF5259F785D8872E3AAF455EF4AEAF70B454492EC67B0B9A6E5B49790EB7ABDAE899B61FB1381BD5E9569FF52B683D325FD78E45F73DFA941C64FC94B9380CCB192C9E1B2D895E270798CB08B84CCCC9B361CD812D0BABDC2935125BF15EC367589C8D5ABEA91B61FB1381BD5E95607D48DA2F4D17F5E2AE6FC83EE7BF52C6DC60B0286FE4DE8B8C181CDA7A34B645A80E8D57F2A9505DA92E50503453485B8DA9ECF3F3A76D87EC4E06F57A5582F51F697D355FD7F22FB9EFD4B1B934C1715A9BE14AC966E3BD12066E235006A92F3F94CB7CFB80D0511495D2577A36B329B67F6C3F627037ABD2AC1FA8DB4E2DB6CBFAFE45F7451E4095A7F358D911CE43493726564B4A99F967A0BF34855006924D58D7BE92A50ADB6CFE8AC44DD4595D3B90DCFDAD5257A0381BD5E95E1481B89B542DB70BFAFE45BCFA1E6EA8D2D2749E721E54E96D655FEABACABFD575957FAA6B1AFF0054D615FEA9ACABFD5358D7FAAEB2AFF55D654AD33ABD09D9FDB7D499FD518DC745C740E06F1A14BDB18DAF708DEBFDAC494EDDAFEBF9125D2646534AE99CBAFF008DF6EEBF8DF6EEBF8DF6EEBF8DF6EEBF8DF6EEBF8DF6EEBF8DF6EEBF8DF6EEBF8DF6EE86DBEDE563F198EC7477DD2DA380E368750BD93DB8549660B11E3371821DE44B6E409379F579F579F579F579F579F579F579F579F579F579F579F4E372DD1CB05CD5BDD6A93262C66ED405439B126C7B574D37A974D2E5C1D45A7B20FAF2D8A44FFF009DAB70F52EA185AC97B9190C7B1AE773B5341D1C75E1D3F8CCD6E7B98CC86635FE6E7E771BB8D9495A7F17BA92319A33596BECFB931E7E5A266EBEB2D578ACCEE2EA0CC42C7683D4D3A7EDF1DD2CF7C0CDEEDAE045D39AB646533DFD40F6EECE2F2BAB72D8BCEEA8D4D2345EA9CEE565E989DAC31B0B6EB399A99A82238C1CE2E1B59ADCCC4B905DD59AEA5C277586AE1937F3BA766EAC8F27087594A87A0B2191C9686FF87E4703F3E91A630B296E6D7E967F1BA8F6DB4CEA1913B4269E9CC37B67A5DBCA0DAAD268695B47A3CC197B65A5E564DE8487666734360B33366687C2CA56374D6271B863A3706597B6F34CBD0226031B1739FD4DEAF571571571ECB8AB8AB8F65C55C55FFBB9FFDA0008010202063F00FB3EA896878D24CE0139611552DE5160B9B2C58F8B2C34D25CC80E9267F7A4582E640B1F1658B1803AA275516C609A446076CA136BB6F0751B3643CAA030A1610784C73C1EA191BF79584256CACF3BC317DC9914BDE1C4869D3A270CC6629044AA1E8BE5914AF405A2D86714C672C8A9BC1A5A0DD39E2F96454DE1AC3C5C504F03484D4875642613C1DF17CB22A6F40D2A710F2E83483144F106E59F02BA83AA2609A91DF17CB22A6F40C313869550D2AC5A2EAC9E4EF6D243397CC08F5C597748A9BDA1306A4562715BDB22A9928315340C13D283065AE2CBBA454DED16940C15A90C0D06441ED717E122A6F69B35064135219CC088A2F96454DED357B8811C0CFC037DAA1DF165DD22A6F69F0C067092353D17CB22A6F69940641B02AEC5F2C8A9BDA647AE032854717CB22A6F69994065AE1577C5F2C8A9BD10641EF62A1545F2C8A9BD10930D2B569219019EA8BE591537A219BA1C30D2B0A81B17CB22A6F443C41A41D3B40D0A8CE591537A2750690F383428A2F96454DE8961C24A6567A2F96454DE0D51B081A9B54855368AC61A6731FC41A5396830C6A057A2F96452BC411EF5610A65A6E5B9E65DAF96B6EA6B6C8335FE99B9576AAED2B81EB3D40CDADA997FFA04BA4F2BF53CB51F0A7A653D5B488CB7E2F96452BC42637545654273AED79FDD76CBBDAB3CA0F28DF559DDF87CDB41E49B86C7687AEF2FCC09D374D3B569EBC2978F48AFF545F2C8A47AC129073ED74A85A9DA1867DB684F39E991659BBBDB21394B37B348DE5ED6F3BF0C5F2C8D319A6E8B4AE61695CC2D2B985A5730B4AE61695CC2D2B985A5730B4AE61695CC1A717E1F7FCFFFDA0008010302063F00FB3E699AB86A241A09E3527CCB15495CFF00983731A9E31695F545A57D516D5F5434D4A67FD45B57D51695F545B57D50F24DF445FABEB2DC2E1ADBBE986AA73ECEC89C38BFC411249ECC5D5427E6BA90D552AACBF307535961E59C2F1874562E983D36939EE4FF0090521B55D7A2C88A8F533540BB6CC88774BE61EA2A9C29DD0EA41E81304D04E92133C5DE0CC8CECF48F18A2BD9D8876DD4C8877538940980C1E830E198500DA5B23C628AF67621DB7532219F93A816B81A418643542C3D0234D2D1E31457B3B102911573A830EC0637F32606A431441A5409C350618A2E21340C3FC078C515ECEC40A4455CEA8092B3ABB2ADCFCA2680E60D490DD31389C353318AD6778708EF5628A66BCD57C60A4455CEA0D0C1E5ED6452F620C6BAAF341310D41A554C112E72DE0EAA85034ECBB5477AB1457F27F602911573A8320618F98399B3EEA8543F551B9B62BA5480D41BC180C81F90255ED1DEAC515FCBFD80A4455CEAD161D0196921A5ECD950A96411C0FAE6567D94F902728B652F2877AB14537D9FAB8C1488773AB4980CF78DD06A8092AB08B40D7B28275090A5AA950EF5628A66BCDC40A443B9D5A2C811795F283483518359DA5870ACA318EE1DEAC515FC9FD80A4455CEA0C3D1683BE9F9A04A7781996C90698F50E9529DE11DB7A29BAF37102E2C5222AE7568320618596A4E28127A8335C0821E315C59D88171629115FEBEAD06C27E628127E58525762CAF676205C58A4457FAFAB45901066B093F24040A2CAF676205C58D5222AE754412F8541CDACBAB09774595ECEC40B8B1AA4455CEAD26940BCB3FC083ABB2BFD35FCAAEDB303417BE2CAF676205C58D5222AE7569B483CD9D63D54F1026FEE22AAFAA022F34595ECEC40B8B1AA4455CEA88F4CE8558E90C30FA7F6D5D9D04B45019AE2CAF66E205C58D5222AE7544BAAFDC4FC5E60C32984D5B28C12D07ED8B2BD9B8C171635488AB9D51246568879CAD27E60C30CD98B2BD9B88171635488AB9D41841DF689C4C185EC0C3D02524EB074EAE662BB1857B37182E2C6A911573A82BDC08CE8ACF04B2B561C6A066734C9E604CA19A4E2BD9B71657F37182E2C6A911573A84E4D213155DD0C493A418A27881BC4D231314DA47762CAFE6E305C5895221DD069510A034884DA66F9341AD24C431D8B2BF9B8C171629108CA9214128592E5164BC0592F0164BC0592F0164BC0592F0164BC0592F0164BC03A9A708645266ADEA2DE4F93315D940B8B148B390A05028140A05028140A0504268B6BD9975FECBF8812524C4A7EF7FFFDA0008010101063F00FF00C3D9B57BA469DF32C167689D79EE24D891AFB387F56AEBC866BB8A0858A793E972793431E07AA6725731F5CB5342F75ABEF17ACBF4B63873F287A262975761CE7E9723F1C95F1D71AB27FF006E4FE2928E4BBD5B1E63F4A1F875FE3F55FF00991FF8942386EB56958F7A354CBF87795E5538D59203DF7D32A7F00971AC1AE357FF009B1FF8958794EAFF00F353F0EB1F2AD6011B461AA17FC19F6D7D19C5424BBD383A25C4B30C2EAD848C144A4FED220C7A74083883B411E93A96B6D135C0B081A510A759DB915462472B1AFA185B04D6A42AD15B237C488D943067652172E5EBB77B563ABDD8115CCA6449F727A25E191A27C311C99D5AA34DE3B2BC6E48620ED564039BDF7A8767A7A3155B4D3E7BD8D877B3DC4A9631BFB2826775F7D56965A7C08DB8509142EB996471D679077DB7A4D525FDF654DF319256032824F70732D793DA80EE361228BC871C79179AB0A08394D2DC3AE2EFB71F5A9ED58E50C3A2DDC34CC6D9A488724918CC30FBD4432953DC6181AFA11248BE8DCAC9BB30C45F06258FC615CFCA7DD56873C9182D737434F9F11D782E919595BBBEF6B446B890CB325B2C4F2372931131FF0067D27891872ADA123EF32D712CAC31F24D3ECA38FD6DE2A63F82A388291B8BDBE4CDCCD9AE5E5C47EF32FE6D43E2A5ED47EA19279068B17DAB054972F832A6C18F22A8E614D0424A46366CE7A20F250C062C687C5B61EC529CA797B951A8D8EAA31158AED1DCAC0EC3CE2BFBCDAC32FAECA31F6C513E4B931F72C6B862E6CA32B2B6BD691925B1E89590FF0045693E049F2CFE93C4BE66DDA5AE30F34D3BB2B43CFAF3E58D43E2A5ED47EA1C87B9A1A7DA90D4C80F4D5FA43D6236539A38D207E434A5547256200A1193803C868372F76B1C36F76B15388AC196B85D70DBFF005059F624AD27C093E59FD27897CCDBB4B5C61E69A77656A23EEAF6F0FF00BF61FD150F8A97B51FA877046D3F40AE03FF00B386924738432FC55C03DE9C70DBE09A2C0620ED14C42D6DC41076508A46C1D79BBB40A9DA6B1C3EFD052DB4731EE503E8620635C2C70FFF00A0B31FA125693E049F2CFE93C4BE66DDA5AE30F34D3BB2956E5C60AD777A633DD5F29718FB60D43E2A5ED47EA1CFF50AFDA70D348DFE166D92FBD3C81FE157D1B72DFDE621F14C4F5D39B6F3E14481B28B20E4ACC31057908A58A7395F98F31A537086680F2BA7580F639E96EF4CBB0E8DCE36E07B8C3ACA6B09A3DE463F691EDF6C5631BE3DD1581AE160397FEA1B33FA12D693E049F2CFE93C4BE66DDA5AE30F34D3BB295A6FAF35EFCF26A87C54BDA8FD43B8FA857ED386B6EDA8EDE59374D11FEE7747917FD5B91DEFB96EF3C0A169780437EA36A1C3071EE94F230A240FBD4705C0F3D12A2B772E3247DC3CA285C69F74D6777CE54E18F84BC8C2963D72D8A0E4F2FB51994FAEF1F28FCCA5BBB4952789B92E2161B0F70F70F855D339E3E690737842B85BB9FF005059F624AD2DB0CB94DC47878BB99531FBF97D27897CCDBB4B5C5D7848DDB43A7C017BECC2247C7D8C0D697E36F3E793543E2A5ED47EA1DCFD40BF69C3450F3F2566C311CF4B6D740CF660F40839648CF75186D5ACF049F4B58A8C483B2E231EF873F8542367304C7F6728C3F0D623020D1205665C701CFCE2B2E7DEC7CEAFB7651D434693C9AE87EBED8ED8A55E7565EFBB54B790AEEDC1DDDD5B13898E4C36A9EEA9EF1BDCD70B20DB19D7ECCA1FCD936569DE36F3E7B37A4F12F99B7696B8AFC2B0F9AC75A578CBBF9DCB50F8A97B51FA8773F500FB4E1ACC2BD9ACEA3153CA284B6B2949176E00E0456499123BF3D4738224A477AC7911FDCBFF005BDD5188669235D86DA7C5645F5863CB416EA09226E7E7028BC244A9873728F6453211B31D948E0E5C08C4D4463FF0DA9C584AA3933AE241FBCC3F4AB854F73886CC7E8495A778DBCF9ECDE93C4BE66DDA5AE2BF0AC3E6B1D691E1DDFCEE5A87C54BDA8FD43BA3FE5F1F69C3581EB0ACA792B0EED62A70E706B789D61D751B36FAD4B6D7644B19E8812A874F6083B50F83535C5BA8B5B9810C862C4BC3228E5C037490D61013B920865E63425C302769A58D46249030156B9861169F1E2E7BB23E270FBC4D70A8FF0030D993FD496B4C0E3025AE9C782F772B2FE89F49E25F336ED2D715DA8277EA2C262B86CC9E4F1A038F842B47F0AEBE752D43E2A5ED47E85D5FC9790AD958895AF6E4C8BBB8440099778D8E09BACA7799BA9432306C406181E66E43F7FEE1AE6F6E23B6B64C33CD33AC68B89C062CC401B6965D42EE1B389DB2249712244A58F302E40C6A2B17BEB75BD9C6682D4CA82575209C5109CCC36730A46D4AFADEC9652446D712A44188E5CB9CAE38524B138923900647520AB29188208E507FD22EFF00EDFF00FF006515020F250F75595AB11CA2B61C08D841E7A571C8FB08A998B10D2BA40A7D66C59BF4528B61B7BB4463D51853DE3AE658062839B39E4F6A8261D3639A43DD63F92B8589E53C4367D896B4B65E4027438F752E2446FC2BE93C4BE66DDA5AE2F98A110B5B69E8B273160884AFB381AD17D7F29F9D4B50F8A97B51D6A3AA5B406EAF20848B2B55E596E6421208FF00DA4CC8B5C65C2F7DA6B449C45C317D776CF14A6ECDCEAF6D64D0DF39C8AA165BD578275882F4DE39DBDD5717EA3A25F5D0D5B51E12B397865232725C5D4306A382C4ACB95DA06313E43D4793A5D6AD45F44D4262F170EDB4F0CEB136517AD39491D732A892451956455EAF51BA557BA7E9579A8BEA9A6696DA95A6A13DC328BAB8679488E3B78ADA58EED9377F1F09F2786189E1CB973674B096E2F26B032DCDAE56800264919D72C0F8A49F1531F8B93ABD1FDA275AB889A5B34BCBBB5B29E4B0C5378E92B214CD18C090F9495C57A54FAC3DDC56967070F4CBA234D62F7C1F5059D9E685403955E7885B26EC0F28B8457DC326EE4CDC3E44507D270DF68F3EA5C310DA491DFC975BC899648EEC63841648DBC930899192DDE07B98BE312ACF5C4D6A3B4B8D32DB5382D2DAE2D1AEADEE25CF12B8313005E48A4B5DDC6B1FC6BAC8FBAEB51D5040FA36BD2E9D04CF6D100CF6B7122A178D4107F54CC5702B5C532DA6BDA9CC3496D32EB4E8DCC4C0C9712059D5B0881923609FA9FD52676CA9D4CBAD5DDB6B17F6BE49C59A5E97636F0AC4625B1BC8F4F8EE5823C4FBCFF153BE69378913A7472F4EB8A2CB50B89EEA2D2F5B96D34E9AE76C86DBC96DA600BE037804B34A037E677BFE8B76073F0F8FB4A2A2AC3020EDA1B70A0DCFCF594D6F546C34A7DC9DB5A7BA757CA26120F7D923CBF8335489CFCA2957959CE1EDD44586D7E9B7DEF438547F986CFB12D69BE36F3E7B37A4F12F99B7696B8AFD9B0F9AC55A27B171F3996A1F152F6A3F50E71FFC0AFDA70D19106DE7AF628293CBE8153CB4D130D87654F1938EEAE62603B98A48A4F6687AFB2AD930D84827D8E5348A075540F6A89AE151DDE21B33FA12D69414000ACA481DD33C849FBE7D27897CCDBB4B5C610963BA5B5D3DC2736631A02DECE02B42F067F9CC950F8A97B51FA873FD42BF69C34765160280C76634AE39EB0A1328F66B504F7B1BAFDE9147E2340FAF514A47228DBEC9A4F63D0E16F5B882C87E84A6B49F024F967F49E25F336ED2D718F99E9DD85AD0BC09BE712543E2A5ED4747D429BEA25FB4E1A347656239AB231DA3D02BED5143D596392361ECA9A53514846D2AB4A3D61E870BFF00DC5663F425AD27C093E59FD27897CCDBB4B5C65E67A7F616B41F1729FF007F2543E2A5ED4747D429BEA24FB521A228D122830F6A83AF3F28F404A831652180EEE1B70FBF598721DA2AD1C73A8FC1B297D8F4385FFEE2B4EC4B5A4F8127CB3FA4F12F99B7696B8CBCCB4FEC2D681E25CFB733D43E2A5ED47EA1CDF5127DA90D1EEFA388E5AC0F50F28A0CA7107D075EF03100FB3B47E0A92D18F4ED5F93DEB6D1F8694FADE870B8FF003159F625AD27C093E59FD27897CCDBB4B5C67E65A7F616B87FC43FCABD43E2A5ED47EA1CFF0050AFDA70D623EE3115918F44D62368ABF830E908D6443DC2A48FE9A8FCA3A1048771740F3063B1BF34D14C79368AC6B858F77882CFB12D693E049F2CFE93C4BE66DDA5AE33F32D3FB0B5C3DE6E4FB723D43E2A5ED47EA1DC7D42BF69C344135B3D13856228236D1CD46E5983CD79B76722A29202FB7B68DFDBAECFDA01F8E92DA66FEFB6602383CAC8362B7F435060761AE153FE61B3EC4B5A4F8127CB3FA4F12F99B7696B8D3CC6C3E4D6B87BCDBFB6D50F8A97B51FA8773F500FB4E1FBBC457913B6018E687C2EF97F3A8C5260430C08A4BDB16C0038AF708E753EB1A59633949D92C44F491FB86B858737FD4367D896B49F024F967F49E25F336ED2D71AF98D87C9AD70EF9A8ED3543E2A5ED47EA1DCFD403ED387D0C3EE815241071046CDB403B7F7841D31EE87BA1FDAAC920041A17366F81E42A7A922FB96AE1609D19E3E20B2DEC2DD753925F6C7BEAD27C093E59FD27897CCDBB4B5C6DE6161F26B5C39E66BF8CD43E2A5ED47EA1DCFD403ED3868FA1CBF74B2C6C55D0E208ACCA72CAA3E362EE7BE1EF6B2B6DC6B868E18FF00F9AB501B9F0C1F65693E049F2CFE93C4BE66DDA5AE37F30B1F935AE1DF334FC66A1F152F6A3F50EE7EA01F69C342D6C606B8B8219B22E0305518B333310A8AA3ACCCD96A2D324B393CBEE32F93C09964328738298D90B23A9C3ACADD9A8D750B6300981685F32488E14E0D95E36746CA7ADD2E8D4ADA7DA99D202AB2C85E38915A4C722E7959173BE56CA9D6E8D4D656F67235DDB66F2A89F2C7BAC8D95B7AD21448F06E8F49BAD4F697B0BDBDCC586789C6D01862A4618865653D165E8B7DC2C913157538AB0A0BB23B903A717337AE9F06B86BB9F4D5AFE27AD27C093E59FD27897CCDBB4B5C71F57D8FC92D70E79947FD350F8A97B51FA8773F500FB4E1AD788D84C56EA7D756B94C47B06B4979DB73A7A5BEAC9A8DC8EB416932240F247863F199E70B0C7FB69A458BAB2BB5585B687BDD6ED86A58DF5BCD19B6977F3C61208122467CB1DCC704BF1A92669248F2747731E6D3A26B7F261F4A6AD9ED1B1391962B0508D9B69318393A5EFBDD56B5F4B5C496961345A4B8B98937F23DE1B18E4C8622543AB8696491D9D72374BA59AB4C5B094DCE951D9A47637720CB2C815D8C9BC8FF0064C92B326EBA4AA993A4D9BEE4321208DA08D86B872D6E06691357B5612F2120661D21DDDB5A4F8127CB3FA4F12F99B7696B8E7EAEB2F925AE1DEE7914587B186CA87C54BDA8FD43B9FA807DA70D4EB35B25ED9DCA6EAEAD5D9933282194ABA74A37475CCAC2A1F25B08A2D321864B67D31DE495268A738CDBE9095919DD8232BAE4DD3450B47D28A92CB4DB05D32CC4BE512AACD24F34B32A95469267CAD842ACFB9450B93792B75A4A3A7EA9A70D4ECD666B9B7533CB6F2452C8AA9295923C4B2CCB1C5BD46FFD18D9597BEBE3A9D8457B677F22CCF66AEF6E217881488C1226668C4719DCE5E9E68BA2D5108ADE3B2B3B64DD5A59C459951312C4B3BE2F248EC733C8DD6FB9DBB2B878FF00F296DF8CD693E049F2CFE93C4BE66DDA5AE3AFABACBE48570EFAF63111EC1188A87C54BDA8FD439A6542526D06648CF317B7BC8A761FBB05BF369E69A117093C4636180678643874C63DF2FE953489A54F2DB3426336B2C9D212E747128941E8E215D3A23A9264F7D51CF69A54B1419AE1E7865C2453BC53B98D13305548D8F5BAD97ABD4A696C2D9AD6D8AC6042DB70711A8908C3BD690332FBDAE4AE4AE4AE435C95C95773F14E9E6FE3789459AEE16E02C81C16D8E72AE29D1CDD2AD362E1C8B73A73EA36D710419375BB48A2512931E2DBBCD28964CB9BAB5A348A715921675C3B8F2330FC7E93C4BE66DDA5AE3BFAB6CFE48570EFAF6311F6C6350F8A97B51FA861B4B5126B1A63B4F67031C16746431CF6ED8ECF8E89997C3CB573670092C65472A6DA76304AB81EAB6386D15D673FEDC7C2AEB3FEFC7C2AE57FDF8F855D66FDF8F855CADFBF1F0AB95FF7E3E1572BFEFC7C2AE57FDF8F855CAFFBF1F0A8B3C8C8A39499C7C2A10DAC523C921DD5CEA43131DAC126C9A62E7965DDE2912FBA6AB7B0B5411DB5AC6B142839950603D27888246F29F2462638C167203293801CBB057125FA5C05D3B54D3D2082E98108668A11D1388E8E2C327855C3EAC3065B38C303CC40C0D43E2A5ED47EA1BC586C4446C7C22C3FB3424D5748B2BF906C0F756D14CC07B322B57F2BE91FC05B7C0AFE57D23F80B6F815FCAFA47F016DF02BF95F48FE02DBE057F2BE91FC05B7C0AFE57D23F80B6F815FCAFA47F016DF02BF95F48FE02DBE057F2BE91FC05B7C0AC470BE91ECF905B7FC3A16FA7DAC3676EBD58608D6341F9A800A0C0638BA2FF5DC2FF4FA4B4722874705595862083B0820D19C696AA59F786218642DDDC083F8EA2B5B6060821016348F600A3661CF424CEEEC14A8CC71C03104F37BDF50DA58B210E8AA4363DE963CDE157245EDB7E4AE48BDB6FC95C917B6DF92B922F6DBF257245EDB7E4AE48BDB6FC95C917B6DF92B922F6DBF257245EDB7E4AE48BDB6FC95C917B6DF92B922F6DBF252AB88C287462416C7A0C1BB9EB7A9D87A024B999218CB2A2BC8C101773955713874998E55F456E2D2649E062CAB2C6432928C518623DCB29535CB5EB772BC8A3D5AC9AF031436CB7111973AF597206CD9970DA2BC9EC355B4BBB820B6E609E391F01CA72A3134BA73DEC0BA838CC9666541332E04E223C7391B0F37A4FD1FA7EB17B610C7A2C97D6F6563A7A6A06E6EC4E638D245DC4D3043B0742583C62D5E36B3A3B42BA169706A7C47731CAA521325B492C91411E0CF348B244C8AB8AA65E9EF7AAAFC4C134C1A4710D9E8DF4AE9F20B84B84104ACD16F336EC01716EC033C26378F332649A45CD5C4D6F7F693CF75C21A5C1AADE33DC09DE71722E1F7625DDC5D25F2523318F2F497A35AB467477974DD1352D3F4BD46FF007E8A736A496C6378A1C19E4DDB5EC6255631F47A51BC9D45E1B5D220F25E1F9B89A5D1EE2FCCDF1B74D6B6F78B3C7E4FBBE8C1BF83A32EFF003B6E7F5591A96D346B69B53D5E48757BA9AE750B88ADF736F63A84B679CC904055DF32FF0076896DD734717C74C8DF18FC297DA9ADBEA0F75A469575AC4E6ED52F55AFA38D5A6168226CEA6462E71922CDD3DDE664CB56B0E896DE4FA5DA713E97A36A1AABCE16495E5BBB75B8862B7DDB8781926686495E689F3AB648DBAF56D1456DBDB7973F945CE755DD6500A740F49F39D9D1EAD5C5AE89777304763A41D44790DBC1748971BF31A1D537B1CD24360E8B995AD724ECB15DB67F8A5AD09748B9911F54BE8E1B86D3A386E2F9EDCC1248CD651DC2CB03B2B2C6F234B1BAADB6F5BAF96A1D6F5297CAAF614BA3738A0865C6DA6913773C615562BA458D63B9454C8971BCDDF432D19470B3287D206BD6D9EFA100DB280654972A3EEE75CCBBA58C4F1C9DFCB0D6A37967A24B7B65A4E9363AEDFCA678E12B677BBE25510862F3C696CECA9D18DFBE9A2E8E7D6743BDD38E9F7DA425ADC32EF9670F05F09774495550B2036F209235DE22F7B2BFFA65AF0A5969E6FAC6CED65D43513E506D025C4E8F6D6044995833C2FBFB909DECB0DBC9EE6B42B6B9BCBCD264FA0B55FA7A1B4CA846A96175696C46774629D369E48727EB23F771D686DC5BA9DCE9892E87A45DD82C63C9D2F6FEE37A2F44A729CEE85605F27E8AA6F33EEFBE5E19B8B09AEA69353BEE24B49B4B95479304B537F3599540AAC8CD2DBC3F1ACFF19BE7FF0057934C8E3D4EF356B3BAD14DCF118BC4CBE49AA092109181BB8FC9E4933DD2BDAF78B0A3645EB3EA2897B34D32456E65B170373003BCCAF19C8A734DB779F1927EAD7A9DF47FDD9469FC2B6FBE32E50049A9DFA145C0E1B4DB59E7CDE7BEE92B8878BAF2216BA568313691A7CB93BD8F2CFA8CEAAA3310F308ADF93FF67D0EBD68A6C6482EE48355B16BAD0E0B378F5096E09C9E586F36E36D6F6EE9248BB955648376F7791B735C39A75ADF5CD8DADE4D742F9ED4AABB225B33AA97657C9D303A4B95FDCB570BC975ABDF5F1D422D5EDEFD6E047932D96616CF95234CB27431DE75E4CCD9BBDCBC3AD77AFEAB9B56E0F9756D4FF54846A102DA6ED548886E7FC54B991323CBBA5DE67F8CCDC3BA8EA649D4AF74CB3B8BE2CB90EFE5B7479715D997A6CDD1FB9FA772B7D21E4BE439B31CBB9DE6F70CBDDCFDF56ACD7500B84D6E04B5D4A190968E48511E3C997981591C356A3A7DDF955E47AA59A69B7335CDCCB2CC2CE324AC29231251716662474DDBAECD5A84FA80B953AB5A2586A71DBDCCB025C4116F0C42458D80631EFE5CBE174B356A90DCC72326B17969A85F1DE302D71602DC40C0F7B8791C199475B2FBEA87508D6E55ADB519358B6B51712F93477B3ABACB2AC38E4F8CDEC8CC30CB9DDD932E76A863805D5B6E52F21325BDD4D0BC90EA3706EAE22919194B234ECCEBDF47FB365A5B08D6EE1B316B656525BC5752A24B1E9CA12D8C801E9B468A176F5FBFCD4D7F20BA52FA8C1ACB5AA5CCC96C6FED9A3649CC21B266F894CEBD46EB65CFD2AB6BA32CC8D6D9F2C69232C4FBC181DE460E5932E1D0CFD4EF6A7BCB93710CD796A2C6FCDB4F2402E2D559D96297211982EF65CAC32BAEF1FA751C8D25D4735B5C0BBB0963B8955AD5C5B8B5296FB4AC50B43995E151BA6677932E76CD5268F691B2DA4DBF69CB3B3C924974CD24F23BB12CD24B248EECDEE9A96128F9134C6D194673FE11C282BE1F4474EB52B192190DBEADA65BE8B7A378C0B59DA2CAB1283DEB01732E2E3A55A86B70A30D43548ADA0BB72C4A94B3DE6E405E45C37F263EEBFF00205FFFD9, 0, CAST(N'2021-05-07T15:51:35.790' AS DateTime), 1, CAST(N'2021-05-07T15:51:35.790' AS DateTime), 4, 1, NULL, NULL, N'con todos sus accesorios', CAST(200.00 AS Decimal(14, 2)), 1, 3, N's')
INSERT [dbo].[Publicaciones] ([idPublicacion], [Titulo], [Imagen], [Raiting], [fechaCreacion], [idCategoria], [fechaPublicacion], [idSubCategoria], [idTipoPublicacion], [idDepartamento], [idMunicipio], [Descripcion], [Precio], [idEstadoPublicacion], [idUsuario], [Delivery]) VALUES (2, N'Vendo Samsung S21', 0xFFD8FFE000104A46494600010101006000600000FFDB0043000302020302020303030304030304050805050404050A070706080C0A0C0C0B0A0B0B0D0E12100D0E110E0B0B1016101113141515150C0F171816141812141514FFDB00430103040405040509050509140D0B0D1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414FFC200110800B400D203012200021101031101FFC4001C0001000203010101000000000000000000000105060708040302FFC400190101000301010000000000000000000000000102040305FFDA000C03010002100310000001EA900000035A1B2DA7FDE6D16AEB1360282DCF40001048000000224008E76E89E7398DCDE8C72EF4F1F7E23917DF8DE92AF3E9A4EA7DC18F58C5AD51290081200000089008E71E8EE72B573EFAFC7D5E9E1B7FCD2DB65D390FA31AC8F3DEA6C6BACA97B3090000000112109040E69E96E68B532EC8303BCF5FCBBCFD54DEF2D96163FBF162EDE9B2A5BBE37B2222D241200000000008E62E9DE5E9A7E72CD5F63E9F89935BEBDD9FD75E6BE9D7DB2B06BADC968EF33F6B315B008900000000011CA3D5DCA4AE07FBC66D75799B1B33C1720D97C8335D7BB27977F75E6379279FA6CC458089000001120010397BA879251E7C4FD3B2B5E2D7B9D7CBF3AB9DFE65AEAE26DB5AE69EDFCADF6A224000000000002391FAE39051AAAFF0FB4EB9B67E59AB328D59F25FA55E676E1B42CEBAC3CEF62DA62520000000000011C7DD83C7C8D2BF6F47D7AE68CF71FCD6BC7F3D2D896D4B75A5F7D7FBF96AB909000000000021223913AEF9C9182F9BA9B5DF6CBCEF9C6CEDB9C93F78FD3451586239AC5AC824412000000890001CBFD41F23437C779D82341FEF7CC9A1DBE09D47B700412890000000000002240000000000003FFFC4002C100000050303030303050000000000000001020304050006121135400713211416311032501517222526FFDA0008010100010502FC25D37912DF06F725C6A27EEF7C950750A3C948DFB04B5213F1AE688E13538B260552E60573A03096B3CC0D18E1C4F2D6A432F47B161C69FC43AB5D04D40553E14A78B8D15B4A4D5D68DFC693500443E935B3C56D9C298F13C91C44016C0C99F50CF03247CCB533B3C5EDBC298DF52F8368254D4140732A856AA8A270A99D9E336DE15C1E25DB391D08A0180DF25369454B24DBAF854CED119B770AE3F124D950A2984809BA03534295C1869526A9C829DD818CDBB85748E2F50714C970D1C0815C35050B493D2B8379548E07FCF466DDC2BB47475DFED883C32C8C59C4484D302AA66CB4763E9648B844C66DDC2BE541485B3C0705CC523B510D5BAA3A281E2257C49263AC5466DDC2BDC9DC39DB99216EF4AA530D0A89141D4AB0E912915D349001246C5EDBC2BAB1F5EE2280D4EA20E98C72829D20603506825B71D60BCB07F5517B670AFDF986B8C11A1216BF4D218E2CCCDA8AAF86CB60E650D9C1456D7C2BF4D89FB6558B1530A47D1A48CD2957E516E25012B6032CA4B9708489DAB85D401F253E8247A99E990863184F4C977C34B45A7AB909AD9A236AE17507EEC06885CA936C6299A89CC0438D5B9183171737B2C3ED3C2EA079508888802460A6BF734513285A31083A63537B2C36D1C2BE43276D2DB53B4F218485EC99135B902BDC2E51448D91A9BD961B68E13B2154BC5F4611C26B43AAF85858C267683749A235A55E72E8C45BF1A90B78EE15F447509289756A3CC88F520EE4DEEABA5D5772FA775EDFBC9DD7EDECA3AA87E9AC6C63DE1A891162271CD11AD34FC5FF00FFC400221100020201040203010000000000000000000102113003122131103222404150FFDA0008010301013F01FA4FA232BCB2F56444EC42C53F5669C85C9D0B14FD59174C82DDC917B9D31627D12D3FD46991EF81627D0D50B837D3B1627E1F0539492162658DDF669C2BE42C4C71A142FBF0BF85FFC40020110002020105000300000000000000000000010211300312213132224050FFDA0008010201013F01FA4B964A145648FA43251A1AC71F48AB25F1ECEC789764643768D48EC25DE34C8F28D6F23C71E48F06AAB8E44E84F71397191A2EBA252DD8D1763FC4FFC4004310000102030307050B0B050000000000000100020304111221311040415173B1B20522617174061323243252636591A2C1141533425064727582A1D12035628185FFDA0008010100063F02FB11C1904C77B296FA09C07494223FB9FA34E0DEFCD0EF65578C773F3CCE960B7B978C4BCE4B1F490085FDC18C3A9F72F073D01DFAC2E6C46BBA8E6B2822739A7950923A9ADA2D6AEBC2C508B14CBC5E4BEF364CBBE1826DEBC173B93256BADB0ECEE5CC831601F451DE3E28F28F26CF4CC685039F1A4E65F6DB119A69A8A6BDB7B5C2A333963EB289C032DA1FD13FD9E2709529B166ECCE01F5944E00B057DCAAD3555D1967FB3C4E12A5364CDD99C0FCC9FC23250858DD92CBB0C93FD9E270952BB26EECCE19F58BF85AAFCB726941A7053FD9E270952BB26EECCDBF98BF85B92D0C162A9514179E9C8E0A6DDAE59FC254AEC9BBB33AFAC5FC2DC947609CD06D37584D78346E29C21FD51528D9539B089C254AEC9BBB33FF00A0FE16AE84FB2FA3E8A86B5AA6F526B81B8DC994353A57290F4310FBA54AEC9BBB338AE1889F7EE6AA7BAAEBDBA5070C1C2AA8503A950DC7021728F677F0952BB26EECCE2B75CFBF73555B715663DC7CF1F14056B66E4342BD027CA6F35729374096770952BB26EECCF9E68DF9C5FC2D582B402D481AE47C1383B05CA47D03C7B854A6C99BB338FDB9FB9A9B2D39F478362EAEB57D08381D6AA3FD85FE2A8531C14E3B5CB3CFBA54A6C59BB338C7EFCFDCD556FB17C9E35624AF9BA5BD499118EEFD04F92ED7D0541890FC2C2897516A50A1B4DEE706A9D68C04B3C7BA549EC59BB338FDB9FB9AAAD342A91DB64F9ED46C39B1E13BCA00A8AEB56E09BE8A8BBF9F225EFF00D5A14FF6789C25496C59C399CC76E7EE6E4BD0736A0EB0ACB8D5C703AFA3AD114A10A1C378A467F3E275EA53FD9E2709525B0670E671C7DF9FB9B93A95110F63482A1CF4C406BE29885F089D030C9CA1D9E2709525B06708CCE20FBFBF85AAD446961D00ABC2EA405F0E59BF4917E03A5321436D986C165A350C9CA1D9E2709523B06708CCE5038070F9CDF71FC0155A39C159668F395A9DB265C7D469BDC9B0A0C36C286DC1AD1419673BE3808B1A13A14287A5EE228A5613BCA6426B4FB333F964361A89913501C4735C682ADFDBF742D484E88DA58D0D23DB540CBF73D3319C302F70F802BC5FB9E6431AE2179FE15D0A4E547E01F12BC2F2E3207443006E6AF1BEE926DFD0D73BF94C9B8AF8B3D310CD5A639A8075E6858F687B4E21C2A17325A0B3F0C303ECCFFFC40027100002020103030403010100000000000000011121314151614071F0108191A1B1C1D150E1FFDA0008010100013F21FF00121C806D2E25658AE341522EB20F96A091C3661BF229783721CC2D906C425DEC5F457BE91E0411239AFF00310885ADC5DF6069DE3BE07F499AFF0077DA7881ECF181BF02D77C7EF461D3389D7894296BB0EFA01DBA6A5744F0461ED03567516BC167CB07B8869F4499C2F19B7A2637044A9CBD908A484042EA9E8368B52B5B100D317A42F15B7A26413DE0F9423E09A0A4C486A5EFB0D3DA8E9DAC3F405E5F6F44F03B418FBC2333294E47DD431E688CCB39BD881AD476F445E376F45A0F2CCD531258619344256C81DF608B437E1A706F6C9EF71E276F44F044A5408A692A4E3519675E9A16010C25ED4D49BB8E0672E5087CEC4DA1B6A3B3249F2ABD813CDD3D13C087B7846A84F2DA931EC82B881CD70342651E8A047BEF923B20DB99168293F9C1E276F46A1A5BA3784BAB6CA12A76301FD701F3B8C6B791CF5180EC28E5FD3ECCAEDAA4BC7EDE89E08847A3CC8DA889D8A0FC3F62D89D0BF71D818A0B5FD0EA958F1C61FC3329D9CF23E3F6F44F0361221B62B6AC5E134254F4D34C5E88703C8D4912A9F723C1E8FE8792DBD13C18193DE33391CF1E1C8EA5409D3F70E054E46E936DF0F6E18E48CC6E3B5F64426C155FC4AF44F05353153379A3EC88A91B897CBFC8C12594E8D49714F946D7FD47CC89BC8D411C8CDB178E2BD8BCA6DE89E088DDD235EA878B8073F288DACB3BEF194C4A6C51DDA7A3EE4B10F661BDED293DADFC7A7EF35B3A2783107AE56374685634E4AD3218B9025DF36FB72312368A2E4F85009FF450BE7D0F79DD9D13C0A33D7083AE12242356A2CB94DE9169F0C5922AF051C61DA6D74B39A3C1CBE0ACAF3B4A1C762FCA7BB453B0B0CCD584BF205BE568E863A5FD91E061F34B2A9CBED1122AEEE609368D03FDF31DAB8C21608A218285254A475CE46BB2A4B3AC8B86129CA54FA343D11C8073D1CE3AAA0F5855687C413F062F69A802B0D58FD20663B7235F28B031F8E3F269B9E60BF117BF1B34A1ABEEFA4C00F919ECC692F7C2A1224250B8FF002FFFDA000C03010002000300000010F0092010C804000120F3CE00800F98E17E8800C53CB20200A81156280000F3CE10604E8F44164410053CF00000F2468AD4001053CF00000AF42C70C002053CF10004AA690BA00000F3CE00000B0DC0EAA800053CF00000E95C8DD8000073CB000308BF38AA80100D3CE08000012E4000420053CF0080002000080000073CFFC4001F11010002020202030000000000000000000100113031214140A15161B1FFDA0008010301013F10F0952601974CB8378BD4627E600FB8AF1BD27F229B8CD22749C8BC5E9B1EE9CC87481A2B1735023C0856F0ACC5B2345A0211A62D188A54EA6543DCD3168C619529BCDB34C42C48BA477796A2578DFFC4001F11010002030002030100000000000000000100112130314061104171A1FFDA0008010201013F10F08D07B8D2C54757F6128FD447EA551D4EBF422798690A750535AB84BCA6104B188AD3A8E914C316061A0B3BD47480C587980A31D4762AB22D53B2BEE3A8CA4A209DC3E11D4A9189373D3E1D77E3FF00FFC40027100100020103030501010101010000000001001121103141516171208191A1B130C1F0D1F1FFDA0008010100013F10D4CFA2F4E34E74B8CE7574BFE3B697A5CBD14F097B6A2102604022B9083E0EAC564A3557082749463782BF085BAEC7BC150332F0B7C93B210097D948189CECFE3B2EF4B97E8AFE1C9063389B9E21C912B65B14E83F14545473695FDC5EE78601EDAC22AD7448F4404C1C02AB79555AAEA45CB2DFE4CB25970655FC097D412734D557745FD5B784EDE37B44F849CE9539D0B7D6E9B68CDCF12C008575C081F6C5B1560A25E25B0681D6EA6467C61B1260894DB7E65295E6118589D3CC360E8632E54B8E487ACF46C7C4AFB2A29E6342EA75CCA3C8C671712D44EABDD0082167DEDFE7787720EC915988EE4868B4B7EB4AFE05E954CDF5587C478046566823B10EA9B502DFFF0025B00607B7781AD416BA9BFE473F2CA3882896163D6672415E855C9FC2E6D5ADCDA6E7889200A3A9F8AAA565268B4605A2FDE2046CB73FC8CC7AC3B37C44ECA8349C20AAAA4AF560F6BA838BD083497A9EAABD2BA449CC7763897DB4197A4E9054872DBE7BC5A8DF28FF00D52F871CDB4C6E805184BD87DB14010028360ED2B3DA99D6B1FE4BDDB5DF81F61D0EB3BD68CE343D7E7D1B91D0091697537C52DBB8AEBFBF12C9B94B637D1FFAA61CC34103C9B3C3DE26581AA83C37B7AFEC619CEE985D2FF7B3D206C2C6983C9E62970B2A55AB4F646001C136B4E6798CDA1E933E8B9B4DCF139CF2831882E145EFBFD7BCB03EED09C595B298ED7EF0978B214B748F2237102800C7B107FB28EDBD35C73DB3D63143D13BB4BFB055A74E96DFBBD0EDEA4BA97EABD3AEB71D9F10D3009D98BD763A25D4EA7721BB603A2758140988EEEC7DD43F301ED4A6052E472C94EE3F1BF10D77887847A822241B0A6C73CB33D35CC612E710F5331BE97A6E6788C52D004DAA7EC5D87A8F129970F0578FFC1F103008652C3B0ADCE3DA3158309BAF7AF8F9ED38D545AC57284516219B77F15FF1194D2CB751BF445962DCDC8C36FE06950D389B9E20C0A55E82C0B78CA7CCD8E57C972CAF35037EF02CA87137D1BEB04DB70A4BF044280B02F047A2CAECC5F67E10CA9BDCF27F54C9F4BCCA9C7F0CCBB95989A5C4DBC477432C5D63D456F23C757E53176665D3A31703B50E33BF31E64FA0B13C4A959ED6571DEFD95445DE55C47F0AA596A92B7F6FC863D6C6ADDAE2D09DCB892A5D7A995E8A9B9E25762FF818BD7C375BFDFB77869ADCCC6BB965179CEBA546C047537B81AB33C9312E03C26CBE2871D768CF2D042C2F860D3000BC0307BFD4CDB53C56047E45693F7D2A569C43D269537953786D78975E9249E67094FB75F11822742FF9E4BF1054E20DE1C0AF7A3BED31A5145D981C675D1F697685E43E65FC01A260FEC0F8F41156DD74DDBD27A6F4B97D25E9BDE23146CEC46E17A36E0886AE1F6758890AD01E1333339530582E819A618D8F25A33D1486740AEAD95D61B25226E12978FC875434B7055A6A37A73A1E94D1F13DB5DCF1148DD026A296CA02F2BA36EDE26C983478AE4255A036E290044412C4C9FA8B907D90C972006904EB2DF2C51357DDD42B1A1B7F06F89538CCF12FA4DCF114B2D2D4099A9E649458FF00DE08803251798B5652C28A63F654DB926EBC49141C1970676A137E101F06FCC1A256C962F4B3F7466DFC0D2EE55CA9BBE22CFA9023823D013B84A95EA200A2D33D6DCC6005B5E0AAC16197A6F729972E0B2259A5577BDA806332B192407B073DF762F51EF1329E05C47F0BEAD1606E42807B4580EB6E1A7C8E9827339D4F4EFE8FCD12C48F989D1A9FB0099236ACE22CF07ABBC5A9D143DA2365B6D5D6957EF3B78037CE1FB817A903E71FEA05D76427881F348ABDA9FA95BEE368D8668392C069AB07D26D09BC3D5CCBB812A71A12ABA187A208CEF3F18FA10B88B63009F72BA46595E97ACE26EC730F4F3AB37742388EF382319CC34E74AD2A5686BFFFD9, 0, CAST(N'2021-05-07T15:52:18.770' AS DateTime), 1, CAST(N'2021-05-07T15:52:18.770' AS DateTime), 4, 1, NULL, NULL, N'Todo de fabrica con garantia', CAST(450.00 AS Decimal(14, 2)), 1, 3, N's')
INSERT [dbo].[Publicaciones] ([idPublicacion], [Titulo], [Imagen], [Raiting], [fechaCreacion], [idCategoria], [fechaPublicacion], [idSubCategoria], [idTipoPublicacion], [idDepartamento], [idMunicipio], [Descripcion], [Precio], [idEstadoPublicacion], [idUsuario], [Delivery]) VALUES (3, N'Vendo Samsung S21 Plus', 0xFFD8FFE000104A46494600010101006000600000FFDB0043000302020302020303030304030304050805050404050A070706080C0A0C0C0B0A0B0B0D0E12100D0E110E0B0B1016101113141515150C0F171816141812141514FFDB00430103040405040509050509140D0B0D1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414FFC200110800B400D203012200021101031101FFC4001C0001000300030101000000000000000000000506070304080201FFC400190101000301010000000000000000000000000103040205FFDA000C03010002100310000001F54800000000000000000000000000653AB60A76E72764EEAAA5D2BEFC57D57392E7FB131165A0DFA2412000000000000C1B79C1CB4C9C276BD4F3EC7F50BDDC9AAC9C915294775CB8D3EE1CF409000000000000611BBE128909EA0D83D9F2657B51B274EDEF58BA1D6C56FE5BEA16FA6C04800000000000309DDB094546D7984C7ABE0D927F33D2ACDBA07052F4BF3F5465CA9376CF7844800000000000307DE30630AE7ACF7F5795A4DDA8163D9DD8347CB755A74715DA897BC1A4224000000000001836F38199FD66035FD786877CFAFCD554C6859559DDE8175A7DC3CADE09000000000000603BF79F8F33C9563BB666D36DF935E74E6B359683B6755CDDC69B72C1EA824000000000001E7CF41F9ECF2B734AF6AEC9C179AADAB8A6DDE97899A6AACDCE9774E2E048000000000003CF9E83F3F1DAABEFF096E7F336F923D0AE748645F2B2ED77C875E8E812000000000000819E184CD6B828F3F3238F900000000000000000000000000000003FFFC4002B1000010401020503050003000000000000030102040500074006111213331431321016212223155060FFDA0008010100010502FF007FC7B767AC8559C247F4ADA19CCC589C460C1DDDF24E4BCBB167DDA41E54710C2BA5D9EA47CD87EA54FDB11EA9828C16C9FA5B466B2E767A91F31BB052396773AF065E4F45FA5C79B67A8FF3135131C2E791E463D3F10CFDD6E5BF9B67A8FF0038B2BAD139391E9832AA6351CC51150896DE7D9EA37CE3131875662191F801779559F8EAECBEDBCFB3D46F9473E432F5A1C8E8E7AF9A71112423964BBF9597E5FB3D46F921BB6A29CEE8AF90F3A353F9C692F8E4105AB1A77BECF523DE24F43A77142E86ADEA017A9AEE7D75B23A833D79BF67A91EE588E1A826F3CAEE9408C8BCD855C86169E2CBE7CF67A90BC9EE8229429748EC80E70723911D9EE9C372FA85629C9FB3D4BF7ACBA3549012812E3362888F241EC6349D394E7EDD85BF9F67A99EEC234B910D22AA47AF55636CBD585EA8ACE1A07A9B6B7F36CF53BDD1F829640643B2075C328C02F51CD383A0F66BAE3CDB3D4FF76B51506DE5828A84C850DFD34F412AC8E31B44CB9F36CF543E4084AFC7D7AB123FE8E01DFCE9A07F8BACCB9F36CF5393A8A3E0C4AA8B615A36B194859B2B857839949F5BB72248D9EA7F53095B3C171024438518BF7070E56B8BA8B403C76A6D6AE7DF33CF94F0AE6EEEB67734916FA18F48AB58E0E96D00941C13471F054D0018D63589FF0005FFC400221100020103030501000000000000000000000102112130031231104041505161FFDA0008010301013F01ECD4AA54AE48B673D16384FE8BF0E3245D19A77B917B858E5A7E51A764439B0B1B42B0A7490B1D095884774D0B1D46421B458DC3E11852EFD27FFFC40020110002010304030000000000000000000000010211213003123151224050FFDA0008010201013F01F4DC28532C926354B0F238D7824BB1DF24644A924496C63C6991BA35F81E38DEC46C6B2F1C95232DC6ACAD91A381BAE4DDDFC5FFC40043100002000304060506090D0000000000000102000311040512B210213140417413225161842332427181B10614152452627291C15054607392A1A2B3C2C3D1E1F0FFDA0008010100063F02FCBFD159A6194EC8CECEBB6828283EF89732DD7BDB9AD8C2ADD14DC2A9DC23C87C20B6AF74E5578EA5F1669C3B275969EE87B10F92ED5699682634B57746C3ED11E5AE1C63B645A54C797B9AF295EA938FDD1312CF30F4D2FCF933170BAFB0EE8BCBFF0071635E8A37DF0678949D395C06653AD87B2BA6E7B728A4FE98D9D9BE923236A3ED03745E5CFF003163518D7143AA2874DD7CE2E47DD072E73AE8A8343185E2A229C468BAF9C5C8FBA0E58E75815D34AC071AAB1DF175F38B91F74F0C73AE8EED000D9C4C5211B862A18BB39B5C8FBA7866CEB023036C82988885D6707A47BA0E12180DA4418BAB9A5C8FBA7856CEB00C3196462035086C6C4B578C28EE864D5499017682B48BAB9B191F743CAB6758C3C7E8C546B10187A5AFDB1430A769851FF08BAF9C195F74F0AD9D6356A31867FED88001AD3B20400625CE1A8B0AC5D95FCF7FA5F74F0AD9D616625191B58222ABB635F54881021A4B1D86A22EAE70657DD3C2B6758D9D259CF9D2FF00C409F29B1C93FBBD7155A56312F99EE81584A7A462EBE71723EE9E15B3AC51F5376C6394751DABC18474F66EAD35B4B3E87FA8953645070988786894784B05CC5D7CE2E47DD3C2B6711AE2828E9F45A079D21FBF588629A9DF80D9A0DA5875E7ECFB3C22EAE71723EE83956CEBA3BA076C6A53838D3D1EF894981BE2CC7AD3C6C006DF6C2A20C28A2807608BAB9D5C8FBA0E59B3AC6C8AE812E529798FD5551C4C59ECDE922F58FD6E3A2EAE75723EE92C76D9C8FE3581B273D3AC6364093664C735B62C0B45A089D6CE14D92FD5A6E81C4DB5723EE921A9B643E1EF2194C4AB559D84D93356B51EE8C5367C855AEB139C0A4330B7D82539DB826024FDD1AADA66FEAA4BB7E11E42C9785A0FD4914F798F9AFC19B7CDEF7387F08B3DE57B59D2EFB359037C5EC8AD898B114C4DECDD0D9ED684AED0CA68CA7B8C1F9DDAF09E0A408D76779BF6DE3A9774AF6D4C793B159D3D52C4514051DDFA07FFC400281001000201030304030003010000000000010011213141514061A110718191B1C1D15060F0F1FFDA0008010100013F21FF003E734194D0382DF18021332639AA9BAD2D88D2869FCACCA16FFD050BC382E5A3A1C6FB935E773C3DA8683776A7941E6D5CE3AE6AEFD25FB76835289439D798C6B7100F0629B06C5AABD0C69887C8886AA3BC0A38E9405DC8C5611414DA72DCB8F57069D27A3F24A319A07A788FC93276836BBC43D101A74769318307D0726E3CDC1456AD1E3D23E21B5327A4034E8F4A75C85E61E6F152EB17F59442C4506025CBD80ECE3A631D134DFDE1225AF102B477378C77343622D956B60F11963262EB88AD3AE6E94C3708D9B882047B93325FBED8341C0481DC2BF7799B93C3CE21437283D20AA59B655CAFD4D455C24468A6E90BBC4359C010D8709A3AADC96077E90B5CE66592C10E86E31467E798C03F3AC9661AEDAC5771AFE23E148EB9DFCC747610F6E90A05D202322596121B1DC6827058331A788277129B2DBF74E28ABF6D0E91CA5A9B936EFC1818B5AEEF81B4CAE56FB244D62BCBF91D0D4457680039B98C00D3A375286157D46187145DF1994CE86356AE4E630DC6DDC2E3F8CE69C4D607F0C1E53D3C1A746A8C51C6C879F238F8E25A30B185BF3FD2685F2F233B4552E26285EEDB1FD9B7EBD341A746A499163DA6AAF57D4BA1BB78A658EADCFD79FB94324D0CD6EFA0406A01F6301E990D3A439A5B7DA62E52545D3B30DBD3414C152D4A702DD67C9F5E869D1A83A8D246382F7E0ED2CA2BDEC8F56D518D0CCC09CA5A2DFB9EF18C41BA31CD3434E8C01BD2F60D076C0E4AC65709A24B04161C1DB337BB1F928CD7DB88046B6551681A767410F0A226A33831BB243F1CF477E47C20AF625DBBC5DFDE8CFD43CB7CFF0020943A3FFADB0D301BDFFC4EDA2057FA1FFFDA000C03010002000300000010F3CF3CF30F3CF3CF3CF3CF3CF3CB1F9E9C7CF3CF3CF3CF3CFA3AAAABCF3CF3CF3CF3CAE7C132BCF3CF3CF3CF3CE41983A3CF3CF3CF3CF3CB003D183CF3CF3CF3CF3CA2487DABCF3CF3CF3CF3CB048D0ABCF3CF3CF3CF3CE01C408BCF3CF3CF3CF3CE19A9927CF3CF3CF3CF3CB2CF2C73CF3CF3CF3CF3CF3CF3CF3CF3CF3CFFC4001E11010002030002030000000000000000000100112130311041405091FFDA0008010301013F10F87D041DF80DEB3720D2C8365CE353335467E039A999E65B03512E4E358DF8406EC646B63244E50C19C6B542E151CDE8CFE4E35D59D4237ED9C6BF445AE8CA6057D17FFFC4001C1100030003000300000000000000000000000111213031404150FFDA0008010201013F10F0F9D8E49AD1D42EA12383D4BA2320A48217AEEA3190BEC954EB5BD7470488D9D6B9C82DCA29C8FBAD3A7443E5E51191EB996AA1EF58F5E61B4D97E1FF00FFC400271001000202010402020203010000000000010011213141405161718191A1B1C1E1105060F0FFDA0008010100013F10FF004B72CEA711E139AD390ADDD30ABB8592BB947708B265140202D1C4BF39C21CBE14EBCAE20EA9C286533BB024CC165B7871FA4EF4CC98E11F96B83FA843C5A0805D9679E93540856E249242D5E5987C7607130B7C2DF8619CD12E70807357BF44327799793B9880A9D6A7CA6C12761AAB60D8747F59A3868EC6925192B66F532B1CB1F3E230355E84841C8FF81734D1EBA31717D8956D76C1B686A9B1EE4ACC2E19E5E23825F296FA773C4A1218A0ECCEC86E71A3D7479B2A866F7E38778A037A599428B2ACE60A45E07047CE17B5E7C4002C2D0C972B476226E01A3A40A35006319A8C4AAE2D70436CB2E6A638ED7463B5EDED020C2A1C12DEA145EF7D28FC43183474785FB3417B10E1AD1AD7987A0779C3855912588A6C0E1F492F70745E6CADE17755989BC4F8EE3CCCEEEDBC2C5E78EF7C547FBEB6427F2434747B6566D1FD0ED044D4A6C185BDFE23B54C5B3298BF0DE25960069C60ED161B016D02516EF5479A25D009EC0D163376F2F2903474774386916409DD9C65EE85EC8E5361EA734100E48BF343EEE0DC64A6F1515DDCBA738AECDFDC7B862E1D641D226A355AF4E468E8F2ED84859262261B3CF13B7B4C0F18F0F267DCD0F98AC8CD9E0BA99331BE4AE53B4C26B69C01FED5302060C9502FC1FB94201F5A190D1D1968057D122873B423313C2B201B8B1AD14C6F93919E5EB173F32BB01576198167B071874FBB62892C13CADFB9A1D1AAAF78014E15D9E0BFE0D359EF2F17851AD9DC45E47F5983D50960F0BD7DC08B6743B38FE0FC468512CBE73DE3618B3B4AABEE0A3E2868F5D1A0D34C8485000F1EFECFE252988E5ED1E71A7671370D3107E4327A5D70ADD1B3EA651E72871E60272CA6AC0481E970257FE6731D41347AE9052800BA8586677C07653E467E1F50F6C04017B0892C3E0F3034E0B328DAD21B3B62B984DD2E0F72C9AF6194A03C7B3B8750CD1EBA3AA4019B3AD8B1808C8A95DD1C4D606954CB6A8285BAE8195E89AB341618351C3051F22B62DBD0B34585F4003D0045530D1EBA378FB9414C4D17475102D538AFDC699E02354F0C1B0216A7A0775AD7686986BA0D5FCE40F012F11C6747AE8EA473E345A27EE2B8A0610E16358B5D5E5AB6AF19462F0839C07C7F6CB3906950B12B80036E351146B1558609DBA6A51836AC6905801F358BE8268F5D1B32F182E7BD2310C97A068426D5A2911189BE6D81A0CD6AF52A8C28F438549EBBC2DADF737A427E658AAD01F90BF89E5509DEFF009319821766EFB00412F032F48CD051D50D36D4A2644511233A9ECD7E3C5E60D3BDAD5F721B9DE47F644086340BED943839C33F44A815FF0003FFD9, 0, CAST(N'2021-05-07T15:53:04.160' AS DateTime), 1, CAST(N'2021-05-07T15:53:04.160' AS DateTime), 4, 1, NULL, NULL, N'Vendo telefono Samsung s21 sin ningun defecto', CAST(800.00 AS Decimal(14, 2)), 1, 3, N's')
INSERT [dbo].[Publicaciones] ([idPublicacion], [Titulo], [Imagen], [Raiting], [fechaCreacion], [idCategoria], [fechaPublicacion], [idSubCategoria], [idTipoPublicacion], [idDepartamento], [idMunicipio], [Descripcion], [Precio], [idEstadoPublicacion], [idUsuario], [Delivery]) VALUES (4, N'Vendo Samsung A01', 0xFFD8FFE000104A46494600010101012C012C0000FFDB0043000302020302020303030304030304050805050404050A070706080C0A0C0C0B0A0B0B0D0E12100D0E110E0B0B1016101113141515150C0F171816141812141514FFDB00430103040405040509050509140D0B0D1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414FFC200110800B400D203012200021101031101FFC4001D000100010403010000000000000000000000080405060702030901FFC4001C0101000203010101000000000000000000000406020507030108FFDA000C0301000210031000000195200000000000000000000000000166BCF9FF0097C99281DCBDFE4EF40D13CBEC0D1E82649E6E7A1FE3F6E830FA00000000000081F3C207D8FCBB075F8801F050CCF85F32F96CACC453FD800000000000103A78C0DB1F976FCF8EBD13EB8F1F8E5595177E797AC6261C569574B819388DA400000000000045295B12E46A370C7CDFD88D873D27D379C7AF93F30FB62AAFCFFDD7AE5D4239D1B3E65900915C00000000000040E9E30FA14CB6ED1A0B9D0EDB4BA0A406A8BC6A35FDC2C1C2C126E93EBCEFF4435DA5C8065AE00000000000044097F0CB4FB6D81F6CBC39D5DEE3805EB0AE9BA1B0D932FE8EF343C53D0E8253B79DC8C8056BD400000000000107671409D7EEB26A6C72DFAFB95E7A692A3BE732E7C1D3B6854D3AE074F1E6F2720155F500000000000079DFE87F9E5B65A2BFA6A3A6C3ACEDA4FB2F1EEEAE1C7EBAA7B4099EDCE646402ADEC000000000000F3CBD0D8D92718E5CB67FCDCE1ACDB31F5ACDB33E9ABFD008D32C7539F608590000000000000000000000000000000000000000000000007FFFC4002D10000006010303020602030000000000000001020304050611144012133516170710202132332224365060FFDA0008010100010502FF007F61730AA8BD6B483D6B483D6D483D6D483D6B483D6B48206475966EF0F2794FDAE41B7741B0E6BB7746DDD1B7746DDD0D93F19CAB92732B784BF27F54DFD18A386EE37C273C9FD537F461FF00E31C273C9FD1A86A1BCF95940718878B35D8C7784E793F9EA2321A610993BB173D25578C3A4F63DC2C56BE34BB4918CD6CF66E2ADCA79C0FEE6DB0DB67255A159BFD7071468D9C6F858D4B28D649B84A5163198BC3B2AD76B9C53BDA5226750DC1194A5F4B78FF0082E12D4EA2CA24C90E1C34F4313A32263139A530B65E04F1A04877AD58FF0081E152B49766B519B6CC941C50C9D9FEE3C9342B72612E75B98FF81E151AB49C4E0EE7D96F0BE73B8EBEC75054630964D0BC7FC0F0AB1CE8B0EF837C4894480FB9DE70CB51DB125244D63FE0784CBBDBB1392172C3B20DC3F91895FAF1FF0005C279CE8B25C9D02A41B810351A8350907FC31FF03C2B67148B52D54680931D40D40D41DFC71FF05C2B42D6D49212351A8D7E4E7E38FF0082E15AAFB76BDF48DC246E5237291B948DCA429F250C7FED45C2CB7E18C89D67ED6DE0F6B2F07B5B783DADBC1ED6DE0F6B2F0557C269EECA6DB4B2DFFCD7FFC4002E110001020404030607000000000000000001000302040511122130311013410622326181B1142034405051C1FFDA0008010301013F01FB3BABABE9B9E1F91ADB49CF0F1A5F66FE2600F4D45841E9D555E45AA7CC0699DAD7CFD74AAB1470CA92DEF97BAA6CBBD322C37503079C19732CECB1C020C9579CE6CD03E5FD3A526C3732F069D1914CC9B32A2CD055863B81F1B852B5685C80070DA253EE875EC40E952C5E6A1F5F658156E20DCB60EB1706F6D2A3FD6C37F3F653950624A1BC673FD29B9B7271DE639C1BDB4B1C4DF7A036289311B9E2DEDA445D600B00580202DF82FFC400371100010204000A0707050000000000000001020300040511061214152130314191B1101334515272C1073235617181D1204050A1E1FFDA0008010201013F01FD9252566C911933BE03C23277BC078464CF780F085A1483650B6AB07BE228FBF23FA30A3B627CA399D560F7C411F7E462F178AB61564CE1625138C46D27643F507AA47AE7F6ECD1AA614B4AEED9B1896AD2A8CD97E7492D68F9ED319C5A7A4CCE4B2B1D36245B7C692618164EAA6E6D722C97D1B44562B73355406DCF746E8F67D505A1F5D397EE2C5C7D47E4728A851DD95709685D1096D4D8B285B555718D26A1F4E71D4C602D3D4BA8E53B900FF7A3F30B682A2BE8C49903E5EA7553C9C697508A6D0DFA92F15B1A379DD14CA7314C970C323FD3D1847DAD3E5F53AAA5B487A6928705C436D840B2440E8C22ED49F2FA9D54BCC2E59C0EB7B633ECE778E119FA73BC708CFD39DE3844DCDB938BEB1DDBFC17FFC4003E100001020106090906060300000000000001000203040511213140122032337374A1B1B21013222335415181931452617191D14244505360927282C1FFDA0008010100063F02FD7C7B5CAA149E9B03DD595DA30B6AED185B5768C2DABB4616D5DA30B6AED185B57352696C18B13DC0EAEE92E8EEC28879C2D1F01DC1669FF45542781F259B77F559B77F559B77D166DDF44C8ADC384F6105AFB282A491DD9516135E7CC5CE70D31DF8FE637A9B5CEB7986DCE70D31DE71FF00D86F536E845CE70D31DE71A96B3A3E26A462173080E6D40FC54DCDA69EA1A765CE70D31DE714458D45272415D070C1EF29E05B4B6B36E529B9C2AEA18365CE767CA20B631647A00759DE88F646423EFC1E8909F2779C2A2B6BFDE1C940EF54C4EB5FF1B021100C9EE08FF9377A9B5AEB7986DCE76A4DB28FBAA9C8BA2521CDA9AF6DA150FE930E4BC585077872594A743F0237A9BB5787C3739C1D0ECE78D3B506E09401B53A13EC777F81F14F86FCA69A0AA154537C695376AF0F86E73B610FCC7DD543943C7E362A791BF35376AF0F86E73B6B1F7C4843C1BCAD3F15376AF0F86E73A69FEEAD56A35A2EE5F30A6ED5E1F0DCE72D31FF00AADC6F30A6ED5E1F0DCE5FA63BD5AAAB317CC29BB5787C37396609A3AD76F55D78DE614DDABC3E1B9CB34AEDF8FE614DDABC3E1B9CB29FDD76F56156156156156156154576A9BB5787C3738D2C9BA243C18C709D0621A283DF42C885EA059B85EA059B85EA059B85EA059B85EA05910BD4099EDD161C09383D2C076138FC9358C182D68A00FE37FFC400291000020101060700030101000000000000000111213140516171F010204181C1D1F191A1B15060FFDA0008010100013F21FF007DDB8463415ACDA7A1F33D0F89E87C4F43E67A1B4F43013701F44EAEE8A86931371B6BF0214958358FB6004D8FBA3EE8FA73E9C51A8289B4D4699FBBBB12DDC994EE6AE7ADF7D047C505160A3C5C9F33C9246D9C1738BE0F24924918A5262E04A6886A6C6466BAA22D979B932BE1249231206C84B3675993B02AB6596ED940979A523CA1E2E4CB6E01549C03F703457E8F9203DA0284DB18D8CD0896D09118965E74D791AA24AD42935A0A5E67D1228AA299A9F37262322AC1CBAC858A8E6B33BA3638A727919A0922CC92FD7A50633C1E837AC17262396D29351DFE8C76B61907DD5D2417743CA23ADD515E0B412C92FB9B960B9313287984A16BB11288280982B26F554F444C28218DD00DCB05C990EE00D10A1688EA8E9EEC88E84AA21B8B206E582E4CD62FFD1156C05CF522501AD1CF44421A4928EBE6372C17265B289FEDC023569029A721B7B137AC17266A3FEA12B2E08691241C41F0D2EE5A6E582E4C4440727E45619B662C107211E772D37AC17266F85A2228170D8937999BD60B93109AB9F3088172C04402348928B7511A0E8FC0B9B3B199C5F69AC69DBCF70D34D31CD8441AC0F0E85A8A1A916E89512FF9BFFFDA000C03010002000300000010F3CF3CF3CF3CF3CF3CF3CF3CF3C8EB345DFCF3CF3CF3CF3C0FACBA43CF3CF3CF3CF3C4D8A1473CF3CF3CF3CF3C5AF7A3DFCF3CF3CF3CF3C1FF003B077CF3CF3CF3CF3C12B7347BCF3CF3CF3CF3C5D457573CF3CF3CF3CF3C205AF5D7CF3CF3CF3CF3C5FE3CF2BCF3CF3CF3CF3CF3CF3CF3CF3CF3CF3CF3CF3CF3CF3CF3CF3CFFC40028110100010204040603000000000000000001110031213041B1516171811091A1C1D1F0204050FFDA0008010301013F10FD258A8F1A8F1A8F1A19CAB99CDCF16701482E3455989D089E952C521892CA8F6CA4512567084FA503D337B76FB7A6639429D2509F7A211C6185744E651200267B0A7AD4F863AB7F6A3B6A03D1B793BD4454EC3CCF8AC44303772A25CB72A6B34395C20E462BB1DEA72C8F45B94D6469177E0E6EF85226E41A0703EE3985F00D461F329C2CAEAF8DCCA210FE151983F85FFFC40026110100010302060203010000000000000001110021313041516181A1D1F171C11040B150FFDA0008010201013F10FD29E45E012D7B478AF70F15EC1E2A54973234BB1FCE9ABB4A1ECFF18D08F9712209900458DD909D9A0B0C4C10417FB7488A206E30E2F8E552AFA1DC20082CDA650DA50502911A5A5680B1C464846E3224945D3BD5879F8D2CE987741ECD20D0F20B138978B13138BC52DD282704531D59F852D166D04A724CDB8E1F9B54D526F712DD74BE52FE14A76A6E0CF3CCC0EA2BA529340770E91D29FE94361CEEE1E5E45FE0BD5A4D9573B8BF46C5A96BB06907D5A6C825852CD1420180B05282A6BB2690CC109892724501E057A457A45074104588B4AFDFF85FFFC400291001000201020504020203000000000000010011213141405161718191C1D1F010F1A1B15060E1FFDA0008010100013F10FF003EDBC361037744EA153F5334FF002B468C78BFD4CEDA88A30CD70A8E83C1BA45D40804B7E4018EEEEC30516C8643D23BB872243BD4B36FA5933EAF497DDBDA7DDBDA1B788410ED08D4A28C0E51888EEBC168F24344D24DCB972E5CB983744E0F9A6B682A963B0E0B4793F2834972CFC180591BEBBAF05A3C91D483BBF2348267486D4DA197B5E5F043CF822CCB4A1157C5D34AB57B61E382D1E48ACC8B2B9F6FC1A4A8E51C6507466C5BAEA1B19DF02872D5CD9DAAB76B170166747CC5DBC467F701BB37A755C168F247EC1B1026EBA5B356E126588BB66F07B04845426742C3B3844D91E92A8990C06AAE020CADC390AAB4DAAAB7F113F255F0D168DCE70EC6CB8EE4C1C797B2A9FF000382D1E48369A0B792653C0D0D3ACC2070807229C594D26F8481EB429500D4A74375DCB331CFD4BB25668F79455B17B6CEB89A7C734BA11E0F8E8F2410108E6C532C150D82500616B7575879D168607AC1F52CDE729CC558D63A3A9D12336AA545860F3258C651B72883DB83A3A3C90D523AA5EF36316D4061D24158822EF0A60BB9BBADF42175A230F996431747FB383A3A3C9039F275EB23A5F58F1BAAE4C2B07AE03DBEC6FD3019AA5ED90634167A9C1D1D1E4957BAB15CE14DA7BA055750B478954D976BDE34E0EA7221E4265AA56400FE9F074747927334A428ADBAACB50CA212DDCDFF0010711D39444B59F5AF07C7479201D6AD4538398B2DF6E5DDF89404A0846F3A9315F6AF0747479238D4F409F74E15CC694098EF3A92C9507DABC1F1D1E497BAD27DE310612822B9C46369A5F6C383E3A3C9304DD40D28D187C00F983F84F987FCD3E67E94F99FA53E67EB4F98FDC56C1580F38242170EDC1AB17EC3ABA352BA348A9934FB7FBC41C27DF9CFADFBCFADFBCFB9FBCFA7FBCAFD5D636DA8B1D2CE2EE99A740F3300E8007FADFF00FFD9, 0, CAST(N'2021-05-07T15:54:06.317' AS DateTime), 1, CAST(N'2021-05-07T15:54:06.317' AS DateTime), 4, 1, NULL, NULL, N'Vendo samsung A01 2021', CAST(100.00 AS Decimal(14, 2)), 1, 3, N's')
INSERT [dbo].[Publicaciones] ([idPublicacion], [Titulo], [Imagen], [Raiting], [fechaCreacion], [idCategoria], [fechaPublicacion], [idSubCategoria], [idTipoPublicacion], [idDepartamento], [idMunicipio], [Descripcion], [Precio], [idEstadoPublicacion], [idUsuario], [Delivery]) VALUES (5, N'Vendo Nokia 2.1', 0xFFD8FFE000104A46494600010102007600760000FFDB0043000302020302020303030304030304050805050404050A070706080C0A0C0C0B0A0B0B0D0E12100D0E110E0B0B1016101113141515150C0F171816141812141514FFDB00430103040405040509050509140D0B0D1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414FFC200110800B400D203011100021101031101FFC4001D000100000701010000000000000000000000010304050607080209FFC4001B01010003010101010000000000000000000001020403050607FFDA000C03010002100310000001EA90000014850480004481550B8000000000000B79C0F659AA4A64274B1C4519E93792911DF12CFAB200000000006312E0D478440F4489AE393128844DC8A33B817DCB5900000000003189718EDF3AF5AB0C602D3DB05B7A658C329E5AA8E6B8E72EFD45E57D46E5AC800000000018C4B8E35F9FD23C345C6D4988916E5E26B253EA12E5CE5D72F4162F6F72D640000000000C625C67AFCEDD71CAB27A79529D4995EB18BCDAF553AE98B577972D5BC62A00000000006312E33D5E6DEF46196B505F347977BBE6F52B38EAABE1A6A79F7C6D5DCDAB2EF18A800000000018C4B8DF461BF75C92A567B719DC76653E6FBB9379DEADCF36B9BCFA60FAF16CCF6FE7F76C4000000000018C4B8FEFC326B53C56F6BA74A9E1AEF18BD1CFFC3F6EFF008BA46B3A9BD9F3B637D37CC6EB8800000000003189724D2D98F2BC9E7DE5E7D773C7BAE9876DC31E9C979F913A2DC71FA37C6F5670DBBBE200000000000C625C99C3BEC7C3BE470D13326DB8E1D773F3F5EB9FA0F9CD4FF65F17EAD5C7EEEC8F3BD7DCD590000000000317972765D5B0316E864D9E7974C63B72ACE2D2FF0077F05E6F5149CBB76379DEAEE6AC800000000018BCB8AEF4A8BD2C1D38D276CF19A2617A250293976EC3F3FD4DCD590000000000317971069CFBE629AF6275DEEF365C5C0CBA9D3A1B0E8E3BD9CBB070FA3B9EB2000000000062F2E26D396F9DF2584B7DA23302289E9C8B86BD7716EC5CBA773D640000000000C5E5C4FA735368C9E48A233134A68BD373EF04D0D2DD7D9B46E7AC800000000018BCB883466BF7A192815B9D2D099B460DD7AC7E8E3BE9F8F9674AEBBCDDBADB3F7DCF59000000000031798E1FD19F28F4F24BE36995E9EE2D68C99B2DF3B7621EC73CBBA575A65EDD57C3B6E8AC800000000018BCB86B467C87A5214BCA97A229F04C25968A4F50F1EBBA2B2000000000062F2F9F16AD74C44802242512051C4F6256774D640000000000C6E5F35CA7809C5722053269403BBAD1B9AB2000000000040E5D98C4931200000BA1D510BA000000000000000000000000007FFFC4003010000006010302040504030100000000000001020304050607113612301315161710142122243132343520334050FFDA0008010100010502EC3F2D98A5E775C3CEEB879DD70F3BAE1E775C3CEEB879D5798F3AAF0C58C594AFF82C25940816B6926D26EE6373084ADC51C67C82D89BD4E7CCB223A64CC7CE96D8926A9F50FE1172E5E63DDFC9F8E388529DF09C21E12C136E24E52DF4B5BC90A43CB0843A8354EB15890E497C694F18EFE4FC72BBF77C3612CFEEDBE0ABF7DEB05DAB8B45CC853F5FA53C63BF9471CA668E449F4C5542078C532549C56A161586D3A8FD154C1EC3E91969BC3A91D6CF0EA552F33A72A6734A78C77F28E39566695B79CABA7DC230BD44E84A751D463DC450F709460B50143D74632990ECF8BA49FD0F7F28E3957FA9FC252BE8CFD421ADC26384C50514648C7452E927F43DFCA38DD496E0D00D01E4F538D16C2227A835142620F9419733D141A4C832C77BF9471BA34EE3C30681E0EE131C466CD070889C4A580A67619D3849A6D2673AB1CEFE51C6F1C4F517841D6BED4301B8C1B8A11F8C28EDE1DE3779358A9857B3DDB4734952658F77F28E378C84B7D44E35F721A0DB4108D8665704C46ACB293512A7DA4CB45CAFE3E94717EFE51C6F1951249A96940296DB8A913DB86D46C955D565972188AA335ABE12FF008FA51C5FBF9471BAF97F2C24DA3DE1798490A35B8AFAA41EEA3D86DF099FC6D28E2FDFCA38DC54EE786D647540CCA3C2293F421B0D86C312831EC722B3851ACF1E9A7F8FA4FC5FBF9471B83FAC39F261393D4E3B2761B0D86C1949789637163671E597E3E93F17EFE51C6E09F491FDC7D23A47405927A8D640FEA3A44D2FC5D27E2FDFCA38DC6FD90EA9C98C3AC784AABA87ED9FB5A97E9DC8F1D535E9D8E3F122478CA92F4EC59F871E797E2693F17EFE53C6E17DCA853150CE7CA29926AAD9EA8957572FDDBD11E38AF4FC809FA98AEAA2489B911C966C93B42D26E2FDFCA78DD3FDEB30864DD574026F73535D27D00D9324740B54ED0349B8B77F29E371ED4EBDCF52287A9143D48A1EA450F52A87A9143D4AA1EA450977672A3E93716EFE4A83731D7FFDDF068906BE8883A220792D17F8693A0D38AF7CCB72C8346D5225FB2F6E3D97B71ECBDB8F65EDC7B2F6E3D97B71ECBDB8F65EDC40D169BE3D657315103FF0FF00FFC40030110001030204040404070000000000000001000203111204314051131421411020325205224261233350607181E1FFDA0008010301013F01FD78903357377573775737745ED1DD7119BAE23375C466EB88CDD07B4F407458ACC79310EEB4F1E6097DEE08CD5A74C9615F74EDD1627AB9A10C34423B9CEFF57059B2E0B36470B0B8D4B57270FB57270FB57270FB5725064428B0FC2C40D162B30B8D5EA42E63EC9D8AB45689B8B2EFA57307DA84C7DA848765738A0C375C5761A1C5E63C66D942D4D8AA9B026C08409F1DADAAEC34388152158AC4E8AE728A3A285954C850857096299488AAF4D0C82AAC4189B0A6C2A28ED518E8AA020EAAC7D04442A6840AA0C4D8D3224C8936241B68EAB9863EBC3355CCB22697C99052629F8BC45EE5DB431041A9AC4D626B500BE338D113380CCCE7FC28A67C26AD2A495F2FACA87F3068A129AF09AF09D3B621739478E0B17F146C31FC9EA29C4B8D4F8C3EB1A22F2CC93A775335CCC83BA73CB8D49579DD389767E487D63452F6432AED9AC63DB370E48E3B4168CBBFDFFB569F246017005451CA70DC4C4D01EC3BD373B57650B4DC0E8A5ECAA6A6851F2815543F514DCF452AA794467BA029E0DCF452A281AAA13D02B4D68561606CD33212E0DBBB9589C240C8F8B869AF1DD134155F30F504DCF452F6441CC20D5691D5B9A009373962B0FCC3280D08EA140E3161B827D4734E6DC28BF11DD1F926E7A29106AA79C67A2A555AAD56AB55AAD56AB553F6DFFFC4002C110001030206010304020300000000000000010203111204132131405141102032051430612271233350FFDA0008010201013F01FC34528A514A294528A514A2F0D57A2A54AA9A9A9552AA554AA8BC04DCA2A96AF45ABD16AF45AEE8B1DD163BA2D77458EE8B553C0EE026E41E7D8CF5CB444B50B499291A8EE026E43A5C24EF7C9630CD77666BBB339FD99D2766749D99D276673E95A8F92F8C77013721F22C095A993FB121AF9161A7932BF665A76589D96A0AED282EFC04DC8BCFAB47A8AF1641653346BEAA2EFC04DC8D772A5C5C39C48EA0E94598CE30F25D220BBF0137116952E2E1641D2923EA4CFA0AF2F301557A28BC04DC72D14BC578E9074A3E71CFCCD09B0F2E1D51254A548A0931122471EE478666170F96D177E026E4A2B873C73C7BC7BCFA2E0D6593EE1FB26DFD93E1A3C4B6C913421C3C5874A44DA12FC14770137264D473154731C361748B4692603A30DF4874B27F93E23511A944F597E0A3B809B88CBC481A6433A11889B16A0894F64BF051DC04DC8FC8F72B575D8C23EE6AEB52BEC7AD1BA0E73998ACB8F56F7FBEBF7FD92AFF001541DC04DC8BC8A88BBA0DA22689ED5D0D13641FF11DC04DC8FCFBAE2BE8FF0088EE026E45E48A2BE955DC96258568A3513E4E5A20E46A25CC5AA134D94CB86E2D5274C34EDB5CBAA0D6DCB44291BBFD6EAA8FF88EE026E47E48A646B6C792CB7D13A192368AC7A68A3DECB72E24D07B6F4A1F6D34D8CFBBC43AB6A51A831D63AA56166B1A2D476C3B809B8CF257F03B61DC04DCBA85E5E5E5E5E5E5E5E2BEA3B809B8BBFE2770B434343434343434FF008DFFC40044100001030200060C0C05030500000000000100020304110512214093B21013142031333441517374922223325261717291B1D1D2E1356281A1C23043A224425082F0FFDA0008010100063F02FE85E699910E97B805CBE9B4CD5CBE9B4CD5CBE9B4CD5CBE9B4CD5CBE9B4CD5CBE9B4CD5CBE9B4CD5CBE9B4CD58B0D4C329E863C1CC6A2A48B88637496F50524F532BA491C763855981CE3D0171527B91F1730FD0A18FB632FD374C861DB2495F91AD69CA5636E6A8B709E1C9EB513A4DBA07918EDC7B8B8E950CF31C699A4C6F774DB9FDD6CC309F6693553EC09CBCCBC877B9790EF72B86BC1F40478DBFEAB865FDD7841E7D6AED0F07A42F0AA2A4FADEE58D3BA592DCF21251EB8EAB730C27D9A4D5551ED6F00D91573C30CEE0C0CC42DB33D760A95BB547E222DA464E117BDCFA53816B5B8BE6847AE3AADCC30A76693553E26F94F943426472C0E98E4C699CFB220D3007DB72C94A0FF00DDDF357347FE6EF9AE45FE6EF9A7C868B2345F23DDF34D78A2C8E17F2DDF3463DC447E6121F9AACA76BB1D8DB1693C3628F5E755B98614ECD26AA9C83621F70530D450C734CDFEE63597201A4FB227700D2FD97E1E34BF65F878D2FD97E1E34BF65F878D2FD912DC1EC0FE9DB3ECAB2A663791F6BFBC2A8EBFF83730C29D9A4D5551ED6C81BEA93E81F10AA3AFFE0DCC30A7669355547B7B3EADE706C55FA87C4299DCCE9FF83730C29D9A4D5553EDFF0046A63BE5207C4295BE6CFF00C5B98614ECD26AAABF6C6FB1EF60386EA434B28798CD9E3A13AA277E2B47BC9E80A6A89BCA3C0DF347429DDCC67C9DC6E61853B349AAAA8FE70AFBDDC311BCB28F19F95BF742A2924DAA5B16DED7C883EAEA249C8E0C73C1EA4F47AF3AADCC30A766935555DFCF0BD08D8FBD1924706B4224B865E6B2B44DFF0052E1E0F40F4A2E71BB8E524F3ECBD1EBCEAB730C29D9A4D55364BDDC8D8E223E34E558CE25C7A4EC12784EF1E8F5E755B98614ECD26AA97D6B74F83B7090975C5F20E650D4D2975E7C62E0E686F3F405D3BCA1A7AAE21EFCA0FF00BB2640B080AAA38A1653B1C62A86B032C470593873A3D79D56E61853B349AAA5F694A69EB772DFC170BE4722E967DD0EF3EF7FD37A0990436CA1CB73D4E17DBA207C873F87F6CA9E8F5EED56E61853B349AAA63E9DE9C505ADE826EB26CBD1EBDDAADCC30A76693554DED29E66D84708BBB2FE8ADC28C50005C06370D93593B314B85C2118C88D48F0E169B39D9322644CF29C6C14B2E3B64DA78D683958A447AF77C1B98614ECD26AA9874146C0381C85AE17047414E976A6420FF6E316016DD0DAF62328BA64936282D6E28C56D90785B8A28F171CE34AF393F40A399BC2C37554D640C8DD546F238052A3D7BBE0DCC30A766935555FB7B161B16D9C6D897FF73A3D7BBE0DCC30A76693554ED1187E33EFC2B93B7BCB886F797276F797276F797103BCB93B7BCB881DE5C9DBDE4F8B690DC6E7BA3D7BBE0DCC309B5B949A69354A7FAF67C612D6FA02E364EE2E364EE21B5B9CEE9C616DE651C33BADFB0CC2C7284F970654C6C89D97699AE317D00AE3E9348EFA5728A4D23BE95C7D2691DF4AE3E9348EFA571F49A477D2B8FA4D23BE95C7D2691DF4AE3E9348EFA5377556411C5CFB5DDEEF8050D2533716189B8A3FE13FFFC4002A1001000201020406030003010000000000010011213151404161F010718191A1B1C1D1F1203050E1FFDA0008010100013F21FF0041456D06FCCEC4FCCEC4FCCEC4FCCECCFCCEC4FCCECCFCC1D42BD9CE26E45ECE73A9136FC3C0DC220DD635F1326B22B83A1B1D2751F79D67BCE768F2AC0B3EE63DE92E90D63CA5C5C6854B229D2274242C30BA3B2FAC3E066736607B3997A820E7D1E655BAF01DF374C0BAF45C341EE67F733AD124227993042FFB62AB0FB16073BE4A33E50C7E652F226817E7C0ECEF9BA773E7E15E0BB639F002365DC14C574E18545B79F3F22320CBC1DC8025225342E4D78179DA374590159D2D6A03C683792D181E6EC410A351FD902B234C40FC2B274D35ACDECB4D7220CD50177662C056CD0710C941CFC84BEB19C029DA37476C68351DE3C46E9CBD6A9AF019345602FE4C7F7315D171E50A814435D473F341E6B8A141800E813E1B80FB56E82FBFCE08CA776DCD294E5FCA746742602D217C3701F62DD2F795F9F10BDDB08CC8152595898E1A729708CE9AD07A0F01D8B74F637D318A45DA17DEF1E1361CDE74A54D20D05C55E6A414B4B677B6E03B16E9E4CFA1F0D15DF12FE50206D0B7A0F69501D661AAB94EC73C9E4C151841E8B7162A468969760478159CDEB807B96E9610EC18023465C0DA747C0011F172033D1F3FA4A5A3880572470CB48B3A4BEB4D0F49F10FBE06A772DD2D607EA6214B734A37E89D57D195E411541ABD608CEFD4CAFAB3E88A21AE495CD654A9F00FBE06A772DD1292CBA1E9B92CD60B854AF41F68E96F55B965AFA4B177ACF8853A23EB07B07DF0353BD6EF0346B5ABDE2BF408DBE72C0374AD14801594BACD4BD2CA366DF129A545EC212BE681296C7E40FC80630E904DB0BE99E04A77ADD05C5A79F4E0F5291F682A2B0A215FA7F88DA0991BC269A738041AB4AA68A9F24A3CA3EF8161DFB7415B94DEC7C53747B72CDA1EB00616C0BB73E0A7C93EF81E1DFB74D36E23084DD174BA0E7962D868E8C556F427036B49CEEC98D9E8F463CA5B9CD0DF0392EB93BC1A6CC5058E40359B3994F967D9C0F2EDDBA3E82FE651D13686D439939626E89722502789A9494C2649055ACF2F5606775B4BBBC70039BA0F232C2244A479C13B4ACB86F1979CB1743ECE05D76EDD335D27C331D26385EB9F0310D56A3D4E7177E011853FFBFAF05AFA1F4E04D76EDD0AC1ACA555CFE8206FE64FEC27F61156D77AA9FD04C35876BCFE822E040C1B59BE06D165480DE1AFDDBE344DD9733F92FDCFE4BF73BB716FFE167606F551F70F000C02611E710A6D3D1246CDACB377FD27669D2A54A952AE628E5ED821EFED146572B6BBABCD5B5F3FF89FFFDA000C03010002000300000010924924C000008A4924924924932D34760F64924924924992D8CB91F24924924924C6AC6102F924924924922DC3D627DC924924924916617787A649249249248B84341CF124924924924575B630B392492492492260557E95492492492491478B51CE649249249248A87BA007724924924924D9EE11083924924924926298ED965C92492492493422D5ED7E49249249249BE3A4751F24924924924C56F75C23924924924926E889973DC92492492493AEEA93A7E49249249248A474C1077249249249245BBDB41279249249249201247E493C9249249249078249241A49249249249249249249249249FFC400291101000201010606030101000000000000010011213140415161719110A1B1D1E1F0205081F1C1FFDA0008010301013F10FD1D7E1898FC2A1B0D25AA729DC9CA772729DC992477272FDC9CBF7251BBDC9CAF722F457A9B17917C2E5CB04DCBA8D005AAAAC45D0615E771834157E8C361341BFDE3E30DD036ABF980CE17567DD73EEB9AE0757DE7D4BEF3EA5F79F52FBC7705AB32E7358D783AD43A8D869FD21B0AA7E4C0A06A6F97FF0072F579E197EAF883FCBE22FE5F113F398366EAFE70E938C11F5B61F22F811E03BE58033869C89C9946E97948FADB0FF1332838B63126BC1E108DD2BC21B7A7A9108385EC36C845B2C9CB8C882DA320611EF03EE4C01E3B1B6DF0021C06551BE2F5486092AF3391CE0D7C3A1B829A22893AEC0CB2D97FE1D9914B7A6E0EAFA4C3731FD4F4ED0FD394361206E02370442804736B1FEBD2E5CDFF0086F8BDED72CA950FDB96C5586F40AD1D21629E6674982E051DB52A5787D5D36254C15ADA32E8E7C2513340574DCED51E073C609AE250144A95345886456B46E340ED26D32809762E086C3AE070AB7758131772A54AF0674410AB269C3613750A692BC2E397110C00A3C34E1B0BC044828692BD904D36C31BA6253151A160B5D6868C5F194DC6D6089CF827FB985722D6D63CFD60C76166B8B505550ABE1A4BA361C6591B74C473BF84E090BE74B6145EE0E40196B7E2582899432BC1C20C21B09B496E58704A952A54A950E1B1268F83AA754EAF0754EA94855B86CB999FC4FDFF00FFC400291100020102050402020301000000000000000111213140415161711091B1F020A130E15081C1F1FFDA0008010201013F10FC09376360D8360D8360D8360D81A6AF814A5C0C4E284896A4B5370913A8DC370DC12B315274C05A243846EBB1BAEC6EBB0999BB1BAEC6E3B1BCEC6E3B0D296C64E30168F2924925924F4A88D0954D5D5C9219F64C9C602D0D067A8C8A9694BB51398BDECEDD524B50BC0F6247B123D9027C138A3A7EB7C8635BF6A5CB8C05A3277194476B1012A027F410FF0081A834085CC88A678D602D0FF7249333202317D1663D1E3580B440F975945132E9A3CCDF39910F6C2DDB2C05A26741C487A0B418E35E64C9A6DFA1EA96CB016BA63119091F41546ADD8A35495EEAB3590B3E5BE966DEC8D10DDE6DEA2DDB2C05A1E1C72357C1F6321DC77DAB85E782A5529D2AB71F1095E2EF9777D364E301687348DFA02D5684B54B275082BCA16FABD97FAF25B894B84A896DF0D938C05A12CDBC8995524E17C2421AF214B08924918327180B42FD8636CA4A1277986DB559FA8A172D13BB5F4B58FA205EFD5EE770BC89D4B9DA8B7FB38532751110C9C602D1E5172AC220A25A447C5924B2B4C45E327180B43FD89927A40A8AA344A8366E5925C327180B45DC84BD12685499694BE09C929D98DA709BB86EF6B0B337713115D1C930EA76598C42B40E6ABB6CFB0E5E7158A02B10D4A576B8DCB864E30168F311E1C4CA6AE9FBFB2E06D50A6ADF249938ACE1A6ACD08AB0A73572DB88F05F50D550D5AF40324EEDD155CBA2EF41A85F7212308C9AAB50A68CBE64E30168F30F4924924F49247ACC9C602D099DA25A13D09E84F427A13D09E84F4189105CB8C0582E7C29F2B971816D3BFE10094B21B972FF0084FFC4002A100100020201020603000203010000000001001121314151611040718191F0A1B1C120D13050E1F1FFDA0008010100013F10FF008367CF25E8B2FF00CEEDDBB36ECD0881A04595804C23613889778FBD11F2391728557E7587BC7C80593B3F0E81800EF63E9FD14A3FDA82980405236D11F21AE1892531008128A0AC3C437573104CDB5742F2E18B5F7048EC97646905F105277D8A84B485802911A711F699A06B295C8BD4F2375C8E1AAD32F423163FA749F7CFE42C11A45F244638637B66D93D63D94EC77CC1AD8816588E4EA29E8CBDDADBBEAAE76A5F998208ED3B34B6ADFCF927377AA4C7514F560DE5F98BAE7E6306B42D98BBDB0B200D8F467190E954C295B3C5B5406F41B416C5E6CD59589B47D43072E75F6BC9695BAD4042A45EC2DCC33C270E6AFA1A2831958C9AC36165C982DB68DC2A6FB7C32C27CC4900B4736A8EE90968F860174F51A7B9073872F62D6668FA90067F65816B8A5A35BABE630C452C075E475AB5851A15A07A88304ED81496F25C5CD0D5E409639BBAAE747260117DA6C41CA34CD480529A23B256010000E82576C2114E455B457E65E0CD54C02E0001DBC9584B60EDFD78115297DDCF4200082145CC2966BF98E11A05E499622B3FA7E88B22C7C7B00FF7F305925880B04F57B4B845092AAA494EA59D47390BF7F23568BE9111E20BA602C6545AAE3931F8943B0335A57641A2A416E9ED0B06CD021721B7882C60DB63F4ED791ABDC110B789620CBFFD4BC43AAC22AAA2ED78AA216A9C001772A098A9DC2016A69C34C0E1EDAD2C2F601ACAD02CC6C821757E84BCBCAABB9CECC4344FE7C8B5A496049D480CAD17998AF02DF561951A318802E89AD1C8646F9C3155C5BA9102E088DA42434963483C4766F98E260D0B4601A27D8747920AD72C0516C2BCD3619AEE4422A5A361DAE1D1137656872B58F9D113FB3CA9E03A51FEE02AD710A7A2AE4DBD86251EB6D5B472AE6E138C3F738792CAD567C1F450914594A36CEA9E21C9163543DC60EC4A1D5A8A68A3E0C4046E740EE65125FB147C0078F6D14360194FD4C3C96DAB72E9FEF3ADDD4D9D70883689CD5992687255BE050036D58DA0C7B06A23E45F1C0BC709DB78707375CCB0875E39481811E460C3B65606B063C92DABEDD7E98E28947083B6815336CB9A737D17CE014050A295460E215F0FA60DE203211B17868E45A913557C43B561D364C1DF19D275CCB557FF00079293172BD4A1D70CB47B56E5BA417496251ABCD6EA3C6592C15910179BE099989D4A097F55E1BED6BF43C9298AF0366FC3070ABA54851340C7594200B12AE25749D62BC22977BD665208483AA836C6C37C336D66D140B0D72AA01D5848553A5C391C81E4B388135F068B5E63FDB2B4340891B1C674963897CAF245ED79959BEFB90D4371EA963B107622088830E2B057C30DCB5757BDAC3376CB6D212CBC77207713C25460B9B4B5E63FC54B1538444EE20C16F858C002CE2ED4E28035A74383474C77759EEE8D16950015F42630D792E66BD29F1F083F91A92BEB5140AAD95407EF9E269A82E9585E32B44C0EB002E91F507E49E88A2D2C1765E1C572E6606A626D792CA6BD85A12F982B0779F74FE410849A434FC4FA27F27D03F911226D5AFE27D8FF0092C09C6B04F6A8A7D0FC4129A2E28344ED1DF90D9448F7B5A899F101EE2D9F87C49512D9AEE30A78D1A215F5BA083A552BE7C48698AC9A289ECBDBC81F9142B03B139223A6D8576F02FA0014341E1C1A309FE63858B162C4C29BB58A0E97BDD21CAD430A0DBF2F2C88E54FFD27FFD9, 0, CAST(N'2021-05-07T15:56:16.867' AS DateTime), 1, CAST(N'2021-05-07T15:56:16.867' AS DateTime), 4, 1, NULL, NULL, N'Vendo nokia en buenisimo estado', CAST(175.00 AS Decimal(14, 2)), 1, 3, N's')
SET IDENTITY_INSERT [dbo].[Publicaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([idRating], [Rating], [fechaHoraCreacion], [idPublicacion], [idUsuario]) VALUES (1, 5, CAST(N'2021-05-07T18:02:15.883' AS DateTime), 1, 9)
SET IDENTITY_INSERT [dbo].[Rating] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([idRol], [Rol]) VALUES (1, N'Administrador')
INSERT [dbo].[Roles] ([idRol], [Rol]) VALUES (2, N'Vendedor')
INSERT [dbo].[Roles] ([idRol], [Rol]) VALUES (3, N'Comprador')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategorias] ON 

INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (1, N'Vehiculos', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (2, N'Apartamentos', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (3, N'Casas', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (4, N'Telefonos Celulares', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (5, N'Audio, Video y Foto', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (6, N'Computadoras', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (7, N'Tablets', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (8, N'Proyectores', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (9, N'Routers', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (10, N'Juguetes', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (11, N'Microfonos', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (12, N'Audifonos', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (13, N'Smart Watch', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (14, N'TV Smart', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (15, N'Cargadores', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (16, N'Cables de energia', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (17, N'Teclados', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (18, N'Mouse', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (19, N'Monitores', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (20, N'Bocinas', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (21, N'Aparatos de sonido', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (22, N'Limpieza', 2, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (23, N'Ventas', 2, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (24, N'Inversiones', 2, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (25, N'Cocina', 2, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (26, N'Pintura', 2, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (27, N'Encomiendas', 2, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (28, N'Mecanicos', 2, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (29, N'Zapateria', 2, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (30, N'Utiles Escolares', 1, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (31, N'Fontaneria', 2, NULL)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria], [estadoSubCategoria]) VALUES (32, N'Ropa', 1, NULL)
SET IDENTITY_INSERT [dbo].[SubCategorias] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoPublicacion] ON 

INSERT [dbo].[TipoPublicacion] ([idTipoPublicacion], [tipoPublicacion]) VALUES (1, N'Ropa')
INSERT [dbo].[TipoPublicacion] ([idTipoPublicacion], [tipoPublicacion]) VALUES (2, N'Calzado')
SET IDENTITY_INSERT [dbo].[TipoPublicacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idUsuario], [idRol], [nombreCompleto], [Nombres], [Apellidos], [Dui], [Nit], [telefonoContacto], [correoElectronico], [Contrasena], [idDepartamento], [idMunicipio], [Direccion], [Vendedor], [Comprador], [estadoUsuario], [contribuyente]) VALUES (3, 2, N'Douglas Guzman', N'Douglas Ricardo', N'Guzman Barahona', N'054439764', N'06143010961170', N'78804230', N'drgb96@gmail.com', N'123456', 1, 1, NULL, N'N', N'Y', 1, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [idRol], [nombreCompleto], [Nombres], [Apellidos], [Dui], [Nit], [telefonoContacto], [correoElectronico], [Contrasena], [idDepartamento], [idMunicipio], [Direccion], [Vendedor], [Comprador], [estadoUsuario], [contribuyente]) VALUES (4, 3, N'Cristian Torres', N'Cristian', N'Torres', N'045002738', N'082112081911066', N'71003568', N'cristiantorresalfaro91@gmail.com', N'123', 1, 1, NULL, N'Y', N'N', 1, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [idRol], [nombreCompleto], [Nombres], [Apellidos], [Dui], [Nit], [telefonoContacto], [correoElectronico], [Contrasena], [idDepartamento], [idMunicipio], [Direccion], [Vendedor], [Comprador], [estadoUsuario], [contribuyente]) VALUES (5, 1, N'admin', N'admin', N'admin', N'000000000', N'0000000', N'00000', N'admin', N'admin', 1, 1, NULL, N'Y', N'N', 1, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [idRol], [nombreCompleto], [Nombres], [Apellidos], [Dui], [Nit], [telefonoContacto], [correoElectronico], [Contrasena], [idDepartamento], [idMunicipio], [Direccion], [Vendedor], [Comprador], [estadoUsuario], [contribuyente]) VALUES (6, 3, N'juan perez', N'juan', N'perez', N'045002738', N'12345678999999', N'71003568', N'prueba@gmail.com', N'123', NULL, NULL, NULL, N'Y', N'N', NULL, N'N')
INSERT [dbo].[Usuarios] ([idUsuario], [idRol], [nombreCompleto], [Nombres], [Apellidos], [Dui], [Nit], [telefonoContacto], [correoElectronico], [Contrasena], [idDepartamento], [idMunicipio], [Direccion], [Vendedor], [Comprador], [estadoUsuario], [contribuyente]) VALUES (7, 2, N'juan antonio perez morales', N'juan antonio', N'perez morales', N'054439764', N'06143011951170', N'76112426', N'juan@gmail.com', N'12345', NULL, NULL, NULL, N'Y', N'N', NULL, N'N')
INSERT [dbo].[Usuarios] ([idUsuario], [idRol], [nombreCompleto], [Nombres], [Apellidos], [Dui], [Nit], [telefonoContacto], [correoElectronico], [Contrasena], [idDepartamento], [idMunicipio], [Direccion], [Vendedor], [Comprador], [estadoUsuario], [contribuyente]) VALUES (8, 2, N'mauricio quintanilla', N'mauricio', N'quintanilla', N'054439764', N'06141510911153', N'71213535', N'mauricio@gmail.com', N'12345', NULL, NULL, NULL, N'Y', N'N', NULL, N'N')
INSERT [dbo].[Usuarios] ([idUsuario], [idRol], [nombreCompleto], [Nombres], [Apellidos], [Dui], [Nit], [telefonoContacto], [correoElectronico], [Contrasena], [idDepartamento], [idMunicipio], [Direccion], [Vendedor], [Comprador], [estadoUsuario], [contribuyente]) VALUES (9, 3, N'Nathaly stephanie ventura de guzman', N'Nathaly stephanie', N'ventura de guzman', N'053373818', N'06140604961171', N'75126258', N'nathyventura96@gmail.com', N'123456', NULL, NULL, NULL, N'Y', N'N', NULL, N'N')
INSERT [dbo].[Usuarios] ([idUsuario], [idRol], [nombreCompleto], [Nombres], [Apellidos], [Dui], [Nit], [telefonoContacto], [correoElectronico], [Contrasena], [idDepartamento], [idMunicipio], [Direccion], [Vendedor], [Comprador], [estadoUsuario], [contribuyente]) VALUES (10, 3, N'jose ismael ventura martinez', N'jose ismael', N'ventura martinez', N'054439764', N'01461706961153', N'78821441', N'jose@gmail.com', N'123456', NULL, NULL, NULL, N'Y', N'N', NULL, N'N')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Wishlist] ON 

INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (1, 1, 3, CAST(N'2021-05-07T19:29:00.000' AS DateTime), 1)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (2, 1, 3, CAST(N'2021-05-07T19:48:00.000' AS DateTime), 1)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (3, 2, 3, CAST(N'2021-05-07T19:57:00.000' AS DateTime), 1)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (4, 3, 4, CAST(N'2021-05-07T20:01:00.000' AS DateTime), 0)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (5, 2, 4, CAST(N'2021-05-07T22:09:00.000' AS DateTime), 0)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (6, 1, 4, CAST(N'2021-05-07T22:09:00.000' AS DateTime), 0)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (7, 4, 4, CAST(N'2021-05-07T22:10:00.000' AS DateTime), 0)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (8, 5, 4, CAST(N'2021-05-07T22:14:00.000' AS DateTime), 0)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (9, 4, 4, CAST(N'2021-05-07T22:18:00.000' AS DateTime), 0)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (10, 3, 4, CAST(N'2021-05-07T22:23:00.000' AS DateTime), 0)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (11, 2, 4, CAST(N'2021-05-07T22:28:00.000' AS DateTime), 0)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (12, 1, 4, CAST(N'2021-05-07T22:28:00.000' AS DateTime), 0)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (13, 2, 4, CAST(N'2021-05-07T22:28:00.000' AS DateTime), 0)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (14, 4, 4, CAST(N'2021-05-07T22:28:00.000' AS DateTime), 0)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (15, 1, 9, CAST(N'2021-05-07T22:40:00.000' AS DateTime), 0)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (16, 2, 9, CAST(N'2021-05-07T22:40:00.000' AS DateTime), 0)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (17, 5, 9, CAST(N'2021-05-07T22:41:00.000' AS DateTime), 1)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (18, 4, 9, CAST(N'2021-05-07T22:41:00.000' AS DateTime), 0)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (19, 3, 9, CAST(N'2021-05-07T22:42:00.000' AS DateTime), 1)
INSERT [dbo].[Wishlist] ([idWhislist], [idPublicacion], [idUsuario], [fechaCreacion], [estadoWishlist]) VALUES (20, 1, 9, CAST(N'2021-05-07T22:42:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Wishlist] OFF
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_Vendedor]  DEFAULT ('Y') FOR [Vendedor]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_Comprador]  DEFAULT ('N') FOR [Comprador]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_contribuyente]  DEFAULT ('N') FOR [contribuyente]
GO
ALTER TABLE [dbo].[Municipios]  WITH CHECK ADD  CONSTRAINT [fk_municipios_departamentos] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamentos] ([idDepartamento])
GO
ALTER TABLE [dbo].[Municipios] CHECK CONSTRAINT [fk_municipios_departamentos]
GO
ALTER TABLE [dbo].[OrdenesCompras]  WITH CHECK ADD  CONSTRAINT [FK_OrdenesCompras_OrdenesVentas] FOREIGN KEY([idOrdenVenta])
REFERENCES [dbo].[OrdenesVentas] ([idOrdenVenta])
GO
ALTER TABLE [dbo].[OrdenesCompras] CHECK CONSTRAINT [FK_OrdenesCompras_OrdenesVentas]
GO
ALTER TABLE [dbo].[OrdenesCompras]  WITH CHECK ADD  CONSTRAINT [FK_OrdenesCompras_Publicaciones] FOREIGN KEY([idPublicacion])
REFERENCES [dbo].[Publicaciones] ([idPublicacion])
GO
ALTER TABLE [dbo].[OrdenesCompras] CHECK CONSTRAINT [FK_OrdenesCompras_Publicaciones]
GO
ALTER TABLE [dbo].[OrdenesCompras]  WITH CHECK ADD  CONSTRAINT [FK_OrdenesCompras_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[OrdenesCompras] CHECK CONSTRAINT [FK_OrdenesCompras_Usuarios]
GO
ALTER TABLE [dbo].[OrdenesVentas]  WITH CHECK ADD  CONSTRAINT [FK_OrdenesNegocios_Publicaciones] FOREIGN KEY([idPublicacion])
REFERENCES [dbo].[Publicaciones] ([idPublicacion])
GO
ALTER TABLE [dbo].[OrdenesVentas] CHECK CONSTRAINT [FK_OrdenesNegocios_Publicaciones]
GO
ALTER TABLE [dbo].[Publicaciones]  WITH CHECK ADD  CONSTRAINT [FK_Publicaciones_Departamentos] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamentos] ([idDepartamento])
GO
ALTER TABLE [dbo].[Publicaciones] CHECK CONSTRAINT [FK_Publicaciones_Departamentos]
GO
ALTER TABLE [dbo].[Publicaciones]  WITH CHECK ADD  CONSTRAINT [fk_publicaciones_estado] FOREIGN KEY([idEstadoPublicacion])
REFERENCES [dbo].[EstadoPublicacion] ([idEstadoPublicacion])
GO
ALTER TABLE [dbo].[Publicaciones] CHECK CONSTRAINT [fk_publicaciones_estado]
GO
ALTER TABLE [dbo].[Publicaciones]  WITH CHECK ADD  CONSTRAINT [FK_Publicaciones_Municipios] FOREIGN KEY([idMunicipio])
REFERENCES [dbo].[Municipios] ([idMunicipio])
GO
ALTER TABLE [dbo].[Publicaciones] CHECK CONSTRAINT [FK_Publicaciones_Municipios]
GO
ALTER TABLE [dbo].[Publicaciones]  WITH CHECK ADD  CONSTRAINT [fk_publicaciones_subcategorias] FOREIGN KEY([idSubCategoria])
REFERENCES [dbo].[SubCategorias] ([idSubCategoria])
GO
ALTER TABLE [dbo].[Publicaciones] CHECK CONSTRAINT [fk_publicaciones_subcategorias]
GO
ALTER TABLE [dbo].[Publicaciones]  WITH CHECK ADD  CONSTRAINT [fk_publicaciones_tipo] FOREIGN KEY([idTipoPublicacion])
REFERENCES [dbo].[TipoPublicacion] ([idTipoPublicacion])
GO
ALTER TABLE [dbo].[Publicaciones] CHECK CONSTRAINT [fk_publicaciones_tipo]
GO
ALTER TABLE [dbo].[Publicaciones]  WITH CHECK ADD  CONSTRAINT [FK_Publicaciones_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Publicaciones] CHECK CONSTRAINT [FK_Publicaciones_Usuarios]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Publicaciones1] FOREIGN KEY([idPublicacion])
REFERENCES [dbo].[Publicaciones] ([idPublicacion])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Publicaciones1]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Usuarios]
GO
ALTER TABLE [dbo].[SubCategorias]  WITH CHECK ADD  CONSTRAINT [fk_subcategorias_categorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([idCategoria])
GO
ALTER TABLE [dbo].[SubCategorias] CHECK CONSTRAINT [fk_subcategorias_categorias]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Departamentos] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamentos] ([idDepartamento])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Departamentos]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Municipios] FOREIGN KEY([idMunicipio])
REFERENCES [dbo].[Municipios] ([idMunicipio])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Municipios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [fk_usuarios_roles] FOREIGN KEY([idRol])
REFERENCES [dbo].[Roles] ([idRol])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [fk_usuarios_roles]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [fk_whislist_publicaciones] FOREIGN KEY([idPublicacion])
REFERENCES [dbo].[Publicaciones] ([idPublicacion])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [fk_whislist_publicaciones]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [fk_whislist_usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [fk_whislist_usuarios]
GO
USE [master]
GO
ALTER DATABASE [SocialNetworkDeveloper] SET  READ_WRITE 
GO
