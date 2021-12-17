USE [master]
GO
/****** Object:  Database [MRR_BaramMarketing]    Script Date: 17/09/2021 0:16:18 ******/
CREATE DATABASE [MRR_BaramMarketing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MRR_BaramMarketing', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MRR_BaramMarketing.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MRR_BaramMarketing_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MRR_BaramMarketing_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MRR_BaramMarketing] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MRR_BaramMarketing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MRR_BaramMarketing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET ARITHABORT OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MRR_BaramMarketing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MRR_BaramMarketing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MRR_BaramMarketing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MRR_BaramMarketing] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET RECOVERY FULL 
GO
ALTER DATABASE [MRR_BaramMarketing] SET  MULTI_USER 
GO
ALTER DATABASE [MRR_BaramMarketing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MRR_BaramMarketing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MRR_BaramMarketing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MRR_BaramMarketing] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MRR_BaramMarketing] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MRR_BaramMarketing] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MRR_BaramMarketing', N'ON'
GO
ALTER DATABASE [MRR_BaramMarketing] SET QUERY_STORE = OFF
GO
USE [MRR_BaramMarketing]
GO
/****** Object:  Table [dbo].[MRR_Agents]    Script Date: 17/09/2021 0:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MRR_Agents](
	[AgentID] [float] NULL,
	[AgentName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MRR_Area]    Script Date: 17/09/2021 0:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MRR_Area](
	[AreaID] [float] NULL,
	[AreaName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MRR_Categories]    Script Date: 17/09/2021 0:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MRR_Categories](
	[CategoryID] [float] NULL,
	[CategoryName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MRR_Customers]    Script Date: 17/09/2021 0:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MRR_Customers](
	[CustomerID] [float] NULL,
	[CustomerName] [nvarchar](255) NULL,
	[CustomerPaymentTerms] [float] NULL,
	[AgentID] [float] NULL,
	[AreaID] [float] NULL,
	[CustomerTypeID] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MRR_CustomerType]    Script Date: 17/09/2021 0:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MRR_CustomerType](
	[CustomerTypeID] [float] NULL,
	[CustomerTypeDesc] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MRR_Holidays]    Script Date: 17/09/2021 0:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MRR_Holidays](
	[Year] [float] NULL,
	[Period] [nvarchar](255) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MRR_Invoices]    Script Date: 17/09/2021 0:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MRR_Invoices](
	[InvoiceID] [nvarchar](50) NULL,
	[ProductID] [nvarchar](50) NULL,
	[CustomerID] [nvarchar](50) NULL,
	[InvoiceDate] [date] NULL,
	[AgentID] [nvarchar](50) NULL,
	[OrderID] [nvarchar](50) NULL,
	[Quantity] [nvarchar](50) NULL,
	[Price] [nvarchar](50) NULL,
	[RowDiscount] [nvarchar](50) NULL,
	[InvDiscount] [nvarchar](50) NULL,
	[InvoiceType] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MRR_Products]    Script Date: 17/09/2021 0:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MRR_Products](
	[ProductID] [nvarchar](13) NULL,
	[ProductName] [nvarchar](41) NULL,
	[Section] [nvarchar](8) NULL,
	[SubCategory] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MRR_SalesTargets]    Script Date: 17/09/2021 0:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MRR_SalesTargets](
	[AgentID] [float] NULL,
	[CategoryID] [float] NULL,
	[Year] [float] NULL,
	[Target] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MRR_SubCategories]    Script Date: 17/09/2021 0:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MRR_SubCategories](
	[SubCategoryID] [nvarchar](50) NULL,
	[SubCategoryName] [nvarchar](65) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MRR_Suppliers]    Script Date: 17/09/2021 0:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MRR_Suppliers](
	[SupplierGroupCode] [float] NULL,
	[SupplierGroupDesc] [nvarchar](255) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [MRR_BaramMarketing] SET  READ_WRITE 
GO
