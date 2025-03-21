USE [master]
GO
/****** Object:  Database [ExpenseTracker]    Script Date: 3/19/2025 10:06:22 PM ******/
CREATE DATABASE [ExpenseTracker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExpenseTracker', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ExpenseTracker.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExpenseTracker_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ExpenseTracker_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ExpenseTracker] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExpenseTracker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExpenseTracker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExpenseTracker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExpenseTracker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExpenseTracker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExpenseTracker] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExpenseTracker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExpenseTracker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExpenseTracker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExpenseTracker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExpenseTracker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExpenseTracker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExpenseTracker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExpenseTracker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExpenseTracker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExpenseTracker] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ExpenseTracker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExpenseTracker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExpenseTracker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExpenseTracker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExpenseTracker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExpenseTracker] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ExpenseTracker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExpenseTracker] SET RECOVERY FULL 
GO
ALTER DATABASE [ExpenseTracker] SET  MULTI_USER 
GO
ALTER DATABASE [ExpenseTracker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExpenseTracker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExpenseTracker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExpenseTracker] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExpenseTracker] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExpenseTracker] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ExpenseTracker', N'ON'
GO
ALTER DATABASE [ExpenseTracker] SET QUERY_STORE = ON
GO
ALTER DATABASE [ExpenseTracker] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ExpenseTracker]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/19/2025 10:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/19/2025 10:06:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 3/19/2025 10:06:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenses](
	[ExpenseId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Amount] [float] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Expenses] PRIMARY KEY CLUSTERED 
(
	[ExpenseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/19/2025 10:06:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[EmailId] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250316055033_InitializeDatabase', N'7.0.11')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'Housing')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'Food')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (3, N'Transportation')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (4, N'Health')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (5, N'Kids')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (6, N'Operating Expenses')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Expenses] ON 

INSERT [dbo].[Expenses] ([ExpenseId], [UserId], [CategoryId], [Description], [Amount], [Date]) VALUES (1, 1, 1, N'House Rent', 10000, CAST(N'2025-03-16T11:20:33.1177238' AS DateTime2))
INSERT [dbo].[Expenses] ([ExpenseId], [UserId], [CategoryId], [Description], [Amount], [Date]) VALUES (2, 2, 5, N'Restaurants', 4000, CAST(N'2025-03-16T11:20:33.1177249' AS DateTime2))
INSERT [dbo].[Expenses] ([ExpenseId], [UserId], [CategoryId], [Description], [Amount], [Date]) VALUES (3, 1, 2, N'Restaurant Food ', 3500, CAST(N'2025-03-16T05:53:14.5720000' AS DateTime2))
INSERT [dbo].[Expenses] ([ExpenseId], [UserId], [CategoryId], [Description], [Amount], [Date]) VALUES (7, 3, 5, N'Dresses, Toys', 4500, CAST(N'2025-03-18T13:16:37.3530000' AS DateTime2))
INSERT [dbo].[Expenses] ([ExpenseId], [UserId], [CategoryId], [Description], [Amount], [Date]) VALUES (8, 1, 3, N'Cab,Bus', 2000, CAST(N'2025-03-18T19:21:49.6330000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Expenses] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [PhoneNumber], [EmailId], [Password]) VALUES (1, N'Shiva', N'Ram', N'7891234567', N'shivaram@gmail.com', N'shiva@123')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [PhoneNumber], [EmailId], [Password]) VALUES (2, N'Koushik', N'B', N'9087654321', N'koushik123@gmail.com', N'koushik@123')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [PhoneNumber], [EmailId], [Password]) VALUES (3, N'Raja', N'Ram', N'9876543213', N'rajaram123@gmail.com', N'rajaram@123')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [PhoneNumber], [EmailId], [Password]) VALUES (4, N'Raja', N'Ram', N'9876543213', N'rajaram123@gmail.com', N'rajaram@123')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Expenses_CategoryId]    Script Date: 3/19/2025 10:06:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Expenses_CategoryId] ON [dbo].[Expenses]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Expenses_UserId]    Script Date: 3/19/2025 10:06:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Expenses_UserId] ON [dbo].[Expenses]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_Expenses_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_Expenses_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_Expenses_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_Expenses_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [ExpenseTracker] SET  READ_WRITE 
GO
