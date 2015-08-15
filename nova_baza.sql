USE [master]
GO
/****** Object:  Database [Anketi]    Script Date: 13.08.2015 22:41:49 ******/
CREATE DATABASE [Anketi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Anketi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Anketi.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Anketi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Anketi_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Anketi] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Anketi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Anketi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Anketi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Anketi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Anketi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Anketi] SET ARITHABORT OFF 
GO
ALTER DATABASE [Anketi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Anketi] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Anketi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Anketi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Anketi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Anketi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Anketi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Anketi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Anketi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Anketi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Anketi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Anketi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Anketi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Anketi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Anketi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Anketi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Anketi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Anketi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Anketi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Anketi] SET  MULTI_USER 
GO
ALTER DATABASE [Anketi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Anketi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Anketi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Anketi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Anketi]
GO
/****** Object:  Table [dbo].[Anketa]    Script Date: 13.08.2015 22:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Anketa](
	[id_anketa] [int] NOT NULL,
	[prasanje] [varchar](200) NOT NULL,
	[opis_a] [varchar](300) NOT NULL,
	[kraen_datum] [datetime] NOT NULL,
	[id_lice] [int] NOT NULL,
	[datum_kreiranje] [datetime] NOT NULL,
	[multi_choice] [int] NOT NULL,
 CONSTRAINT [PK_Anketa] PRIMARY KEY CLUSTERED 
(
	[id_anketa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dozvoleni_Korisnici]    Script Date: 13.08.2015 22:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dozvoleni_Korisnici](
	[id_o] [int] NOT NULL,
	[id_anketa] [int] NOT NULL,
 CONSTRAINT [PK_Dozvoleni_Korisnici] PRIMARY KEY CLUSTERED 
(
	[id_o] ASC,
	[id_anketa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Glasa]    Script Date: 13.08.2015 22:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Glasa](
	[id_lice] [int] NOT NULL,
	[id_anketa] [int] NOT NULL,
	[id_odg] [int] NOT NULL,
	[datum_glasanje] [datetime] NULL,
 CONSTRAINT [PK_Glasa] PRIMARY KEY CLUSTERED 
(
	[id_lice] ASC,
	[id_anketa] ASC,
	[id_odg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ima_Ogranicuvanje]    Script Date: 13.08.2015 22:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ima_Ogranicuvanje](
	[id_lice] [int] NOT NULL,
	[id_o] [int] NOT NULL,
 CONSTRAINT [PK_Ima_Ogranicuvanje] PRIMARY KEY CLUSTERED 
(
	[id_lice] ASC,
	[id_o] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kategorija]    Script Date: 13.08.2015 22:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kategorija](
	[id_k] [int] NOT NULL,
	[ime_k] [varchar](50) NOT NULL,
	[opis_k] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Kategorija] PRIMARY KEY CLUSTERED 
(
	[id_k] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Komentar]    Script Date: 13.08.2015 22:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Komentar](
	[id_kom] [int] NOT NULL,
	[sodrzina] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Komentar] PRIMARY KEY CLUSTERED 
(
	[id_kom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Komentar_Za]    Script Date: 13.08.2015 22:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Komentar_Za](
	[id_kom] [int] NOT NULL,
	[id_anketa] [int] NOT NULL,
	[id_lice] [int] NOT NULL,
	[datum] [datetime] NOT NULL,
 CONSTRAINT [PK_Komentar_Za] PRIMARY KEY CLUSTERED 
(
	[id_kom] ASC,
	[id_anketa] ASC,
	[id_lice] ASC,
	[datum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Korisnik]    Script Date: 13.08.2015 22:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnik](
	[id_lice] [int] NOT NULL,
	[br_anketi] [int] NOT NULL,
 CONSTRAINT [PK_Korisnik] PRIMARY KEY CLUSTERED 
(
	[id_lice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lice]    Script Date: 13.08.2015 22:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lice](
	[id_lice] [int] NOT NULL,
	[ime] [char](20) NOT NULL,
	[prezime] [char](30) NOT NULL,
	[e_mail] [char](30) NOT NULL,
	[lozinka] [char](40) NOT NULL,
	[tel_broj] [char](9) NOT NULL,
	[ulica] [char](30) NOT NULL,
	[grad] [char](30) NOT NULL,
	[datum_r] [datetime] NULL,
 CONSTRAINT [PK_Lice] PRIMARY KEY CLUSTERED 
(
	[id_lice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mozni_Odgovori]    Script Date: 13.08.2015 22:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mozni_Odgovori](
	[id_odg] [int] NOT NULL,
	[ime_odg] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Mozni_Odgovori] PRIMARY KEY CLUSTERED 
(
	[id_odg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ogranicuvanja]    Script Date: 13.08.2015 22:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ogranicuvanja](
	[id_o] [int] NOT NULL,
	[ime_o] [varchar](50) NOT NULL,
	[opis_o] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Ogranicuvanja] PRIMARY KEY CLUSTERED 
(
	[id_o] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Premium_Korisnik]    Script Date: 13.08.2015 22:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Premium_Korisnik](
	[id_lice] [int] NOT NULL,
 CONSTRAINT [PK_Premium_Korisnik] PRIMARY KEY CLUSTERED 
(
	[id_lice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pripagja]    Script Date: 13.08.2015 22:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pripagja](
	[id_k] [int] NOT NULL,
	[id_anketa] [int] NOT NULL,
 CONSTRAINT [PK_Pripagja] PRIMARY KEY CLUSTERED 
(
	[id_k] ASC,
	[id_anketa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sodrzi]    Script Date: 13.08.2015 22:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sodrzi](
	[id_odg] [int] NOT NULL,
	[id_anketa] [int] NOT NULL,
 CONSTRAINT [PK_Sodrzi] PRIMARY KEY CLUSTERED 
(
	[id_odg] ASC,
	[id_anketa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice]) VALUES (1, N'Who will win the BARCLAYS Premier League?', N' ', CAST(0x0000A4F200DEADDC AS DateTime), 1, CAST(0x0000A4F200DEADDC AS DateTime), 0)
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice]) VALUES (2, N'Who will win The US Open?', N'', CAST(0x0000A51B00B6C0C4 AS DateTime), 3, CAST(0x0000A4F200B6C0C4 AS DateTime), 0)
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice]) VALUES (3, N'What is you favourite Programing Language?', N'', CAST(0x0000A57600F8A96C AS DateTime), 1, CAST(0x0000A4F2011C0D30 AS DateTime), 1)
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice]) VALUES (4, N'How difficult is C#?', N'', CAST(0x0000A580016EC624 AS DateTime), 5, CAST(0x0000A4F5016EB238 AS DateTime), 0)
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice]) VALUES (5, N'What do you think of LISP?', N'', CAST(0x0000A5430151EF54 AS DateTime), 3, CAST(0x0000A4F801392348 AS DateTime), 1)
INSERT [dbo].[Dozvoleni_Korisnici] ([id_o], [id_anketa]) VALUES (9, 1)
INSERT [dbo].[Dozvoleni_Korisnici] ([id_o], [id_anketa]) VALUES (9, 2)
INSERT [dbo].[Dozvoleni_Korisnici] ([id_o], [id_anketa]) VALUES (10, 4)
INSERT [dbo].[Dozvoleni_Korisnici] ([id_o], [id_anketa]) VALUES (10, 5)
INSERT [dbo].[Dozvoleni_Korisnici] ([id_o], [id_anketa]) VALUES (19, 3)
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 1, 1, CAST(0x0000A4F200CF3294 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 2, 7, CAST(0x0000A4F200CFE5E0 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 3, 16, CAST(0x0000A4F400F0DB60 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 4, 18, CAST(0x0000A4F40153BBE0 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 5, 23, CAST(0x0000A4F301852C20 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2, 4, 19, CAST(0x0000A4F50123F180 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2, 5, 23, CAST(0x0000A4F2017E0800 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (3, 1, 2, CAST(0x0000A4F0010B3960 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (3, 2, 8, CAST(0x0000A4F300C4E960 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (4, 3, 16, CAST(0x0000A4F30172C530 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (5, 2, 9, CAST(0x0000A4EF0166AF70 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (5, 3, 14, CAST(0x0000A4F50130DA30 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (5, 5, 22, CAST(0x0000A50000FC1E30 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (5, 5, 23, CAST(0x0000A50000FC1E30 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (6, 2, 8, CAST(0x0000A4FD00D8F630 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (6, 4, 18, CAST(0x0000A4F50123F180 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (7, 2, 7, CAST(0x0000A4F200E13390 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (7, 4, 18, CAST(0x0000A4F5015CCC30 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (7, 5, 22, CAST(0x0000A4F5015CCC30 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (7, 5, 23, CAST(0x0000A4F5015CCC30 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (9, 2, 8, CAST(0x0000A4F30171F240 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (9, 3, 15, CAST(0x0000A4F00110FDF0 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (9, 4, 17, CAST(0x0000A4F00110FDF0 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (10, 4, 17, CAST(0x0000A4F00110FDF0 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (10, 5, 21, CAST(0x0000A4F2017E0800 AS DateTime))
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (1, 1)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (1, 10)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (1, 11)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (1, 19)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (2, 6)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (2, 12)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (2, 19)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (3, 1)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (3, 8)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (3, 11)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (4, 3)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (4, 10)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (4, 12)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (4, 19)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (5, 6)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (5, 8)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (5, 11)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (6, 3)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (6, 8)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (6, 11)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (7, 3)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (7, 10)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (7, 12)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (7, 19)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (8, 1)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (8, 11)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (8, 19)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (9, 3)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (9, 10)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (9, 12)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (9, 19)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (10, 6)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (10, 11)
INSERT [dbo].[Ima_Ogranicuvanje] ([id_lice], [id_o]) VALUES (10, 19)
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (1, N'Sport', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (2, N'Football', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (3, N'Tennis', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (4, N'Faculty', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (5, N'Programming', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (6, N'C#', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (7, N'LISP', N'')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1, N'I think that JAVA is the best programing language at the moment.')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (2, N'Chelsea has the most COMPACT team!!!')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (3, N'Man Utd must win this year.')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (4, N'Why did you put Liverpool? :D')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (5, N'Chelsea will win it again.')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (6, N'Chilich does not have any chance.')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (7, N'Nishikori is in very bad form :(')
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (1, 3, 1, CAST(0x0000A4F301711E24 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (2, 1, 3, CAST(0x0000A4F300C9DFB0 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (3, 1, 1, CAST(0x0000A4F301213710 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (4, 1, 6, CAST(0x0000A4F50102BA60 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (5, 1, 5, CAST(0x0000A4F101365D20 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (6, 2, 5, CAST(0x0000A4F10152A750 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (7, 2, 1, CAST(0x0000A4F0016D4BA0 AS DateTime))
INSERT [dbo].[Korisnik] ([id_lice], [br_anketi]) VALUES (2, 0)
INSERT [dbo].[Korisnik] ([id_lice], [br_anketi]) VALUES (3, 2)
INSERT [dbo].[Korisnik] ([id_lice], [br_anketi]) VALUES (5, 1)
INSERT [dbo].[Korisnik] ([id_lice], [br_anketi]) VALUES (7, 0)
INSERT [dbo].[Korisnik] ([id_lice], [br_anketi]) VALUES (8, 0)
INSERT [dbo].[Korisnik] ([id_lice], [br_anketi]) VALUES (10, 0)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [grad], [datum_r]) VALUES (1, N'Slavko              ', N'Kazakov                       ', N'slavce_caki@yahoo.com         ', N'123456                                  ', N'075236344', N'Dimche Mirchev br.12          ', N'Veles                         ', CAST(0x0000853700DEADDC AS DateTime))
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [grad], [datum_r]) VALUES (2, N'Andrej              ', N'Petrov                        ', N'petrov_androj@gmail.com       ', N'lozinka1                                ', N'077233562', N'Partizanska 2/15              ', N'Skopje                        ', CAST(0x000072C800DEADDC AS DateTime))
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [grad], [datum_r]) VALUES (3, N'Milica              ', N'Trajkovska                    ', N'milica_1992@yahoo.com         ', N'lozinka2                                ', N'076159669', N'Leninova 5/33                 ', N'Veles                         ', CAST(0x00008B4E00DEADDC AS DateTime))
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [grad], [datum_r]) VALUES (4, N'Dragana             ', N'Andreeva                      ', N'andreeva_dragana@yahoo.com    ', N'lozinka3                                ', N'070224456', N'Partizanski Odredi b.b.       ', N'Skopje                        ', CAST(0x000085D000DEADDC AS DateTime))
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [grad], [datum_r]) VALUES (5, N'Dejan               ', N'Stojkovski                    ', N'stojkovski_d@gmail.com        ', N'lozinka4                                ', N'077226335', N'Blagoj Gjorev 23              ', N'Veles                         ', CAST(0x00008BFA00DEADDC AS DateTime))
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [grad], [datum_r]) VALUES (6, N'Milan               ', N'Popov                         ', N'popov_mile@yahoo.com          ', N'lozinka5                                ', N'072256489', N'Vladimir Nazor 55             ', N'Veles                         ', CAST(0x00008FFB00DEADDC AS DateTime))
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [grad], [datum_r]) VALUES (7, N'Ana                 ', N'Trajkovska                    ', N'trajkovska_ana@gmail.com      ', N'lozinka6                                ', N'071266412', N'Partizanka 33/56              ', N'Skopje                        ', CAST(0x0000821900DEADDC AS DateTime))
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [grad], [datum_r]) VALUES (8, N'Jovana              ', N'Jancevska                     ', N'jovana_j@yahoo.com            ', N'lozinka7                                ', N'075256336', N'Blagoj Gjorev 45              ', N'Veles                         ', CAST(0x000075D200DEADDC AS DateTime))
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [grad], [datum_r]) VALUES (9, N'Nikola              ', N'Markovski                     ', N'nikola_m@gmail.com            ', N'lozinka8                                ', N'072357667', N'Pero Nakov b.b.               ', N'Skopje                        ', CAST(0x00007B4800DEADDC AS DateTime))
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [grad], [datum_r]) VALUES (10, N'Dragan              ', N'Nikolov                       ', N'nikolov_d@gmail.com           ', N'lozinka9                                ', N'078256321', N'Leninova 2/15                 ', N'Veles                         ', CAST(0x00006C2A00DEADDC AS DateTime))
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1, N'Manchester United')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (2, N'Chelsea')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (3, N'Arsenal')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (4, N'Manchester City')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (5, N'Liverpool')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (6, N'Other')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (7, N'Novak Djokovich')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (8, N'Roger Federer')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (9, N'Stan Wavrinka')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (10, N'Marin Chilich')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (11, N'Andy Murry')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (12, N'Kei Nishikori')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (13, N'C')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (14, N'C++')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (15, N'C#')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (16, N'JAVA')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (17, N'Easy')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (18, N'Medium')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (19, N'Hard')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (20, N'Very Hard')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (21, N'I think that LISP is Useless')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (22, N'LISP is not used today')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (23, N'It motivates Me to solve problems with recursion')
INSERT [dbo].[Ogranicuvanja] ([id_o], [ime_o], [opis_o]) VALUES (1, N'075', N'Only for One Users!!!')
INSERT [dbo].[Ogranicuvanja] ([id_o], [ime_o], [opis_o]) VALUES (3, N'070', N'Only for T-Mobile Users!!!')
INSERT [dbo].[Ogranicuvanja] ([id_o], [ime_o], [opis_o]) VALUES (6, N'078', N'Only for VIP Users!!!')
INSERT [dbo].[Ogranicuvanja] ([id_o], [ime_o], [opis_o]) VALUES (8, N'0-18', N'Under 18 years old!!!')
INSERT [dbo].[Ogranicuvanja] ([id_o], [ime_o], [opis_o]) VALUES (9, N'No restrictions', N'No restrictions')
INSERT [dbo].[Ogranicuvanja] ([id_o], [ime_o], [opis_o]) VALUES (10, N'20-30', N'Between 20 to 30 years old!!!')
INSERT [dbo].[Ogranicuvanja] ([id_o], [ime_o], [opis_o]) VALUES (11, N'Veles', N'Only for thouse who live in Veles!!!')
INSERT [dbo].[Ogranicuvanja] ([id_o], [ime_o], [opis_o]) VALUES (12, N'Skopje', N'Only for thouse who live in Skopje!!!')
INSERT [dbo].[Ogranicuvanja] ([id_o], [ime_o], [opis_o]) VALUES (13, N'Bitola', N'Only for thouse who live in Bitola!!!')
INSERT [dbo].[Ogranicuvanja] ([id_o], [ime_o], [opis_o]) VALUES (14, N'Kumanovo', N'Only for thouse who live in Kumanovo!!!')
INSERT [dbo].[Ogranicuvanja] ([id_o], [ime_o], [opis_o]) VALUES (15, N'Ohrid', N'Only for thouse who live in Ohrid!!!')
INSERT [dbo].[Ogranicuvanja] ([id_o], [ime_o], [opis_o]) VALUES (16, N'Struga', N'Only for thouse who live in Struga!!!')
INSERT [dbo].[Ogranicuvanja] ([id_o], [ime_o], [opis_o]) VALUES (17, N'Dojran', N'Only for thouse who live in Dojran!!!')
INSERT [dbo].[Ogranicuvanja] ([id_o], [ime_o], [opis_o]) VALUES (18, N'Tetovo', N'Only for thouse who live in Tetovo!!!')
INSERT [dbo].[Ogranicuvanja] ([id_o], [ime_o], [opis_o]) VALUES (19, N'18-99', N'Above 18 years old!!!')
INSERT [dbo].[Premium_Korisnik] ([id_lice]) VALUES (1)
INSERT [dbo].[Premium_Korisnik] ([id_lice]) VALUES (2)
INSERT [dbo].[Premium_Korisnik] ([id_lice]) VALUES (4)
INSERT [dbo].[Premium_Korisnik] ([id_lice]) VALUES (6)
INSERT [dbo].[Premium_Korisnik] ([id_lice]) VALUES (9)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (1, 1)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (1, 2)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (2, 1)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (3, 2)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (4, 4)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (4, 5)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (5, 3)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (5, 4)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (5, 5)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (6, 4)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (7, 5)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1, 1)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (2, 1)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (3, 1)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (4, 1)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (5, 1)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (6, 1)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (6, 2)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (7, 2)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (8, 2)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (9, 2)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (10, 2)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (11, 2)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (12, 2)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (13, 3)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (14, 3)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (15, 3)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (16, 3)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (17, 4)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (18, 4)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (19, 4)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (20, 4)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (21, 5)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (22, 5)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (23, 5)
ALTER TABLE [dbo].[Anketa] ADD  CONSTRAINT [DF_Anketa_multi_choice]  DEFAULT ((0)) FOR [multi_choice]
GO
ALTER TABLE [dbo].[Korisnik] ADD  CONSTRAINT [DF_Korisnik_br_anketi]  DEFAULT ((0)) FOR [br_anketi]
GO
ALTER TABLE [dbo].[Anketa]  WITH CHECK ADD  CONSTRAINT [FK_Anketa_Lice] FOREIGN KEY([id_lice])
REFERENCES [dbo].[Lice] ([id_lice])
GO
ALTER TABLE [dbo].[Anketa] CHECK CONSTRAINT [FK_Anketa_Lice]
GO
ALTER TABLE [dbo].[Dozvoleni_Korisnici]  WITH CHECK ADD  CONSTRAINT [FK_Dozvoleni_Korisnici_Anketa] FOREIGN KEY([id_anketa])
REFERENCES [dbo].[Anketa] ([id_anketa])
GO
ALTER TABLE [dbo].[Dozvoleni_Korisnici] CHECK CONSTRAINT [FK_Dozvoleni_Korisnici_Anketa]
GO
ALTER TABLE [dbo].[Dozvoleni_Korisnici]  WITH CHECK ADD  CONSTRAINT [FK_Dozvoleni_Korisnici_Ogranicuvanja] FOREIGN KEY([id_o])
REFERENCES [dbo].[Ogranicuvanja] ([id_o])
GO
ALTER TABLE [dbo].[Dozvoleni_Korisnici] CHECK CONSTRAINT [FK_Dozvoleni_Korisnici_Ogranicuvanja]
GO
ALTER TABLE [dbo].[Glasa]  WITH CHECK ADD  CONSTRAINT [FK_Glasa_Anketa] FOREIGN KEY([id_anketa])
REFERENCES [dbo].[Anketa] ([id_anketa])
GO
ALTER TABLE [dbo].[Glasa] CHECK CONSTRAINT [FK_Glasa_Anketa]
GO
ALTER TABLE [dbo].[Glasa]  WITH CHECK ADD  CONSTRAINT [FK_Glasa_Lice] FOREIGN KEY([id_lice])
REFERENCES [dbo].[Lice] ([id_lice])
GO
ALTER TABLE [dbo].[Glasa] CHECK CONSTRAINT [FK_Glasa_Lice]
GO
ALTER TABLE [dbo].[Glasa]  WITH CHECK ADD  CONSTRAINT [FK_Glasa_Mozni_Odgovori] FOREIGN KEY([id_odg])
REFERENCES [dbo].[Mozni_Odgovori] ([id_odg])
GO
ALTER TABLE [dbo].[Glasa] CHECK CONSTRAINT [FK_Glasa_Mozni_Odgovori]
GO
ALTER TABLE [dbo].[Ima_Ogranicuvanje]  WITH CHECK ADD  CONSTRAINT [FK_Ima_Ogranicuvanje_Lice] FOREIGN KEY([id_lice])
REFERENCES [dbo].[Lice] ([id_lice])
GO
ALTER TABLE [dbo].[Ima_Ogranicuvanje] CHECK CONSTRAINT [FK_Ima_Ogranicuvanje_Lice]
GO
ALTER TABLE [dbo].[Ima_Ogranicuvanje]  WITH CHECK ADD  CONSTRAINT [FK_Ima_Ogranicuvanje_Ogranicuvanja] FOREIGN KEY([id_o])
REFERENCES [dbo].[Ogranicuvanja] ([id_o])
GO
ALTER TABLE [dbo].[Ima_Ogranicuvanje] CHECK CONSTRAINT [FK_Ima_Ogranicuvanje_Ogranicuvanja]
GO
ALTER TABLE [dbo].[Komentar_Za]  WITH CHECK ADD  CONSTRAINT [FK_Komentar_Za_Anketa] FOREIGN KEY([id_anketa])
REFERENCES [dbo].[Anketa] ([id_anketa])
GO
ALTER TABLE [dbo].[Komentar_Za] CHECK CONSTRAINT [FK_Komentar_Za_Anketa]
GO
ALTER TABLE [dbo].[Komentar_Za]  WITH CHECK ADD  CONSTRAINT [FK_Komentar_Za_Komentar] FOREIGN KEY([id_kom])
REFERENCES [dbo].[Komentar] ([id_kom])
GO
ALTER TABLE [dbo].[Komentar_Za] CHECK CONSTRAINT [FK_Komentar_Za_Komentar]
GO
ALTER TABLE [dbo].[Komentar_Za]  WITH CHECK ADD  CONSTRAINT [FK_Komentar_Za_Lice] FOREIGN KEY([id_lice])
REFERENCES [dbo].[Lice] ([id_lice])
GO
ALTER TABLE [dbo].[Komentar_Za] CHECK CONSTRAINT [FK_Komentar_Za_Lice]
GO
ALTER TABLE [dbo].[Korisnik]  WITH CHECK ADD  CONSTRAINT [FK_Korisnik_Lice] FOREIGN KEY([id_lice])
REFERENCES [dbo].[Lice] ([id_lice])
GO
ALTER TABLE [dbo].[Korisnik] CHECK CONSTRAINT [FK_Korisnik_Lice]
GO
ALTER TABLE [dbo].[Premium_Korisnik]  WITH CHECK ADD  CONSTRAINT [FK_Premium_Korisnik_Lice] FOREIGN KEY([id_lice])
REFERENCES [dbo].[Lice] ([id_lice])
GO
ALTER TABLE [dbo].[Premium_Korisnik] CHECK CONSTRAINT [FK_Premium_Korisnik_Lice]
GO
ALTER TABLE [dbo].[Pripagja]  WITH CHECK ADD  CONSTRAINT [FK_Pripagja_Anketa] FOREIGN KEY([id_anketa])
REFERENCES [dbo].[Anketa] ([id_anketa])
GO
ALTER TABLE [dbo].[Pripagja] CHECK CONSTRAINT [FK_Pripagja_Anketa]
GO
ALTER TABLE [dbo].[Pripagja]  WITH CHECK ADD  CONSTRAINT [FK_Pripagja_Kategorija] FOREIGN KEY([id_k])
REFERENCES [dbo].[Kategorija] ([id_k])
GO
ALTER TABLE [dbo].[Pripagja] CHECK CONSTRAINT [FK_Pripagja_Kategorija]
GO
ALTER TABLE [dbo].[Sodrzi]  WITH CHECK ADD  CONSTRAINT [FK_Sodrzi_Anketa] FOREIGN KEY([id_anketa])
REFERENCES [dbo].[Anketa] ([id_anketa])
GO
ALTER TABLE [dbo].[Sodrzi] CHECK CONSTRAINT [FK_Sodrzi_Anketa]
GO
ALTER TABLE [dbo].[Sodrzi]  WITH CHECK ADD  CONSTRAINT [FK_Sodrzi_Mozni_Odgovori] FOREIGN KEY([id_odg])
REFERENCES [dbo].[Mozni_Odgovori] ([id_odg])
GO
ALTER TABLE [dbo].[Sodrzi] CHECK CONSTRAINT [FK_Sodrzi_Mozni_Odgovori]
GO
USE [master]
GO
ALTER DATABASE [Anketi] SET  READ_WRITE 
GO
