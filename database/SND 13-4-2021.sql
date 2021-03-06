USE [master]
GO
/****** Object:  Database [SocialNetworkDeveloper]    Script Date: 13/4/2021 15:46:41 ******/
CREATE DATABASE [SocialNetworkDeveloper]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SocialNetworkDeveloper', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER19EXPRESS\MSSQL\DATA\SocialNetworkDeveloper.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SocialNetworkDeveloper_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER19EXPRESS\MSSQL\DATA\SocialNetworkDeveloper_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [SocialNetworkDeveloper] SET AUTO_CLOSE OFF 
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
ALTER DATABASE [SocialNetworkDeveloper] SET QUERY_STORE = OFF
GO
USE [SocialNetworkDeveloper]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 13/4/2021 15:46:41 ******/
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
/****** Object:  Table [dbo].[Chat]    Script Date: 13/4/2021 15:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat](
	[idChat] [int] NOT NULL,
	[idUsuarioEmisor] [int] NULL,
	[idUsuarioDestinatario] [int] NULL,
	[Mensaje] [text] NULL,
	[estadoMensaje] [int] NULL,
	[estadoChat] [int] NULL,
 CONSTRAINT [pk_chat] PRIMARY KEY CLUSTERED 
(
	[idChat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 13/4/2021 15:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentarios](
	[idComentario] [int] IDENTITY(1,1) NOT NULL,
	[Comentario] [text] NULL,
	[idTipoComentario] [int] NULL,
	[idComentarioPrincipal] [int] NULL,
	[idEstadoComentario] [int] NULL,
 CONSTRAINT [pk_comentarios] PRIMARY KEY CLUSTERED 
(
	[idComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contactos]    Script Date: 13/4/2021 15:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contactos](
	[idContacto] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NULL,
	[idUsuarioContacto] [int] NULL,
	[estado] [int] NULL,
 CONSTRAINT [pk_contactos] PRIMARY KEY CLUSTERED 
(
	[idContacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 13/4/2021 15:46:41 ******/
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
/****** Object:  Table [dbo].[EstadoComentario]    Script Date: 13/4/2021 15:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoComentario](
	[idEstadoComentario] [int] IDENTITY(1,1) NOT NULL,
	[estado] [nvarchar](100) NULL,
 CONSTRAINT [pk_estado_comentario] PRIMARY KEY CLUSTERED 
(
	[idEstadoComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoPublicacion]    Script Date: 13/4/2021 15:46:41 ******/
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
/****** Object:  Table [dbo].[Municipios]    Script Date: 13/4/2021 15:46:41 ******/
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
/****** Object:  Table [dbo].[OrdenesCompras]    Script Date: 13/4/2021 15:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenesCompras](
	[idOrdenCompra] [int] IDENTITY(1,1) NOT NULL,
	[idPublicacion] [int] NULL,
	[idUsuario] [int] NULL,
	[fechaHoraOrdenCompra] [datetime] NULL,
	[totalCompraConIva] [decimal](10, 4) NULL,
	[totalCompraSinIva] [decimal](10, 0) NULL,
	[estadoOrdenCompra] [char](1) NULL,
 CONSTRAINT [PK_OrdenesCompras] PRIMARY KEY CLUSTERED 
(
	[idOrdenCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenesComprasDetalles]    Script Date: 13/4/2021 15:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenesComprasDetalles](
	[idOrdenCompraDetalle] [int] IDENTITY(1,1) NOT NULL,
	[idOrdenCompra] [int] NULL,
	[Cantidad] [decimal](10, 4) NULL,
	[montoConIva] [decimal](10, 4) NULL,
	[montoSinIva] [decimal](10, 4) NULL,
	[estadoOrdenCompraDetalle] [int] NULL,
 CONSTRAINT [PK_OrdenesComprasDetalles] PRIMARY KEY CLUSTERED 
(
	[idOrdenCompraDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenesVentas]    Script Date: 13/4/2021 15:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenesVentas](
	[idOrdenVenta] [int] IDENTITY(1,1) NOT NULL,
	[idPublicacion] [int] NULL,
	[idUsuario] [int] NULL,
	[estadoOrdenVenta] [char](1) NULL,
	[fechaHoraOrdenVenta] [datetime] NULL,
	[totalVentaConIva] [decimal](10, 4) NULL,
	[totalVentaSinIva] [decimal](10, 0) NULL,
 CONSTRAINT [PK_OrdenesNegocios] PRIMARY KEY CLUSTERED 
(
	[idOrdenVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenesVentasDetalles]    Script Date: 13/4/2021 15:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenesVentasDetalles](
	[idOrdenVentaDetalle] [int] IDENTITY(1,1) NOT NULL,
	[idOrdenVenta] [int] NULL,
	[Cantidad] [decimal](10, 4) NULL,
	[estadoOrdenNegocioDetalle] [int] NULL,
	[montoConIva] [decimal](10, 4) NULL,
	[montoSinIva] [decimal](10, 4) NULL,
 CONSTRAINT [PK_OrdenesNegociosDetalles] PRIMARY KEY CLUSTERED 
(
	[idOrdenVentaDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publicaciones]    Script Date: 13/4/2021 15:46:41 ******/
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
	[fechaPublicacion] [datetime] NULL,
	[idSubCategoria] [int] NULL,
	[idTipoPublicacion] [int] NULL,
	[idMinicipio] [int] NULL,
	[Descripcion] [nvarchar](250) NULL,
	[Precio] [decimal](6, 2) NULL,
	[idEstadoPublicacion] [int] NULL,
	[idUsuario] [int] NULL,
	[Delivery] [char](1) NULL,
 CONSTRAINT [pk_pulicaciones] PRIMARY KEY CLUSTERED 
