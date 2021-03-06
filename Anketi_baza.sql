USE [master]
GO
/****** Object:  Database [Anketi]    Script Date: 15.09.2015 13:29:16 ******/
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
/****** Object:  Table [dbo].[Anketa]    Script Date: 15.09.2015 13:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Anketa](
	[id_anketa] [int] IDENTITY(1,1) NOT NULL,
	[prasanje] [varchar](200) NOT NULL,
	[opis_a] [varchar](300) NOT NULL,
	[kraen_datum] [datetime] NOT NULL,
	[id_lice] [int] NOT NULL,
	[datum_kreiranje] [datetime] NOT NULL,
	[multi_choice] [int] NOT NULL,
	[url_slika] [varchar](250) NULL,
 CONSTRAINT [PK_Anketa] PRIMARY KEY CLUSTERED 
(
	[id_anketa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dozvoleni_Korisnici]    Script Date: 15.09.2015 13:29:16 ******/
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
/****** Object:  Table [dbo].[Glasa]    Script Date: 15.09.2015 13:29:16 ******/
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
/****** Object:  Table [dbo].[Grad]    Script Date: 15.09.2015 13:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grad](
	[id_grad] [int] IDENTITY(1,1) NOT NULL,
	[ime_grad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Grad] PRIMARY KEY CLUSTERED 
(
	[id_grad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ima_Ogranicuvanje]    Script Date: 15.09.2015 13:29:16 ******/
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
/****** Object:  Table [dbo].[Kategorija]    Script Date: 15.09.2015 13:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kategorija](
	[id_k] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Komentar]    Script Date: 15.09.2015 13:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Komentar](
	[id_kom] [int] IDENTITY(1,1) NOT NULL,
	[sodrzina] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Komentar] PRIMARY KEY CLUSTERED 
(
	[id_kom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Komentar_Za]    Script Date: 15.09.2015 13:29:16 ******/
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
/****** Object:  Table [dbo].[Korisnik]    Script Date: 15.09.2015 13:29:16 ******/
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
/****** Object:  Table [dbo].[Lice]    Script Date: 15.09.2015 13:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lice](
	[id_lice] [int] IDENTITY(1,1) NOT NULL,
	[ime] [char](20) NOT NULL,
	[prezime] [char](30) NOT NULL,
	[e_mail] [char](30) NOT NULL,
	[lozinka] [char](40) NOT NULL,
	[tel_broj] [char](9) NOT NULL,
	[ulica] [char](30) NOT NULL,
	[datum_r] [datetime] NOT NULL,
	[id_grad] [int] NULL,
 CONSTRAINT [PK_Lice] PRIMARY KEY CLUSTERED 
(
	[id_lice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mozni_Odgovori]    Script Date: 15.09.2015 13:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mozni_Odgovori](
	[id_odg] [int] IDENTITY(1,1) NOT NULL,
	[ime_odg] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Mozni_Odgovori] PRIMARY KEY CLUSTERED 
(
	[id_odg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ogranicuvanja]    Script Date: 15.09.2015 13:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ogranicuvanja](
	[id_o] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Premium_Korisnik]    Script Date: 15.09.2015 13:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Premium_Korisnik](
	[id_lice] [int] NOT NULL,
	[datum_starts] [date] NULL,
	[datum_end] [date] NULL,
 CONSTRAINT [PK_Premium_Korisnik] PRIMARY KEY CLUSTERED 
(
	[id_lice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pripagja]    Script Date: 15.09.2015 13:29:16 ******/
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
/****** Object:  Table [dbo].[Sodrzi]    Script Date: 15.09.2015 13:29:16 ******/
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
SET IDENTITY_INSERT [dbo].[Anketa] ON 

INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice], [url_slika]) VALUES (1, N'Who will win the BARCLAYS Premier League?', N' ', CAST(0x0000A4F200DEADDC AS DateTime), 1, CAST(0x0000A4F200DEADDC AS DateTime), 0, NULL)
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice], [url_slika]) VALUES (2, N'Who will win The US Open?', N'', CAST(0x0000A51B00B6C0C4 AS DateTime), 3, CAST(0x0000A4F200B6C0C4 AS DateTime), 0, N'https://www.octa.com/wp-content/uploads/2013/08/Tennis-Us-open-2013.jpg')
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice], [url_slika]) VALUES (3, N'What is you favourite Programing Language?', N'', CAST(0x0000A57600F8A96C AS DateTime), 1, CAST(0x0000A4F2011C0D30 AS DateTime), 1, NULL)
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice], [url_slika]) VALUES (4, N'How difficult is C#?', N'', CAST(0x0000A580016EC624 AS DateTime), 5, CAST(0x0000A4F5016EB238 AS DateTime), 0, NULL)
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice], [url_slika]) VALUES (5, N'What do you think of LISP?', N'Hello2', CAST(0x0000A41D0151EF54 AS DateTime), 3, CAST(0x0000A4F801392348 AS DateTime), 1, NULL)
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice], [url_slika]) VALUES (8, N'What is your favourite color?', N'///', CAST(0x0000A51900000000 AS DateTime), 1, CAST(0x0000A5090007E7D4 AS DateTime), 1, N'http://www.hopscotchonline.org/Game1/colors/rainbow.png')
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice], [url_slika]) VALUES (17, N'Where do you study?', N'', CAST(0x0000A52300000000 AS DateTime), 1, CAST(0x0000A50901094F88 AS DateTime), 0, NULL)
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice], [url_slika]) VALUES (48, N'What do you prefer?', N'', CAST(0x0000A50900000000 AS DateTime), 1, CAST(0x0000A50A0160D244 AS DateTime), 1, NULL)
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice], [url_slika]) VALUES (49, N'What is you favourite F1 team?', N'', CAST(0x0000A52300000000 AS DateTime), 1, CAST(0x0000A50F00EF496C AS DateTime), 0, NULL)
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice], [url_slika]) VALUES (50, N'What is your favourite F1 driver?', N'', CAST(0x0000A52300000000 AS DateTime), 1, CAST(0x0000A50F00F10338 AS DateTime), 1, N'http://www2.pictures.fp.zimbio.com/Formula+One+Drivers+Australian+Grand+Prix+9kx6U7dUHhWl.jpg')
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice], [url_slika]) VALUES (51, N'What is you favourite meal?', N'', CAST(0x0000A52300000000 AS DateTime), 1, CAST(0x0000A50F00F2088C AS DateTime), 0, NULL)
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice], [url_slika]) VALUES (52, N'What do you train?', N'', CAST(0x0000A53800000000 AS DateTime), 1, CAST(0x0000A50F010B13E0 AS DateTime), 1, NULL)
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice], [url_slika]) VALUES (53, N'How often do you watch Tennis?', N'', CAST(0x0000A52300000000 AS DateTime), 5, CAST(0x0000A50F010BCBDC AS DateTime), 0, N'http://news.bbcimg.co.uk/media/images/56755000/jpg/_56755895_atp-tennis-graphic(2).jpg')
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice], [url_slika]) VALUES (54, N'Do you watch Barclays Premier League?', N'', CAST(0x0000A5E800000000 AS DateTime), 5, CAST(0x0000A50F010C0EA8 AS DateTime), 0, N'http://www.hangout.co.ke/wp-content/uploads/2014/03/barclays-premier-league-fixtures.jpg')
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice], [url_slika]) VALUES (55, N'What gaming console do you use?', N'', CAST(0x0000A51E00000000 AS DateTime), 1, CAST(0x0000A50F01118388 AS DateTime), 1, N'http://www.cromaretail.com/Images/guide/gaming/gaming-buying-guide.jpg')
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice], [url_slika]) VALUES (1049, N'What type of music do you love?', N'', CAST(0x0000A62800000000 AS DateTime), 3035, CAST(0x0000A51400DB0C90 AS DateTime), 1, N'https://www.essentiallearningproducts.com/media/elp/teachers/content/monthly_activities/DBD1_0306.gif')
INSERT [dbo].[Anketa] ([id_anketa], [prasanje], [opis_a], [kraen_datum], [id_lice], [datum_kreiranje], [multi_choice], [url_slika]) VALUES (1050, N'What is your favorite Movie for 2014?', N'', CAST(0x0000A57F00000000 AS DateTime), 3035, CAST(0x0000A51400DD034C AS DateTime), 0, N'http://i2.mirror.co.uk/incoming/article4984092.ece/ALTERNATES/s615/Oscars-LIVE-MAIN.jpg')
SET IDENTITY_INSERT [dbo].[Anketa] OFF
INSERT [dbo].[Dozvoleni_Korisnici] ([id_o], [id_anketa]) VALUES (9, 1)
INSERT [dbo].[Dozvoleni_Korisnici] ([id_o], [id_anketa]) VALUES (9, 2)
INSERT [dbo].[Dozvoleni_Korisnici] ([id_o], [id_anketa]) VALUES (10, 4)
INSERT [dbo].[Dozvoleni_Korisnici] ([id_o], [id_anketa]) VALUES (10, 5)
INSERT [dbo].[Dozvoleni_Korisnici] ([id_o], [id_anketa]) VALUES (19, 3)
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 1, 1, CAST(0x0000A4F200CF3294 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 2, 7, CAST(0x0000A4F200CFE5E0 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 2, 12, CAST(0x0000A50400FF61BC AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 3, 15, CAST(0x0000A5050161B7F4 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 3, 16, CAST(0x0000A4F400F0DB60 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 4, 18, CAST(0x0000A4F40153BBE0 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 5, 23, CAST(0x0000A4F301852C20 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 8, 35, CAST(0x0000A50900082F50 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 8, 38, CAST(0x0000A50900082F50 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 17, 81, CAST(0x0000A51400D04F58 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 48, 1178, CAST(0x0000A51400D03DC4 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 48, 1180, CAST(0x0000A51400D03DC4 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 49, 1175, CAST(0x0000A51400D01CF4 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 50, 183, CAST(0x0000A51400CFF9CC AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 50, 185, CAST(0x0000A51400CFF9CC AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 51, 187, CAST(0x0000A50F01135140 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 52, 190, CAST(0x0000A50F011332C8 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 52, 194, CAST(0x0000A50F011332C8 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 53, 199, CAST(0x0000A50F011324B8 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 54, 201, CAST(0x0000A50F0112EB4C AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1, 55, 207, CAST(0x0000A51400CFC2B8 AS DateTime))
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
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (8, 1, 1, CAST(0x0000A50201841790 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (8, 2, 7, CAST(0x0000A502017F76CC AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (8, 3, 13, CAST(0x0000A50300222D38 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (8, 3, 16, CAST(0x0000A50300231EA0 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (8, 4, 17, CAST(0x0000A50201897758 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (9, 2, 8, CAST(0x0000A4F30171F240 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (9, 3, 15, CAST(0x0000A4F00110FDF0 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (9, 4, 17, CAST(0x0000A4F00110FDF0 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (10, 4, 17, CAST(0x0000A4F00110FDF0 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (10, 5, 21, CAST(0x0000A4F2017E0800 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (21, 1, 2, CAST(0x0000A50200FC06C0 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1022, 1, 1, CAST(0x0000A502001BB688 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1023, 2, 7, CAST(0x0000A50401124D18 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (1023, 2, 8, CAST(0x0000A50401127874 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2023, 2, 7, CAST(0x0000A50600298D1C AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2023, 3, 13, CAST(0x0000A50500F5544C AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2023, 3, 14, CAST(0x0000A50500F5544C AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2023, 3, 15, CAST(0x0000A50500F5544C AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2024, 3, 15, CAST(0x0000A50500F713F4 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2024, 3, 16, CAST(0x0000A50500F713F4 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2024, 5, 21, CAST(0x0000A50500F74C34 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2024, 5, 23, CAST(0x0000A50500F74C34 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2025, 3, 14, CAST(0x0000A50500F84954 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2025, 3, 16, CAST(0x0000A50500F81CCC AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2026, 2, 8, CAST(0x0000A50500F9E4A8 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2027, 1, 3, CAST(0x0000A50500FABFCC AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2027, 5, 21, CAST(0x0000A50500FAE2F4 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2027, 5, 22, CAST(0x0000A50500FAE2F4 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2028, 3, 13, CAST(0x0000A505010EE9E8 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2028, 3, 15, CAST(0x0000A505010CF584 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2028, 3, 16, CAST(0x0000A505010CF584 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2028, 3, 21, CAST(0x0000A505010EE9E8 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2028, 5, 23, CAST(0x0000A505010EBB08 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2029, 1, 2, CAST(0x0000A505016FF224 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2029, 1, 6, CAST(0x0000A5050170A444 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2029, 2, 8, CAST(0x0000A505016F7970 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2029, 3, 13, CAST(0x0000A50501108410 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2029, 3, 14, CAST(0x0000A5050110A738 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2029, 3, 16, CAST(0x0000A5050115D244 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2029, 4, 17, CAST(0x0000A5060027144C AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2029, 5, 23, CAST(0x0000A505011A34EC AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2030, 3, 15, CAST(0x0000A505011ACF9C AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2030, 3, 16, CAST(0x0000A505011ACF9C AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2030, 5, 22, CAST(0x0000A505011B29D8 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2030, 5, 23, CAST(0x0000A505011B29D8 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2031, 3, 16, CAST(0x0000A505011BDF7C AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2031, 5, 22, CAST(0x0000A505011BB8D0 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2032, 1, 5, CAST(0x0000A50501712400 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2032, 3, 16, CAST(0x0000A50501713DC8 AS DateTime))
INSERT [dbo].[Glasa] ([id_lice], [id_anketa], [id_odg], [datum_glasanje]) VALUES (2033, 2, 7, CAST(0x0000A50801669F08 AS DateTime))
SET IDENTITY_INSERT [dbo].[Grad] ON 

INSERT [dbo].[Grad] ([id_grad], [ime_grad]) VALUES (1, N'Велес')
INSERT [dbo].[Grad] ([id_grad], [ime_grad]) VALUES (2, N'Скопје')
INSERT [dbo].[Grad] ([id_grad], [ime_grad]) VALUES (3, N'Куманово')
INSERT [dbo].[Grad] ([id_grad], [ime_grad]) VALUES (4, N'Битола')
INSERT [dbo].[Grad] ([id_grad], [ime_grad]) VALUES (5, N'Прилеп')
INSERT [dbo].[Grad] ([id_grad], [ime_grad]) VALUES (6, N'Гевгелија')
INSERT [dbo].[Grad] ([id_grad], [ime_grad]) VALUES (7, N'Охрид')
INSERT [dbo].[Grad] ([id_grad], [ime_grad]) VALUES (8, N'Струга')
INSERT [dbo].[Grad] ([id_grad], [ime_grad]) VALUES (9, N'Ресен')
INSERT [dbo].[Grad] ([id_grad], [ime_grad]) VALUES (10, N'Кавадарци')
INSERT [dbo].[Grad] ([id_grad], [ime_grad]) VALUES (11, N'Тетово')
INSERT [dbo].[Grad] ([id_grad], [ime_grad]) VALUES (12, N'Гостивар')
INSERT [dbo].[Grad] ([id_grad], [ime_grad]) VALUES (13, N'Берово')
INSERT [dbo].[Grad] ([id_grad], [ime_grad]) VALUES (14, N'Дебар')
SET IDENTITY_INSERT [dbo].[Grad] OFF
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
SET IDENTITY_INSERT [dbo].[Kategorija] ON 

INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (1, N'Sport', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (2, N'Football', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (3, N'Tennis', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (4, N'College', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (5, N'Programming', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (6, N'C#', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (7, N'LISP', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (9, N'Politics', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (10, N'JAVA', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (11, N'ASP.NET', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (12, N'News', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (13, N'Basketball', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (14, N'Handball', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (15, N'Moto-Sport', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (16, N'Music', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (17, N'Movies', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (18, N'Every-day stuff', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (19, N'Concerts', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (20, N'Celebrity', N'')
INSERT [dbo].[Kategorija] ([id_k], [ime_k], [opis_k]) VALUES (21, N'Other', N'')
SET IDENTITY_INSERT [dbo].[Kategorija] OFF
SET IDENTITY_INSERT [dbo].[Komentar] ON 

INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1, N'I think that JAVA is the best programing language at the moment.')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (2, N'Chelsea has the most COMPACT team!!!')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (3, N'Man Utd must win this year.')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (4, N'Why did you put Liverpool? :D')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (5, N'Chelsea will win it again.')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (6, N'Chilich does not have any chance.')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (7, N'Nishikori is in very bad form :(')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (8, N'Djokovich has the easiest path!!')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (9, N'Hello?')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (10, N'Are there any online users?')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (11, N'?')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (12, N'Nadal vs Chorich?')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (13, N'What do you think about that match')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (14, N'Will Serena Williams win?')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (15, N'Hello?')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (16, N'Will Djokovich play better this time?')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (17, N'?')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (18, N'?')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (19, N'Hello?')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (20, N'Hello?')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (21, N'Hi?')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (22, N'Proba')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1008, N'Hello?')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1009, N'Hello')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1010, N'asd')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1011, N'xvcv')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1012, N'fdgdfg')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1013, N'Hello')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1014, N'Hi')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1015, N'Hi!')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1016, N'How are you today?')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1017, N'HI')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1018, N'h')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1019, N'FF')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1020, N'HI')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1021, N'Hello')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1022, N'Hi')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1023, N'??')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1024, N'Hi, is anyone there?')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1025, N'Hii')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1026, N'HI')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1027, N'This is the best Football League :D')
INSERT [dbo].[Komentar] ([id_kom], [sodrzina]) VALUES (1028, N'Hi')
SET IDENTITY_INSERT [dbo].[Komentar] OFF
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (1, 3, 1, CAST(0x0000A4F301711E24 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (2, 1, 3, CAST(0x0000A4F300C9DFB0 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (3, 1, 1, CAST(0x0000A4F301213710 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (4, 1, 6, CAST(0x0000A4F50102BA60 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (5, 1, 5, CAST(0x0000A4F101365D20 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (6, 2, 5, CAST(0x0000A4F10152A750 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (7, 2, 1, CAST(0x0000A4F0016D4BA0 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (8, 2, 1, CAST(0x0000A50400FB6184 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (9, 2, 1, CAST(0x0000A50400FC8550 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (10, 2, 1, CAST(0x0000A50400FC9DEC AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (11, 2, 1, CAST(0x0000A50400FCA29C AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (12, 2, 1, CAST(0x0000A50400FCB55C AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (13, 2, 1, CAST(0x0000A50400FCC498 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (14, 2, 1, CAST(0x0000A50400FCDC08 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (15, 2, 1, CAST(0x0000A50400FCE310 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (16, 2, 1, CAST(0x0000A50400FCFE04 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (17, 2, 1, CAST(0x0000A50400FD0188 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (18, 2, 1, CAST(0x0000A50400FD0638 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (19, 2, 1, CAST(0x0000A50400FD0D40 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (20, 2, 1, CAST(0x0000A50400FD18F8 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (21, 2, 1, CAST(0x0000A50400FF46C8 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (22, 2, 1023, CAST(0x0000A5040112A754 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (1008, 1, 1, CAST(0x0000A505000ACFF8 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (1026, 48, 1, CAST(0x0000A50B011F9004 AS DateTime))
INSERT [dbo].[Komentar_Za] ([id_kom], [id_anketa], [id_lice], [datum]) VALUES (1027, 54, 1, CAST(0x0000A50F01130FA0 AS DateTime))
INSERT [dbo].[Korisnik] ([id_lice], [br_anketi]) VALUES (1, 5)
INSERT [dbo].[Korisnik] ([id_lice], [br_anketi]) VALUES (2, 0)
INSERT [dbo].[Korisnik] ([id_lice], [br_anketi]) VALUES (3, 2)
INSERT [dbo].[Korisnik] ([id_lice], [br_anketi]) VALUES (5, 3)
INSERT [dbo].[Korisnik] ([id_lice], [br_anketi]) VALUES (7, 0)
INSERT [dbo].[Korisnik] ([id_lice], [br_anketi]) VALUES (8, 0)
INSERT [dbo].[Korisnik] ([id_lice], [br_anketi]) VALUES (10, 0)
INSERT [dbo].[Korisnik] ([id_lice], [br_anketi]) VALUES (2029, 0)
INSERT [dbo].[Korisnik] ([id_lice], [br_anketi]) VALUES (2035, 3)
INSERT [dbo].[Korisnik] ([id_lice], [br_anketi]) VALUES (2036, 0)
INSERT [dbo].[Korisnik] ([id_lice], [br_anketi]) VALUES (3035, 2)
SET IDENTITY_INSERT [dbo].[Lice] ON 

INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (1, N'Slavko              ', N'Kazakov                       ', N'slavce_caki@yahoo.com         ', N'123456                                  ', N'075236344', N'Dimce Mircev br 12            ', CAST(0x0000853700DEADDC AS DateTime), 1)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (2, N'Andrej              ', N'Petrov                        ', N'petrov_androj@gmail.com       ', N'lozinka1                                ', N'077233562', N'Partizanska 2/15              ', CAST(0x000072C800DEADDC AS DateTime), 2)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (3, N'Milica              ', N'Trajkovska                    ', N'milica_1992@yahoo.com         ', N'lozinka2                                ', N'076159669', N'Leninova 5/33                 ', CAST(0x00008B4E00DEADDC AS DateTime), 1)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (4, N'Dragana             ', N'Andreeva                      ', N'andreeva_dragana@yahoo.com    ', N'lozinka3                                ', N'070224456', N'Partizanski Odredi b.b.       ', CAST(0x000085D000DEADDC AS DateTime), 2)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (5, N'Dejan               ', N'Stojkovski                    ', N'stojkovski_d@gmail.com        ', N'lozinka4                                ', N'077226335', N'Blagoj Gjorev 23              ', CAST(0x00008BFA00DEADDC AS DateTime), 1)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (6, N'Milan               ', N'Popov                         ', N'popov_mile@yahoo.com          ', N'lozinka5                                ', N'072256489', N'Vladimir Nazor 55             ', CAST(0x00008FFB00DEADDC AS DateTime), 1)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (7, N'Ana                 ', N'Trajkovska                    ', N'trajkovska_ana@gmail.com      ', N'lozinka6                                ', N'071266412', N'Partizanka 33/56              ', CAST(0x0000821900DEADDC AS DateTime), 2)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (8, N'Jovana              ', N'Jancevska                     ', N'jovana_j@yahoo.com            ', N'lozinka7                                ', N'075256336', N'Blagoj Gjorev 45              ', CAST(0x000075D200DEADDC AS DateTime), 1)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (9, N'Nikola              ', N'Markovski                     ', N'nikola_m@gmail.com            ', N'lozinka8                                ', N'072357667', N'Pero Nakov b.b.               ', CAST(0x00007B4800DEADDC AS DateTime), 2)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (10, N'Dragan              ', N'Nikolov                       ', N'nikolov_d@gmail.com           ', N'lozinka9                                ', N'078256321', N'Leninova 2/15                 ', CAST(0x00006C2A00DEADDC AS DateTime), 1)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (12, N'Test2               ', N'Testing2                      ', N'test2@yahoo.com               ', N'123456789                               ', N'077159655', N'HHHH                          ', CAST(0x0000886700FB4FF0 AS DateTime), 3)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (13, N'Proba               ', N'ProbaPrezime                  ', N'proba@gmail.com               ', N'lozinka2                                ', N'077899655', N'Ulica 22                      ', CAST(0x000093D7015A11C0 AS DateTime), 4)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (14, N'Testing             ', N'surname                       ', N'mail@yahoo.com                ', N'369258                                  ', N'070236159', N'YY                            ', CAST(0x00008C4F00FB4FF0 AS DateTime), 5)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (15, N'Kole                ', N'Petkovski                     ', N'kole_petkovski@yahoo.com      ', N'pasword111                              ', N'070556689', N'TT                            ', CAST(0x00007B9600FB4FF0 AS DateTime), 5)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (16, N'RR                  ', N'UU                            ', N'uu@gmail.com                  ', N'123159                                  ', N'0123     ', N'ff                            ', CAST(0x0000886700FB4FF0 AS DateTime), 5)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (17, N'Test                ', N'adasd                         ', N'sds@yahoo.c                   ', N'asdasdasd                               ', N'asdasd   ', N'asdasd                        ', CAST(0x00008FC700FB4FF0 AS DateTime), 14)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (19, N'Kolco               ', N'Kolcevski                     ', N'kolco@yahoo.com               ', N'12345678                                ', N'074236333', N'Ulica                         ', CAST(0x00008FC700FB4FF0 AS DateTime), 4)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (20, N'Test3               ', N'testing 3                     ', N'test3@gmail.com               ', N'123456789123                            ', N'070258369', N'Ленинова 12                   ', CAST(0x0000883A00FB4FF0 AS DateTime), 7)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (21, N'Test29-08           ', N'sdasd                         ', N'testing29_08@yahoo.com        ', N'123456789                               ', N'077256366', N'Vada                          ', CAST(0x00008FC700FB4FF0 AS DateTime), 12)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (1021, N'TTT                 ', N'ERE                           ', N'ERE@yahoo.com                 ', N'123456789                               ', N'075236569', N'ERWE                          ', CAST(0x00008FC700FB4FF0 AS DateTime), 13)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (1022, N'Test30-08           ', N'Testing                       ', N'test30_08@yahoo.com           ', N'123456789                               ', N'070265333', N'Leninova                      ', CAST(0x00008FC700FB4FF0 AS DateTime), 14)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (1023, N'Aleksandar          ', N'Lazarevski                    ', N'lazo@gmail.com                ', N'123456789                               ', N'loiuytrew', N'ulica                         ', CAST(0x00008FC700FB4FF0 AS DateTime), 3)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (2023, N'Kiko                ', N'Kolev                         ', N'kiko@yahoo.com                ', N'123456789                               ', N'077159357', N'QQQ                           ', CAST(0x00008FC700FB4FF0 AS DateTime), 5)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (2024, N'Stojce              ', N'Stojkov                       ', N'stojce_s@gmail.com            ', N'258369                                  ', N'070266656', N'UU                            ', CAST(0x00008FC700FB4FF0 AS DateTime), 3)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (2025, N'Mirce               ', N'Mirkov                        ', N'mirce@yahoo.com               ', N'123789                                  ', N'072369365', N'sdas                          ', CAST(0x00008FC700FB4FF0 AS DateTime), 14)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (2026, N'Andrij              ', N'Andreev                       ', N'andrejce@yahoo.com            ', N'123456789                               ', N'072365159', N'WW                            ', CAST(0x00008FC700FB4FF0 AS DateTime), 1)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (2027, N'Kire                ', N'Kirov                         ', N'kirov_k@yhaoo.com             ', N'147789                                  ', N'075236458', N'sad                           ', CAST(0x00008FC700FB4FF0 AS DateTime), 6)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (2028, N'Nikola              ', N'Kole                          ', N'nikola_kole@yahoo.com         ', N'123456789                               ', N'072345123', N'sad                           ', CAST(0x00008FC700FB4FF0 AS DateTime), 13)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (2029, N'GGG                 ', N'GGGG                          ', N'ggtv@yahoo.com                ', N'123456789                               ', N'071159236', N'GG                            ', CAST(0x00008FC700FB4FF0 AS DateTime), 2)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (2030, N'TTT                 ', N'TTTT                          ', N'qw@yahoo.com                  ', N'123456789                               ', N'071596324', N'asdsa                         ', CAST(0x00008FC700FB4FF0 AS DateTime), 10)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (2031, N'RTR                 ', N'ads                           ', N'rtr@yahoo.com                 ', N'123456                                  ', N'070258369', N'asdad                         ', CAST(0x00008FC700FB4FF0 AS DateTime), 1)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (2032, N'H                   ', N'H                             ', N'detective_h@yahoo.com         ', N'123456                                  ', N'075236985', N'sadd                          ', CAST(0x00008FC700FB4FF0 AS DateTime), 4)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (2033, N'Test03-09           ', N'Testing                       ', N'test03_09@gmail.com           ', N'123456789                               ', N'075236259', N'qweqw                         ', CAST(0x0000A2C900000000 AS DateTime), 11)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (2034, N'NEW                 ', N'BRAND New                     ', N'brand_new@yahoo.com           ', N'123456kol                               ', N'075236954', N'asd                           ', CAST(0x0000A51500000000 AS DateTime), 12)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (2035, N'Kirca               ', N'Bananamen                     ', N'kirca_banana@yahoo.com        ', N'123456789                               ', N'072256321', N'ulica                         ', CAST(0x0000A2B400000000 AS DateTime), 14)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (2036, N'Tetssad             ', N'TestingNew                    ', N'testingVerYNew@yahoo.com      ', N'123456789                               ', N'075125632', N'sdaasd                        ', CAST(0x0000A50E00000000 AS DateTime), 3)
INSERT [dbo].[Lice] ([id_lice], [ime], [prezime], [e_mail], [lozinka], [tel_broj], [ulica], [datum_r], [id_grad]) VALUES (3035, N'Bojan               ', N'Andreev                       ', N'bole_andreev@yahoo.com        ', N'258123789                               ', N'072369256', N'Leninova                      ', CAST(0x0000881B00000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Lice] OFF
SET IDENTITY_INSERT [dbo].[Mozni_Odgovori] ON 

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
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (35, N'Green')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (36, N'Yello')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (37, N'Red, Magenta')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (38, N'Blue, Cyan')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (39, N'Black')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (40, N'Pink')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (81, N'FINKI')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (82, N'Elektro')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (83, N'Masinski')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (84, N'Tehnoloski')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (85, N'FINKI')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (86, N'Elektro')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (87, N'Masinski')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (88, N'Tehnoloski')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (170, N'Car')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (171, N'Train')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (172, N'Bus')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (173, N'Bike')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (174, N'Motorcycle')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (175, N'Ferarri')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (176, N'RedBull')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (177, N'Mercedes')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (178, N'Lotus')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (179, N'Wiliams')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (180, N'Felipe Masa')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (181, N'Sebastian Vettle')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (182, N'Lous Hamilton')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (183, N'Kimi Raikonen')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (184, N'Niko Rossberg')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (185, N'Fernando Alonso')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (186, N'Pizza')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (187, N'Spaggeti')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (188, N'Hamburger')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (189, N'French Fries')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (190, N'Tennis')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (191, N'Football')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (192, N'Handball')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (193, N'Basketball')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (194, N'Golf')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (195, N'Voleyball')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (196, N'Sometimes')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (197, N'Often')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (198, N'Very often')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (199, N'Regulary')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (200, N'Never')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (201, N'Yes')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (202, N'No')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (203, N'PS-3')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (204, N'PS-4')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (205, N'Xbox')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (206, N'Xbox One')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (207, N'Gaming PC')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1175, N'Ferarri')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1176, N'Red Bull')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1177, N'Car')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1178, N'Bus')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1179, N'Train')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1180, N'Bike')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1181, N'Motorcycle')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1182, N'Blues')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1183, N'Heavy Metal')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1184, N'Metal')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1185, N'Hip Hop')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1186, N'Rock')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1187, N'Pop')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1188, N'Birdman')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1189, N'Boyhood')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1190, N'The Grand Budapest Hotel')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1191, N'The Imitation Game')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1192, N'The Theory of Everything')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1193, N'Whiplash')
INSERT [dbo].[Mozni_Odgovori] ([id_odg], [ime_odg]) VALUES (1194, N'Interstellar')
SET IDENTITY_INSERT [dbo].[Mozni_Odgovori] OFF
SET IDENTITY_INSERT [dbo].[Ogranicuvanja] ON 

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
SET IDENTITY_INSERT [dbo].[Ogranicuvanja] OFF
INSERT [dbo].[Premium_Korisnik] ([id_lice], [datum_starts], [datum_end]) VALUES (1, CAST(0x6A3A0B00 AS Date), CAST(0xD83B0B00 AS Date))
INSERT [dbo].[Premium_Korisnik] ([id_lice], [datum_starts], [datum_end]) VALUES (2, NULL, NULL)
INSERT [dbo].[Premium_Korisnik] ([id_lice], [datum_starts], [datum_end]) VALUES (4, NULL, NULL)
INSERT [dbo].[Premium_Korisnik] ([id_lice], [datum_starts], [datum_end]) VALUES (6, NULL, NULL)
INSERT [dbo].[Premium_Korisnik] ([id_lice], [datum_starts], [datum_end]) VALUES (9, NULL, NULL)
INSERT [dbo].[Premium_Korisnik] ([id_lice], [datum_starts], [datum_end]) VALUES (2029, CAST(0x6A3A0B00 AS Date), CAST(0xD83B0B00 AS Date))
INSERT [dbo].[Premium_Korisnik] ([id_lice], [datum_starts], [datum_end]) VALUES (2036, CAST(0x6A3A0B00 AS Date), CAST(0xD83B0B00 AS Date))
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (1, 1)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (1, 2)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (1, 49)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (1, 50)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (1, 52)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (1, 53)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (1, 54)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (2, 1)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (2, 8)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (2, 52)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (2, 54)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (3, 2)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (3, 8)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (3, 52)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (3, 53)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (4, 4)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (4, 5)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (5, 3)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (5, 4)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (5, 5)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (6, 4)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (7, 5)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (16, 1049)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (17, 1050)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (19, 1049)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (20, 1049)
INSERT [dbo].[Pripagja] ([id_k], [id_anketa]) VALUES (20, 1050)
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
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (35, 8)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (36, 8)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (37, 8)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (38, 8)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (39, 8)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (40, 8)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (81, 17)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (82, 17)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (83, 17)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (84, 17)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (177, 49)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (178, 49)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (179, 49)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (180, 50)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (181, 50)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (182, 50)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (183, 50)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (184, 50)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (185, 50)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (186, 51)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (187, 51)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (188, 51)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (189, 51)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (190, 52)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (191, 52)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (192, 52)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (193, 52)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (194, 52)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (195, 52)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (196, 53)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (197, 53)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (198, 53)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (199, 53)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (200, 53)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (201, 54)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (202, 54)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (203, 55)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (204, 55)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (205, 55)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (206, 55)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (207, 55)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1175, 49)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1176, 49)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1177, 48)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1178, 48)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1179, 48)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1180, 48)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1181, 48)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1182, 1049)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1183, 1049)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1184, 1049)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1185, 1049)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1186, 1049)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1187, 1049)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1188, 1050)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1189, 1050)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1190, 1050)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1191, 1050)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1192, 1050)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1193, 1050)
INSERT [dbo].[Sodrzi] ([id_odg], [id_anketa]) VALUES (1194, 1050)
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
ALTER TABLE [dbo].[Lice]  WITH CHECK ADD  CONSTRAINT [FK_Lice_Grad] FOREIGN KEY([id_grad])
REFERENCES [dbo].[Grad] ([id_grad])
GO
ALTER TABLE [dbo].[Lice] CHECK CONSTRAINT [FK_Lice_Grad]
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
