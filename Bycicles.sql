USE [master]
GO
/****** Object:  Database [bicycles]    Script Date: 16/11/2019 22:52:33 ******/
CREATE DATABASE [bicycles]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bicycles', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\bicycles.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bicycles_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\bicycles_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [bicycles] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bicycles].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bicycles] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bicycles] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bicycles] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bicycles] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bicycles] SET ARITHABORT OFF 
GO
ALTER DATABASE [bicycles] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bicycles] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bicycles] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bicycles] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bicycles] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bicycles] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bicycles] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bicycles] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bicycles] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bicycles] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bicycles] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bicycles] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bicycles] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bicycles] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bicycles] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bicycles] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bicycles] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bicycles] SET RECOVERY FULL 
GO
ALTER DATABASE [bicycles] SET  MULTI_USER 
GO
ALTER DATABASE [bicycles] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bicycles] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bicycles] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bicycles] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bicycles] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'bicycles', N'ON'
GO
ALTER DATABASE [bicycles] SET QUERY_STORE = OFF
GO
USE [bicycles]
GO
/****** Object:  User [userpepote]    Script Date: 16/11/2019 22:52:33 ******/
CREATE USER [userpepote] FOR LOGIN [pepote] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Bicycles]    Script Date: 16/11/2019 22:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bicycles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Model] [varchar](50) NULL,
	[Year] [int] NULL,
 CONSTRAINT [PK_Bicycles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BranchOffices]    Script Date: 16/11/2019 22:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchOffices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](50) NULL,
 CONSTRAINT [PK_BranchOffices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stocks]    Script Date: 16/11/2019 22:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stocks](
	[BranchOfficesID] [int] NOT NULL,
	[BicyclesID] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[BranchOfficesID] ASC,
	[BicyclesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Stocks]  WITH CHECK ADD  CONSTRAINT [FK_Stocks_Bicycles] FOREIGN KEY([BranchOfficesID])
REFERENCES [dbo].[Bicycles] ([ID])
GO
ALTER TABLE [dbo].[Stocks] CHECK CONSTRAINT [FK_Stocks_Bicycles]
GO
ALTER TABLE [dbo].[Stocks]  WITH CHECK ADD  CONSTRAINT [FK_Stocks_BranchOffices] FOREIGN KEY([BranchOfficesID])
REFERENCES [dbo].[BranchOffices] ([ID])
GO
ALTER TABLE [dbo].[Stocks] CHECK CONSTRAINT [FK_Stocks_BranchOffices]
GO
USE [master]
GO
ALTER DATABASE [bicycles] SET  READ_WRITE 
GO
