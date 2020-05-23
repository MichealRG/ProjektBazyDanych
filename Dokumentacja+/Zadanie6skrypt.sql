USE [ListaPrzebojów]
GO
/****** Object:  Table [dbo].[Albumy]    Script Date: 21.05.2020 20:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Albumy](
	[IdAlbum] [int] NOT NULL,
	[NazwaAlbumu] [nvarchar](50) NOT NULL,
	[DataWydania] [datetime] NULL,
	[RozpoczęcieNagrań] [datetime] NULL,
	[Wydawnictwo] [nvarchar](100) NULL,
 CONSTRAINT [PK_Albumy] PRIMARY KEY CLUSTERED 
(
	[IdAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gatunki]    Script Date: 21.05.2020 20:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gatunki](
	[IdGatunku] [int] NOT NULL,
	[NazwaGatunku] [nvarchar](20) NOT NULL,
	[DataPowstania] [datetime] NULL,
	[MiejscePowstania] [nvarchar](50) NULL,
 CONSTRAINT [PK_Gatunki] PRIMARY KEY CLUSTERED 
(
	[IdGatunku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nagrody]    Script Date: 21.05.2020 20:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nagrody](
	[IdNagrody] [int] NOT NULL,
	[NazwaNagrody] [nvarchar](50) NULL,
	[Kategoria] [varchar](50) NULL,
	[PierwszeWręczenie] [datetime] NULL,
 CONSTRAINT [PK_Nagrody] PRIMARY KEY CLUSTERED 
(
	[IdNagrody] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NalezyDoGatunku]    Script Date: 21.05.2020 20:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NalezyDoGatunku](
	[IdUtworu] [int] NOT NULL,
	[IdGatunku] [int] NOT NULL,
 CONSTRAINT [PK_NalezyDoGatunku] PRIMARY KEY CLUSTERED 
(
	[IdUtworu] ASC,
	[IdGatunku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oceny]    Script Date: 21.05.2020 20:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oceny](
	[IdOceny] [int] NOT NULL,
	[OcenaAdministratora] [char](2) NOT NULL,
	[OcenaAdministratorki] [char](2) NULL,
	[Komentarz] [varchar](100) NULL,
 CONSTRAINT [PK_Oceny] PRIMARY KEY CLUSTERED 
(
	[IdOceny] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtrzymanieNagrody]    Script Date: 21.05.2020 20:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtrzymanieNagrody](
	[IdUtworu] [int] NOT NULL,
	[IdNagrody] [int] NOT NULL,
	[DataOtrzymania] [datetime] NULL,
 CONSTRAINT [PK_OtrzymanieNagrody] PRIMARY KEY CLUSTERED 
(
	[IdUtworu] ASC,
	[IdNagrody] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utwory]    Script Date: 21.05.2020 20:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utwory](
	[IdUtworu] [int] NOT NULL,
	[NazwaUtworu] [nvarchar](50) NOT NULL,
	[DataWykonanania] [datetime] NULL,
	[OpisUtworu] [nvarchar](100) NULL,
	[Długość] [char](5) NULL,
	[WykonawcaId] [int] NOT NULL,
	[AlbumId] [int] NOT NULL,
	[OcenaId] [int] NOT NULL,
 CONSTRAINT [PK_Utwory] PRIMARY KEY CLUSTERED 
(
	[IdUtworu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wykonawcy]    Script Date: 21.05.2020 20:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wykonawcy](
	[IdWykonawcy] [int] NOT NULL,
	[Wykonawca] [nvarchar](50) NOT NULL,
	[DataUrodzeniaPowstania] [date] NULL,
	[RolaWykonawcy] [varchar](50) NULL,
 CONSTRAINT [PK_Wykonawcy] PRIMARY KEY CLUSTERED 
(
	[IdWykonawcy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NalezyDoGatunku]  WITH CHECK ADD  CONSTRAINT [FK_NalezyDoGatunku_Gatunki] FOREIGN KEY([IdGatunku])
REFERENCES [dbo].[Gatunki] ([IdGatunku])
GO
ALTER TABLE [dbo].[NalezyDoGatunku] CHECK CONSTRAINT [FK_NalezyDoGatunku_Gatunki]
GO
ALTER TABLE [dbo].[NalezyDoGatunku]  WITH CHECK ADD  CONSTRAINT [FK_NalezyDoGatunku_Utwory] FOREIGN KEY([IdUtworu])
REFERENCES [dbo].[Utwory] ([IdUtworu])
GO
ALTER TABLE [dbo].[NalezyDoGatunku] CHECK CONSTRAINT [FK_NalezyDoGatunku_Utwory]
GO
ALTER TABLE [dbo].[OtrzymanieNagrody]  WITH CHECK ADD  CONSTRAINT [FK_OtrzymanieNagrody_Nagrody] FOREIGN KEY([IdNagrody])
REFERENCES [dbo].[Nagrody] ([IdNagrody])
GO
ALTER TABLE [dbo].[OtrzymanieNagrody] CHECK CONSTRAINT [FK_OtrzymanieNagrody_Nagrody]
GO
ALTER TABLE [dbo].[OtrzymanieNagrody]  WITH CHECK ADD  CONSTRAINT [FK_OtrzymanieNagrody_Utwory] FOREIGN KEY([IdUtworu])
REFERENCES [dbo].[Utwory] ([IdUtworu])
GO
ALTER TABLE [dbo].[OtrzymanieNagrody] CHECK CONSTRAINT [FK_OtrzymanieNagrody_Utwory]
GO
ALTER TABLE [dbo].[Utwory]  WITH CHECK ADD  CONSTRAINT [FK_Utwory_Albumy] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Albumy] ([IdAlbum])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Utwory] CHECK CONSTRAINT [FK_Utwory_Albumy]
GO
ALTER TABLE [dbo].[Utwory]  WITH CHECK ADD  CONSTRAINT [FK_Utwory_Oceny] FOREIGN KEY([OcenaId])
REFERENCES [dbo].[Oceny] ([IdOceny])
GO
ALTER TABLE [dbo].[Utwory] CHECK CONSTRAINT [FK_Utwory_Oceny]
GO
ALTER TABLE [dbo].[Utwory]  WITH CHECK ADD  CONSTRAINT [FK_Utwory_Wykonawcy] FOREIGN KEY([WykonawcaId])
REFERENCES [dbo].[Wykonawcy] ([IdWykonawcy])
GO
ALTER TABLE [dbo].[Utwory] CHECK CONSTRAINT [FK_Utwory_Wykonawcy]
GO
