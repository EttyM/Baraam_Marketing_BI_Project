USE [master]
GO
/****** Object:  Database [STG_BaramMarketing]    Script Date: 17/09/2021 0:18:35 ******/
CREATE DATABASE [STG_BaramMarketing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'STG_BaramMarketing', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\STG_BaramMarketing.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'STG_BaramMarketing_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\STG_BaramMarketing_log.ldf' , SIZE = 401408KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [STG_BaramMarketing] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [STG_BaramMarketing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [STG_BaramMarketing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET ARITHABORT OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [STG_BaramMarketing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [STG_BaramMarketing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET  ENABLE_BROKER 
GO
ALTER DATABASE [STG_BaramMarketing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [STG_BaramMarketing] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET RECOVERY FULL 
GO
ALTER DATABASE [STG_BaramMarketing] SET  MULTI_USER 
GO
ALTER DATABASE [STG_BaramMarketing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [STG_BaramMarketing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [STG_BaramMarketing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [STG_BaramMarketing] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [STG_BaramMarketing] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [STG_BaramMarketing] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'STG_BaramMarketing', N'ON'
GO
ALTER DATABASE [STG_BaramMarketing] SET QUERY_STORE = OFF
GO
USE [STG_BaramMarketing]
GO
/****** Object:  Table [dbo].[ErrProducts]    Script Date: 17/09/2021 0:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrProducts](
	[ProductID] [nvarchar](13) NULL,
	[ErrProductName] [nvarchar](41) NULL,
	[Section] [nvarchar](8) NULL,
	[SubCategory] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_DimAgents]    Script Date: 17/09/2021 0:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_DimAgents](
	[AgentID] [smallint] NULL,
	[AgentName] [nvarchar](65) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_DimCustomers]    Script Date: 17/09/2021 0:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_DimCustomers](
	[CustomerID] [int] NULL,
	[CustomerName] [nvarchar](65) NULL,
	[CustomerPaymentTerms] [nvarchar](40) NULL,
	[AgentID] [smallint] NULL,
	[AgentName] [nvarchar](65) NULL,
	[AreaID] [smallint] NULL,
	[AreaName] [nvarchar](65) NULL,
	[CustomerTypeID] [smallint] NULL,
	[CustomerTypeDesc] [nvarchar](65) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_DimDate]    Script Date: 17/09/2021 0:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_DimDate](
	[InvoiceDate] [date] NULL,
	[DateID] [int] NULL,
	[MonthNumber] [smallint] NULL,
	[DayOfWeek] [smallint] NULL,
	[Quarter] [smallint] NULL,
	[QuarterAndYear] [nvarchar](20) NULL,
	[Year] [smallint] NULL,
	[Holiday] [nvarchar](80) NULL,
	[IsHoliday] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_DimProducts]    Script Date: 17/09/2021 0:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_DimProducts](
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](60) NULL,
	[ProductCategoryID] [smallint] NULL,
	[CategoryName] [nvarchar](65) NULL,
	[ProductSubCategory] [smallint] NULL,
	[SubCategoryName] [nvarchar](65) NULL,
	[ProductSupplierID] [smallint] NULL,
	[SupplierGroupDesc] [nvarchar](65) NULL,
	[IsOther] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_FactTransactions]    Script Date: 17/09/2021 0:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_FactTransactions](
	[InvoiceID] [int] NULL,
	[InvoiceDate] [date] NULL,
	[DateID] [int] NULL,
	[ProductID] [int] NULL,
	[CustomerID] [int] NULL,
	[AgentID] [smallint] NULL,
	[Quantity] [money] NULL,
	[Price] [money] NULL,
	[RowDiscount] [money] NULL,
	[InvRowDiscount] [money] NULL,
	[TotalDiscount] [money] NULL,
	[NetRowAmount] [money] NULL,
	[IsDebitInvoice] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_MakeSTG_DimDate]    Script Date: 17/09/2021 0:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_MakeSTG_DimDate] 
	   (@CurrentDate DATETIME)
AS
 INSERT INTO [dbo].[STG_DimDate]
      ([InvoiceDate]
      ,[DateID]
      ,[MonthNumber]
      ,[DayOfWeek]
      ,[Quarter]
  	  ,[QuarterAndYear]
      ,[Year]
	  ,[Holiday]
	  ,IsHoliday)
SELECT   
       @CurrentDate,
	   CAST (CONVERT (CHAR (8),@CurrentDate,112) AS INT),
	   MONTH (@CurrentDate),
	   DATEPART (WEEKDAY,@CurrentDate),
	   DATEPART (QQ,@CurrentDate),
   	   CONCAT('רבעון',DATEPART (QQ,@CurrentDate),' ',YEAR(@CurrentDate)),
	   YEAR (@CurrentDate),
	   ISNULL ((SELECT [Period]
			FROM	[MRR_BaramMarketing].dbo.MRR_Holidays H
			WHERE	@CurrentDate BETWEEN [StartDate] AND [EndDate]),'לא חג'),
	   IIF ((SELECT [Period]
			FROM	[MRR_BaramMarketing].dbo.MRR_Holidays
			WHERE	@CurrentDate BETWEEN [StartDate] AND [EndDate]) IS NULL, ' לא חגים','חגים')




			
GO
USE [master]
GO
ALTER DATABASE [STG_BaramMarketing] SET  READ_WRITE 
GO
