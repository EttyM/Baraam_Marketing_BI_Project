USE [master]
GO
/****** Object:  Database [DWH_BaramMarketing]    Script Date: 17/09/2021 0:20:57 ******/
CREATE DATABASE [DWH_BaramMarketing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DWH_BaramMarketing', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DWH_BaramMarketing.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DWH_BaramMarketing_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DWH_BaramMarketing_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DWH_BaramMarketing] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DWH_BaramMarketing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DWH_BaramMarketing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET ARITHABORT OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DWH_BaramMarketing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DWH_BaramMarketing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DWH_BaramMarketing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DWH_BaramMarketing] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET RECOVERY FULL 
GO
ALTER DATABASE [DWH_BaramMarketing] SET  MULTI_USER 
GO
ALTER DATABASE [DWH_BaramMarketing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DWH_BaramMarketing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DWH_BaramMarketing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DWH_BaramMarketing] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DWH_BaramMarketing] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DWH_BaramMarketing] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DWH_BaramMarketing', N'ON'
GO
ALTER DATABASE [DWH_BaramMarketing] SET QUERY_STORE = OFF
GO
USE [DWH_BaramMarketing]
GO
/****** Object:  Table [dbo].[DimAgents]    Script Date: 17/09/2021 0:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAgents](
	[AgentID] [smallint] NOT NULL,
	[AgentName] [nvarchar](65) NULL,
	[RI] [bit] NULL,
	[RI_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCustomers]    Script Date: 17/09/2021 0:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomers](
	[CustomerID] [int] NOT NULL,
	[CustomerName] [nvarchar](65) NULL,
	[CustomerPaymentTerms] [nvarchar](40) NULL,
	[AgentID] [smallint] NULL,
	[AgentName] [nvarchar](65) NULL,
	[AreaID] [smallint] NULL,
	[AreaName] [nvarchar](65) NULL,
	[CustomerTypeID] [smallint] NULL,
	[CustomerTypeDesc] [nvarchar](65) NULL,
	[RI] [bit] NULL,
	[RI_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 17/09/2021 0:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[Date] [date] NULL,
	[DateID] [int] NOT NULL,
	[MonthNumber] [smallint] NULL,
	[DayOfWeek] [smallint] NULL,
	[Quarter] [smallint] NULL,
	[QuarterAndYear] [nvarchar](20) NULL,
	[Year] [smallint] NULL,
	[Holiday] [nvarchar](80) NULL,
	[IsHoliday] [nvarchar](10) NULL,
	[RI] [bit] NULL,
	[RI_Date] [date] NULL,
 CONSTRAINT [PK__DimDate__A426F2538E8A0D3D] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimInvoiceType]    Script Date: 17/09/2021 0:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimInvoiceType](
	[InvoiceType] [bit] NOT NULL,
	[InvTypeDesc] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProducts]    Script Date: 17/09/2021 0:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProducts](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](60) NULL,
	[CategoryID] [smallint] NULL,
	[CategoryName] [nvarchar](65) NULL,
	[SubCategoryID] [smallint] NULL,
	[SubCategoryName] [nvarchar](65) NULL,
	[SupplierGroupID] [smallint] NULL,
	[SupplierGroupDesc] [nvarchar](65) NULL,
	[IsOther] [bit] NULL,
	[RI] [bit] NULL,
	[RI_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_KPIs]    Script Date: 17/09/2021 0:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_KPIs](
	[AgentID] [smallint] NOT NULL,
	[CategoryID] [smallint] NOT NULL,
	[Year] [smallint] NOT NULL,
	[Target] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactTransactions]    Script Date: 17/09/2021 0:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactTransactions](
	[InvoiceID] [int] NULL,
	[InvoiceDate] [date] NULL,
	[DateID] [int] NOT NULL,
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
ALTER TABLE [dbo].[DimAgents] ADD  CONSTRAINT [DF_DimAgents_RI]  DEFAULT ((0)) FOR [RI]
GO
ALTER TABLE [dbo].[DimAgents] ADD  CONSTRAINT [DF_DimAgents_RI_Date]  DEFAULT (getdate()) FOR [RI_Date]
GO
/****** Object:  StoredProcedure [dbo].[sp_makeDWH_DimAgents]    Script Date: 17/09/2021 0:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_makeDWH_DimAgents]
AS
MERGE [DWH_BaramMarketing].[dbo].[DimAgents] AS MyTarget
USING [STG_BaramMarketing].[dbo].[STG_DimAgents] AS MySource
     ON MySource.[AgentID] = MyTarget.[AgentID]
WHEN MATCHED
	THEN UPDATE SET 
		[AgentName] = MySource.[AgentName],
		[RI] = 0,
		[RI_Date] = GETDATE()
WHEN NOT MATCHED THEN INSERT
    (
        [AgentID], 
        [AgentName], 
        [RI], 
        [RI_Date]
    )
    VALUES (
        MySource.[AgentID], 
        MySource.[AgentName], 
        0, 
        GETDATE()
    );
GO
/****** Object:  StoredProcedure [dbo].[sp_makeDWH_DimCustomers]    Script Date: 17/09/2021 0:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_makeDWH_DimCustomers]
AS
MERGE [DWH_BaramMarketing].[dbo].[DimCustomers] AS MyTarget
USING [STG_BaramMarketing].[dbo].[STG_DimCustomers] AS   MySource
     ON MySource.[CustomerID] = MyTarget.[CustomerID]
WHEN MATCHED 
	THEN UPDATE SET 
          MyTarget.[CustomerName] = MySource.[CustomerName],
          MyTarget.[CustomerPaymentTerms] = MySource.[CustomerPaymentTerms],
          MyTarget.[AgentID] = MySource.[AgentID],
          MyTarget.[AgentName] = MySource.[AgentName],
          MyTarget.[AreaID] = MySource.[AreaID],
          MyTarget.[AreaName] = MySource.[AreaName],
          MyTarget.[CustomerTypeID] = MySource.[CustomerTypeID],
          MyTarget.[CustomerTypeDesc] = MySource.[CustomerTypeDesc],
          MyTarget.[RI] = 0,
          MyTarget.[RI_Date] = GETDATE()
WHEN NOT MATCHED THEN INSERT
    (
        [CustomerID], 
        [CustomerName], 
        [CustomerPaymentTerms], 
        [AgentID], 
        [AgentName], 
        [AreaID], 
        [AreaName], 
        [CustomerTypeID], 
        [CustomerTypeDesc], 
        [RI], 
        [RI_Date]
    )
    VALUES (
        MySource.[CustomerID], 
        MySource.[CustomerName], 
        MySource.[CustomerPaymentTerms], 
        MySource.[AgentID], 
        MySource.[AgentName], 
        MySource.[AreaID], 
        MySource.[AreaName], 
        MySource.[CustomerTypeID], 
        MySource.[CustomerTypeDesc], 
        0, 
        GETDATE()
    );
GO
/****** Object:  StoredProcedure [dbo].[sp_makeDWH_DimDate]    Script Date: 17/09/2021 0:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_makeDWH_DimDate]
AS 
MERGE [DWH_BaramMarketing].[dbo].[DimDate] AS MyTarget
USING [STG_BaramMarketing].[dbo].[STG_DimDate] MySource
     ON (MySource.[InvoiceDate] = MyTarget.[Date])
WHEN MATCHED 
	THEN UPDATE SET 
          MyTarget.[DateID] = MySource.[DateID],
          MyTarget.[MonthNumber] = MySource.[MonthNumber],
          MyTarget.[DayOfWeek] = MySource.[DayOfWeek],
	      MyTarget.[Quarter] = MySource.[Quarter],
		  MyTarget.[Year] = MySource.[Year],
		  MyTarget.[QuarterAndYear] =	MySource.[QuarterAndYear],
		  MyTarget.[Holiday] = MySource.[Holiday],
		  MyTarget.[IsHoliday] = MySource.[IsHoliday],
		  MyTarget.[RI]= 0,
          MyTarget.[RI_Date]=GETDATE()

WHEN NOT MATCHED 
	THEN INSERT
    ( 
	   [Date]
      ,[DateID]
      ,[MonthNumber]
      ,[DayOfWeek]
      ,[Quarter]
      ,[Year]
	  ,[QuarterAndYear]
      ,[Holiday]
      ,[IsHoliday]
	  ,[RI]
	  ,[RI_Date]

    )
    VALUES (
		MySource.[InvoiceDate],
        MySource.[DateID], 
        MySource.[MonthNumber], 
        MySource.[DayOfWeek], 
        MySource.[Quarter], 
        MySource.[Year],
		MySource.[QuarterAndYear],
		MySource.[Holiday],
        MySource.[IsHoliday],
		0,
		GETDATE()
    );
GO
/****** Object:  StoredProcedure [dbo].[sp_makeDWH_DimProducts]    Script Date: 17/09/2021 0:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_makeDWH_DimProducts]
AS
MERGE [DWH_BaramMarketing].[dbo].[DimProducts] AS MyTarget
USING [STG_BaramMarketing].[dbo].[STG_DimProducts]  AS MySource
     ON (MySource.ProductID = MyTarget.ProductID)
WHEN MATCHED 
	THEN UPDATE SET 
          MyTarget.ProductName = MySource.ProductName,
          MyTarget.[CategoryID] = MySource.[ProductCategoryID],
          MyTarget.[CategoryName] = MySource.[CategoryName],
		  MyTarget.[SubCategoryID] = MySource.[ProductSubCategory],
          MyTarget.[SubCategoryName] = MySource.[SubCategoryName],
		  MyTarget.[SupplierGroupID] = MySource.[ProductSupplierID], 
	      MyTarget.[SupplierGroupDesc] = MySource.[SupplierGroupDesc],
		  MyTarget.[IsOther] = MySource.[IsOther],
		  MyTarget.[RI]= 0,
          MyTarget.[RI_Date]=GETDATE()
WHEN NOT MATCHED 
	THEN INSERT
	(
       [ProductID]
      ,[ProductName]
      ,[CategoryID]
      ,[CategoryName]
      ,[SubCategoryID]
      ,[SubCategoryName]
      ,[SupplierGroupID]
      ,[SupplierGroupDesc]
      ,[IsOther]
	  ,[RI]
	  ,[RI_Date]
	)
    VALUES
     (
          MySource.ProductID, 
          MySource.ProductName, 
          MySource.[ProductCategoryID], 
          MySource.[CategoryName], 
          MySource.[ProductSubCategory],
		  MySource.[SubCategoryName],
		  MySource.[ProductSupplierID],
		  MySource.[SupplierGroupDesc],
		  MySource.[IsOther],
		  0,
		  GETDATE()
    );
GO
/****** Object:  StoredProcedure [dbo].[sp_makeDWH_FactTransactions]    Script Date: 17/09/2021 0:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_makeDWH_FactTransactions]
AS
MERGE [DWH_BaramMarketing].[dbo].[FactTransactions] AS MyTarget
USING [STG_BaramMarketing].[dbo].[STG_FactTransactions] AS MySource
      ON MySource.[InvoiceID] = MyTarget.[InvoiceID]
	 AND MySource.[ProductID] = MyTarget.[ProductID]

WHEN MATCHED 
	THEN UPDATE SET 
          [InvoiceDate] = MySource.[InvoiceDate],
          [DateID] = MySource.[DateID],
          [CustomerID] = MySource.[CustomerID],
          [AgentID] = MySource.[AgentID],
          [Quantity] = MySource.[Quantity],
          [Price] = MySource.[Price],
          [RowDiscount] = MySource.[RowDiscount],
          [InvRowDiscount] = MySource.[InvRowDiscount],
          [TotalDiscount] = MySource.[TotalDiscount],
		  [NetRowAmount] = MySource.[NetRowAmount],
          [IsDebitInvoice] = MySource.[IsDebitInvoice]
WHEN NOT MATCHED THEN INSERT
    (
        [InvoiceID], 
        [InvoiceDate], 
        [DateID], 
        [ProductID], 
        [CustomerID], 
        [AgentID], 
        [Quantity], 
        [Price], 
        [RowDiscount], 
        [InvRowDiscount], 
        [TotalDiscount],
		[NetRowAmount],
        [IsDebitInvoice]
    )
    VALUES (
        MySource.[InvoiceID], 
        MySource.[InvoiceDate], 
        MySource.[DateID], 
        MySource.[ProductID], 
        MySource.[CustomerID], 
        MySource.[AgentID], 
        MySource.[Quantity], 
        MySource.[Price], 
        MySource.[RowDiscount], 
        MySource.[InvRowDiscount], 
        MySource.[TotalDiscount],
		MySource.[NetRowAmount], 
        MySource.[IsDebitInvoice] 
    );
GO
/****** Object:  StoredProcedure [dbo].[sp_RI_DimAgents]    Script Date: 17/09/2021 0:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RI_DimAgents]
AS
MERGE [DWH_BaramMarketing].[dbo].[DimAgents] AS MyTarget
USING (SELECT DISTINCT AgentID
	   FROM [DWH_BaramMarketing].[dbo].[FactTransactions]) AS MySource
     ON MySource.[AgentID] = MyTarget.[AgentID]
WHEN MATCHED
	THEN UPDATE SET 
				[RI] = 0,
				[RI_Date] = GETDATE()
WHEN NOT MATCHED THEN INSERT
    (
        [AgentID], 
        [AgentName], 
        [RI], 
        [RI_Date]
    )
    VALUES (
		MySource.[AgentID],
		'שם סוכן לא ידוע',
        1, 
        GETDATE()
    );
GO
/****** Object:  StoredProcedure [dbo].[sp_RI_DimCustomers]    Script Date: 17/09/2021 0:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RI_DimCustomers]
AS
MERGE [DWH_BaramMarketing].[dbo].[DimCustomers] AS MyTarget
USING (SELECT DISTINCT [CustomerID]
	   FROM [dbo].[FactTransactions]) AS   MySource
     ON MySource.[CustomerID] = MyTarget.[CustomerID]
WHEN MATCHED 
	THEN UPDATE SET 
          [RI] = 0,
          [RI_Date] = GETDATE()
WHEN NOT MATCHED THEN INSERT
    (
        [CustomerID], 
        [CustomerName], 
        [CustomerPaymentTerms], 
        [AgentID], 
        [AgentName], 
        [AreaID], 
        [AreaName], 
        [CustomerTypeID], 
        [CustomerTypeDesc], 
        [RI], 
        [RI_Date]
    )
    VALUES (
        MySource.[CustomerID],
		CONCAT('שם מוצר לא ידוע',' ',[CustomerID]),
		'שוטף לא ידוע',
		99,
		'שם סוכן לא ידוע',
		-1,
		'שם אזור לא ידוע',
		-1,
		'סוג לקוח לא ידוע',
        0, 
        GETDATE()
    );
GO
/****** Object:  StoredProcedure [dbo].[sp_RI_DimDate]    Script Date: 17/09/2021 0:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RI_DimDate]
AS 
MERGE [DWH_BaramMarketing].[dbo].[DimDate] AS MyTarget
USING (SELECT DISTINCT [DateID]
	   FROM [dbo].[FactTransactions]) AS MySource
     ON (MySource.[DateID] = MyTarget.[DateID])
WHEN MATCHED 
	THEN UPDATE SET
	      [RI] = 0,
          [RI_Date] = GETDATE()
WHEN NOT MATCHED 
	THEN INSERT 
      ([Date]
      ,[DateID]
      ,[MonthNumber]
      ,[DayOfWeek]
      ,[Quarter]
      ,[Year]
	  ,[QuarterAndYear]
      ,[Holiday]
      ,[IsHoliday]
	  ,[RI]
	  ,[RI_Date])
    VALUES (
	    '01-01-1900'
	   ,MySource.[DateID]
	   ,-1
	   ,-1
	   ,-1
	   ,1900
	   ,'שגוי'
	   ,'שגוי'
	   ,'שגוי'
	   ,1
	   ,GETDATE()
    );
GO
/****** Object:  StoredProcedure [dbo].[sp_RI_DimProducts]    Script Date: 17/09/2021 0:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RI_DimProducts]
AS
MERGE [dbo].[DimProducts] AS Target
USING (SELECT DISTINCT [ProductID]
	   FROM [dbo].[FactTransactions]) AS Source
   ON (Target.[ProductID] = Source.[ProductID])
WHEN  MATCHED 
	THEN UPDATE SET [RI] =0
				   ,[RI_Date] = GETDATE()
WHEN NOT MATCHED BY Target
    THEN INSERT (
		 [ProductID]
		 ,[ProductName]
		 ,[CategoryID]
		 ,[CategoryName]
		 ,[SubCategoryID]
		 ,[SubCategoryName]
		 ,[SupplierGroupID]
		 ,[SupplierGroupDesc]
		 ,[IsOther]
		 ,[RI]
		 ,[RI_Date]
		 )
  VALUES  (Source.[ProductID]
	      ,CONCAT('שם מוצר לא ידוע',' ', Source.[ProductID])
          ,-1
          ,'שם קטגוריה לא ידוע'
          ,-1
		  ,'שם תתקטגוריה לא ידוע'
	  	  ,1
	      ,'שם קבוצת ספק לא ידוע'
		  ,CASE WHEN [ProductID] IN (100000,100004,100007,100008,100009) THEN 1 ELSE 0 END
		  ,1
		  ,GETDATE()
		  );
GO
USE [master]
GO
ALTER DATABASE [DWH_BaramMarketing] SET  READ_WRITE 
GO