(
	[idPublicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 13/4/2021 15:46:41 ******/
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
/****** Object:  Table [dbo].[SubCategorias]    Script Date: 13/4/2021 15:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategorias](
	[idSubCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombreSubCategoria] [nvarchar](100) NULL,
	[idCategoria] [int] NULL,
 CONSTRAINT [pk_subcategorias] PRIMARY KEY CLUSTERED 
(
	[idSubCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoComentario]    Script Date: 13/4/2021 15:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoComentario](
	[idTipoComentario] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [nvarchar](100) NULL,
 CONSTRAINT [pk_tipo_comentario] PRIMARY KEY CLUSTERED 
(
	[idTipoComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPublicacion]    Script Date: 13/4/2021 15:46:41 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 13/4/2021 15:46:41 ******/
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
	[dui] [nvarchar](10) NULL,
	[nit] [nvarchar](16) NULL,
	[telefonoContacto] [nvarchar](15) NULL,
	[correoElectronico] [nvarchar](150) NULL,
	[Contrasena] [nvarchar](25) NULL,
	[Vendedor] [char](1) NULL,
	[Comprador] [char](1) NULL,
	[estadoUsuario] [int] NULL,
 CONSTRAINT [pk_usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Whislist]    Script Date: 13/4/2021 15:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Whislist](
	[idWhislist] [int] IDENTITY(1,1) NOT NULL,
	[idPublicacion] [int] NULL,
	[idUsuario] [int] NULL,
	[fechaCreacion] [datetime] NULL,
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
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([idRol], [Rol]) VALUES (1, N'Administrador')
INSERT [dbo].[Roles] ([idRol], [Rol]) VALUES (2, N'Usuario')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[SubCategorias] ON 

INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (1, N'Vehiculos', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (2, N'Apartamentos', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (3, N'Casas', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (4, N'Telefonos Celulares', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (5, N'Audio, Video y Foto', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (6, N'Computadoras', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (7, N'Tablets', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (8, N'Proyectores', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (9, N'Routers', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (10, N'Juguetes', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (11, N'Microfonos', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (12, N'Audifonos', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (13, N'Smart Watch', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (14, N'TV Smart', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (15, N'Cargadores', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (16, N'Cables de energia', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (17, N'Teclados', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (18, N'Mouse', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (19, N'Monitores', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (20, N'Bocinas', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (21, N'Aparatos de sonido', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (22, N'Limpieza', 2)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (23, N'Ventas', 2)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (24, N'Inversiones', 2)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (25, N'Cocina', 2)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (26, N'Pintura', 2)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (27, N'Encomiendas', 2)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (28, N'Mecanicos', 2)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (29, N'Zapateria', 2)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (30, N'Utiles Escolares', 1)
INSERT [dbo].[SubCategorias] ([idSubCategoria], [nombreSubCategoria], [idCategoria]) VALUES (31, N'Fontaneria', 2)
SET IDENTITY_INSERT [dbo].[SubCategorias] OFF
SET IDENTITY_INSERT [dbo].[TipoPublicacion] ON 

INSERT [dbo].[TipoPublicacion] ([idTipoPublicacion], [tipoPublicacion]) VALUES (1, N'Ropa')
INSERT [dbo].[TipoPublicacion] ([idTipoPublicacion], [tipoPublicacion]) VALUES (2, N'Calzado')
SET IDENTITY_INSERT [dbo].[TipoPublicacion] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idUsuario], [idRol], [nombreCompleto], [Nombres], [Apellidos], [dui], [nit], [telefonoContacto], [correoElectronico], [Contrasena], [Vendedor], [Comprador], [estadoUsuario]) VALUES (3, 1, N'Douglas Guzman', N'Douglas Ricardo', N'Guzman Barahona', N'054439764', N'06143010961170', N'78804230', N'drgb96@gmail.com', N'123456', NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [idRol], [nombreCompleto], [Nombres], [Apellidos], [dui], [nit], [telefonoContacto], [correoElectronico], [Contrasena], [Vendedor], [Comprador], [estadoUsuario]) VALUES (4, 1, N'Cristian Torres', N'Cristian', N'Torres', N'045002738', N'082112081911066', N'71003568', N'cristiantorresalfaro91@gmail.com', N'123', N'Y', N'N', NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_Vendedor]  DEFAULT ('Y') FOR [Vendedor]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_Comprador]  DEFAULT ('N') FOR [Comprador]
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [fk_chat_usuarios_destinatario] FOREIGN KEY([idUsuarioDestinatario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [fk_chat_usuarios_destinatario]
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [fk_chat_usuarios_emisor] FOREIGN KEY([idUsuarioEmisor])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [fk_chat_usuarios_emisor]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [fk_comentarios_estado_comentario] FOREIGN KEY([idEstadoComentario])
REFERENCES [dbo].[EstadoComentario] ([idEstadoComentario])
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [fk_comentarios_estado_comentario]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [fk_comentarios_tipo] FOREIGN KEY([idTipoComentario])
REFERENCES [dbo].[TipoComentario] ([idTipoComentario])
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [fk_comentarios_tipo]
GO
ALTER TABLE [dbo].[Contactos]  WITH CHECK ADD  CONSTRAINT [fk_contactos_usuarios2] FOREIGN KEY([idUsuarioContacto])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Contactos] CHECK CONSTRAINT [fk_contactos_usuarios2]
GO
ALTER TABLE [dbo].[Contactos]  WITH CHECK ADD  CONSTRAINT [fk_contatos_usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Contactos] CHECK CONSTRAINT [fk_contatos_usuario]
GO
ALTER TABLE [dbo].[Municipios]  WITH CHECK ADD  CONSTRAINT [fk_municipios_departamentos] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamentos] ([idDepartamento])
GO
ALTER TABLE [dbo].[Municipios] CHECK CONSTRAINT [fk_municipios_departamentos]
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
ALTER TABLE [dbo].[OrdenesComprasDetalles]  WITH CHECK ADD  CONSTRAINT [FK_OrdenesComprasDetalles_OrdenesCompras] FOREIGN KEY([idOrdenCompra])
REFERENCES [dbo].[OrdenesCompras] ([idOrdenCompra])
GO
ALTER TABLE [dbo].[OrdenesComprasDetalles] CHECK CONSTRAINT [FK_OrdenesComprasDetalles_OrdenesCompras]
GO
ALTER TABLE [dbo].[OrdenesVentas]  WITH CHECK ADD  CONSTRAINT [FK_OrdenesNegocios_Publicaciones] FOREIGN KEY([idPublicacion])
REFERENCES [dbo].[Publicaciones] ([idPublicacion])
GO
ALTER TABLE [dbo].[OrdenesVentas] CHECK CONSTRAINT [FK_OrdenesNegocios_Publicaciones]
GO
ALTER TABLE [dbo].[OrdenesVentas]  WITH CHECK ADD  CONSTRAINT [FK_OrdenesNegocios_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[OrdenesVentas] CHECK CONSTRAINT [FK_OrdenesNegocios_Usuarios]
GO
ALTER TABLE [dbo].[OrdenesVentasDetalles]  WITH CHECK ADD  CONSTRAINT [FK_OrdenesNegociosDetalles_OrdenesNegocios] FOREIGN KEY([idOrdenVenta])
REFERENCES [dbo].[OrdenesVentas] ([idOrdenVenta])
GO
ALTER TABLE [dbo].[OrdenesVentasDetalles] CHECK CONSTRAINT [FK_OrdenesNegociosDetalles_OrdenesNegocios]
GO
ALTER TABLE [dbo].[Publicaciones]  WITH CHECK ADD  CONSTRAINT [fk_publicaciones_estado] FOREIGN KEY([idEstadoPublicacion])
REFERENCES [dbo].[EstadoPublicacion] ([idEstadoPublicacion])
GO
ALTER TABLE [dbo].[Publicaciones] CHECK CONSTRAINT [fk_publicaciones_estado]
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
ALTER TABLE [dbo].[SubCategorias]  WITH CHECK ADD  CONSTRAINT [fk_subcategorias_categorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([idCategoria])
GO
ALTER TABLE [dbo].[SubCategorias] CHECK CONSTRAINT [fk_subcategorias_categorias]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [fk_usuarios_roles] FOREIGN KEY([idRol])
REFERENCES [dbo].[Roles] ([idRol])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [fk_usuarios_roles]
GO
ALTER TABLE [dbo].[Whislist]  WITH CHECK ADD  CONSTRAINT [fk_whislist_publicaciones] FOREIGN KEY([idPublicacion])
REFERENCES [dbo].[Publicaciones] ([idPublicacion])
GO
ALTER TABLE [dbo].[Whislist] CHECK CONSTRAINT [fk_whislist_publicaciones]
GO
ALTER TABLE [dbo].[Whislist]  WITH CHECK ADD  CONSTRAINT [fk_whislist_usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Whislist] CHECK CONSTRAINT [fk_whislist_usuarios]
GO
USE [master]
GO
ALTER DATABASE [SocialNetworkDeveloper] SET  READ_WRITE 
GO
