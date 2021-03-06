USE [master]
GO
/****** Object:  Database [Hastane]    Script Date: 31.5.2022 18:31:44 ******/
CREATE DATABASE [Hastane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hastane', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Hastane.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hastane_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Hastane_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Hastane] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hastane].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hastane] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hastane] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hastane] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hastane] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hastane] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hastane] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hastane] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hastane] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hastane] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hastane] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hastane] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hastane] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hastane] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hastane] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hastane] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hastane] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hastane] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hastane] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hastane] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hastane] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hastane] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hastane] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hastane] SET RECOVERY FULL 
GO
ALTER DATABASE [Hastane] SET  MULTI_USER 
GO
ALTER DATABASE [Hastane] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hastane] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hastane] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hastane] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hastane] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hastane] SET QUERY_STORE = OFF
GO
USE [Hastane]
GO
/****** Object:  User [HP_\RÜKNA]    Script Date: 31.5.2022 18:31:45 ******/
CREATE USER [HP_\RÜKNA] FOR LOGIN [HP_\RÜKNA] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_datareader] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [HP_\RÜKNA]
GO
/****** Object:  Table [dbo].[Doktorlar]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktorlar](
	[doktorno] [int] IDENTITY(1,1) NOT NULL,
	[doktoradsoyad] [varchar](50) NULL,
	[tc] [char](11) NULL,
	[uzmanlikalani] [varchar](50) NULL,
	[unvani] [varchar](50) NULL,
	[telefon] [char](15) NULL,
	[adres] [varchar](50) NULL,
	[dogumtarihi] [nvarchar](50) NULL,
	[polno] [int] NULL,
 CONSTRAINT [PK_Doktorlar] PRIMARY KEY CLUSTERED 
(
	[doktorno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hastalar]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastalar](
	[hastano] [int] IDENTITY(1,1) NOT NULL,
	[hastaadsoyad] [varchar](50) NULL,
	[tcno] [char](11) NULL,
	[dogumtarihi] [nvarchar](50) NULL,
	[boy] [int] NULL,
	[yas] [int] NULL,
	[recete] [varchar](50) NULL,
	[rapordurumu] [varchar](50) NULL,
	[doktorno] [int] NULL,
	[randevuid] [int] NULL,
 CONSTRAINT [PK_Hastalar] PRIMARY KEY CLUSTERED 
(
	[hastano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanıcılar]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanıcılar](
	[kullanicino] [int] IDENTITY(1,1) NOT NULL,
	[kullaniciadi] [varchar](50) NOT NULL,
	[sifre] [varchar](50) NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[telefon] [char](20) NOT NULL,
 CONSTRAINT [PK_Kullanıcılar] PRIMARY KEY CLUSTERED 
(
	[kullanicino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poliklinikler]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poliklinikler](
	[polno] [int] IDENTITY(1,1) NOT NULL,
	[poladi] [varchar](50) NULL,
	[poluzmansayisi] [int] NULL,
	[polbaskan] [varchar](50) NULL,
	[polbashemsire] [varchar](50) NULL,
	[yataksayisi] [int] NULL,
 CONSTRAINT [PK_Poliklinikler] PRIMARY KEY CLUSTERED 
(
	[polno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Randevular]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Randevular](
	[randevuno] [int] IDENTITY(1,1) NOT NULL,
	[hastano] [int] NULL,
	[polno] [int] NULL,
	[doktorno] [int] NULL,
	[randevutarih] [nvarchar](50) NULL,
 CONSTRAINT [PK_randevular] PRIMARY KEY CLUSTERED 
(
	[randevuno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Doktorlar] ON 

INSERT [dbo].[Doktorlar] ([doktorno], [doktoradsoyad], [tc], [uzmanlikalani], [unvani], [telefon], [adres], [dogumtarihi], [polno]) VALUES (1, N'Rükna Kavraş', N'45896589595', N'dahiliye', N'doçent', N'05696595689    ', N'Üsküdar', N'1997-01-23', 1)
INSERT [dbo].[Doktorlar] ([doktorno], [doktoradsoyad], [tc], [uzmanlikalani], [unvani], [telefon], [adres], [dogumtarihi], [polno]) VALUES (2, N'kübra görgülü', N'74845986598', N'göz ', N'doçent              ', N'(0534) 695-945 ', N'Çekmeköy', N'1998-01-25', 1)
INSERT [dbo].[Doktorlar] ([doktorno], [doktoradsoyad], [tc], [uzmanlikalani], [unvani], [telefon], [adres], [dogumtarihi], [polno]) VALUES (3, N'Şevval Çelik', N'21565986595', N'ortopedi', N'uzman', N'05369895689    ', N'Maltepe', N'1995-01-02', 2)
INSERT [dbo].[Doktorlar] ([doktorno], [doktoradsoyad], [tc], [uzmanlikalani], [unvani], [telefon], [adres], [dogumtarihi], [polno]) VALUES (5, N'Ayşenur Uğuz', N'15265989659', N'dahiliye', N'prof dr             ', N'(536) 959-6125 ', N'Bağcılar', N'1994-02-02', 3)
SET IDENTITY_INSERT [dbo].[Doktorlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Hastalar] ON 

INSERT [dbo].[Hastalar] ([hastano], [hastaadsoyad], [tcno], [dogumtarihi], [boy], [yas], [recete], [rapordurumu], [doktorno], [randevuid]) VALUES (1, N'Ayşe Dönmez', N'12569896596', N'1990-12-06', 160, 35, N'var', N'raporlu', 1, 2)
INSERT [dbo].[Hastalar] ([hastano], [hastaadsoyad], [tcno], [dogumtarihi], [boy], [yas], [recete], [rapordurumu], [doktorno], [randevuid]) VALUES (2, N'Sıla Şahin', N'25698965987', N'1985-02-12', 170, 25, N'var', N'raporlu', 1, 2)
INSERT [dbo].[Hastalar] ([hastano], [hastaadsoyad], [tcno], [dogumtarihi], [boy], [yas], [recete], [rapordurumu], [doktorno], [randevuid]) VALUES (3, N'Ali Gül', N'1256986958 ', N'1970-11-25', 175, 20, N'yok', N'raporsuz', 2, 3)
INSERT [dbo].[Hastalar] ([hastano], [hastaadsoyad], [tcno], [dogumtarihi], [boy], [yas], [recete], [rapordurumu], [doktorno], [randevuid]) VALUES (13, N'Rükna Kavraş', N'15456965985', N'1990-02-01', 170, 32, N'var', N'raporlu', 2, 2)
INSERT [dbo].[Hastalar] ([hastano], [hastaadsoyad], [tcno], [dogumtarihi], [boy], [yas], [recete], [rapordurumu], [doktorno], [randevuid]) VALUES (15, N'Şeyma Gül', N'45666666666', N'23-01-1985', 155, 37, N'yok', N'raporlu', 2, 1)
SET IDENTITY_INSERT [dbo].[Hastalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanıcılar] ON 

INSERT [dbo].[Kullanıcılar] ([kullanicino], [kullaniciadi], [sifre], [mail], [telefon]) VALUES (1, N'rükna', N'1234', N'rukna@gmail.com', N'05395689569         ')
INSERT [dbo].[Kullanıcılar] ([kullanicino], [kullaniciadi], [sifre], [mail], [telefon]) VALUES (2, N'kübra', N'1234', N'kubra@gmail.com', N'05369856984         ')
INSERT [dbo].[Kullanıcılar] ([kullanicino], [kullaniciadi], [sifre], [mail], [telefon]) VALUES (35, N'şeyma', N'55', N'seyma@gmail.com', N'5696598569          ')
INSERT [dbo].[Kullanıcılar] ([kullanicino], [kullaniciadi], [sifre], [mail], [telefon]) VALUES (2024, N'Rükna', N'1234', N'kavrasrukna@gmail.com', N'(536) 965-9896      ')
SET IDENTITY_INSERT [dbo].[Kullanıcılar] OFF
GO
SET IDENTITY_INSERT [dbo].[Poliklinikler] ON 

INSERT [dbo].[Poliklinikler] ([polno], [poladi], [poluzmansayisi], [polbaskan], [polbashemsire], [yataksayisi]) VALUES (1, N'dahiliye', 5, N'Rükna Kavraş', N'Kübra Öz', 5)
INSERT [dbo].[Poliklinikler] ([polno], [poladi], [poluzmansayisi], [polbaskan], [polbashemsire], [yataksayisi]) VALUES (2, N'göz', 6, N'Kübra Şahin', N'Şevval Gül', 10)
INSERT [dbo].[Poliklinikler] ([polno], [poladi], [poluzmansayisi], [polbaskan], [polbashemsire], [yataksayisi]) VALUES (3, N'ortopedi', 7, N'Şevval Öz', N'Ayşe Çelik', 12)
INSERT [dbo].[Poliklinikler] ([polno], [poladi], [poluzmansayisi], [polbaskan], [polbashemsire], [yataksayisi]) VALUES (4, N'diş', 10, N'Ayşenur Uğuz', N'Pelin Şahin', 20)
INSERT [dbo].[Poliklinikler] ([polno], [poladi], [poluzmansayisi], [polbaskan], [polbashemsire], [yataksayisi]) VALUES (7, N'kadın hastalıkları', 6, N'Ali Gün', N'Selma üGüneş', 6)
SET IDENTITY_INSERT [dbo].[Poliklinikler] OFF
GO
SET IDENTITY_INSERT [dbo].[Randevular] ON 

INSERT [dbo].[Randevular] ([randevuno], [hastano], [polno], [doktorno], [randevutarih]) VALUES (1, 1, 2, 2, N'23-01-2022')
INSERT [dbo].[Randevular] ([randevuno], [hastano], [polno], [doktorno], [randevutarih]) VALUES (2, 1, 2, 3, N'2022-01-17')
INSERT [dbo].[Randevular] ([randevuno], [hastano], [polno], [doktorno], [randevutarih]) VALUES (3, 2, 3, 1, N'2019-01-02')
INSERT [dbo].[Randevular] ([randevuno], [hastano], [polno], [doktorno], [randevutarih]) VALUES (4, 1, 2, 3, N'15-01-2021')
SET IDENTITY_INSERT [dbo].[Randevular] OFF
GO
ALTER TABLE [dbo].[Doktorlar]  WITH CHECK ADD  CONSTRAINT [FK_Doktorlar_Poliklinikler] FOREIGN KEY([polno])
REFERENCES [dbo].[Poliklinikler] ([polno])
GO
ALTER TABLE [dbo].[Doktorlar] CHECK CONSTRAINT [FK_Doktorlar_Poliklinikler]
GO
ALTER TABLE [dbo].[Hastalar]  WITH CHECK ADD  CONSTRAINT [FK_Hastalar_Randevular] FOREIGN KEY([randevuid])
REFERENCES [dbo].[Randevular] ([randevuno])
GO
ALTER TABLE [dbo].[Hastalar] CHECK CONSTRAINT [FK_Hastalar_Randevular]
GO
ALTER TABLE [dbo].[Randevular]  WITH CHECK ADD  CONSTRAINT [FK_Randevular_Doktorlar] FOREIGN KEY([doktorno])
REFERENCES [dbo].[Doktorlar] ([doktorno])
GO
ALTER TABLE [dbo].[Randevular] CHECK CONSTRAINT [FK_Randevular_Doktorlar]
GO
ALTER TABLE [dbo].[Randevular]  WITH CHECK ADD  CONSTRAINT [FK_Randevular_Hastalar] FOREIGN KEY([hastano])
REFERENCES [dbo].[Hastalar] ([hastano])
GO
ALTER TABLE [dbo].[Randevular] CHECK CONSTRAINT [FK_Randevular_Hastalar]
GO
/****** Object:  StoredProcedure [dbo].[doktorarama]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[doktorarama] (
@doktoradsoyad varchar(50),
@uzmanlikalani varchar(50)
)
as 
begin
select * from Doktorlar where doktoradsoyad=@doktoradsoyad or uzmanlikalani=@uzmanlikalani
end
GO
/****** Object:  StoredProcedure [dbo].[doktoraz]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[doktoraz]
as
begin
SELECT * FROM Doktorlar ORDER BY uzmanlikalani asc;
end
GO
/****** Object:  StoredProcedure [dbo].[doktordtuzmanlik]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[doktordtuzmanlik]
as
begin
SELECT dogumtarihi,uzmanlikalani as 'doğum tarihine göre desc sıralama' FROM Doktorlar  GROUP BY dogumtarihi,uzmanlikalani ORDER BY dogumtarihi desc
end
GO
/****** Object:  StoredProcedure [dbo].[doktorekle]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[doktorekle](--personelno identity old. için eklemedim

@doktoradsoyad varchar(50),
@tc varchar(50),
@uzmanlikalani varchar(50),
@unvani char(20),
@telefon char(11),
@adres varchar(50),
@dogumtarihi nvarchar(50),
@polno int
)
as begin 
insert into Doktorlar(doktoradsoyad,tc,uzmanlikalani,unvani,telefon,adres,dogumtarihi,polno) values (@doktoradsoyad,@tc,@uzmanlikalani,@unvani,@telefon,@adres,@dogumtarihi,@polno)
end
GO
/****** Object:  StoredProcedure [dbo].[doktorlistele]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[doktorlistele]
as begin
select * from Doktorlar --parametresiz prosedür
end
GO
/****** Object:  StoredProcedure [dbo].[doktorsilme]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[doktorsilme]
@doktorno int
as begin
delete from Doktorlar where doktorno=@doktorno
end
GO
/****** Object:  StoredProcedure [dbo].[doktorunvan]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[doktorunvan]
as
begin
SELECT unvani as 'doğum tarihi 2000 den büyük olanlar' FROM Doktorlar where dogumtarihi>'12.12.2000' GROUP BY unvani
end
GO
/****** Object:  StoredProcedure [dbo].[doktoryenile]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[doktoryenile] 
 --pnoya göre güncelleme yapmak istediğim için aldım
@doktorno  int,
@doktoradsoyad  varchar(50),
@tc varchar(50),
@uzmanlikalani varchar(50),
@unvani char(20),
@telefon char(11),
@adres varchar(50),
@dogumtarihi nvarchar(50),
@polno int

 as begin
 update Doktorlar set doktoradsoyad=@doktoradsoyad,tc=@tc,uzmanlikalani=@uzmanlikalani, unvani=@unvani,telefon=@telefon,adres=@adres,dogumtarihi=@dogumtarihi,polno=@polno where doktorno=@doktorno --burada yazdığım where lü oulu set alanında yazmıyorum
 end
GO
/****** Object:  StoredProcedure [dbo].[doktorza]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[doktorza]
as
begin
SELECT * FROM Doktorlar ORDER BY uzmanlikalani desc;
end
GO
/****** Object:  StoredProcedure [dbo].[Giris]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Giris](
@kullaniciadi varchar(50),
@sifre varchar(50)
)
as 
begin
select * from Kullanıcılar where kullaniciadi=@kullaniciadi and sifre=@sifre
end
GO
/****** Object:  StoredProcedure [dbo].[hastaarama]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[hastaarama] (
@hastano int,
@hastaadsoyad varchar(50)
)
as 
begin
select * from Hastalar where hastano like @hastano or hastaadsoyad like @hastaadsoyad
end
GO
/****** Object:  StoredProcedure [dbo].[hastaaz]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hastaaz]
as
begin
SELECT * FROM Hastalar ORDER BY hastano asc;
end
GO
/****** Object:  StoredProcedure [dbo].[hastadoktor]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[hastadoktor]

as begin 
select  hastaadsoyad,doktoradsoyad,uzmanlikalani from Hastalar inner join Doktorlar on Hastalar.doktorno=doktorlar.doktorno
end
GO
/****** Object:  StoredProcedure [dbo].[hastadoktorrandevu]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hastadoktorrandevu]
as begin 
select  randevutarih,hastaadsoyad,doktoradsoyad,poladi from Hastalar inner join Randevular on Hastalar.hastano=Randevular.hastano
join Doktorlar on Doktorlar.doktorno=Randevular.doktorno join Poliklinikler on Randevular.polno=Poliklinikler.polno
end
GO
/****** Object:  StoredProcedure [dbo].[hastadtboy]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hastadtboy]
as
begin
SELECT dogumtarihi,avg(boy) as 'yaş ortalaması 30 dan büyük olanların boy ortalaması' FROM Hastalar GROUP BY dogumtarihi HAVING AVG(yas)>30
end
GO
/****** Object:  StoredProcedure [dbo].[hastaekle]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[hastaekle](--personelno identity old. için eklemedim

@hastaadsoyad varchar(50),
@tcno char(11),
@dogumtarihi nvarchar(50),
@boy int,
@yas int,
@recete varchar(50),
@rapordurumu varchar(50),
@doktorno int,
@randevuid int
)
as begin 
insert into Hastalar(hastaadsoyad,tcno,dogumtarihi,boy,yas,recete,rapordurumu,doktorno,randevuid) values (@hastaadsoyad,@tcno,@dogumtarihi,@boy,@yas,@recete,@rapordurumu,@doktorno,@randevuid)
end
GO
/****** Object:  StoredProcedure [dbo].[hastalistele]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hastalistele]
as begin
select * from Hastalar --parametresiz prosedür
end
exec hastalistele
GO
/****** Object:  StoredProcedure [dbo].[hastarandevu]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hastarandevu]
as begin 
select  hastaadsoyad,randevutarih from Hastalar inner join Randevular on Hastalar.hastano=Randevular.hastano
end
GO
/****** Object:  StoredProcedure [dbo].[hastasilme]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hastasilme]
@hastano int
as begin
delete from Hastalar where hastano=@hastano
end

exec hastasilme 5
select * from Hastalar
GO
/****** Object:  StoredProcedure [dbo].[hastasilme11]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hastasilme11]
@hastano int
as begin
delete from Hastalar where hastano=@hastano
end
GO
/****** Object:  StoredProcedure [dbo].[hastayas]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hastayas]
as
begin
SELECT recete,sum(yas) as 'boy ortalaması 160 dan uzun olanların yaş toplamı' FROM Hastalar GROUP BY recete HAVING AVG(boy)>160
end
GO
/****** Object:  StoredProcedure [dbo].[hastayenile]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[hastayenile] 
 --TCNOY göre güncelleme yapmak istediğim için aldım
@hastano int,
@hastaadsoyad varchar(50),
@tcno char(11),
@dogumtarihi nvarchar(50),
@boy int,
@yas int,
@recete varchar(50),
@rapordurumu varchar(50),
@doktorno int,
@randevuid int

 as begin
 update Hastalar set hastaadsoyad=@hastaadsoyad,tcno=@tcno,dogumtarihi=@dogumtarihi,boy=@boy,yas=@yas,recete=@recete,rapordurumu=@rapordurumu,doktorno=@doktorno,randevuid=@randevuid where  hastano=@hastano
 end
GO
/****** Object:  StoredProcedure [dbo].[hastaza]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hastaza]
as
begin
SELECT * FROM Hastalar ORDER BY hastano desc;
end
GO
/****** Object:  StoredProcedure [dbo].[kullaniciekle]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[kullaniciekle](

@kullaniciadi varchar(50),
@sifre varchar(50),
@mail varchar(50),
@telefon char(20)
)
as begin 
insert into Kullanıcılar(kullaniciadi,sifre,mail,telefon) values (@kullaniciadi,@sifre,@mail,@telefon)
end
GO
/****** Object:  StoredProcedure [dbo].[polarama]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[polarama] (
@poladi varchar(50)
)
as 
begin
select * from Poliklinikler where poladi like @poladi
end
GO
/****** Object:  StoredProcedure [dbo].[polaz]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[polaz]
as
begin
SELECT * FROM Poliklinikler ORDER BY poladi asc;
end
GO
/****** Object:  StoredProcedure [dbo].[poldoktor]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[poldoktor]
as begin 
select  doktoradsoyad,poladi,polbaskan from Poliklinikler inner join Doktorlar on Poliklinikler.polno=Doktorlar.polno
end
GO
/****** Object:  StoredProcedure [dbo].[poliklinikekle]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[poliklinikekle](--personelno identity old. için eklemedim

@poladi varchar(50),
@poluzmansayisi int,
@polbaskan varchar(50),
@polbashemsire varchar(50),
@yataksayisi int
)
as begin 
insert into Poliklinikler(poladi,poluzmansayisi,polbaskan,polbashemsire,yataksayisi) values (@poladi,@poluzmansayisi,@polbaskan,@polbashemsire,@yataksayisi)
end
GO
/****** Object:  StoredProcedure [dbo].[polikliniklistele]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[polikliniklistele]
as begin
select * from Poliklinikler --parametresiz prosedür
end
exec polikliniklistele
GO
/****** Object:  StoredProcedure [dbo].[polikliniksilme]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[polikliniksilme]
@polno varchar(50)
as begin
delete from Poliklinikler where polno=@polno
end
GO
/****** Object:  StoredProcedure [dbo].[poliklinikyenile]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[poliklinikyenile] 
 --TCNOY göre güncelleme yapmak istediğim için aldım
@polno int,
@poladi varchar(50),
@poluzmansayisi int,
@polbaskan varchar(50),
@polbashemsire varchar(50),
@yataksayisi int

 as begin
 update Poliklinikler set poladi=@poladi, poluzmansayisi=@poluzmansayisi, polbaskan= @polbaskan,polbashemsire =@polbashemsire ,yataksayisi=@yataksayisi where polno=@polno
 end
GO
/****** Object:  StoredProcedure [dbo].[poluzman1]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[poluzman1]
as begin

SELECT poladi,sum(poluzmansayisi) as 'poliklinik adına göre toplam poliklinik uzman sayısı' FROM Poliklinikler GROUP BY poladi
end
GO
/****** Object:  StoredProcedure [dbo].[polyataksayisi]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[polyataksayisi]
as
begin
SELECT poladi,sum(yataksayisi) as 'poladına göre toplam yatak sayısı' FROM Poliklinikler GROUP BY poladi
end
GO
/****** Object:  StoredProcedure [dbo].[polza]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[polza]
as
begin
SELECT * FROM Poliklinikler ORDER BY poladi desc;
end
GO
/****** Object:  StoredProcedure [dbo].[randevuarama]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[randevuarama] (
@randevutarih nvarchar(50)
)
as 
begin
select * from Randevular where randevutarih like @randevutarih
end
GO
/****** Object:  StoredProcedure [dbo].[randevuaz]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[randevuaz]
as
begin
SELECT * FROM Randevular ORDER BY randevutarih asc;
end
GO
/****** Object:  StoredProcedure [dbo].[randevuazsıralamatarihegore]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[randevuazsıralamatarihegore]
as
begin
SELECT * FROM Randevular ORDER BY randevutarih asc;
end
GO
/****** Object:  StoredProcedure [dbo].[randevuekle]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[randevuekle](--personelno identity old. için eklemedim
@hastano int,
@polno int,
@doktorno int,
@randevutarih nvarchar(50)
)
as begin 
insert into Randevular(hastano,polno,doktorno,randevutarih) values (@hastano,@polno,@doktorno,@randevutarih)
end
GO
/****** Object:  StoredProcedure [dbo].[randevulistele]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[randevulistele]
as begin
select * from Randevular --parametresiz prosedür
end
GO
/****** Object:  StoredProcedure [dbo].[randevusilme]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[randevusilme]
@randevuno int
as begin
delete from Randevular where randevuno=@randevuno
end
GO
/****** Object:  StoredProcedure [dbo].[randevuyenile]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[randevuyenile] 
 --TCNOY göre güncelleme yapmak istediğim için aldım
@randevuno int,
@hastano int,
@polno int,
@doktorno int,
@randevutarih nvarchar(50)

 as begin
 update Randevular set  hastano=@hastano,polno=@polno, doktorno=@doktorno,randevutarih=@randevutarih where randevuno=@randevuno
 end
GO
/****** Object:  StoredProcedure [dbo].[randevuza]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[randevuza]
as
begin
SELECT * FROM Randevular ORDER BY randevutarih desc;
end
GO
/****** Object:  StoredProcedure [dbo].[randevuzasıralamatarihegore]    Script Date: 31.5.2022 18:31:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[randevuzasıralamatarihegore]
as
begin
SELECT * FROM Randevular ORDER BY randevutarih desc;
end
GO
USE [master]
GO
ALTER DATABASE [Hastane] SET  READ_WRITE 
GO
