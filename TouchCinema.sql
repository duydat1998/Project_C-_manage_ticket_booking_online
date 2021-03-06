USE [master]
GO
/****** Object:  Database [TouchCinemaDatabase]    Script Date: 6/15/2018 10:14:04 PM ******/
CREATE DATABASE [TouchCinemaDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TouchCinemaDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TouchCinemaDatabase.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TouchCinemaDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TouchCinemaDatabase_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TouchCinemaDatabase] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TouchCinemaDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TouchCinemaDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TouchCinemaDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TouchCinemaDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TouchCinemaDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TouchCinemaDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TouchCinemaDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [TouchCinemaDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TouchCinemaDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TouchCinemaDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TouchCinemaDatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TouchCinemaDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TouchCinemaDatabase]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 6/15/2018 10:14:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[username] [nvarchar](20) NOT NULL,
	[password] [nvarchar](10) NULL,
	[firstName] [nvarchar](20) NULL,
	[lastName] [nvarchar](20) NULL,
	[phone] [nvarchar](20) NULL,
	[email] [nvarchar](100) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genre]    Script Date: 6/15/2018 10:14:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[genreID] [int] NOT NULL,
	[genreName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[genreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GenreOfMovie]    Script Date: 6/15/2018 10:14:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenreOfMovie](
	[GenreMovieID] [int] IDENTITY(1,1) NOT NULL,
	[movieID] [nvarchar](20) NULL,
	[genreID] [int] NULL,
 CONSTRAINT [PK_GenreOfMovie] PRIMARY KEY CLUSTERED 
(
	[GenreMovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Member]    Script Date: 6/15/2018 10:14:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[username] [nvarchar](20) NOT NULL,
	[password] [nvarchar](10) NOT NULL,
	[firstName] [nvarchar](20) NOT NULL,
	[lastName] [nvarchar](20) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[birthDate] [date] NOT NULL,
	[avatar] [nvarchar](max) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movie]    Script Date: 6/15/2018 10:14:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[movieID] [nvarchar](20) NOT NULL,
	[movieTitle] [nvarchar](max) NULL,
	[length] [int] NULL,
	[rating] [float] NULL,
	[startDate] [date] NULL,
	[poster] [nvarchar](max) NULL,
	[linkTrailer] [nvarchar](max) NULL,
	[producer] [nvarchar](50) NULL,
	[year] [int] NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[movieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/15/2018 10:14:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderID] [nchar](10) NOT NULL,
	[scheduleID] [nvarchar](20) NOT NULL,
	[orderDate] [datetime] NOT NULL,
	[username] [nvarchar](20) NULL,
	[phone] [nvarchar](20) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[isCheckOut] [bit] NOT NULL,
 CONSTRAINT [PK_Order1] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/15/2018 10:14:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [nchar](10) NOT NULL,
	[seat] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Point]    Script Date: 6/15/2018 10:14:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Point](
	[username] [nvarchar](20) NOT NULL,
	[point] [int] NULL,
 CONSTRAINT [PK_Point] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 6/15/2018 10:14:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[roomID] [int] NOT NULL,
	[numberOfSear] [int] NULL,
	[isAvailable] [bit] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 6/15/2018 10:14:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[scheduleID] [nvarchar](20) NOT NULL,
	[date] [datetime] NULL,
	[movieID] [nvarchar](20) NULL,
	[roomID] [int] NULL,
	[priceOfTicket] [float] NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[scheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 6/15/2018 10:14:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[username] [nvarchar](20) NOT NULL,
	[password] [nvarchar](10) NULL,
	[firstName] [nvarchar](20) NULL,
	[lastName] [nvarchar](20) NULL,
	[phone] [nvarchar](20) NULL,
	[email] [nvarchar](100) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Admin] ([username], [password], [firstName], [lastName], [phone], [email]) VALUES (N'datnd', N'123456', N'Nguyen', N'Dat', N'01627962333', N'datndse63093@gmail.com')
INSERT [dbo].[Admin] ([username], [password], [firstName], [lastName], [phone], [email]) VALUES (N'hieubt', N'234432', N'Bui', N'Hieu', N'0122456678', N'hieubt@gmail.com')
INSERT [dbo].[Admin] ([username], [password], [firstName], [lastName], [phone], [email]) VALUES (N'huylm', N'123123', N'Le', N'Huy', N'0986676840', N'huylmse629898@gmail.com')
INSERT [dbo].[Genre] ([genreID], [genreName]) VALUES (1, N'Action')
INSERT [dbo].[Genre] ([genreID], [genreName]) VALUES (2, N'Comedy')
INSERT [dbo].[Genre] ([genreID], [genreName]) VALUES (3, N'Romantic')
INSERT [dbo].[Genre] ([genreID], [genreName]) VALUES (4, N'Only above 18')
INSERT [dbo].[Genre] ([genreID], [genreName]) VALUES (5, N'Only above 16')
INSERT [dbo].[Genre] ([genreID], [genreName]) VALUES (6, N'Only above 13')
INSERT [dbo].[Genre] ([genreID], [genreName]) VALUES (7, N'Musician')
INSERT [dbo].[Genre] ([genreID], [genreName]) VALUES (8, N'Horror')
INSERT [dbo].[Genre] ([genreID], [genreName]) VALUES (9, N'Family')
INSERT [dbo].[Genre] ([genreID], [genreName]) VALUES (10, N'Cartoon')
SET IDENTITY_INSERT [dbo].[GenreOfMovie] ON 

INSERT [dbo].[GenreOfMovie] ([GenreMovieID], [movieID], [genreID]) VALUES (1, N'Jura-1', 1)
INSERT [dbo].[GenreOfMovie] ([GenreMovieID], [movieID], [genreID]) VALUES (3, N'Jura-1', 8)
INSERT [dbo].[GenreOfMovie] ([GenreMovieID], [movieID], [genreID]) VALUES (4, N'Jura-1', 4)
INSERT [dbo].[GenreOfMovie] ([GenreMovieID], [movieID], [genreID]) VALUES (5, N'Jura-2', 1)
INSERT [dbo].[GenreOfMovie] ([GenreMovieID], [movieID], [genreID]) VALUES (6, N'Jura-2', 8)
INSERT [dbo].[GenreOfMovie] ([GenreMovieID], [movieID], [genreID]) VALUES (7, N'Jura-2', 4)
INSERT [dbo].[GenreOfMovie] ([GenreMovieID], [movieID], [genreID]) VALUES (8, N'EGM', 3)
INSERT [dbo].[GenreOfMovie] ([GenreMovieID], [movieID], [genreID]) VALUES (9, N'EGM', 9)
SET IDENTITY_INSERT [dbo].[GenreOfMovie] OFF
INSERT [dbo].[Member] ([username], [password], [firstName], [lastName], [phone], [email], [birthDate], [avatar], [isActive]) VALUES (N'linhnt', N'111', N'Nguyen ', N'Linh', N'01627962333', N'linhnt@gmail.com', CAST(N'1992-11-26' AS Date), N'linh.png', 1)
INSERT [dbo].[Member] ([username], [password], [firstName], [lastName], [phone], [email], [birthDate], [avatar], [isActive]) VALUES (N'phuongnt', N'111', N'Nguyen', N'Phuong', N'01627962333', N'phuongnt@gmail.com', CAST(N'1996-01-07' AS Date), N'phuong.jpeg', 1)
INSERT [dbo].[Movie] ([movieID], [movieTitle], [length], [rating], [startDate], [poster], [linkTrailer], [producer], [year]) VALUES (N'EGM', N'Em Gái Mưa', 119, 4.5, CAST(N'2018-06-01' AS Date), NULL, NULL, N'Viễn Đông', 2018)
INSERT [dbo].[Movie] ([movieID], [movieTitle], [length], [rating], [startDate], [poster], [linkTrailer], [producer], [year]) VALUES (N'Jura-1', N'Jurasic park 1', 128, 9, CAST(N'2008-12-02' AS Date), NULL, NULL, N'Fox century', 2008)
INSERT [dbo].[Movie] ([movieID], [movieTitle], [length], [rating], [startDate], [poster], [linkTrailer], [producer], [year]) VALUES (N'Jura-2', N'Jurassic park 2', 134, 8.3, CAST(N'2018-06-15' AS Date), NULL, NULL, N'Fox century', 2018)
INSERT [dbo].[Point] ([username], [point]) VALUES (N'linhnt', 123)
INSERT [dbo].[Point] ([username], [point]) VALUES (N'phuongnt', 0)
INSERT [dbo].[Room] ([roomID], [numberOfSear], [isAvailable]) VALUES (1, 40, 1)
INSERT [dbo].[Room] ([roomID], [numberOfSear], [isAvailable]) VALUES (2, 40, 1)
INSERT [dbo].[Room] ([roomID], [numberOfSear], [isAvailable]) VALUES (3, 40, 1)
INSERT [dbo].[Room] ([roomID], [numberOfSear], [isAvailable]) VALUES (4, 80, 1)
INSERT [dbo].[Room] ([roomID], [numberOfSear], [isAvailable]) VALUES (5, 80, 1)
INSERT [dbo].[Staff] ([username], [password], [firstName], [lastName], [phone], [email], [isActive]) VALUES (N'baotd', N'111', N'Tran', N'Dinh Bao', N'09472392783', N'baotd@gmail.com', 0)
INSERT [dbo].[Staff] ([username], [password], [firstName], [lastName], [phone], [email], [isActive]) VALUES (N'khanhnt', N'111', N'Le', N'Dieu Khanh', N'0976088128', N'khanhlt@gmail.com', 1)
INSERT [dbo].[Staff] ([username], [password], [firstName], [lastName], [phone], [email], [isActive]) VALUES (N'minhlv', N'111', N'Le', N'Van Minh', N'0987654324', N'minhlv@gmail.com', 1)
ALTER TABLE [dbo].[GenreOfMovie]  WITH CHECK ADD  CONSTRAINT [FK_GenreOfMovie_Genre] FOREIGN KEY([genreID])
REFERENCES [dbo].[Genre] ([genreID])
GO
ALTER TABLE [dbo].[GenreOfMovie] CHECK CONSTRAINT [FK_GenreOfMovie_Genre]
GO
ALTER TABLE [dbo].[GenreOfMovie]  WITH CHECK ADD  CONSTRAINT [FK_GenreOfMovie_Movie] FOREIGN KEY([movieID])
REFERENCES [dbo].[Movie] ([movieID])
GO
ALTER TABLE [dbo].[GenreOfMovie] CHECK CONSTRAINT [FK_GenreOfMovie_Movie]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Member] FOREIGN KEY([username])
REFERENCES [dbo].[Member] ([username])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Member]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Schedule] FOREIGN KEY([scheduleID])
REFERENCES [dbo].[Schedule] ([scheduleID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Schedule]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Point]  WITH CHECK ADD  CONSTRAINT [FK_Point_Member] FOREIGN KEY([username])
REFERENCES [dbo].[Member] ([username])
GO
ALTER TABLE [dbo].[Point] CHECK CONSTRAINT [FK_Point_Member]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Movie] FOREIGN KEY([movieID])
REFERENCES [dbo].[Movie] ([movieID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Movie]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Room] FOREIGN KEY([roomID])
REFERENCES [dbo].[Room] ([roomID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Room]
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [CK_Movie] CHECK  (([rating]<=(10)))
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [CK_Movie]
GO
USE [master]
GO
ALTER DATABASE [TouchCinemaDatabase] SET  READ_WRITE 
GO
