USE [master]
GO
/****** Object:  Database [SoHoa]    Script Date: 12/17/2022 11:30:40 PM ******/
CREATE DATABASE [SoHoa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SoHoa', FILENAME = N'C:\Users\daonh\SoHoa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SoHoa_log', FILENAME = N'C:\Users\daonh\SoHoa_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SoHoa] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SoHoa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SoHoa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SoHoa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SoHoa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SoHoa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SoHoa] SET ARITHABORT OFF 
GO
ALTER DATABASE [SoHoa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SoHoa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SoHoa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SoHoa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SoHoa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SoHoa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SoHoa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SoHoa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SoHoa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SoHoa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SoHoa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SoHoa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SoHoa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SoHoa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SoHoa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SoHoa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SoHoa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SoHoa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SoHoa] SET  MULTI_USER 
GO
ALTER DATABASE [SoHoa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SoHoa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SoHoa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SoHoa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SoHoa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SoHoa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SoHoa] SET QUERY_STORE = OFF
GO
USE [SoHoa]
GO
/****** Object:  Table [dbo].[S_VanBan]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_VanBan](
	[VanBanID] [int] IDENTITY(1,1) NOT NULL,
	[HoSoID] [int] NOT NULL,
	[MaDinhDanh] [nvarchar](25) NULL,
	[STTVanBan] [int] NULL,
	[LoaiVanBanID] [int] NULL,
	[SoVanBan] [nvarchar](11) NULL,
	[KyHieuVanBan] [nvarchar](30) NULL,
	[NoiDung] [nvarchar](500) NULL,
	[NgonNguID] [int] NULL,
	[SoTo] [int] NULL,
	[GhiChu] [nvarchar](500) NULL,
	[KyHieuThongTin] [nvarchar](30) NULL,
	[TuKhoa] [nvarchar](100) NULL,
	[ButTich] [nvarchar](2000) NULL,
	[TinhTrangVatLyID] [int] NULL,
	[MucDoTinCayID] [int] NULL,
	[ComputerFileID] [int] NULL,
	[NgayVanBan] [date] NULL,
	[isDeleted] [bit] NULL,
	[NgayTao] [date] NULL,
	[NgayCapNhat] [date] NULL,
	[NguoiTao] [nvarchar](50) NULL,
	[NguoiChinhSua] [nvarchar](50) NULL,
	[StatusID] [int] NULL,
	[NgayThemFile] [date] NULL,
	[CheDoSuDung] [nvarchar](20) NULL,
	[Status] [tinyint] NULL,
	[Signature] [tinyint] NULL,
	[Confirmed] [tinyint] NULL,
	[CoQuanToChucBanHanh] [nvarchar](50) NULL,
 CONSTRAINT [PK_S_VanBan_1] PRIMARY KEY CLUSTERED 
(
	[VanBanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view1]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view1] AS
		SELECT HoSoID, COUNT(HoSoID) as 'NumberOfDocuments'
		FROM S_VanBan
		GROUP BY HoSoID
GO
/****** Object:  Table [dbo].[S_ComputerFile]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_ComputerFile](
	[ComputerFileID] [int] IDENTITY(1,1) NOT NULL,
	[NgayTao] [date] NULL,
	[NgayCapNhat] [date] NULL,
	[GhiChu] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[Url] [varchar](4000) NULL,
	[FileName] [nvarchar](300) NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[NguoiCapNhat] [nvarchar](100) NULL,
	[HoSoID] [int] NULL,
	[PageNumber] [int] NULL,
	[SheetNumber] [int] NULL,
	[Size] [nvarchar](20) NULL,
	[FolderPath] [nvarchar](1000) NULL,
	[ClientUrl] [nvarchar](1000) NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_S_File_1] PRIMARY KEY CLUSTERED 
(
	[ComputerFileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_HoSo]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_HoSo](
	[HoSoID] [int] IDENTITY(1,1) NOT NULL,
	[HopSoID] [int] NOT NULL,
	[MaHoSo] [nvarchar](50) NULL,
	[SoHoSo] [char](10) NULL,
	[TieuDeHoSo] [nvarchar](50) NULL,
	[TenHoSo] [nvarchar](50) NULL,
	[NgayTao] [date] NULL,
	[NgayCapNhat] [date] NULL,
	[LoaiHoSoID] [int] NULL,
	[IsDeleted] [bit] NULL,
	[GhiChu] [nvarchar](300) NULL,
	[ThoiGianBatDau] [datetime] NULL,
	[ThoiGianKetThuc] [datetime] NULL,
	[ThoiHanBaoQuan] [nvarchar](50) NULL,
	[CheDoSuDung] [nvarchar](50) NULL,
	[NgonNgu] [nvarchar](50) NULL,
	[TongSoVanBan] [int] NULL,
	[KyHieuThongTin] [nvarchar](2000) NULL,
	[TuKhoa] [nvarchar](30) NULL,
	[SoLuongTo] [int] NULL,
	[SoLuongTrang] [int] NULL,
	[TinhTrangVatLy] [nvarchar](50) NULL,
	[FileCatalog] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[Status] [tinyint] NULL,
	[FontId] [int] NULL,
	[OrganId] [int] NULL,
	[TableOfContentId] [int] NULL,
 CONSTRAINT [PK_S_HoSo_1] PRIMARY KEY CLUSTERED 
(
	[HoSoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view2]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view2] AS
		SELECT S_ComputerFile.HoSoID, COUNT(S_ComputerFile.HoSoID) as 'Files' FROM S_HoSo
		LEFT JOIN S_ComputerFile
		ON S_ComputerFile.HoSoID = S_HoSo.HoSoID
		GROUP BY S_ComputerFile.HoSoID
		HAVING S_ComputerFile.HoSoID IS NOT NULL
GO
/****** Object:  Table [dbo].[AccessTokens]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccessTokens](
	[AccessTokenId] [int] IDENTITY(1,1) NOT NULL,
	[Token] [char](200) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[EffectiveTime] [datetimeoffset](7) NOT NULL,
	[ExpiresIn] [int] NOT NULL,
	[UserAgent] [varchar](200) NOT NULL,
	[IP] [varchar](20) NOT NULL,
 CONSTRAINT [PK_AccessTokens_1] PRIMARY KEY CLUSTERED 
(
	[AccessTokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommonStatus]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommonStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](100) NULL,
	[Note] [nvarchar](500) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_CommonStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiaChi]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaChi](
	[DiaChiID] [int] IDENTITY(1,1) NOT NULL,
	[TinhID] [int] NULL,
	[HuyenID] [int] NULL,
	[XaPhuongID] [int] NULL,
	[DiaChiChiTiet] [nvarchar](200) NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_DiaChi] PRIMARY KEY CLUSTERED 
(
	[DiaChiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DigitalSignatures]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DigitalSignatures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](200) NULL,
	[Size] [varchar](10) NULL,
	[Path] [nvarchar](500) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateDate] [date] NULL,
	[IsDeleted] [tinyint] NULL,
	[Status] [tinyint] NULL,
	[ServerPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK__DigitalS__3214EC070DAAB556] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileUploads]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileUploads](
	[FileUploadId] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](500) NULL,
	[FileType] [nvarchar](500) NULL,
	[FileSize] [nvarchar](500) NULL,
	[FilePath] [nvarchar](500) NULL,
	[FileKey] [nvarchar](500) NULL,
	[FileDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_FileUploads] PRIMARY KEY CLUSTERED 
(
	[FileUploadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Huyen]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Huyen](
	[HuyenID] [int] NOT NULL,
	[TenHuyen] [nvarchar](50) NULL,
	[Cap] [nvarchar](20) NULL,
	[TinhID] [int] NULL,
 CONSTRAINT [PK_Huyen] PRIMARY KEY CLUSTERED 
(
	[HuyenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NgonNgu]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NgonNgu](
	[NgonNguId] [int] IDENTITY(1,1) NOT NULL,
	[TenNgonNgu] [nvarchar](100) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_NgonNgu] PRIMARY KEY CLUSTERED 
(
	[NgonNguId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhatKy]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhatKy](
	[NhatKyId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[VanBanId] [int] NULL,
	[Action] [nvarchar](64) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_NhatKy] PRIMARY KEY CLUSTERED 
(
	[NhatKyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_Authority]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_Authority](
	[AuthorityID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorityName] [nvarchar](50) NULL,
	[NgayTao] [date] NULL,
	[NgayCapNhat] [date] NULL,
 CONSTRAINT [PK_S_Authority] PRIMARY KEY CLUSTERED 
(
	[AuthorityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_CoQuan]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_CoQuan](
	[CoQuanID] [int] IDENTITY(1,1) NOT NULL,
	[MaCoQuan] [nvarchar](50) NULL,
	[TenCoQuan] [nvarchar](500) NULL,
	[LoaiCoQuan] [int] NULL,
	[Deleted] [bit] NULL,
	[Status] [bit] NULL,
	[DiaChiID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[UpdatedBy] [varchar](50) NULL,
	[Description] [nvarchar](1000) NULL,
	[Notes] [nvarchar](1000) NULL,
	[AddressDetail] [nvarchar](500) NULL,
 CONSTRAINT [PK_S_CoQuan] PRIMARY KEY CLUSTERED 
(
	[CoQuanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_HopSo]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_HopSo](
	[HopSoID] [int] IDENTITY(1,1) NOT NULL,
	[MucLucHoSoID] [int] NOT NULL,
	[MaHopSo] [nvarchar](50) NULL,
	[TieuDeHopSo] [nvarchar](50) NULL,
	[isDeleted] [bit] NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[SoLuongVanBan] [int] NULL,
	[NgayTao] [date] NULL,
	[NgayCapNhat] [date] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_S_HopSo_1] PRIMARY KEY CLUSTERED 
(
	[HopSoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_Kho]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_Kho](
	[KhoID] [int] IDENTITY(1,1) NOT NULL,
	[TenKho] [nvarchar](50) NULL,
	[NgayTao] [date] NULL,
	[NgayCapNhat] [date] NULL,
 CONSTRAINT [PK_S_Kho] PRIMARY KEY CLUSTERED 
(
	[KhoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_LoaiCoQuan]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_LoaiCoQuan](
	[LoaiCoQuanID] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiCoQuan] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](200) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_S_LoaiCoQuan] PRIMARY KEY CLUSTERED 
(
	[LoaiCoQuanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_LoaiHoSo]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_LoaiHoSo](
	[LoaiHoSoID] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiHoSo] [nvarchar](50) NULL,
	[NgayTao] [date] NULL,
	[NgayCapNhat] [date] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_S_LoaiHoSo] PRIMARY KEY CLUSTERED 
(
	[LoaiHoSoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_LoaiVanBan]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_LoaiVanBan](
	[LoaiVanBanID] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiVanBan] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_S_LoaiVanBan] PRIMARY KEY CLUSTERED 
(
	[LoaiVanBanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_LuuTru]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_LuuTru](
	[LuuTruID] [int] IDENTITY(1,1) NOT NULL,
	[KhoID] [int] NULL,
	[PhongID] [int] NOT NULL,
 CONSTRAINT [PK_S_LuuTru] PRIMARY KEY CLUSTERED 
(
	[LuuTruID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_Menu]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_Menu](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](2000) NULL,
	[MenuName] [nvarchar](50) NULL,
	[MenuRole] [varchar](50) NULL,
 CONSTRAINT [PK_S_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_MucDoTinCay]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_MucDoTinCay](
	[MucDoTinCayID] [int] IDENTITY(1,1) NOT NULL,
	[LoaiMucDoTinCay] [nvarchar](30) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_S_MucDoTinCay] PRIMARY KEY CLUSTERED 
(
	[MucDoTinCayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_MucLucHoSo]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_MucLucHoSo](
	[MucLucHoSoID] [int] IDENTITY(1,1) NOT NULL,
	[LuuTruID] [int] NOT NULL,
	[TenMucLucHoSo] [nvarchar](50) NULL,
	[MaDanhMuc] [nvarchar](50) NULL,
	[MucLucSo] [nvarchar](50) NULL,
	[NgayTao] [date] NULL,
	[NgayCapNhat] [date] NULL,
	[isDeleted] [bit] NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_S_MucLucHoSo_1] PRIMARY KEY CLUSTERED 
(
	[MucLucHoSoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_NhanVien]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_NhanVien](
	[NhanVienID] [int] IDENTITY(1,1) NOT NULL,
	[TenNhanVien] [nvarchar](150) NULL,
	[NgaySinh] [date] NULL,
	[Email] [varchar](150) NULL,
	[SoCMT] [varchar](12) NULL,
	[UserID] [int] NULL,
	[GioiTinh] [bit] NULL,
	[NgayCap] [date] NULL,
	[NoiCap] [nvarchar](50) NULL,
	[SoDienThoai] [varchar](12) NULL,
	[AnhDaiDien] [nvarchar](50) NULL,
	[NguyenQuan] [nvarchar](250) NULL,
 CONSTRAINT [PK_S_NhanVien] PRIMARY KEY CLUSTERED 
(
	[NhanVienID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_Page]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_Page](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[SystemID] [int] NULL,
	[PageName] [nchar](800) NULL,
	[URLPage] [char](800) NULL,
	[NguoiTao] [nvarchar](50) NULL,
	[NgayTao] [date] NULL,
	[NgayCapNhat] [date] NULL,
 CONSTRAINT [PK_S_Page] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_Phong]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_Phong](
	[PhongID] [int] IDENTITY(1,1) NOT NULL,
	[PhongSo] [nvarchar](50) NULL,
	[CoQuanID] [int] NULL,
	[TenPhong] [nvarchar](50) NULL,
	[LichSu] [nvarchar](max) NULL,
	[NgonNgu] [nvarchar](50) NULL,
	[isDeleted] [bit] NULL,
	[NgayTao] [date] NULL,
	[NgayCapNhat] [date] NULL,
	[GhiChu] [nvarchar](300) NULL,
	[SoLuongTaiLieuGiay] [float] NULL,
	[SoLuongTaiLieuDaSoHoa] [float] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[NgonNguID] [int] NULL,
	[CongCu] [nvarchar](50) NULL,
 CONSTRAINT [PK_S_Phong_1] PRIMARY KEY CLUSTERED 
(
	[PhongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_Role]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_S_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_Role_URL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_Role_URL](
	[RoleID] [int] NULL,
	[MenuId] [int] NULL,
	[RoleUrlId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_S_Role_URL] PRIMARY KEY CLUSTERED 
(
	[RoleUrlId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_TinhTrangVatLy]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_TinhTrangVatLy](
	[TinhTrangVatLyId] [int] IDENTITY(1,1) NOT NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_S_TrangThai] PRIMARY KEY CLUSTERED 
(
	[TinhTrangVatLyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_Uers_Atuthority]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_Uers_Atuthority](
	[SystemID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[AuthorityID] [int] NULL,
	[RoleID] [int] NULL,
	[NgayTao] [date] NULL,
	[NgayCapNhat] [date] NULL,
 CONSTRAINT [PK_S_Role_Uers_Atuthority]]] PRIMARY KEY CLUSTERED 
(
	[SystemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_User_Role]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_User_Role](
	[UserID] [int] NULL,
	[RoleID] [int] NULL,
	[UserRoleId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_S_User_Role] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S_Users]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](800) NOT NULL,
	[NguoiTao] [nvarchar](50) NULL,
	[NguoiCapNhat] [nvarchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[status] [smallint] NULL,
	[isDeleted] [smallint] NULL,
	[PasswordSalt] [varchar](300) NULL,
 CONSTRAINT [PK_S_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tinh]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tinh](
	[TinhID] [int] NOT NULL,
	[TenTinh] [nvarchar](50) NULL,
	[Cap] [nvarchar](20) NULL,
 CONSTRAINT [PK_Tinh] PRIMARY KEY CLUSTERED 
(
	[TinhID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XaPhuong]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XaPhuong](
	[XaPhuongID] [int] NOT NULL,
	[TenXaPhuong] [nvarchar](50) NULL,
	[Cap] [nvarchar](20) NULL,
	[HuyenID] [int] NULL,
 CONSTRAINT [PK_XaPhuong] PRIMARY KEY CLUSTERED 
(
	[XaPhuongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[S_HopSo] ADD  CONSTRAINT [DF_S_HopSo_isDeleted]  DEFAULT (N'bit') FOR [isDeleted]
GO
ALTER TABLE [dbo].[S_MucLucHoSo] ADD  CONSTRAINT [DF_S_MucLucHoSo_isDeleted]  DEFAULT (N'bit') FOR [isDeleted]
GO
ALTER TABLE [dbo].[S_Phong] ADD  CONSTRAINT [DF_S_Phong_isDeleted]  DEFAULT (N'bit') FOR [isDeleted]
GO
ALTER TABLE [dbo].[NhatKy]  WITH CHECK ADD  CONSTRAINT [FK_NhatKy_S_VanBan] FOREIGN KEY([VanBanId])
REFERENCES [dbo].[S_VanBan] ([VanBanID])
GO
ALTER TABLE [dbo].[NhatKy] CHECK CONSTRAINT [FK_NhatKy_S_VanBan]
GO
ALTER TABLE [dbo].[S_ComputerFile]  WITH CHECK ADD  CONSTRAINT [FK_S_ComputerFile_S_HoSo] FOREIGN KEY([HoSoID])
REFERENCES [dbo].[S_HoSo] ([HoSoID])
GO
ALTER TABLE [dbo].[S_ComputerFile] CHECK CONSTRAINT [FK_S_ComputerFile_S_HoSo]
GO
ALTER TABLE [dbo].[S_CoQuan]  WITH CHECK ADD  CONSTRAINT [FK_S_CoQuan_DiaChi] FOREIGN KEY([DiaChiID])
REFERENCES [dbo].[DiaChi] ([DiaChiID])
GO
ALTER TABLE [dbo].[S_CoQuan] CHECK CONSTRAINT [FK_S_CoQuan_DiaChi]
GO
ALTER TABLE [dbo].[S_CoQuan]  WITH CHECK ADD  CONSTRAINT [FK_S_CoQuan_S_LoaiCoQuan1] FOREIGN KEY([LoaiCoQuan])
REFERENCES [dbo].[S_LoaiCoQuan] ([LoaiCoQuanID])
GO
ALTER TABLE [dbo].[S_CoQuan] CHECK CONSTRAINT [FK_S_CoQuan_S_LoaiCoQuan1]
GO
ALTER TABLE [dbo].[S_HopSo]  WITH CHECK ADD  CONSTRAINT [FK_S_HopSo_S_MucLucHoSo] FOREIGN KEY([MucLucHoSoID])
REFERENCES [dbo].[S_MucLucHoSo] ([MucLucHoSoID])
GO
ALTER TABLE [dbo].[S_HopSo] CHECK CONSTRAINT [FK_S_HopSo_S_MucLucHoSo]
GO
ALTER TABLE [dbo].[S_HoSo]  WITH CHECK ADD  CONSTRAINT [FK_S_HoSo_S_HopSo] FOREIGN KEY([HopSoID])
REFERENCES [dbo].[S_HopSo] ([HopSoID])
GO
ALTER TABLE [dbo].[S_HoSo] CHECK CONSTRAINT [FK_S_HoSo_S_HopSo]
GO
ALTER TABLE [dbo].[S_HoSo]  WITH CHECK ADD  CONSTRAINT [FK_S_HoSo_S_LoaiHoSo] FOREIGN KEY([LoaiHoSoID])
REFERENCES [dbo].[S_LoaiHoSo] ([LoaiHoSoID])
GO
ALTER TABLE [dbo].[S_HoSo] CHECK CONSTRAINT [FK_S_HoSo_S_LoaiHoSo]
GO
ALTER TABLE [dbo].[S_LuuTru]  WITH CHECK ADD  CONSTRAINT [FK_S_LuuTru_S_Kho1] FOREIGN KEY([KhoID])
REFERENCES [dbo].[S_Kho] ([KhoID])
GO
ALTER TABLE [dbo].[S_LuuTru] CHECK CONSTRAINT [FK_S_LuuTru_S_Kho1]
GO
ALTER TABLE [dbo].[S_LuuTru]  WITH CHECK ADD  CONSTRAINT [FK_S_LuuTru_S_Phong1] FOREIGN KEY([PhongID])
REFERENCES [dbo].[S_Phong] ([PhongID])
GO
ALTER TABLE [dbo].[S_LuuTru] CHECK CONSTRAINT [FK_S_LuuTru_S_Phong1]
GO
ALTER TABLE [dbo].[S_MucLucHoSo]  WITH CHECK ADD  CONSTRAINT [FK_S_MucLucHoSo_S_LuuTru] FOREIGN KEY([LuuTruID])
REFERENCES [dbo].[S_LuuTru] ([LuuTruID])
GO
ALTER TABLE [dbo].[S_MucLucHoSo] CHECK CONSTRAINT [FK_S_MucLucHoSo_S_LuuTru]
GO
ALTER TABLE [dbo].[S_NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_S_NhanVien_S_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[S_Users] ([UserID])
GO
ALTER TABLE [dbo].[S_NhanVien] CHECK CONSTRAINT [FK_S_NhanVien_S_Users]
GO
ALTER TABLE [dbo].[S_Page]  WITH CHECK ADD  CONSTRAINT [FK_S_Page_S_Role_Uers_Atuthority]]] FOREIGN KEY([SystemID])
REFERENCES [dbo].[S_Uers_Atuthority] ([SystemID])
GO
ALTER TABLE [dbo].[S_Page] CHECK CONSTRAINT [FK_S_Page_S_Role_Uers_Atuthority]]]
GO
ALTER TABLE [dbo].[S_Phong]  WITH CHECK ADD  CONSTRAINT [FK_S_Phong_S_CoQuan] FOREIGN KEY([CoQuanID])
REFERENCES [dbo].[S_CoQuan] ([CoQuanID])
GO
ALTER TABLE [dbo].[S_Phong] CHECK CONSTRAINT [FK_S_Phong_S_CoQuan]
GO
ALTER TABLE [dbo].[S_Role_URL]  WITH CHECK ADD  CONSTRAINT [FK_S_Role_URL_S_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[S_Menu] ([MenuId])
GO
ALTER TABLE [dbo].[S_Role_URL] CHECK CONSTRAINT [FK_S_Role_URL_S_Menu]
GO
ALTER TABLE [dbo].[S_Role_URL]  WITH CHECK ADD  CONSTRAINT [FK_S_Role_URL_S_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[S_Role] ([RoleID])
GO
ALTER TABLE [dbo].[S_Role_URL] CHECK CONSTRAINT [FK_S_Role_URL_S_Role]
GO
ALTER TABLE [dbo].[S_Uers_Atuthority]  WITH CHECK ADD  CONSTRAINT [FK_S_Role_Uers_Atuthority]]_S_Authority] FOREIGN KEY([AuthorityID])
REFERENCES [dbo].[S_Authority] ([AuthorityID])
GO
ALTER TABLE [dbo].[S_Uers_Atuthority] CHECK CONSTRAINT [FK_S_Role_Uers_Atuthority]]_S_Authority]
GO
ALTER TABLE [dbo].[S_Uers_Atuthority]  WITH CHECK ADD  CONSTRAINT [FK_S_Role_Uers_Atuthority]]_S_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[S_Users] ([UserID])
GO
ALTER TABLE [dbo].[S_Uers_Atuthority] CHECK CONSTRAINT [FK_S_Role_Uers_Atuthority]]_S_Users]
GO
ALTER TABLE [dbo].[S_User_Role]  WITH CHECK ADD  CONSTRAINT [FK_S_User_Role_S_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[S_Role] ([RoleID])
GO
ALTER TABLE [dbo].[S_User_Role] CHECK CONSTRAINT [FK_S_User_Role_S_Role]
GO
ALTER TABLE [dbo].[S_User_Role]  WITH CHECK ADD  CONSTRAINT [FK_S_User_Role_S_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[S_Users] ([UserID])
GO
ALTER TABLE [dbo].[S_User_Role] CHECK CONSTRAINT [FK_S_User_Role_S_Users]
GO
ALTER TABLE [dbo].[S_VanBan]  WITH CHECK ADD  CONSTRAINT [FK_S_VanBan_CommonStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[CommonStatus] ([StatusID])
GO
ALTER TABLE [dbo].[S_VanBan] CHECK CONSTRAINT [FK_S_VanBan_CommonStatus]
GO
ALTER TABLE [dbo].[S_VanBan]  WITH CHECK ADD  CONSTRAINT [FK_S_VanBan_NgonNgu] FOREIGN KEY([NgonNguID])
REFERENCES [dbo].[NgonNgu] ([NgonNguId])
GO
ALTER TABLE [dbo].[S_VanBan] CHECK CONSTRAINT [FK_S_VanBan_NgonNgu]
GO
ALTER TABLE [dbo].[S_VanBan]  WITH CHECK ADD  CONSTRAINT [FK_S_VanBan_S_ComputerFile] FOREIGN KEY([ComputerFileID])
REFERENCES [dbo].[S_ComputerFile] ([ComputerFileID])
GO
ALTER TABLE [dbo].[S_VanBan] CHECK CONSTRAINT [FK_S_VanBan_S_ComputerFile]
GO
ALTER TABLE [dbo].[S_VanBan]  WITH CHECK ADD  CONSTRAINT [FK_S_VanBan_S_HoSo] FOREIGN KEY([HoSoID])
REFERENCES [dbo].[S_HoSo] ([HoSoID])
GO
ALTER TABLE [dbo].[S_VanBan] CHECK CONSTRAINT [FK_S_VanBan_S_HoSo]
GO
ALTER TABLE [dbo].[S_VanBan]  WITH CHECK ADD  CONSTRAINT [FK_S_VanBan_S_LoaiVanBan] FOREIGN KEY([LoaiVanBanID])
REFERENCES [dbo].[S_LoaiVanBan] ([LoaiVanBanID])
GO
ALTER TABLE [dbo].[S_VanBan] CHECK CONSTRAINT [FK_S_VanBan_S_LoaiVanBan]
GO
ALTER TABLE [dbo].[S_VanBan]  WITH CHECK ADD  CONSTRAINT [FK_S_VanBan_S_MucDoTinCay] FOREIGN KEY([MucDoTinCayID])
REFERENCES [dbo].[S_MucDoTinCay] ([MucDoTinCayID])
GO
ALTER TABLE [dbo].[S_VanBan] CHECK CONSTRAINT [FK_S_VanBan_S_MucDoTinCay]
GO
ALTER TABLE [dbo].[S_VanBan]  WITH CHECK ADD  CONSTRAINT [FK_S_VanBan_S_TinhTrangVatLy] FOREIGN KEY([TinhTrangVatLyID])
REFERENCES [dbo].[S_TinhTrangVatLy] ([TinhTrangVatLyId])
GO
ALTER TABLE [dbo].[S_VanBan] CHECK CONSTRAINT [FK_S_VanBan_S_TinhTrangVatLy]
GO
/****** Object:  StoredProcedure [dbo].[ACCOUNT_CREATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ACCOUNT_CREATE]
	@UserName NVARCHAR(50) = N'',
	@Password NVARCHAR(800) = N'',
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET NOCOUNT ON;
	IF EXISTS(SELECT UserName from S_Users WHERE S_Users.UserName = @UserName)
	BEGIN
		SET @ErrorCode = '1'
		SET @ErrorMessage = N'Tài khoản đã tồn tại'
		RETURN;
	END

	
	BEGIN TRY
		INSERT INTO S_Users(
			UserName,
			Password
		)VALUES(
			@UserName,
			@Password
		)
		SET @ErrorCode = '0'
		SET @ErrorMessage = N''
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[ACCOUNT_DELETE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ACCOUNT_DELETE]
	@UserName NVARCHAR(50) = N'',
	@Password NVARCHAR(800) = N'',
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	SET NOCOUNT ON;
	
	BEGIN TRY
		DELETE S_Users
		WHERE S_Users.UserName = @UserName
		SET @ErrorCode = '0'
		SET @ErrorMessage = N''
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[ACCOUNT_EDIT_PASSWORD]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ACCOUNT_EDIT_PASSWORD]
	-- Add the parameters for the stored procedure here
	@UserName NVARCHAR(50),
	@Password NVARCHAR(800),
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		UPDATE S_Users
		SET S_Users.Password = @Password
		WHERE S_Users.UserName = @UserName
		SET @ErrorCode = '0'
		SET @ErrorMessage = N''
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[ACCOUNT_GET_USER_BY_USER_NAME]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ACCOUNT_GET_USER_BY_USER_NAME]
	-- Add the parameters for the stored procedure here
	@UserName NVARCHAR(50),
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF NOT EXISTS (SELECT UserID FROM S_Users WITH(NOLOCK)
		WHERE S_Users.UserName = @UserName COLLATE SQL_Latin1_General_CP1_CS_AS AND (dbo.S_Users.status = 1) AND (dbo.S_Users.isdeleted = 0 OR dbo.S_Users.isdeleted IS NULL) )
			BEGIN
				SET @ErrorCode = '-1';
				SET @ErrorMessage = N'Không tồn tại user trên hệ thống.'
            END
		ELSE
        BEGIN
			SELECT
				S_Users.UserID AS id,
				UserName,
				Password,
				ur.RoleID RoleID,
				r.RoleName RoleName,
				r.RoleName UserRole
			FROM S_Users  WITH(NOLOCK)
			LEFT JOIN S_User_Role uR on S_Users.UserID = uR.UserID
			LEFT JOIN S_Role r on r.RoleID = uR.RoleID
			WHERE S_Users.UserName = @UserName COLLATE SQL_Latin1_General_CP1_CS_AS AND (dbo.S_Users.status = 1) AND (dbo.S_Users.isdeleted = 0 OR dbo.S_Users.isdeleted IS NULL)
			SET @ErrorCode = '0'
			SET @ErrorMessage = N''
        END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[Address_ALL_TINH]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Address_ALL_TINH]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	SET NOCOUNT ON; 
	BEGIN TRY
		BEGIN
			SELECT t.TenTinh AS ProvincialName,t.TinhID AS ProvincialID,t.Cap AS Level
			FROM Tinh t WITH (NOLOCK)
			ORDER BY t.TinhID DESC
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[ADDRESS_GET_ALL_WARD_BY_PROVINCEID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ADDRESS_GET_ALL_WARD_BY_PROVINCEID]
	@TinhID INT,
	@ErrorCode VARCHAR(50) OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		  SELECT TOP 20 x.XaPhuongID AS WardsID, x.TenXaPhuong AS WardsName, x.Cap AS Level, x.HuyenID AS DistrictID FROM dbo.Tinh t WITH (NOLOCK)
		  INNER JOIN dbo.Huyen h WITH (NOLOCK)
		  ON t.TinhID = h.TinhID
		  INNER JOIN dbo.XaPhuong x WITH (NOLOCK)
		  ON h.HuyenID = x.HuyenID WHERE t.TinhID = @TinhID
		  SET @ErrorCode = '0'
		  SET @ErrorMessage = N'Lấy dữ liệu thành công.'
    END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Address_GET_BY_DIACHI_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Address_GET_BY_DIACHI_ID]
(
	@DiaChiID	  INT =0,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
	BEGIN TRY

		IF (SELECT DiaChi.DiaChiID FROM DiaChi WHERE DiaChi.DiaChiID =@DiaChiID) IS NULL
			BEGIN
				SET @ErrorCode = N'0';
				SET @ErrorMessage = N'Lấy dữ liệu thất bại';
			END
		ELSE 

			BEGIN
				SELECT *
				FROM DiaChi dc 
				left outer join Tinh t on dc.TinhID = t.TinhID
				WHERE dc.DiaChiID = @DiaChiID
				ORDER BY dc.DiaChiID DESC
				--OFFSET CONVERT(INT, @PageNumber*@RowsPerPage) ROWS 
				--FETCH NEXT CONVERT(INT, @PageSize) ROWS ONLY
				SET @ErrorCode = N'1';
				SET @ErrorMessage = N'Lấy dữ liệu thành công';
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Address_GET_BY_TINH_HUYEN_XAPHUONG_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Address_GET_BY_TINH_HUYEN_XAPHUONG_ID]
(
	@TinhID	  INT =0,
	@HuyenID  INT =0,
	@XaPhuongID INT =0,
	@FromRecord INT,
	@PageSize INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
	DECLARE @queryStr NVARCHAR(MAX) = '',@Temp INT =0;
	BEGIN TRY
		SET @queryStr = 'SELECT *
				FROM DiaChi dc 
				left outer join Tinh t on dc.TinhID = t.TinhID
				left outer join Huyen h on h.HuyenID = dc.HuyenID
				left outer join XaPhuong xp on xp.XaPhuongID = dc.XaPhuongID'
		IF @TinhID !=0
			BEGIN
				SET @Temp = 1
				SET @queryStr = @queryStr + ' WHERE dc.TinhID = '+@TinhID
			END
		IF @HuyenID !=0
			IF @Temp = 1
				BEGIN
					SET @Temp = 2
					SET @queryStr = @queryStr + ' and dc.HuyenID = ' +@HuyenID
				END
			ELSE
				BEGIN
					SET @Temp = 3
					SET @queryStr = @queryStr + ' WHERE dc.HuyenID = '+ @HuyenID
				END
		IF @XaPhuongID !=0
			IF @Temp != 0
				BEGIN
					SET @queryStr = @queryStr + ' and dc.XaPhuongID = '+ @XaPhuongID 
				END
			ELSE 
				BEGIN
					SET @queryStr = @queryStr + ' WHERE dc.XaPhuongID = ' + @XaPhuongID
				END
		IF @Temp =0
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thất bại';
		IF @Temp =0 
			BEGIN
				SET @queryStr = @queryStr + ' ORDER BY dc.DiaChiID DESC
				OFFSET CONVERT(INT, ' + @FromRecord +') ROWS 
				FETCH NEXT CONVERT(INT, '+@PageSize +') ROWS ONLY'
				SET @ErrorCode = N'1';
				SET @ErrorMessage = N'Lấy dữ liệu thành công';
			END
		END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Address_GET_HUYEN_BY_TINH_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Address_GET_HUYEN_BY_TINH_ID]
(
	@TinhID	  INT =0,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
	BEGIN TRY
		BEGIN
			IF @TinhID !=0
				BEGIN
					SELECT h.HuyenID AS DistrictID,h.TenHuyen AS DistrictName,h.TinhID AS ProvincialID,h.Cap AS Level
					FROM Huyen h WHERE h.TinhID = @TinhID
					ORDER BY h.HuyenID DESC
					SET @ErrorMessage = N'Lấy dữ liệu thành công';
				END
			ELSE
				BEGIN
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'Lấy dữ liệu thất bại ';
				END
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = N'0';
		SET @ErrorMessage = N'Lấy dữ liệu thất bại ';
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Address_GET_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Address_GET_PAGING]
(
	@RowsPerPage INT = 10,
	@PageNumber INT = 0,
	@PageSize INT =10,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT *
			FROM DiaChi dc
			left outer join Tinh t on dc.TinhID = t.TinhID
			ORDER BY dc.DiaChiID DESC
			OFFSET CONVERT(INT, @PageNumber*@RowsPerPage) ROWS 
			FETCH NEXT CONVERT(INT, @PageSize) ROWS ONLY
			SET @ErrorCode = N'success';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Address_GET_XAPHUONG_BY_HUYEN_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Address_GET_XAPHUONG_BY_HUYEN_ID]
(
	@HuyenID	  INT =0,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
	BEGIN TRY
		BEGIN
			IF @HuyenID <> 0
				BEGIN
					SELECT xp.XaPhuongID AS WardsID,xp.Cap Level,xp.HuyenID DistrictID,xp.TenXaPhuong WardsName
					FROM XaPhuong xp WHERE xp.HuyenID = @HuyenID
					ORDER BY xp.HuyenID DESC
					SET @ErrorMessage = N'Lấy dữ liệu thành công';
				END
			ELSE
				BEGIN
					SET @ErrorCode = N'-1';
					SET @ErrorMessage = N'Lấy dữ liệu thất bại ';
				END
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[COMPUTER_FILE_UPLOAD]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[COMPUTER_FILE_UPLOAD]
	-- Add the parameters for the stored procedure here
	@FileName NVARCHAR(300),
	@Url NVARCHAR(4000),
	@CreatedBy NVARCHAR(100),
	@CreatedDate DATE,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		INSERT INTO S_ComputerFile(FileName, Url, NguoiTao, NgayTao)
		VALUES(@FileName, @Url, @CreatedBy, @CreatedDate)
		SET @ErrorCode = '1';
		SET @ErrorMessage = 'SUC';
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[COMPUTER_GET_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[COMPUTER_GET_BY_ID]
(
	@ComputerFileId INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
			SELECT
				ComputerFileID AS FileId,
				FileName,
				Url,
				Size,
				NguoiTao AS CreatedBy,
				PageNumber,
				NgayTao AS CreatedDate,
				HoSoID AS ProfileId,
				FolderPath,
				ClientUrl,
				Status
				FROM S_ComputerFile f WITH (NOLOCK)
				WHERE (f.isDeleted = 0 OR f.isDeleted IS NULL) AND f.ComputerFileID = @ComputerFileId
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[COMPUTER_GET_BY_PROFILE_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[COMPUTER_GET_BY_PROFILE_ID]
(
	@ProfileId INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
			SELECT
				ComputerFileID AS FileId,
				FileName,
				Url,
				Size,
				NguoiTao AS CreatedBy,
				PageNumber,
				NgayTao AS CreatedDate,
				HoSoID AS ProfileId,
				FolderPath,
				ClientUrl,
				Status
				FROM S_ComputerFile f WITH (NOLOCK)
				WHERE (f.isDeleted = 0 OR f.isDeleted IS NULL) AND f.HoSoID = @ProfileId
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[CONFIDENCE_LEVEL_GET_ALL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CONFIDENCE_LEVEL_GET_ALL]
	-- Add the parameters for the stored procedure here
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	BEGIN TRY
		SELECT 
			S_MucDoTinCay.MucDoTinCayID as 'ConfidenceLevelId',
			S_MucDoTinCay.LoaiMucDoTinCay as 'ConfidenceLevelName'
		FROM S_MucDoTinCay
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[COQUAN_ADD_NEW]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[COQUAN_ADD_NEW]
(
	@TenCoQuan	NVARCHAR(500) = '',
	@LoaiCoQuan INT,
	@Tinh		INT,
	@Huyen		INT,
	@Xa			INT,
	@ErrorCode  INT OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		-- Check cơ quan đã có trong cơ sở dữ liệu hay chưa
		IF EXISTS (SELECT CoQuanID FROM S_CoQuan WITH (NOLOCK) WHERE TenCoQuan = @TenCoQuan)
		BEGIN
			SET @ErrorCode = 1;
			SET @ErrorMessage = N'Cơ quan đã tồn tại trên hệ thống, vui lòng thử lại.';
			RETURN;
		END
		ELSE
		BEGIN
			DECLARE @TinhName NVARCHAR(50);
			DECLARE @HuyenName NVARCHAR(50);
			DECLARE @XaName NVARCHAR(50);
			DECLARE @AddressDetails NVARCHAR(200) = '';

			SET @TinhName = (SELECT Tinh.TenTinh FROM Tinh WHERE Tinh.TinhID = @Tinh)
			SET @HuyenName = (SELECT Huyen.TenHuyen FROM Huyen WHERE Huyen.HuyenID = @Huyen)
			SET @XaName = (SELECT XaPhuong.TenXaPhuong FROM XaPhuong WHERE XaPhuong.XaPhuongID = @Xa)

			SET @AddressDetails = CONCAT(@TinhName, ', ', @HuyenName, ', ', @XaName);
			-- Thêm địa chỉ cơ quan vào bảng địa chỉ
			INSERT INTO DiaChi
			(
				TinhID,
				HuyenID,
				XaPhuongID,
				DiaChiChiTiet
			)
			VALUES 
			(
				@Tinh,
				@Huyen,
				@Xa,
				@AddressDetails
			)
			-- lấy ra Id của địa chỉ cơ quan vừa thêm
			DECLARE @AddressID INT;
			SELECT @AddressID = CONVERT(INT ,(SELECT TOP 1 DiaChiID FROM DiaChi WHERE DiaChi.TinhID = @Tinh AND DiaChi.HuyenID = @Huyen AND DiaChi.XaPhuongID = @Xa ORDER BY DiaChiID DESC))
			-- Thêm cơ quan vào bảng cơ quan
			INSERT INTO S_CoQuan
			(
				TenCoQuan,
				LoaiCoQuan,
				DiaChiID
			)
			VALUES
			(
				@TenCoQuan,
				@LoaiCoQuan,
				@AddressID
			)
			SET @ErrorCode = 0;
			SET @ErrorMessage = N'';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorCode = ERROR_MESSAGE();
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[COQUAN_DELETE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[COQUAN_DELETE]
(
	@CoQuanID INT,
	@ErrorCode INT OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @DiaChiID INT;
		SELECT @DiaChiID = CONVERT(INT, (SELECT DiaChiID FROM dbo.S_CoQuan WHERE CoQuanID = @CoQuanID))
		-- Xóa địa chỉ cơ quan trong bảng địa chỉ
		UPDATE DiaChi
		SET
			Deleted = 1
		WHERE DiaChiID = @DiaChiID

		-- Xóa cơ quan trong bảng cơ quan
		UPDATE dbo.S_CoQuan
		SET
			Deleted = 1
		WHERE CoQuanID = @CoQuanID
		SET @ErrorCode = 0;
		SET @ErrorMessage = N'Xóa thành công, hihi.';
    END TRY
    BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[COQUAN_GET_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[COQUAN_GET_BY_ID]
(
	@CoQuanID INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, -- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT  -- Thông báo lỗi
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF @CoQuanID IS NULL
		BEGIN
			SET @ErrorCode = N'1';
			SET @ErrorMessage = N'Không tồn tại bản ghi.';
			RETURN;
		END
		ELSE
		BEGIN

			SELECT cq.CoQuanID,
								cq.MaCoQuan as OrganCode,
								 cq.TenCoQuan,
								 lcq.LoaiCoQuanID,
								 cq.CreateBy,
								 lcq.TenLoaiCoQuan AS OrganType,
								 dc.TinhID,
								 dc.HuyenID,
								 dc.XaPhuongID,
								 cq.DiaChiID,
								 dc.DiaChiChiTiet AS AddressDetail,
								 cq.Description,
								 cq.Notes

								FROM dbo.S_CoQuan cq 
								INNER JOIN dbo.S_LoaiCoQuan lcq ON (cq.LoaiCoQuan = lcq.LoaiCoQuanID)
								INNER JOIN dbo.DiaChi dc ON (cq.DiaChiID = dc.DiaChiID) WHERE cq.CoQuanID = @CoQuanID
				SET @ErrorCode = N'0';
				SET @ErrorMessage = N'';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END

GO
/****** Object:  StoredProcedure [dbo].[COQUAN_GET_BY_TYPE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[COQUAN_GET_BY_TYPE]
(
	@type INT = NULL,
	@ErrorCode    NVARCHAR(100) OUTPUT, -- Mã lỗi
	@ErrorMessage NVARCHAR(4000) OUTPUT  -- Thông báo lỗi
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		BEGIN TRY
		IF @type IS NULL
		BEGIN
			SET @ErrorCode = N'1';
			SET @ErrorMessage = N'Không tồn tại cơ quan.';
			RETURN;
		END
		ELSE
		BEGIN
			SELECT TenCoQuan, LoaiCoQuan, Status
			FROM S_CoQuan, S_LoaiCoQuan WHERE S_CoQuan.LoaiCoQuan = @type AND S_LoaiCoQuan.LoaiCoQuanID = @type
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END
		END TRY
		BEGIN CATCH
			SET @ErrorCode = ERROR_MESSAGE();
			SET @ErrorMessage = ERROR_MESSAGE();
		END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[COQUAN_GET_SEARCH_WITH_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[COQUAN_GET_SEARCH_WITH_PAGING]
(
@InWhere      NVARCHAR(MAX)  = '', 
 @InSort       NVARCHAR(200)  = '', 
 @StartRow     INT            = 0,
 @Keywords     NVARCHAR(MAX)  = '', 
 @PageSize     INT            = 10,
 @TotalRecords INT OUTPUT,
 @ErrorCode    NVARCHAR(100) OUTPUT,
 @ErrorMessage NVARCHAR(4000) OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		DECLARE @query NVARCHAR(MAX)= '';
        DECLARE @queryRowCount NVARCHAR(MAX)= '';
        BEGIN TRY
			DECLARE @ROWS NVARCHAR(50) = '';
			SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
            SET @query = 'SELECT cq.CoQuanID,
								 cq.TenCoQuan,
								 cq.CreateBy,
								 lcq.TenLoaiCoQuan AS OrganType,
								 dc.DiaChiChiTiet AS AddressDetail,
								 cq.DiaChiID AS AddressID
								FROM dbo.S_CoQuan cq 
								INNER JOIN dbo.S_LoaiCoQuan lcq ON (cq.LoaiCoQuan = lcq.LoaiCoQuanID)
								INNER JOIN dbo.DiaChi dc ON (cq.DiaChiID = dc.DiaChiID) WHERE (cq.Deleted = 0 OR cq.Deleted IS NULL) AND cq.DiaChiID IS NOT NULL ' + @InWhere + ' ORDER BY ' + @InSort + ' CoQuanID ASC ' + ' OFFSET ' + @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY ';
            EXEC SP_EXECUTESQL @query;
            SET @queryRowCount = 'SELECT @TotalRecords = COUNT(cq.CoQuanID)
								 FROM dbo.S_CoQuan cq 
								 INNER JOIN dbo.S_LoaiCoQuan lcq ON (cq.LoaiCoQuan = lcq.LoaiCoQuanID)
								 INNER JOIN dbo.DiaChi dc ON (cq.DiaChiID = dc.DiaChiID) WHERE (cq.Deleted = 0 OR cq.Deleted IS NULL) AND cq.DiaChiID IS NOT NULL ' + @InWhere;
            EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
            SET @ErrorCode = '0';
            SET @ErrorMessage = N'Lấy dữ liệu thành công';
        END TRY
        BEGIN CATCH
            SET @ErrorCode = ERROR_MESSAGE();
            SET @ErrorMessage = ERROR_MESSAGE();
        END CATCH;
        SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[COQUAN_UPDATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[COQUAN_UPDATE]
(
	@CoQuanID	INT,
	@TenCoQuan	NVARCHAR(500) = '',
	@LoaiCoQuan INT,
	@Tinh		INT,
	@Huyen		INT,
	@Xa			INT,
	@ErrorCode  INT OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
			DECLARE @TinhName NVARCHAR(50);
			DECLARE @HuyenName NVARCHAR(50);
			DECLARE @XaName NVARCHAR(50);
			DECLARE @AddressDetails NVARCHAR(200) = '';

			SET @TinhName = (SELECT Tinh.TenTinh FROM Tinh WHERE Tinh.TinhID = @Tinh)
			SET @HuyenName = (SELECT Huyen.TenHuyen FROM Huyen WHERE Huyen.HuyenID = @Huyen)
			SET @XaName = (SELECT XaPhuong.TenXaPhuong FROM XaPhuong WHERE XaPhuong.XaPhuongID = @Xa)

			SET @AddressDetails = CONCAT(@TinhName, ', ', @HuyenName, ', ', @XaName);
			-- Lấy ra ID của địa chỉ
			DECLARE @DiaChiID INT;
			SELECT @DiaChiID = CONVERT(INT, (SELECT DiaChiID FROM dbo.S_CoQuan WHERE CoQuanID = @CoQuanID))
			-- Cập nhật địa chỉ cơ quan vào bảng địa chỉ
			UPDATE DiaChi
			SET
				TinhID = @Tinh,
				HuyenID = @Huyen,
				XaPhuongID = @Xa,
				DiaChiChiTiet = @AddressDetails
			WHERE DiaChiID = @DiaChiID
			-- lấy ra Id của địa chỉ cơ quan vừa thêm
			-- Cập nhật cho bảng COQUAN
			UPDATE dbo.S_CoQuan
			SET
				TenCoQuan = @TenCoQuan,
				LoaiCoQuan = @LoaiCoQuan
			WHERE CoQuanID = @CoQuanID
			SET @ErrorCode = 0;
			SET @ErrorMessage = N'';
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorCode = ERROR_MESSAGE();
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[DATA_DOCUMENT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DATA_DOCUMENT]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT S_HoSo.MaHoSo as FileCode, 
					MaDinhDanh as DocumentCode, 
					STTVanBan as DocOrdinal, 
					TenLoaiVanBan as TypeName, 
					SoVanBan as CodeNumber, 
					NoiDung as Subject, 
					SoTo as PageAmount, 
					S_VanBan.GhiChu as Description, 
					TinhTrang as Format, 
					S_ComputerFile.Url as FileUrl, 
					NgayVanBan as IssuedDate,
					S_VanBan.Confirmed as Confirmed,
					S_VanBan.NgayTao as CreateTime,
					S_MucDoTinCay.LoaiMucDoTinCay ConfidenceLevel
				FROM S_VanBan
				WITH (NOLOCK) 
				LEFT JOIN S_HoSo ON S_HoSo.HoSoId = S_VanBan.HoSoId  
				LEFT JOIN S_LoaiVanBan ON S_VanBan.LoaiVanBanID = S_LoaiVanBan.LoaiVanBanID 
				LEFT JOIN S_TinhTrangVatLy ON S_TinhTrangVatLy.TinhTrangVatLyId = S_VanBan.TinhTrangVatLyID 
				LEFT JOIN S_MucDoTinCay ON S_MucDoTinCay.MucDoTinCayID = S_VanBan.MucDoTinCayID 
				LEFT JOIN S_ComputerFile ON S_ComputerFile.ComputerFileID = S_VanBan.ComputerFileID 
				WHERE S_VanBan.isDeleted = 0 Or S_VanBan.isDeleted IS NULL
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[DATA_PROFILES]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DATA_PROFILES]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT hs.HoSoID AS ProfileId,
					hs.MaHoSo AS FileCode,
					hs.NgayTao AS CreateTime,
					hs.ThoiGianBatDau AS StartTime,
					hs.ThoiGianKetThuc AS EndTime,
					hps.MaHopSo AS GearBoxCode,
					lhs.TenLoaiHoSo AS ProfileTypeName,
					hs.TieuDeHoSo AS Title,
					hps.TieuDeHopSo AS GearBoxTitle,
					hs.TinhTrangVatLy AS Format,
					hs.ThoiHanBaoQuan AS Maintenance,
					hs.GhiChu AS Description,
					hs.Status
				    FROM S_HoSo hs INNER JOIN S_LoaiHoSo lhs ON hs.LoaiHoSoID = lhs.LoaiHoSoID
				    INNER JOIN S_HopSo hps ON hs.HopSoID = hps.HopSoID WHERE (hs.IsDeleted = 0 OR hs.IsDeleted IS NULL)
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[DATA_STATISTICS]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DATA_STATISTICS]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT sp.TenPhong FontName,ml.MucLucSo TableOfNumber,hs.MaHopSo GearBoxCode,hso.MaHoSo ProfileCode,f.FileName FileName,vb.SoVanBan DocNumber,f.ComputerFileID ComputerFileID,vb.NgayCapNhat UpdateDate
			FROM S_Phong sp
			left outer join S_LuuTru lt on sp.PhongID = lt.PhongID
			left outer join S_MucLucHoSo ml on ml.LuuTruID = lt.LuuTruID
			left outer join S_HopSo hs on hs.MucLucHoSoID = ml.MucLucHoSoID
			left outer join S_HoSo hso on hso.HopSoID = hs.HopSoID
			left outer join S_VanBan vb on vb.HoSoID = hso.HoSoID
			left outer join S_ComputerFile f on f.ComputerFileID = vb.ComputerFileID
			WHERE (sp.isDeleted = 0 or sp.isDeleted IS NULL) and (ml.isDeleted = 0 or ml.isDeleted IS NULL)
			and (hs.isDeleted = 0 or hs.isDeleted IS NULL) and (hso.isDeleted = 0 or hso.isDeleted IS NULL)
			and (vb.isDeleted = 0 or vb.isDeleted IS NULL) and (f.isDeleted = 0 or f.isDeleted IS NULL)
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[DOCUMENT_CREATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DOCUMENT_CREATE]
	-- Add the parameters for the stored procedure here
	@DocumentCode NVARCHAR(25),
	@DocOrdinal INT,
	@FileId INT,
	@DocTypeId INT,
	@CodeNumber NVARCHAR(11),
	@CodeNotation NVARCHAR(30),
	@IssuedDate DATE,
	@Subject NVARCHAR(500) = '',
	@LanguageId INT,
	@PageAmount INT,
	@Description NVARCHAR(500) = '',
	@OrganizationIssued NVARCHAR(50) = '',
	@InforSign NVARCHAR(30) = '',
	@Keyword NVARCHAR(100) = '',
	@Mode NVARCHAR(20) = '',
	@Autograph NVARCHAR(2000) = '',
	@FormatId INT,
	@ComputerFileId INT,
	@ConfidenceLevelId INT,
	@CreatedDate DATE,
	@CreatedBy NVARCHAR(100),
	@Signature INT = 0,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET NOCOUNT ON;
	IF EXISTS(SELECT S_VanBan.VanBanID from S_VanBan WHERE S_VanBan.SoVanBan = @CodeNumber)
	BEGIN
		SET @ErrorCode = '1'
		SET @ErrorMessage = N'Văn bản đã tồn tại'
		RETURN;
	END

	BEGIN TRY

		-- kiểm tra xem file có phải là file cuối cùng trong hồ sơ hay không
		DECLARE @lastFile INT;
		DECLARE @fileCount INT;
		SET @fileCount = (SELECT COUNT(ComputerFileID) FROM S_ComputerFile WHERE (IsDeleted = 0 OR IsDeleted IS NULL) AND (Status = 0) AND HoSoID = @FileId);
		IF @fileCount = 1
			BEGIN
				-- CẬP NHẬT TRẠNG THÁI CHO HỒ SƠ
				UPDATE S_HoSo
				SET Status = 1 WHERE HoSoID = @FileId;
			END

		-- kiểm tra xem hồ sơ có phải là hồ sơ cuối cùng của hộp số
		DECLARE @gearBoxCount INT;
		DECLARE @gearBoxId INT;
		SET @gearBoxId = (SELECT TOP 1 HopSoID FROM S_HoSo WHERE HoSoID = @FileId);
		SET @gearBoxCount = (SELECT COUNT(H.HoSoID) FROM S_HoSo H WHERE (H.IsDeleted = 0 OR H.IsDeleted IS NULL) AND H.Status = 0 AND H.HopSoID = @gearBoxId)
		
		IF @gearBoxId IS NOT NULL AND @gearBoxId != 0
			BEGIN
				-- CẬP NHẬT SỐ LƯƠNG VĂN BẢN CHO HỘP SỐ
				UPDATE S_HopSo
				SET SoLuongVanBan = SoLuongVanBan + 1 WHERE HopSoID = @gearBoxId;
			END

		IF @gearBoxCount = 0
			BEGIN
				-- CẬP NHẬT TRẠNG THÁI CHO HỘP SỐ (ĐÃ HOÀN THÀNH)
				UPDATE S_HopSo
				SET Status = 1 WHERE HopSoID = @gearBoxId;
			END

		---- cập nhật lại trạng thái của file
		UPDATE S_ComputerFile
		SET Status = 1 WHERE ComputerFileID = @ComputerFileId;

		INSERT INTO S_VanBan
		(
			HoSoID, 
			MaDinhDanh, 
			STTVanBan, 
			LoaiVanBanID, 
			SoVanBan, 
			KyHieuVanBan, 
			NoiDung, 
			NgonNguID, 
			SoTo,
			GhiChu,
			KyHieuThongTin,
			TuKhoa,
			ButTich,
			TinhTrangVatLyID,
			MucDoTinCayID,
			ComputerFileID,
			NgayVanBan,
			isDeleted, 
			NgayTao, 
			NguoiTao,
			Status,
			Signature,
			Confirmed,
			CheDoSuDung,
			CoQuanToChucBanHanh
			)
		VALUES
		(
			@FileId,
			@DocumentCode,
			@DocOrdinal,
			@DocTypeId,
			@CodeNumber,
			@CodeNotation,
			@Subject,
			@LanguageId,
			@PageAmount,
			@Description,
			@InforSign,
			@Keyword,
			@Autograph,		
			@FormatId,
			@ConfidenceLevelId,
			@ComputerFileId,
			@IssuedDate,
			0,
			@CreatedDate,
			@CreatedBy,
			0, -- status = 0: chờ sửa, status = 1: đã sửa
			@Signature, -- = 1 : đã có chữ ký số trong văn bản này
			0, -- confirmed = 0, chờ xác nhận, = 1 : đã xác nhận
			@Mode,
			@OrganizationIssued
		)
		SET @ErrorCode = '0'
		SET @ErrorMessage = N''
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[DOCUMENT_DELETE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DOCUMENT_DELETE]
	-- Add the parameters for the stored procedure here
	@DocumentId INT,
	@UpdatedDate DATE,
	@UpdatedBy NVARCHAR(100),
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET NOCOUNT ON;
	BEGIN TRY
		IF NOT EXISTS(SELECT S_VanBan.VanBanID 
					  FROM S_VanBan 
					  WHERE S_VanBan .VanBanID = @DocumentId)
			BEGIN
				SET @ErrorCode = '1'
				SET @ErrorMessage = N'Không tồn tại văn bản này'
				RETURN;
			END
		ELSE
			DECLARE @profileID INT;
			DECLARE @gearBoxId INT;
			SET @profileID = (SELECT TOP 1 S_VanBan.HoSoID 
						  FROM S_VanBan 
						  WHERE S_VanBan .VanBanID = @DocumentId);
			SET @gearBoxId = (SELECT TOP 1 HopSoID FROM S_HoSo WHERE HoSoID = @profileID);
			IF @gearBoxId IS NOT NULL OR @gearBoxId != 0
				BEGIN
					IF (SELECT TOP 1 SoLuongVanBan FROM S_HopSo WHERE HopSoID = @gearBoxId) > 0 AND (SELECT TOP 1 SoLuongVanBan FROM S_HopSo WHERE HopSoID = @gearBoxId) IS NOT NULL
						BEGIN
							-- CẬP NHẬT SỐ LƯƠNG VĂN BẢN CHO HỘP SỐ
							UPDATE S_HopSo
							SET SoLuongVanBan = SoLuongVanBan - 1 WHERE HopSoID = @gearBoxId;
						END
					ELSE
						BEGIN
							-- CẬP NHẬT SỐ LƯƠNG VĂN BẢN CHO HỘP SỐ
							UPDATE S_HopSo
							SET SoLuongVanBan = 0 WHERE HopSoID = @gearBoxId;
						END
				END
			BEGIN
				UPDATE S_VanBan
				SET
					isDeleted = 1,
					NgayCapNhat = @UpdatedDate,
					NguoiChinhSua = @UpdatedBy
				WHERE S_VanBan.VanBanID = @DocumentId
				SET @ErrorCode = '0'
				SET @ErrorMessage = N'SUC'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DOCUMENT_EDIT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DOCUMENT_EDIT]
	-- Add the parameters for the stored procedure here
	@DocumentId INT,
	@DocumentCode NVARCHAR(25),
	@DocOrdinal INT,
	@FileId INT,
	@DocTypeId INT,
	@CodeNumber NVARCHAR(11),
	@CodeNotation NVARCHAR(30),
	@IssuedDate DATE,
	@Subject NVARCHAR(500),
	@LanguageId INT,
	@PageAmount INT,
	@Description NVARCHAR(500),
	@OrganizationIssued NVARCHAR(50),
	@InforSign NVARCHAR(30),
	@Keyword NVARCHAR(100),
	@Mode NVARCHAR(100),
	@Autograph NVARCHAR(2000),
	@FormatId INT,
	@ComputerFileId INT,
	@ConfidenceLevelId INT,
	@UpdatedDate DATE,
	@UpdatedBy NVARCHAR(100),
	@IsDeleted BIT,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @profileID INT;
		DECLARE @gearBoxId INT;
		DECLARE @gearBoxNewId INT;
		SET @profileID = (SELECT TOP 1 S_VanBan.HoSoID 
						FROM S_VanBan 
						WHERE S_VanBan .VanBanID = @DocumentId);
		SET @gearBoxId = (SELECT TOP 1 HopSoID FROM S_HoSo WHERE HoSoID = @profileID);
		SET @gearBoxNewId = (SELECT TOP 1 HopSoID FROM S_HoSo WHERE HoSoID = @FileId);
		IF @gearBoxId IS NOT NULL AND @gearBoxId != 0 AND @gearBoxId != @gearBoxNewId
			BEGIN
				BEGIN
					-- CẬP NHẬT SỐ LƯƠNG VĂN BẢN CHO HỘP SỐ
					UPDATE S_HopSo
					SET SoLuongVanBan = SoLuongVanBan + 1 WHERE HopSoID = @gearBoxNewId;

					-- CẬP NHẬT SỐ LƯƠNG VĂN BẢN CHO HỘP SỐ CŨ
					IF (SELECT TOP 1 SoLuongVanBan FROM S_HopSo WHERE HopSoID = @gearBoxId) > 0 AND (SELECT TOP 1 SoLuongVanBan FROM S_HopSo WHERE HopSoID = @gearBoxId) IS NOT NULL
						BEGIN
							UPDATE S_HopSo
							SET SoLuongVanBan = SoLuongVanBan - 1 WHERE HopSoID = @gearBoxId;
						END
				END
			END
		
		UPDATE S_VanBan
		SET
			HoSoID = @FileId, 
			MaDinhDanh = @DocumentCode,					
			STTVanBan = @DocOrdinal, 
			LoaiVanBanID = @DocTypeId, 
			SoVanBan = @CodeNumber, 
			KyHieuVanBan = @CodeNotation, 
			NoiDung = @Subject, 
			NgonNguID = @LanguageId, 
			SoTo = @PageAmount,
			GhiChu = @Description,
			CoQuanToChucBanHanh = @OrganizationIssued,
			KyHieuThongTin = @InforSign,
			TuKhoa = @Keyword,
			ButTich = @Autograph,
			TinhTrangVatLyID = @FormatId,
			MucDoTinCayID = @ConfidenceLevelId,
			ComputerFileID = @ComputerFileId,
			NgayVanBan = @IssuedDate,
			isDeleted = @IsDeleted, 
			NgayCapNhat = @UpdatedDate, 
			NguoiChinhSua = @UpdatedBy
		WHERE S_VanBan.VanBanID = @DocumentId
		SET @ErrorCode = '0'
		SET @ErrorMessage = N''
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DOCUMENT_GET_ALL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DOCUMENT_GET_ALL]
	-- Add the parameters for the stored procedure here
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	BEGIN TRY
		SELECT 
			VanBanId as DocumentId,
			HoSoID as DocumentId, 
			MaDinhDanh as DocumentCode, 
			STTVanBan as DocOrdinal, 
			LoaiVanBanID as DocumentTypeId, 
			SoVanBan as CodeNumber, 
			KyHieuVanBan as CodeNotation, 
			NoiDung as Subject, 
			NgonNguID as LanguageId, 
			SoTo as PageAmount, 
			S_VanBan.GhiChu as 'Description', 
			KyHieuThongTin as InforSign, 
			TuKhoa as Keyword, 
			ButTich as Autograph, 
			TinhTrangVatLyID as 'Format', 
			MucDoTinCayID as ConfidenceLevelId, 
			ComputerFileID as ComputerFileId, 
			NgayVanBan as IssuedDate
		FROM S_VanBan
		WITH (NOLOCK)
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DOCUMENT_GET_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DOCUMENT_GET_BY_ID]
	-- Add the parameters for the stored procedure here
	@DocumentId INT,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT S_VanBan.VanBanID
			FROM S_VanBan
			WHERE S_VanBan.VanBanID = @DocumentId)
	BEGIN 
		SET @ErrorCode = '1'
		SET @ErrorMessage = 'Không có văn bản này trong cơ sở lưu trữ'
		RETURN; 
	END

	BEGIN TRY
		SELECT S_VanBan.VanBanID as 'DocumentId',
		S_VanBan.MaDinhDanh as 'documentCode',
		S_HoSo.HoSoID as 'FileId',
		S_HoSo.MaHoSo as 'FileCode',
		S_VanBan.STTVanBan as 'DocOrdinal',
		S_LoaiVanBan.TenLoaiVanBan as 'TypeName',
		S_LoaiVanBan.LoaiVanBanID as 'DocTypeId',
		S_VanBan.SoVanBan as 'CodeNumber',
		S_VanBan.KyHieuVanBan as 'CodeNotation',
		S_VanBan.NgayVanBan as 'IssuedDate',
		S_CoQuan.CoQuanID as 'OrganId',
		S_CoQuan.TenCoQuan as 'OrganName',
		S_Phong.PhongID as 'FontId',
		S_MucLucHoSo.MucLucHoSoID as 'TableOfContentId',
		S_HopSo.HopSoID as 'GearBoxId',
		S_VanBan.NoiDung as 'Subject',
		S_VanBan.SoTo as 'PageAmount',
		S_VanBan.GhiChu as 'Description',
		S_VanBan.CoQuanToChucBanHanh as 'OrganizationIssued',
		S_VanBan.[KyHieuThongTin] as 'InforSign',
		S_VanBan.TuKhoa as 'Keyword',
		S_VanBan.CheDoSuDung as 'Mode',
		S_VanBan.ButTich as 'Autograph',
		S_VanBan.CheDoSuDung as 'Mode',
		S_TinhTrangVatLy.TinhTrang as 'Format',
		S_TinhTrangVatLy.TinhTrangVatLyId as 'FormatId',
		NgonNgu.NgonNguId as 'LanguageId',
		NgonNgu.TenNgonNgu as 'Language',
		S_MucDoTinCay.LoaiMucDoTinCay as 'ConfidenceLevel',
		S_MucDoTinCay.MucDoTinCayID as 'ConfidenceLevelId',
		F.FileName as 'ComputerFileName',
		S_VanBan.ComputerFileID as 'ComputerFileId',
		S_VanBan.NguoiTao as 'CreatedBy',
		S_VanBan.NgayTao as 'CreatedDate',
		S_VanBan.NgayCapNhat as 'UpdatedDate',
		S_VanBan.NguoiChinhSua as 'UpdatedBy',
		F.ClientUrl,
		F.ComputerFileID as 'ComputerFileId',
		S_VanBan.Signature
		From S_VanBan
		LEFT JOIN S_HoSo ON S_VanBan.HoSoID = S_HoSo.HoSoID
		LEFT JOIN S_LoaiVanBan ON S_LoaiVanBan.LoaiVanBanID = S_VanBan.LoaiVanBanID
		LEFT JOIN S_HopSo ON S_HopSo.HopSoID = S_HoSo.HopSoID
		LEFT JOIN S_MucLucHoSo ON S_MucLucHoSo.MucLucHoSoID = S_HopSo.MucLucHoSoID
		LEFT JOIN S_LuuTru ON S_LuuTru.LuuTruID = S_MucLucHoSo.LuuTruID
		LEFT JOIN S_Phong ON S_Phong.PhongID = S_LuuTru.PhongID
		LEFT JOIN S_CoQuan ON S_CoQuan.CoQuanID = S_Phong.CoQuanID
		LEFT JOIN NgonNgu ON NgonNgu.NgonNguId = S_VanBan.NgonNguID
		LEFT JOIN S_TinhTrangVatLy on S_TinhTrangVatLy.TinhTrangVatLyId = S_VanBan.TinhTrangVatLyID
		LEFT JOIN S_MucDoTinCay ON S_MucDoTinCay.MucDoTinCayId = S_VanBan.MucDoTinCayId
		LEFT JOIN S_ComputerFile F ON S_VanBan.ComputerFileID = F.ComputerFileID
		WHERE S_VanBan.VanBanID = @DocumentId

		SET @ErrorCode = '0'
		SET @ErrorMessage = 'SUC'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DOCUMENT_GET_BY_SOVANBAN]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DOCUMENT_GET_BY_SOVANBAN]
	-- Add the parameters for the stored procedure here
	@SoVanBan nvarchar(11) = N'',
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT S_VanBan.VanBanID
			FROM S_VanBan
			WHERE S_VanBan.SoVanBan = @SoVanBan)
	BEGIN 
		SET @ErrorCode = '1'
		SET @ErrorMessage = 'Không có văn bản này trong cơ sở lưu trữ'
		RETURN; 
	END

	BEGIN TRY
		SELECT S_VanBan.VanBanID as 'DocumentId'
		From S_VanBan
		WHERE S_VanBan.SoVanBan = @SoVanBan

		SET @ErrorCode = '0'
		SET @ErrorMessage = 'SUC'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DOCUMENT_GET_LIST_BY_FILE_ID_AND_STATUS_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DOCUMENT_GET_LIST_BY_FILE_ID_AND_STATUS_ID]
	-- Add the parameters for the stored procedure here
	@FileId int = 0,
	@StatusID int = 0,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @queryStr NVARCHAR(1000) = '',@temp INT = 0;
	SET @queryStr = 'SELECT * FROM S_VanBan vb WHERE'
	IF @FileId != 0
		BEGIN
			SET @temp =1
			SET @queryStr = @queryStr + ' WHERE vb.ComputerFileID = @FileId	and vb.StatusID = @StatusID'
		END
	IF @StatusID !=0
		IF @temp = 1
			BEGIN
				SET @queryStr = @queryStr + ' and vb.StatusID = @StatusID'
			END
		ELSE 
			BEGIN
				SET @queryStr = @queryStr + ' vb.StatusID = @StatusID'
			END
	IF @temp != 0 
		BEGIN
			SET @queryStr = @queryStr + ' and (vb.isDeleted = 0 or vb.isDeleted IS NULL)' 
		END
	ELSE
		BEGIN
			SET @queryStr = @queryStr + ' (vb.isDeleted = 0 or vb.isDeleted IS NULL)' 
		END
	BEGIN TRY
		EXEC SP_EXECUTESQL @queryStr
		SET @ErrorCode = '0';
		SET @ErrorMessage = 'Lấy dữ liệu thành công';

	END TRY
	BEGIN CATCH
		SET @ErrorCode = '1'
		SET @ErrorMessage = N'Lấy dữ liệu thất bại'
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DOCUMENT_GET_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DOCUMENT_GET_PAGING]
	-- Add the parameters for the stored procedure here
	@FromRecord INT,
	@PageSize INT,
	@InWhere NVARCHAR(MAX) = '',
	@InSort NVARCHAR = '',
	@TotalRecords INT OUTPUT,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
	DECLARE @QUERY nvarchar(max) = '';
	DECLARE @QUERY_TOTAL_ROWS nvarchar(max) = '';
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
    -- Insert statements for procedure here
	SET @QUERY = ' SELECT VanBanID as DocumentId, 
					S_HoSo.MaHoSo as FileCode, 
					MaDinhDanh as DocumentCode, 
					STTVanBan as DocOrdinal, 
					TenLoaiVanBan as TypeName, 
					SoVanBan as CodeNumber, 
					NoiDung as Subject, 
					SoTo as PageAmount,
					Confirmed as Confirmed,
					S_MucDoTinCay.LoaiMucDoTinCay as MucDoTinCay,
					S_MucDoTinCay.LoaiMucDoTinCay as ConfidenceLevel,
					S_VanBan.GhiChu as Description, 
					TinhTrang as Format, 
					S_ComputerFile.Url as FileUrl, 
					NgayVanBan as IssuedDate,
					S_VanBan.Confirmed as Confirmed,
					S_VanBan.Signature as Signature,
					S_VanBan.Status as Status '+
				' FROM S_VanBan ' + 
				' WITH (NOLOCK) ' +
				' LEFT JOIN S_HoSo ON S_HoSo.HoSoId = S_VanBan.HoSoId ' + 
				' LEFT JOIN S_LoaiVanBan ON S_VanBan.LoaiVanBanID = S_LoaiVanBan.LoaiVanBanID ' + 
				' LEFT JOIN S_TinhTrangVatLy ON S_TinhTrangVatLy.TinhTrangVatLyId = S_VanBan.TinhTrangVatLyID ' + 
				' LEFT JOIN S_MucDoTinCay ON S_MucDoTinCay.MucDoTinCayID = S_VanBan.MucDoTinCayID ' + 
				' LEFT JOIN S_ComputerFile ON S_ComputerFile.ComputerFileID = S_VanBan.ComputerFileID ' + 
				' WHERE 1 = 1 ' + @InWhere +
				' ORDER BY VanBanID DESC ' + 
				' OFFSET ' + CONVERT(NVARCHAR, @FromRecord) + ' ROWS '+
				' FETCH NEXT ' + CONVERT(NVARCHAR, @PageSize) + ' ROW ONLY ';
		
		EXEC SP_EXECUTESQL @QUERY
		PRINT @QUERY
		SET @QUERY_TOTAL_ROWS = ' SELECT @TotalRecords = COUNT(S_VanBan.VanBanID) 
									FROM S_VanBan ' +
									' LEFT JOIN S_HoSo ON S_HoSo.HoSoId = S_VanBan.HoSoId ' + 
									' WHERE ( S_VanBan.isDeleted IS NULL OR S_VanBan.isDeleted = ''false'') ' + @InWhere;
		
		EXEC SP_EXECUTESQL @QUERY_TOTAL_ROWS, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
        SET @ErrorCode = '0';
        SET @ErrorMessage = N'Lấy dữ liệu thành công';
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DOCUMENT_GET_SEARCH]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DOCUMENT_GET_SEARCH]
	-- Add the parameters for the stored procedure here
	@FromRecord INT,
	@PageSize INT,
	@InWhere NVARCHAR(MAX) = '',
	@InSort NVARCHAR = '',
	@TotalRecords INT OUTPUT,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
	DECLARE @QUERY nvarchar(max) = '';
	DECLARE @QUERY_TOTAL_ROWS nvarchar(max) = '';
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
    -- Insert statements for procedure here
	SET @QUERY = ' SELECT S_VanBan.MaDinhDanh as CodeNotation,
					S_VanBan.NoiDung as Subject,
					S_VanBan.NgayVanBan as IssuedDate
				   FROM S_VanBan '+
				   ' WITH (NOLOCK) ' +
			       ' INNER JOIN S_HoSo ON S_VanBan.HoSoID = S_HoSo.HoSoID
					INNER JOIN S_HopSo ON S_HopSo.HopSoID = S_HoSo.HopSoID
					INNER JOIN S_MucLucHoSo ON S_MucLucHoSo.MucLucHoSoID = S_HopSo.MucLucHoSoID
					INNER JOIN S_LuuTru ON S_LuuTru.LuuTruID = S_MucLucHoSo.LuuTruID
					INNER JOIN S_Phong ON S_LuuTru.PhongID = S_Phong.PhongID
					INNER JOIN S_CoQuan ON S_CoQuan.CoQuanID = S_Phong.CoQuanID '+
				' WHERE 1 = 1 ' + @InWhere +
				' ORDER BY VanBanID DESC ' + 
				' OFFSET ' + CONVERT(NVARCHAR, @FromRecord) + ' ROWS '+
				' FETCH NEXT ' + CONVERT(NVARCHAR, @PageSize) + ' ROW ONLY ';
		
		EXEC SP_EXECUTESQL @QUERY
		
		SET @QUERY_TOTAL_ROWS = ' SELECT @TotalRecords = COUNT(S_VanBan.VanBanID) 
									FROM S_VanBan '+
				   ' WITH (NOLOCK) ' +
			       ' INNER JOIN S_HoSo ON S_VanBan.HoSoID = S_HoSo.HoSoID
					INNER JOIN S_HopSo ON S_HopSo.HopSoID = S_HoSo.HopSoID
					INNER JOIN S_MucLucHoSo ON S_MucLucHoSo.MucLucHoSoID = S_HopSo.MucLucHoSoID
					INNER JOIN S_LuuTru ON S_LuuTru.LuuTruID = S_MucLucHoSo.LuuTruID
					INNER JOIN S_Phong ON S_LuuTru.PhongID = S_Phong.PhongID
					INNER JOIN S_CoQuan ON S_CoQuan.CoQuanID = S_Phong.CoQuanID '+
									' WHERE ( S_VanBan.isDeleted IS NULL OR S_VanBan.isDeleted = ''false'') ' + @InWhere;
		PRINT @QUERY
		EXEC SP_EXECUTESQL @QUERY_TOTAL_ROWS, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
        SET @ErrorCode = '0';
        SET @ErrorMessage = N'Lấy dữ liệu thành công';
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[DOCUMENT_TYPE_GET_ALL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DOCUMENT_TYPE_GET_ALL]
	-- Add the parameters for the stored procedure here
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	BEGIN TRY
		SELECT 
			S_LoaiVanBan.LoaiVanBanID as 'DocumentTypeId',
			S_LoaiVanBan.TenLoaiVanBan as 'TypeName'
		FROM S_LoaiVanBan
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DOCUMENT_UPDATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DOCUMENT_UPDATE]
	-- Add the parameters for the stored procedure here
	@DocumentId INT,
	@DocumentCode NVARCHAR(25),
	@DocOrdinal INT,
	@FileId INT,
	@DocTypeId INT,
	@CodeNumber NVARCHAR(11),
	@CodeNotation NVARCHAR(30),
	@IssuedDate DATE,
	@Subject NVARCHAR(500) = '',
	@LanguageId INT,
	@PageAmount INT,
	@Description NVARCHAR(500) = '',
	@OrganizationIssued NVARCHAR(50) = '',
	@InforSign NVARCHAR(30) = '',
	@Keyword NVARCHAR(100) = '',
	@Mode NVARCHAR(20) = '',
	@Autograph NVARCHAR(2000) = '',
	@FormatId INT,
	@ComputerFileId INT,
	--@Status INT,
	--@IsDeleted INT,
	@ConfidenceLevelId INT,
	--@CreatedDate DATE,
	--@CreatedBy NVARCHAR(100),
	@UpdatedBy NVARCHAR(50),
	@Signature INT = 0,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT,
	@Confirmed INT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET NOCOUNT ON;
	IF NOT EXISTS(SELECT S_VanBan.VanBanID from S_VanBan WHERE S_VanBan.SoVanBan = @CodeNumber)
	BEGIN
		SET @ErrorCode = '1'
		SET @ErrorMessage = N'Văn bản không tồn tại'
		RETURN;
	END

	BEGIN TRY
		UPDATE S_VanBan
		SET
			HoSoID = @FileId, 
			MaDinhDanh = @DocumentCode, 
			STTVanBan = @DocOrdinal, 
			LoaiVanBanID= @DocTypeId, 
			SoVanBan = @CodeNumber, 
			KyHieuVanBan = @CodeNotation, 
			NoiDung = @Subject, 
			NgonNguID = @LanguageId, 
			SoTo = @PageAmount,
			GhiChu = @Description,
			CoQuanToChucBanHanh = @OrganizationIssued ,
			KyHieuThongTin = @InforSign,
			TuKhoa = @Keyword,
			CheDoSuDung = @Mode,
			ButTich = @Autograph,
			TinhTrangVatLyID = @FormatId,
			MucDoTinCayID = @ConfidenceLevelId,
			ComputerFileID = @ComputerFileId,
			NgayVanBan = @IssuedDate,
			--isDeleted=@IsDeleted, 
			--NgayTao=@CreatedDate, 
			--NguoiTao=@CreatedBy,
			NguoiChinhSua = @UpdatedBy,
			NgayCapNhat = GETDATE(),
			Status = 1, -- đã sửa
			Signature = @Signature,
			Confirmed = @Confirmed
		WHERE S_VanBan.VanBanID = @DocumentId
		SET @ErrorCode = '0'
		SET @ErrorMessage = N''
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[FONT_CREATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FONT_CREATE]
	-- Add the parameters for the stored procedure here
	@PhongSo NVARCHAR(50) = N'',
	@CoQuanID INT,
	@NgonNguID INT,
	@TenPhong NVARCHAR(50) = N'',
	@LichSu NVARCHAR(500) = N'',
	@NgonNgu NVARCHAR(50) = N'',
	@NgayTao NVARCHAR(100) = '',
	@CongCu NVARCHAR(50) = N'',
	@GhiChu NVARCHAR(300) = N'',
	@isDeleted INT= 0,
	@ErrorCode  INT OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		INSERT INTO S_Phong(
			PhongSo,
			CoQuanID,
			TenPhong,
			LichSu,
			NgonNgu,
			isDeleted,
			GhiChu,
			NgayTao,
			NgonNguID,
			CongCu
		)VALUES(
			@PhongSo,
			@CoQuanID,
			@TenPhong,
			@LichSu,
			@NgonNgu,
			@isDeleted,
			@GhiChu,
			@NgayTao,
			@NgonNguID,
			@CongCu
		)
		SET @ErrorCode = '0'
		SET @ErrorMessage = N'Thêm phông thành công'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[FONT_DELETE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FONT_DELETE]
	-- Add the parameters for the stored procedure here
	@PhongID int,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRY
		IF NOT EXISTS(SELECT S_Phong.PhongID
					  FROM S_Phong 
					  WHERE S_Phong.PhongID = @PhongID)
			BEGIN
				SET @ErrorCode = '1'
				SET @ErrorMessage = N'Không tồn tại phông này'
				RETURN;
			END
		ELSE
			BEGIN
				Update S_Phong SET isDeleted =1
				WHERE S_Phong.PhongID = @PhongID;
				SET @ErrorCode = N'0';
				SET @ErrorMessage = N'Xóa thành công'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[FONT_EDIT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FONT_EDIT]
	-- Add the parameters for the stored procedure here
	@PhongID int,
	@PhongSo NCHAR(50) = N'',
	@CoQuanID INT,
	@NgonNguID INT,
	@TenPhong NVARCHAR(50) = N'',
	@LichSu NVARCHAR(500) = N'',
	@NgonNgu NVARCHAR(50) = N'',
	@CongCu NVARCHAR(50) = N'',
	@GhiChu NVARCHAR(300) = N'',
	@NgayCapNhat NVARCHAR(100) = '',
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		UPDATE S_Phong
		SET S_Phong.CoQuanID = @CoQuanID,S_Phong.PhongSo = @PhongSo,
		S_Phong.TenPhong = @TenPhong,S_Phong.LichSu = @LichSu,
		S_Phong.NgonNgu = @NgonNgu,S_Phong.GhiChu =@GhiChu,S_Phong.NgayCapNhat = @NgayCapNhat,NgonNguID = @NgonNguID,CongCu = @CongCu
		WHERE S_Phong.PhongID = @PhongID
		SET @ErrorCode = '0'
		SET @ErrorMessage = N'Cập nhật thành công'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[FONT_EXPORT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FONT_EXPORT]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT sp.PhongID FontID, sp.TenPhong FontName,sp.PhongSo FontNumber,scq.MaCoQuan OrganCode,scq.TenCoQuan OrganName,sp.NgayTao CreateTime,sp.NgayCapNhat UpdateTime,
			sp.LichSu Lang,nn.TenNgonNgu History,sp.GhiChu Note
			FROM S_Phong sp
			left outer join S_CoQuan scq on scq.CoQuanID = sp.CoQuanID 
			left outer join NgonNgu nn on nn.NgonNguId = sp.NgonNguID  
			WHERE sp.isDeleted = 0 or sp.isDeleted IS NULL
			SET @ErrorCode = N'success';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[FONT_GET_ALL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FONT_GET_ALL]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT sp.PhongID FontID, sp.TenPhong FontName,sp.PhongSo FontNumber,scq.CoQuanID OrganID,scq.TenCoQuan OrganName
			FROM S_Phong sp
			left outer join S_CoQuan scq on scq.CoQuanID = sp.CoQuanID  
			WHERE sp.isDeleted = 0 or sp.isDeleted IS NULL
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[FONT_GET_ALL_GETIDANDNAME_SELECT2]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FONT_GET_ALL_GETIDANDNAME_SELECT2]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT sp.PhongID Id, sp.TenPhong Text
			FROM S_Phong sp
			left outer join S_CoQuan scq on scq.CoQuanID = sp.CoQuanID  
			WHERE (sp.isDeleted = 0 or sp.isDeleted IS NULL) AND (scq.Deleted =0 or scq.Deleted IS NULL)
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[FONT_GET_BY_COQUANID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FONT_GET_BY_COQUANID]
(
	@InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	 @ErrorMessage NVARCHAR(4000) OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	DECLARE @ROWS NVARCHAR(50) = '';
	SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
	BEGIN TRY
		IF @InWhere IS NULL
			BEGIN
				SET @ErrorCode = N'1';
				SET @ErrorMessage = N'Không tồn tại bản ghi.';
				RETURN;
			END
		ELSE
			BEGIN
				SET @query = 'SELECT sp.PhongID FontID, sp.TenPhong FontName,sp.PhongSo FontNumber,scq.CoQuanID OrganID,scq.MaCoQuan organCode, scq.TenCoQuan OrganName,sp.NgayTao CreateTime,sp.NgayCapNhat UpdateTime,
								sp.LichSu Lang,nn.TenNgonNgu History
								FROM S_Phong sp
								inner join S_CoQuan scq on scq.CoQuanID = sp.CoQuanID
								left join NgonNgu nn on nn.NgonNguId = sp.NgonNguID
								where (sp.isDeleted = 0 or sp.isDeleted IS NULL) ' + @InWhere +' ORDER BY ' + @InSort + ' sp.PhongID DESC OFFSET ' + @ROWS + ' ROWS FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY ';
				EXEC SP_EXECUTESQL @query;
				SET @queryRowCount = 'SELECT @TotalRecords = COUNT(sp.PhongID)
										FROM S_Phong sp
										inner join S_CoQuan scq on scq.CoQuanID = sp.CoQuanID
										left join NgonNgu nn on nn.NgonNguId = sp.NgonNguID
										where (sp.isDeleted = 0 or sp.isDeleted IS NULL)'  + @InWhere;
				EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
				SET @ErrorCode = N'0';
				SET @ErrorMessage = N'Lấy dữ liệu thành công';
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END

GO
/****** Object:  StoredProcedure [dbo].[FONT_GET_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FONT_GET_BY_ID]
(
	@PhongID INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF @PhongID IS NULL
		BEGIN
			SET @ErrorCode = N'1';
			SET @ErrorMessage = N'Không tồn tại bản ghi.';
			RETURN;
		END
		ELSE
		BEGIN
			SELECT sp.PhongID FontID, sp.TenPhong FontName,sp.PhongSo FontNumber,scq.CoQuanID OrganID,scq.TenCoQuan OrganName,sp.NgayTao CreateTime,sp.NgayCapNhat UpdateTime,
			nn.TenNgonNgu Lang,sp.LichSu History,sp.GhiChu note,nn.NgonNguId LanguageId,sp.CongCu LookupTools
			FROM S_Phong sp
			inner join S_CoQuan scq on scq.CoQuanID = sp.CoQuanID
			left join NgonNgu nn on nn.NgonNguId = sp.NgonNguID
			WHERE sp.PhongID = @PhongID
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[FONT_GET_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FONT_GET_PAGING]
(
	@InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	BEGIN TRY
			DECLARE @ROWS NVARCHAR(50) = '';
			SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
		BEGIN
			SET @query = 'SELECT sp.PhongID FontID, sp.TenPhong FontName,sp.PhongSo FontNumber,scq.MaCoQuan OrganCode,scq.CoQuanID OrganID,scq.TenCoQuan OrganName,sp.NgayTao CreateTime,sp.NgayCapNhat UpdateTime,
							sp.LichSu Lang,nn.TenNgonNgu History,sp.GhiChu Note
							FROM S_Phong sp
							left outer join S_CoQuan scq on scq.CoQuanID = sp.CoQuanID  
							left outer join NgonNgu nn on nn.NgonNguId = sp.NgonNguID  
							WHERE (sp.isDeleted = 0 or sp.isDeleted IS NULL) ' + @InWhere + ' ORDER BY ' + @InSort + ' sp.PhongID DESC ' + ' OFFSET ' + @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY ';
			EXEC SP_EXECUTESQL @query;
            SET @queryRowCount = 'SELECT @TotalRecords = COUNT(sp.PhongID)
									FROM S_Phong sp
									left outer join S_CoQuan scq on scq.CoQuanID = sp.CoQuanID  
									left outer join NgonNgu nn on nn.NgonNguId = sp.NgonNguID  
									WHERE (sp.isDeleted = 0 or sp.isDeleted IS NULL) ' + @InWhere;
            EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[FONT_SEARCH]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FONT_SEARCH]
( 
	@SearchStr	  NVARCHAR(300),
	@FromDate     date,
	@ToDate		  date,
	@PhongID      INT,
	@CoQuanID     INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF @PhongID IS NULL
			BEGIN
				SET @ErrorCode = N'1';
				SET @ErrorMessage = N'Không tồn tại bản ghi.';
				RETURN;
		END
		ELSE
			BEGIN
				SELECT sp.PhongID FontID, sp.TenPhong FontName,sp.PhongSo FontNumber,scq.CoQuanID OrganID,scq.TenCoQuan OrganName,sp.NgayTao CreateTime,sp.NgayCapNhat UpdateTime,
				sp.LichSu Lang,nn.TenNgonNgu History
				FROM S_Phong sp
				left outer join S_CoQuan scq on scq.CoQuanID = sp.CoQuanID  
				left outer join NgonNgu nn on nn.NgonNguId = sp.NgonNguID  
				WHERE (sp.PhongSo LIKE + '%' + @SearchStr + '%' or sp.TenPhong LIKE  + '%' + @SearchStr + '%') and (sp.isDeleted = 0 or sp.isDeleted IS NULL)
				--IF @PhongID IS NOT NULL
				--	and sp.PhongID = @PhongID
				--IF @CoQuanID IS NOT NULL 
				--	and sp.CoQuanID = @CoQuanID
				--IF @FromDate IS NOT NULL 
				--	and (sp.NgayTao >= @FromDate or sp.NgayCapNhat >= @FromDate)
				--IF @ToDate IS NOT NULL 
				--	and (sp.NgayTao >= @ToDate or sp.NgayCapNhat >= @ToDate)
				SET @ErrorCode = N'0';
				SET @ErrorMessage = N'';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[FORMAT_GET_ALL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FORMAT_GET_ALL]
	-- Add the parameters for the stored procedure here
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	BEGIN TRY
		SELECT 
			S_TinhTrangVatLy.TinhTrangVatLyId as 'FormatId',
			S_TinhTrangVatLy.TinhTrang as 'FormatName'
		FROM S_TinhTrangVatLy
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[GearBox_DELETE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GearBox_DELETE]
(
	@HopSoID INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF NOT EXISTS(SELECT S_HopSo.HopSoID
					  FROM S_HopSo 
					  WHERE S_HopSo.HopSoID = @HopSoID)
			BEGIN
				SET @ErrorCode = '1'
				SET @ErrorMessage = N'Không tồn tại hộp số này'
				RETURN;
			END
		ELSE
			IF EXISTS(SELECT HopSoID
					  FROM S_HoSo 
					  WHERE HopSoID = @HopSoID)
				BEGIN
					SET @ErrorCode = '1'
					SET @ErrorMessage = N'Không thể xóa hộp số'
					RETURN;
				END
			ELSE
				BEGIN
					Update S_HopSo SET isDeleted =1
					WHERE S_HopSo.HopSoID = @HopSoID;
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'Xóa thành công'
				END

	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GearBox_EDIT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GearBox_EDIT]
	-- Add the parameters for the stored procedure here
	@HopSoID INT,
	@MaHopSo NVARCHAR(50) = N'',
	@TieuDeHopSo NVARCHAR(50) = N'',
	@MucLucHoSoID INT,
	@NgayCapNhat DATE,
	@isDeleted INT =0,
	@GhiChu NVARCHAR(300) =N'',
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	    BEGIN TRY
		IF @HopSoID IS NOT NULL
			Begin
					IF (Select COUNT(shs.HopSoID) from S_HopSo shs inner join S_MucLucHoSo sm on sm.MucLucHoSoID = shs.MucLucHoSoID where
																													shs.MaHopSo = @MaHopSo
																													and shs.HopSoID != @HopSoID and sm.MucLucHoSoID = @MucLucHoSoID) >= 1
						BEGIN
							SET @ErrorCode = '1';
							SET @ErrorMessage = N'Hộp số đã tồn tại trên hệ thống, vui lòng thử lại.';
							RETURN;
						END
					ELSE
						BEGIN
							UPDATE S_HopSo
							SET MaHopSo = @MaHopSo,TieuDeHopSo = @TieuDeHopSo,NgayCapNhat = @NgayCapNhat,isDeleted = @isDeleted
							,MucLucHoSoID = @MucLucHoSoID,GhiChu = @GhiChu
							WHERE HopSoID = @HopSoID
							SET @ErrorCode = '0'
							SET @ErrorMessage = N''
						END
			End
		ELSE
			BEGIN
				SET @ErrorCode = '1'
				SET @ErrorMessage = N'Cập nhật thất bại mời bạn thử lại'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[GearBox_EXPORT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GearBox_EXPORT]
(
	@FromDate DATETIME = NULL,
	@ToDate	  DATETIME  = NULL,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT DISTINCT sh.HopSoID, sh.HopSoID GearBoxID,sh.MucLucHoSoID TabOfContID,sh.TieuDeHopSo GearBoxTitle,sh.MaHopSo GearBoxName,
			sh.NgayBatDau StartDate,sh.NgayKetThuc EndDate,
			hsCount.num_Profile AS ProfileCount,
			hsCount.MaHoSo ProfileCode,
			hsCount.DocCount AS DocCount,
			hsCount.SoTo AS NumDoc,
			sh.GhiChu AS Note,
			DATEDIFF(month, sh.NgayBatDau, sh.NgayKetThuc) AS Preservationperiod
			FROM S_HopSo sh
			LEFT OUTER JOIN S_MucLucHoSo sm on sm.MucLucHoSoID =  sh.MucLucHoSoID
			LEFT OUTER JOIN 
				(SELECT HopSoID,MaHoSo, COUNT(HopSoID) AS num_Profile ,vbCount.num_Doc AS DocCount,vbCount.SoTo AS SoTo
				 FROM S_HoSo LEFT OUTER JOIN 
								(SELECT HoSoID,SUM(SoTo) AS SoTo, COUNT(VanBanID) AS num_Doc 
								 FROM S_VanBan
								 WHERE (IsDeleted = 0 or IsDeleted IS NULL)
								 GROUP BY HoSoID
								) vbCount
							ON S_HoSo.HoSoID = vbCount.HoSoID
				 WHERE (IsDeleted = 0 or IsDeleted IS NULL)
				 GROUP BY HopSoID,MaHoSo,vbCount.num_Doc,vbCount.SoTo
				) hsCount
			ON sh.HopSoID = hsCount.HopSoID
			WHERE sh.isDeleted = 0 or sh.isDeleted IS NULL
			GROUP BY sh.HopSoID, sh.TieuDeHopSo,sh.MucLucHoSoID,sh.MaHopSo,sh.NgayBatDau,sh.NgayKetThuc,sh.GhiChu,hsCount.num_Profile
			,hsCount.MaHoSo,hsCount.DocCount,hsCount.SoTo -- **NOTE** - see discussion below
			ORDER BY ProfileCount DESC, GearBoxName ASC;  
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GearBox_GET_ALL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GearBox_GET_ALL]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT sh.HopSoID GearBoxID,sh.TieuDeHopSo GearBoxTitle,sh.MaHopSo GearBoxName
			FROM S_HopSo sh WITH (NOLOCK)
			WHERE sh.isDeleted = 0 or sh.isDeleted IS NULL
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GearBox_GET_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GearBox_GET_BY_ID]
(
	@HopSoID INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT sh.HopSoID GearBoxID,sh.MaHopSo GearBoxCode, sh.MucLucHoSoID TabOfContID,sm.TenMucLucHoSo TableOfContName, sh.TieuDeHopSo GearBoxTitle,sh.MaHopSo GearBoxName,
			sh.NgayBatDau StartDate,sh.NgayKetThuc EndDate,sh.Status Status,
			sh.GhiChu Note,sm.MaDanhMuc TabOfContCode,sm.MucLucSo TabOfContNumber,
			sp.PhongID FontID,
			cq.CoQuanID OrganID,
			hsCount.num_Profile AS ProfileCount,
			DATEDIFF(month, sh.NgayBatDau, sh.NgayKetThuc) AS Preservationperiod,
			sp.TenPhong FontName, cq.TenCoQuan OrganName
			FROM S_HopSo sh
			LEFT OUTER JOIN S_MucLucHoSo sm on sm.MucLucHoSoID =  sh.MucLucHoSoID
			INNER JOIN S_LuuTru sl on sl.LuuTruID = sm.LuuTruID
			INNER JOIN S_Phong sp on sp.PhongID = sl.PhongID
			INNER JOIN S_CoQuan cq on sp.CoQuanID = cq.CoQuanID
			LEFT OUTER JOIN 
				(SELECT HopSoID, COUNT(HopSoID) AS num_Profile 
				 FROM S_HoSo
				 GROUP BY HopSoID
				) hsCount
			ON sh.HopSoID = hsCount.HopSoID
			-- GROUP BY t1.team_id, t1.team_name, t1.season_id  -- **NOTE** - see discussion below
			WHERE sh.HopSoID = @HopSoID and (sh.isDeleted = 0 or sh.isDeleted IS NULL)
			ORDER BY ProfileCount DESC, GearBoxName ASC;  
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GEARBOX_GET_BY_TABLE_OF_CONTENT_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GEARBOX_GET_BY_TABLE_OF_CONTENT_ID]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT S_HopSo.HopSoID
			FROM S_HopSo
			WHERE S_HopSo.MucLucHoSoID = @Id)

	BEGIN 
		SET @ErrorCode = '1'
		SET @ErrorMessage = 'Không có hộp số này trong cơ sở lưu trữ'
		RETURN; 
	END

	BEGIN TRY
		SELECT S_HopSo.HopSoID as 'GearBoxID',
				S_HopSo.MaHopSo as 'GearBoxCode',
				S_HopSo.TieuDeHopSo as 'GearBoxName',
				S_HopSo.Status
		FROM S_HopSo WITH (NOLOCK)
		WHERE S_HopSo.MucLucHoSoID = @Id

		SET @ErrorCode = '0'
		SET @ErrorMessage = 'SUC'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[GearBox_GET_BY_TABLEOFCONTID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GearBox_GET_BY_TABLEOFCONTID]
(
	 @InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	 @ErrorMessage NVARCHAR(4000) OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	DECLARE @ROWS NVARCHAR(50) = '';
	SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
	BEGIN TRY
		IF @InWhere IS NULL
			BEGIN
				SET @ErrorCode = N'1';
				SET @ErrorMessage = N'Không tồn tại bản ghi.';
				RETURN;
			END
		ELSE
			BEGIN
				SET @query = 'SELECT sh.HopSoID GearBoxID,sh.MucLucHoSoID TabOfContID,sh.TieuDeHopSo GearBoxTitle,sh.MaHopSo GearBoxCode,
				hsCount.num_Profile AS ProfileCount,
				sh.GhiChu Note,
				sh.SoLuongVanBan AS NumDoc,
				DATEDIFF(month, sh.NgayBatDau, sh.NgayKetThuc) AS Preservationperiod
				FROM S_HopSo sh
				INNER JOIN S_MucLucHoSo sm on sm.MucLucHoSoID =  sh.MucLucHoSoID
				LEFT OUTER JOIN 
					(SELECT HopSoID, COUNT(HopSoID) AS num_Profile 
					 FROM S_HoSo WHERE IsDeleted = 0 or IsDeleted IS NULL
					 GROUP BY HopSoID
					) hsCount
				ON sh.HopSoID = hsCount.HopSoID
				WHERE (sh.isDeleted = 0 or sh.isDeleted IS NULL)  AND (sm.isDeleted = 0 or sm.isDeleted IS NULL)' + @InWhere + ' ORDER BY ' + @InSort + ' ProfileCount DESC, GearBoxCode ASC ' + ' OFFSET ' + @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY ';
					EXEC SP_EXECUTESQL @query;
				SET @queryRowCount = 'SELECT @TotalRecords = Count(sh.HopSoID)
									FROM S_HopSo sh
									INNER JOIN S_MucLucHoSo sm on sm.MucLucHoSoID =  sh.MucLucHoSoID
									LEFT OUTER JOIN 
										(SELECT HopSoID, COUNT(HopSoID) AS num_Profile 
										 FROM S_HoSo WHERE IsDeleted = 0 or IsDeleted IS NULL
										 GROUP BY HopSoID
										) hsCount
									ON sh.HopSoID = hsCount.HopSoID
									WHERE (sh.isDeleted = 0 or sh.isDeleted IS NULL)  AND (sm.isDeleted = 0 or sm.isDeleted IS NULL)
										 ' + @InWhere;
				EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
				SET @ErrorCode = N'0';
				SET @ErrorMessage = N'Lấy dữ liệu thành công';
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GearBox_GET_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GearBox_GET_PAGING]
(
	@InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	BEGIN TRY
			DECLARE @ROWS NVARCHAR(50) = '';
			SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
		BEGIN
		SET @query = 'SELECT sh.HopSoID GearBoxID,sh.MucLucHoSoID TabOfContID,sm.MucLucSo TabOfContNumber,sm.MaDanhMuc TabOfContCode,sh.TieuDeHopSo GearBoxTitle,sh.MaHopSo GearBoxName,
			sh.MaHopSo gearBoxCode,sh.Status Status,
			hsCount.num_Profile AS ProfileCount,
			sh.GhiChu Note,
			sh.SoLuongVanBan AS NumDoc,
			DATEDIFF(month, sh.NgayBatDau, sh.NgayKetThuc) AS Preservationperiod
			FROM S_HopSo sh
			INNER JOIN S_MucLucHoSo sm on sm.MucLucHoSoID =  sh.MucLucHoSoID
			LEFT OUTER JOIN 
				(SELECT HopSoID, COUNT(HopSoID) AS num_Profile 
				 FROM S_HoSo WHERE IsDeleted = 0 or IsDeleted IS NULL
				 GROUP BY HopSoID
				) hsCount
			ON sh.HopSoID = hsCount.HopSoID
			WHERE (sh.isDeleted = 0 or sh.isDeleted IS NULL) AND (sm.isDeleted = 0 or sm.isDeleted IS NULL) ' + @InWhere + ' ORDER BY ' + @InSort + ' ProfileCount DESC, GearBoxName ASC ' + ' OFFSET ' + @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY ';
			EXEC SP_EXECUTESQL @query;
			SET @queryRowCount = 'SELECT @TotalRecords = Count(sh.HopSoID)
								FROM S_HopSo sh
								INNER JOIN S_MucLucHoSo sm on sm.MucLucHoSoID =  sh.MucLucHoSoID
								LEFT OUTER JOIN 
									(SELECT HopSoID, COUNT(HopSoID) AS num_Profile 
									 FROM S_HoSo WHERE IsDeleted = 0 or IsDeleted IS NULL
									 GROUP BY HopSoID
									) hsCount
								ON sh.HopSoID = hsCount.HopSoID
								WHERE (sh.isDeleted = 0 or sh.isDeleted IS NULL) AND (sm.isDeleted = 0 or sm.isDeleted IS NULL)
									 ' + @InWhere;
            EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GearBox_INSERT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GearBox_INSERT]
(
	@MaHopSo nvarchar(50),
	@TieuDeHopSo nvarchar(50) = N'',
	@MucLucHoSoID INT,
	@NgayTao nvarchar(50),
	@isDeleted INT =0,
	@Status INT =3,
	@GhiChu Nvarchar(500) = N'',
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF EXISTS (Select shs.HopSoID from S_HopSo shs inner join S_MucLucHoSo sm on sm.MucLucHoSoID = shs.MucLucHoSoID where
																													shs.MaHopSo = @MaHopSo and shs.MucLucHoSoID = @MucLucHoSoID)
			BEGIN
				SET @ErrorCode = 1;
				SET @ErrorMessage = N'Hộp số đã tồn tại trên hệ thống, vui lòng thử lại.';
				RETURN;
			END
		ELSE
			BEGIN
				IF EXISTS (Select cm.StatusID FROM CommonStatus cm where StatusID = @Status )
					BEGIN
						INSERT INTO S_HopSo(MaHopSo,TieuDeHopSo,MucLucHoSoID,GhiChu,NgayTao,isDeleted,Status,SoLuongVanBan) VALUES(@MaHopSo,@TieuDeHopSo,@MucLucHoSoID,@GhiChu,@NgayTao,@isDeleted,@Status,0)
						SET @ErrorCode = N'0';
						SET @ErrorMessage = N'';
					END
				ElSE
					BEGIN
						INSERT INTO S_HopSo(MaHopSo,TieuDeHopSo,MucLucHoSoID,GhiChu,NgayTao,isDeleted,Status,SoLuongVanBan) VALUES(@MaHopSo,@TieuDeHopSo,@MucLucHoSoID,@GhiChu,@NgayTao,@isDeleted,3,0)
						SET @ErrorCode = N'0';
						SET @ErrorMessage = N'';
					END

			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_HUYEN_BY_TINH_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_ALL_HUYEN_BY_TINH_ID]
(
	@TinhID	  INT =0,
	@FromRecord INT,
	@PageSize INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
	BEGIN TRY

		IF (SELECT DiaChi.TinhID FROM DiaChi WHERE DiaChi.TinhID =@TinhID) IS NULL
			BEGIN
				SET @ErrorCode = N'0';
				SET @ErrorMessage = N'Lấy dữ liệu thất bại';
			END
		ELSE 

			BEGIN
				SELECT *
				FROM DiaChi dc 
				left outer join Tinh t on dc.TinhID = t.TinhID
				WHERE dc.TinhID = @TinhID
				ORDER BY dc.DiaChiID DESC
				OFFSET CONVERT(INT, @FromRecord) ROWS 
				FETCH NEXT CONVERT(INT, @PageSize) ROWS ONLY
				SET @ErrorCode = N'1';
				SET @ErrorMessage = N'Lấy dữ liệu thành công';
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_XAPHUONG_BY_HUYEN_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_ALL_XAPHUONG_BY_HUYEN_ID]
(
	@TinhID	  INT =0,
	@FromRecord INT,
	@PageSize INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
	BEGIN TRY

		IF (SELECT DiaChi.TinhID FROM DiaChi WHERE DiaChi.TinhID =@TinhID) IS NULL
			BEGIN
				SET @ErrorCode = N'0';
				SET @ErrorMessage = N'Lấy dữ liệu thất bại';
			END
		ELSE 

			BEGIN
				SELECT *
				FROM DiaChi dc 
				left outer join Tinh t on dc.TinhID = t.TinhID
				WHERE dc.TinhID = @TinhID
				ORDER BY dc.DiaChiID DESC
				OFFSET CONVERT(INT, @FromRecord) ROWS 
				FETCH NEXT CONVERT(INT, @PageSize) ROWS ONLY
				SET @ErrorCode = N'1';
				SET @ErrorMessage = N'Lấy dữ liệu thành công';
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GET_DATA_DOCUMENT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GET_DATA_DOCUMENT]
	 @InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	 @ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	BEGIN TRY
			DECLARE @ROWS NVARCHAR(50) = '';
			SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
		BEGIN
				SET @query = 'SELECT S_HoSo.MaHoSo as FileCode, 
					MaDinhDanh as DocumentCode, 
					STTVanBan as DocOrdinal, 
					TenLoaiVanBan as TypeName, 
					SoVanBan as CodeNumber, 
					NoiDung as Subject, 
					SoTo as PageAmount, 
					S_VanBan.GhiChu as Description, 
					TinhTrang as Format, 
					S_ComputerFile.Url as FileUrl, 
					NgayVanBan as IssuedDate,
					S_VanBan.Confirmed as Confirmed,
					S_VanBan.NgayTao as CreateTime
				FROM S_VanBan
				WITH (NOLOCK) 
				LEFT JOIN S_HoSo ON S_HoSo.HoSoId = S_VanBan.HoSoId  
				LEFT JOIN S_LoaiVanBan ON S_VanBan.LoaiVanBanID = S_LoaiVanBan.LoaiVanBanID 
				LEFT JOIN S_TinhTrangVatLy ON S_TinhTrangVatLy.TinhTrangVatLyId = S_VanBan.TinhTrangVatLyID 
				LEFT JOIN S_MucDoTinCay ON S_MucDoTinCay.MucDoTinCayID = S_VanBan.MucDoTinCayID 
				LEFT JOIN S_ComputerFile ON S_ComputerFile.ComputerFileID = S_VanBan.ComputerFileID 
				WHERE (S_VanBan.isDeleted = 0 Or S_VanBan.isDeleted IS NULL) '
				    + @InWhere + ' ORDER BY ' + @InSort + ' S_VanBan.VanBanID DESC ' + ' OFFSET ' 
					+ @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) 
					+ ' ROWS ONLY ';
			EXEC SP_EXECUTESQL @query;
            SET @queryRowCount = 'SET @TotalRecords = (SELECT COUNT(S_VanBan.VanBanID)
							FROM S_VanBan
				WITH (NOLOCK) 
				LEFT JOIN S_HoSo ON S_HoSo.HoSoId = S_VanBan.HoSoId  
				LEFT JOIN S_LoaiVanBan ON S_VanBan.LoaiVanBanID = S_LoaiVanBan.LoaiVanBanID 
				LEFT JOIN S_TinhTrangVatLy ON S_TinhTrangVatLy.TinhTrangVatLyId = S_VanBan.TinhTrangVatLyID 
				LEFT JOIN S_MucDoTinCay ON S_MucDoTinCay.MucDoTinCayID = S_VanBan.MucDoTinCayID 
				LEFT JOIN S_ComputerFile ON S_ComputerFile.ComputerFileID = S_VanBan.ComputerFileID 
				WHERE (S_VanBan.isDeleted = 0 Or S_VanBan.isDeleted IS NULL) ' + @InWhere + ')';
            EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GET_DATA_PROFILES]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_DATA_PROFILES]
	 @InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	 @ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	BEGIN TRY
			DECLARE @ROWS NVARCHAR(50) = '';
			SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
		BEGIN
				SET @query = 'SELECT hs.HoSoID AS ProfileId,
					hs.MaHoSo AS FileCode,
					hs.NgayTao AS CreateTime,
					hs.ThoiGianBatDau AS StartTime,
					hs.ThoiGianKetThuc AS EndTime,
					hps.MaHopSo AS GearBoxCode,
					lhs.TenLoaiHoSo AS ProfileTypeName,
					hs.TieuDeHoSo AS Title,
					hps.TieuDeHopSo AS GearBoxTitle,
					hs.TinhTrangVatLy AS Format,
					hs.ThoiHanBaoQuan AS Maintenance,
					hs.GhiChu AS Description,
					hs.Status
				    FROM S_HoSo hs INNER JOIN S_LoaiHoSo lhs ON hs.LoaiHoSoID = lhs.LoaiHoSoID
				    INNER JOIN S_HopSo hps ON hs.HopSoID = hps.HopSoID WHERE (hs.IsDeleted = 0 OR hs.IsDeleted IS NULL) '
				    + @InWhere + ' ORDER BY ' + @InSort + ' hs.HoSoID DESC ' + ' OFFSET ' 
					+ @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) 
					+ ' ROWS ONLY ';
			EXEC SP_EXECUTESQL @query;
            SET @queryRowCount = 'SET @TotalRecords = (SELECT COUNT(hs.HoSoID)
							FROM S_HoSo hs
							INNER JOIN S_LoaiHoSo lhs ON hs.LoaiHoSoID = lhs.LoaiHoSoID
							INNER JOIN S_HopSo hps ON hs.HopSoID = hps.HopSoID WHERE (hs.IsDeleted = 0 OR hs.IsDeleted IS NULL) ' + @InWhere + ')';
            EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GET_DATA_STATISTICS]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_DATA_STATISTICS]
	 @InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	 @ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	BEGIN TRY
			DECLARE @ROWS NVARCHAR(50) = '';
			SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
		BEGIN
			SET @query = 'SELECT sp.TenPhong FontName,ml.MucLucSo TableOfNumber,hs.MaHopSo GearBoxCode,hso.MaHoSo ProfileCode,f.FileName FileName,vb.SoVanBan DocNumber,f.ComputerFileID ComputerFileID,vb.NgayCapNhat UpdateDate
						  FROM S_Phong sp
						  left outer join S_LuuTru lt on sp.PhongID = lt.PhongID
						  left outer join S_MucLucHoSo ml on ml.LuuTruID = lt.LuuTruID
						  left outer join S_HopSo hs on hs.MucLucHoSoID = ml.MucLucHoSoID
						  left outer join S_HoSo hso on hso.HopSoID = hs.HopSoID
						  left outer join S_VanBan vb on vb.HoSoID = hso.HoSoID
						  left outer join S_ComputerFile f on f.ComputerFileID = vb.ComputerFileID
						  WHERE (sp.isDeleted = 0 or sp.isDeleted IS NULL) and (ml.isDeleted = 0 or ml.isDeleted IS NULL)
						  and (hs.isDeleted = 0 or hs.isDeleted IS NULL) and (hso.isDeleted = 0 or hso.isDeleted IS NULL)
						  and (vb.isDeleted = 0 or vb.isDeleted IS NULL) and (f.isDeleted = 0 or f.isDeleted IS NULL) ' 
						 + @InWhere + ' ORDER BY ' + @InSort + ' sp.PhongID DESC ' + ' OFFSET ' 
						 + @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) 
						 + ' ROWS ONLY ';
			EXEC SP_EXECUTESQL @query;
            SET @queryRowCount = 'SELECT @TotalRecords = COUNT(sp.PhongID)
								  FROM S_Phong sp
								  left outer join S_LuuTru lt on sp.PhongID = lt.PhongID
								  left outer join S_MucLucHoSo ml on ml.LuuTruID = lt.LuuTruID
								  left outer join S_HopSo hs on hs.MucLucHoSoID = ml.MucLucHoSoID
								  left outer join S_HoSo hso on hso.HopSoID = hs.HopSoID
								  left outer join S_VanBan vb on vb.HoSoID = hso.HoSoID
								  left outer join S_ComputerFile f on f.ComputerFileID = vb.ComputerFileID
								  WHERE (sp.isDeleted = 0 or sp.isDeleted IS NULL) and (ml.isDeleted = 0 or ml.isDeleted IS NULL)
								  and (hs.isDeleted = 0 or hs.isDeleted IS NULL) and (hso.isDeleted = 0 or hso.isDeleted IS NULL)
								  and (vb.isDeleted = 0 or vb.isDeleted IS NULL) and (f.isDeleted = 0 or f.isDeleted IS NULL) ' 
								  + @InWhere;
            EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GET_FONTS_BY_ORGAN_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GET_FONTS_BY_ORGAN_ID]
(
	@CoQuanID	  INT =0,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
	BEGIN TRY
		BEGIN
			IF @CoQuanID <> 0
				BEGIN
					SELECT sp.PhongID AS FontID,sp.TenPhong FontName
					FROM S_Phong sp WHERE sp.CoQuanID = @CoQuanID AND (sp.isDeleted = 0 OR sp.isDeleted IS NULL)
					ORDER BY sp.PhongID DESC
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'Lấy dữ liệu thành công';
				END
			ELSE
				BEGIN
					SET @ErrorCode = N'-1';
					SET @ErrorMessage = N'Lấy dữ liệu thất bại ';
				END
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GET_FONTS_BY_ORGAN_ID_Select2]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_FONTS_BY_ORGAN_ID_Select2]
(
	@CoQuanID	  INT =0,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
	BEGIN TRY
		BEGIN
			IF @CoQuanID <> 0
				BEGIN
					SELECT sp.PhongID AS Id,sp.TenPhong Text
					FROM S_Phong sp WHERE sp.CoQuanID = @CoQuanID AND (sp.isDeleted = 0 OR sp.isDeleted IS NULL)
					ORDER BY sp.PhongID DESC
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'Lấy dữ liệu thành công';
				END
			ELSE
				BEGIN
					SET @ErrorCode = N'-1';
					SET @ErrorMessage = N'Lấy dữ liệu thất bại ';
				END
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GET_LOG_OF_USER_ACTIVITY]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_LOG_OF_USER_ACTIVITY]
	 @InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	 @ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	BEGIN TRY
			DECLARE @ROWS NVARCHAR(50) = '';
			SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
			--LEFT JOIN S_Role_URL ru ON (r.RoleID = ru.RoleID)
			--LEFT JOIN S_Menu m ON (ru.MenuId = m.MenuId)
			--m.MenuRole as menuRole,
			--				m.MenuName
		BEGIN
			SET @query = 'SELECT us.UserName UserName,us.UserID UserID,vb.GhiChu Content,
						 vb.SoVanBan ProfileNumber, vb.NguoiTao CreatorName,
						 vb.NguoiChinhSua UpdatorName,vb.NgayCapNhat UpdateDate,
						 vb.NgayTao CreateDate, vb.MaDinhDanh MaDinhDanh, vb.STTVanBan STTVanBan
						 FROM dbo.S_Users us
						 INNER JOIN (SELECT * FROM S_VanBan vbc WHERE vbc.NguoiTao IS NOT NULL
									UNION ALL
									SELECT * FROM S_VanBan vbu WHERE vbu.NguoiChinhSua IS NOT NULL
									) AS vb
						 on (vb.NguoiTao = us.UserName or vb.NguoiChinhSua = us.UserName)
						 WHERE ((us.isDeleted = 0) OR (us.isDeleted IS NULL)) and (us.status = 1) 
						 and ((vb.isDeleted = 0) OR (vb.isDeleted IS NULL)) ' 
						 + @InWhere + ' ORDER BY ' + @InSort + ' us.UserID DESC ' + ' OFFSET ' 
						 + @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) 
						 + ' ROWS ONLY ';
			EXEC SP_EXECUTESQL @query;
            SET @queryRowCount = 'SELECT @TotalRecords = COUNT(us.UserID)  FROM dbo.S_Users us
						         INNER JOIN (SELECT * FROM S_VanBan vbc WHERE vbc.NguoiTao IS NOT NULL
									UNION ALL
									SELECT * FROM S_VanBan vbu WHERE vbu.NguoiChinhSua IS NOT NULL
									) AS vb
						         on (vb.NguoiTao = us.UserName or vb.NguoiChinhSua = us.UserName)
								 WHERE ((us.isDeleted = 0) OR (us.isDeleted IS NULL)) and (us.status = 1) 
								 and ((vb.isDeleted = 0) OR (vb.isDeleted IS NULL))' + @InWhere;
            EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GET_TABOFCONTS_BY_FONT_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_TABOFCONTS_BY_FONT_ID]
(
	@PhongID	  INT =0,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
	BEGIN TRY
		BEGIN
			IF @PhongID <> 0
				BEGIN
					SELECT sm.TenMucLucHoSo TabOfContName,sm.MucLucHoSoID TabOfContID,sm.MucLucSo TabOfContNumber,
					sm.GhiChu Note
					FROM S_MucLucHoSo sm
					inner join S_LuuTru sl on sl.LuuTruID = sm.LuuTruID
					inner join S_Phong sp on sl.PhongID = sp.PhongID
					where (sm.isDeleted = 0 or sm.isDeleted IS NULL) AND sp.PhongID = @PhongID
					ORDER BY sp.PhongID DESC
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'Lấy dữ liệu thành công';
				END
			ELSE
				BEGIN
					SET @ErrorCode = N'-1';
					SET @ErrorMessage = N'Lấy dữ liệu thất bại ';
				END
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GET_TABOFCONTS_BY_FONT_ID_Select2]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_TABOFCONTS_BY_FONT_ID_Select2]
(
	@PhongID	  INT =0,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
	BEGIN TRY
		BEGIN
			IF @PhongID <> 0
				BEGIN
					SELECT sm.MucLucSo Text,sm.MucLucHoSoID Id
					FROM S_MucLucHoSo sm
					inner join S_LuuTru sl on sl.LuuTruID = sm.LuuTruID
					inner join S_Phong sp on sl.PhongID = sp.PhongID
					where (sm.isDeleted = 0 or sm.isDeleted IS NULL) AND sp.PhongID = @PhongID
					ORDER BY sp.PhongID DESC
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'Lấy dữ liệu thành công';
				END
			ELSE
				BEGIN
					SET @ErrorCode = N'-1';
					SET @ErrorMessage = N'Lấy dữ liệu thất bại ';
				END
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GET_TINH_BY_TINH_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_TINH_BY_TINH_ID]
(
	@TinhID	  INT =0,
	@FromRecord INT,
	@PageSize INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
	BEGIN TRY

		IF (SELECT DiaChi.TinhID FROM DiaChi WHERE DiaChi.TinhID =@TinhID) IS NULL
			BEGIN
				SET @ErrorCode = N'0';
				SET @ErrorMessage = N'Lấy dữ liệu thất bại';
			END
		ELSE 

			BEGIN
				SELECT *
				FROM DiaChi dc 
				left outer join Tinh t on dc.TinhID = t.TinhID
				WHERE dc.TinhID = @TinhID
				ORDER BY dc.DiaChiID DESC
				OFFSET CONVERT(INT, @FromRecord) ROWS 
				FETCH NEXT CONVERT(INT, @PageSize) ROWS ONLY
				SET @ErrorCode = N'1';
				SET @ErrorMessage = N'Lấy dữ liệu thành công';
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[LANGUAGE_GET_ALL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LANGUAGE_GET_ALL]
	-- Add the parameters for the stored procedure here
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	BEGIN TRY
		SELECT 
			NgonNgu.NgonNguId as 'LanguageId',
			NgonNgu.TenNgonNgu as 'LanguageName'
		FROM NgonNgu
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[LoaiHoSo_CREATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoaiHoSo_CREATE]
	-- Add the parameters for the stored procedure here
	@TenLoaiHoSo NVARCHAR(50) = '',
	@ErrorCode  INT OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		Declare @IsDelted  INT = 0;
		IF EXISTS (SELECT LoaiHoSoID FROM S_LoaiHoSo WITH (NOLOCK) WHERE TenLoaiHoSo = @TenLoaiHoSo)
			BEGIN
				SET @IsDelted = (SELECT IsDeleted FROM S_LoaiHoSo WITH (NOLOCK) WHERE TenLoaiHoSo = @TenLoaiHoSo)
				IF	@IsDelted != 0
					BEGIN
						UPDATE S_LoaiHoSo SET TenLoaiHoSo = @TenLoaiHoSo, IsDeleted = 0 WHERE TenLoaiHoSo = @TenLoaiHoSo
						SET @ErrorCode = '0'
						SET @ErrorMessage = N'Thêm thành công'
					END
				ELSE
					BEGIN
						SET @ErrorCode = 1;
						SET @ErrorMessage = N'Loại hồ sơ đã tồn tại trên hệ thống, vui lòng thử lại.';
						RETURN;
					END
			END
		ELSE
			BEGIN
				INSERT INTO S_LoaiHoSo(
					TenLoaiHoSo
				)VALUES(
					@TenLoaiHoSo
				)
				SET @ErrorCode = '0'
				SET @ErrorMessage = N'Thêm thành công'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[LoaiHoSo_DELETE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoaiHoSo_DELETE]
	-- Add the parameters for the stored procedure here
	@LoaiHoSoID INT = 0,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET NOCOUNT ON;
	
	BEGIN TRY
		IF @LoaiHoSoID != 0
			BEGIN
				IF NOT EXISTS ((SELECT LoaiHoSoID FROM S_HoSo WHERE LoaiHoSoID = @LoaiHoSoID))
					BEGIN
						Update S_LoaiHoSo SET IsDeleted = 1
						WHERE LoaiHoSoID = @LoaiHoSoID
						SET @ErrorCode = '0'
						SET @ErrorMessage = N'Xóa thành công'
					END
			END
		ELSE
			BEGIN
				SET @ErrorCode = '1'
				SET @ErrorMessage = N'Xóa thất bại'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[LoaiHoSo_EDIT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoaiHoSo_EDIT]
	-- Add the parameters for the stored procedure here
	@LoaiHoSoID INT,
	@TenLoaiHoSo NVARCHAR(50),
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		IF EXISTS (SELECT LoaiHoSoID FROM S_LoaiHoSo WITH (NOLOCK) WHERE TenLoaiHoSo = @TenLoaiHoSo)
			BEGIN
				SET @ErrorCode = 1;
				SET @ErrorMessage = N'Đã tồn tại trên hệ thống, vui lòng thử lại.';
				RETURN;
			END
		ELSE
			BEGIN
				UPDATE S_LoaiHoSo
				SET TenLoaiHoSo = @TenLoaiHoSo
				WHERE LoaiHoSoID = @LoaiHoSoID
				SET @ErrorCode = '0'
				SET @ErrorMessage = N''
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[LoaiHoSo_GET_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoaiHoSo_GET_BY_ID]
(
	@LoaiHoSoID INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF @LoaiHoSoID IS NULL
		BEGIN
			SET @ErrorCode = N'1';
			SET @ErrorMessage = N'Không tồn tại bản ghi.';
			RETURN;
		END
		ELSE
		BEGIN
			SELECT lhs.LoaiHoSoID,lhs.TenLoaiHoSo
			FROM S_LoaiHoSo lhs
			WHERE (lhs.IsDeleted = 0 OR lhs.IsDeleted IS NULL) AND lhs.LoaiHoSoID = @LoaiHoSoID
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[LoaiHoSo_GET_SEARCH_WITH_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoaiHoSo_GET_SEARCH_WITH_PAGING]
	@InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	BEGIN TRY
			DECLARE @ROWS NVARCHAR(50) = '';
			SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
		BEGIN
			SET @query = 'SELECT lhs.LoaiHoSoID,lhs.TenLoaiHoSo
							FROM S_LoaiHoSo lhs
							WHERE (lhs.IsDeleted = 0 OR lhs.IsDeleted IS NULL)' + @InWhere + ' ORDER BY ' + @InSort + ' lhs.LoaiHoSoID DESC ' + ' OFFSET ' + @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY ';
			EXEC SP_EXECUTESQL @query;
            SET @queryRowCount = 'SELECT @TotalRecords = COUNT(lhs.LoaiHoSoID)
							FROM S_LoaiHoSo lhs
							WHERE (lhs.IsDeleted = 0 OR lhs.IsDeleted IS NULL)' + @InWhere;
            EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[LoaiVanBan_CREATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoaiVanBan_CREATE]
	-- Add the parameters for the stored procedure here
	@TenLoaiVanBan NVARCHAR(50) = '',
	@ErrorCode  INT OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		Declare @IsDelted INT =0;
		IF EXISTS (SELECT LoaiVanBanID FROM S_LoaiVanBan WITH (NOLOCK) WHERE TenLoaiVanBan = @TenLoaiVanBan)
			BEGIN
				SET @IsDelted = (SELECT IsDeleted FROM S_LoaiVanBan WITH (NOLOCK) WHERE TenLoaiVanBan = @TenLoaiVanBan)
				IF	@IsDelted != 0
					BEGIN
						UPDATE S_LoaiVanBan SET TenLoaiVanBan = @TenLoaiVanBan, IsDeleted = 0 WHERE TenLoaiVanBan = @TenLoaiVanBan
						SET @ErrorCode = '0'
						SET @ErrorMessage = N'Thêm thành công'
					END
				ELSE
					BEGIN
						SET @ErrorCode = 1;
						SET @ErrorMessage = N'Loại văn bản đã tồn tại trên hệ thống, vui lòng thử lại.';
						RETURN;
					END
			END

		ELSE
			BEGIN
				INSERT INTO S_LoaiVanBan(
					TenLoaiVanBan
				)VALUES(
					@TenLoaiVanBan
				)
				SET @ErrorCode = '0'
				SET @ErrorMessage = N'Thêm thành công'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[LoaiVanBan_DELETE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoaiVanBan_DELETE]
	-- Add the parameters for the stored procedure here
	@LoaiVanBanID INT = 0,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET NOCOUNT ON;
	
	BEGIN TRY
		IF @LoaiVanBanID != 0
			BEGIN
				IF NOT EXISTS ((SELECT LoaiVanBanID FROM S_VanBan WHERE LoaiVanBanID = @LoaiVanBanID))
					BEGIN
						Update S_LoaiVanBan SET IsDeleted = 1
						WHERE LoaiVanBanID = @LoaiVanBanID
						SET @ErrorCode = '0'
						SET @ErrorMessage = N'Xóa thành công'
					END
			END
		ELSE
			BEGIN
				SET @ErrorCode = '1'
				SET @ErrorMessage = N'Xóa thất bại'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[LoaiVanBan_EDIT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoaiVanBan_EDIT]
	-- Add the parameters for the stored procedure here
	@LoaiVanBanID INT,
	@TenLoaiVanBan NVARCHAR(50),
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		IF EXISTS (SELECT LoaiVanBanID FROM S_LoaiVanBan WITH (NOLOCK) WHERE TenLoaiVanBan = @TenLoaiVanBan)
			BEGIN
				SET @ErrorCode = 1;
				SET @ErrorMessage = N'Đã tồn tại trên hệ thống, vui lòng thử lại.';
				RETURN;
			END
		ELSE
			BEGIN
				UPDATE S_LoaiVanBan
				SET TenLoaiVanBan = @TenLoaiVanBan
				WHERE LoaiVanBanID = @LoaiVanBanID
				SET @ErrorCode = '0'
				SET @ErrorMessage = N''
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[LoaiVanBan_GET_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoaiVanBan_GET_BY_ID]
(
	@LoaiVanBanID INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF @LoaiVanBanID IS NULL
		BEGIN
			SET @ErrorCode = N'1';
			SET @ErrorMessage = N'Không tồn tại bản ghi.';
			RETURN;
		END
		ELSE
		BEGIN
			SELECT lvb.LoaiVanBanID,lvb.TenLoaiVanBan
			FROM S_LoaiVanBan lvb
			WHERE (lvb.IsDeleted = 0 OR lvb.IsDeleted IS NULL) AND lvb.LoaiVanBanID = @LoaiVanBanID
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[LoaiVanBan_GET_SEARCH_WITH_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoaiVanBan_GET_SEARCH_WITH_PAGING]
	@InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	BEGIN TRY
			DECLARE @ROWS NVARCHAR(50) = '';
			SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
		BEGIN
			SET @query = 'SELECT lvb.LoaiVanBanID,lvb.TenLoaiVanBan
							FROM S_LoaiVanBan lvb
							WHERE (lvb.IsDeleted = 0 OR lvb.IsDeleted IS NULL)' + @InWhere + ' ORDER BY ' + @InSort + ' lvb.LoaiVanBanID DESC ' + ' OFFSET ' + @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY ';
			EXEC SP_EXECUTESQL @query;
            SET @queryRowCount = 'SELECT @TotalRecords = COUNT(lvb.LoaiVanBanID)
							FROM S_LoaiVanBan lvb
							WHERE (lvb.IsDeleted = 0 OR lvb.IsDeleted IS NULL)' + @InWhere;
            EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[LOG_CREATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LOG_CREATE]
	-- Add the parameters for the stored procedure here
	@Action nvarchar(64) = N'',
	@VanBanId INT,
	@CreatedDate DATETIME,
	@UpdatedDate DATETIME,
	@CreatedBy INT,
	@UpdatedBy INT,
	@IsDeleted BIT,
	@ErrorCode  INT OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		INSERT INTO NhatKy(
			Action,
			VanBanId,
			CreatedDate,
			UpdatedDate,
			CreatedBy,
			UpdatedBy,
			IsDeleted
		)VALUES(
			@Action,
			@VanBanId,
			@CreatedDate,
			@UpdatedDate,
			@CreatedBy,
			@UpdatedBy,
			@IsDeleted
		)
		SET @ErrorCode = '0'
		SET @ErrorMessage = N'Thêm nhật ký thành công'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[LOG_DELETE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LOG_DELETE]
	-- Add the parameters for the stored procedure here
	@NhatKyId int,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRY
		IF NOT EXISTS(SELECT NhatKy.NhatKyId
					  FROM NhatKy 
					  WHERE NhatKy.NhatKyId = @NhatKyId)
			BEGIN
				SET @ErrorCode = '1'
				SET @ErrorMessage = N'Không tồn tại nhật ký này'
				RETURN;
			END
		ELSE
			BEGIN
				Update NhatKy SET IsDeleted = 1
				WHERE NhatKy.NhatKyId = @NhatKyId;
				SET @ErrorCode = N'0';
				SET @ErrorMessage = N'Xóa thành công'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[LOG_EDIT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LOG_EDIT]
	-- Add the parameters for the stored procedure here
	@NhatKyId int,
	@Action nvarchar(64) = N'',
	@VanBanId INT,
	@CreatedDate DATETIME,
	@UpdatedDate DATETIME,
	@CreatedBy INT,
	@UpdatedBy INT,
	@ErrorCode  INT OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		UPDATE NhatKy
		SET VanBanId = @VanBanId, Action = @Action,
		CreatedDate = @CreatedDate, CreatedBy = @CreatedBy,
		UpdatedDate = @UpdatedDate, UpdatedBy= @UpdatedBy
		WHERE NhatKyId = @NhatKyId
		SET @ErrorCode = '0'
		SET @ErrorMessage = N'Cập nhật thành công'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[LOG_GET_ALL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LOG_GET_ALL]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT nk.NhatKyId LogId, nk.Action Action,
			nk.VanBanId VanBanId, vb.SoVanBan DocumentNumber,
			nk.UpdatedBy UpdatedBy, nk.UpdatedDate UpdatedDate, 
			nk.CreatedBy CreatedBy, nk.UpdatedDate UpdatedDate, 
			us.UserName UserName, nk.CreatedDate CreatedDate
			FROM NhatKy nk
			left outer join S_VanBan vb on vb.VanBanID = nk.VanBanId  
			left outer join S_Users us on us.UserID = nk.CreatedBy  
			WHERE nk.IsDeleted = 0 or nk.IsDeleted IS NULL
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[LOG_GET_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LOG_GET_BY_ID]
(
	@LogId INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF @LogId IS NULL
		BEGIN
			SET @ErrorCode = N'1';
			SET @ErrorMessage = N'Không tồn tại bản ghi.';
			RETURN;
		END
		ELSE
		BEGIN
			SELECT nk.NhatKyId LogId, nk.Action Action,
			nk.VanBanId VanBanId, vb.SoVanBan DocumentNumber,
			nk.UpdatedBy UpdatedBy, nk.UpdatedDate UpdatedDate, 
			nk.CreatedBy CreatedBy, nk.UpdatedDate UpdatedDate, 
			us.UserName UserName, nk.CreatedDate CreatedDate
			FROM NhatKy nk
			left outer join S_VanBan vb on vb.VanBanID = nk.VanBanId  
			left outer join S_Users us on us.UserID = nk.CreatedBy  
			WHERE (nk.IsDeleted = 0 or nk.IsDeleted IS NULL) AND nk.NhatKyId = @LogId
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[LOG_GET_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LOG_GET_PAGING]
(
	 @InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	 @ErrorMessage NVARCHAR(4000) OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	BEGIN TRY
			DECLARE @ROWS NVARCHAR(50) = '';
			SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
		BEGIN
			SET @query = 'SELECT nk.NhatKyId LogId, nk.Action Action,
							nk.VanBanId VanBanId, vb.SoVanBan DocumentNumber,
							nk.UpdatedBy UpdatedBy, nk.UpdatedDate UpdatedDate, 
							nk.CreatedBy CreatedBy, nk.UpdatedDate UpdatedDate, 
							us.UserName UserName, nk.CreatedDate CreatedDate
							FROM NhatKy nk
							left outer join S_VanBan vb on vb.VanBanID = nk.VanBanId  
							left outer join S_Users us on us.UserID = nk.CreatedBy  
							WHERE (sp.IsDeleted = 0 or sp.IsDeleted IS NULL) ' + @InWhere + ' ORDER BY ' + @InSort + ' nk.NhatKyId DESC ' + ' OFFSET ' + @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY ';
			EXEC SP_EXECUTESQL @query;
            SET @queryRowCount = 'SELECT @TotalRecords = COUNT(nk.NhatKyId)
									FROM NhatKy nk
									left outer join S_VanBan vb on vb.VanBanID = nk.VanBanId  
									left outer join S_Users us on us.UserID = nk.CreatedBy  
									WHERE (sp.IsDeleted = 0 or sp.IsDeleted IS NULL) ' + @InWhere;
            EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[MENU_GET_MENU_BY_ROLE_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MENU_GET_MENU_BY_ROLE_ID]
	-- Add the parameters for the stored procedure here
	@RoleId INT,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		SELECT *
		From S_Menu
		INNER JOIN S_Role_URL
		ON S_Role_URL.MenuId = S_Menu.MenuId
		WHERE S_Role_URL.RoleID = @RoleId

		SET @ErrorCode = '0'
		SET @ErrorMessage = 'SUC'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[MucDoTinCay_CREATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MucDoTinCay_CREATE]
	-- Add the parameters for the stored procedure here
	@LoaiMucDoTinCay NVARCHAR(50) = '',
	@ErrorCode  INT OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF EXISTS (SELECT MucDoTinCayID FROM S_MucDoTinCay WITH (NOLOCK) WHERE LoaiMucDoTinCay = @LoaiMucDoTinCay)
			IF (SELECT IsDeleted FROM S_MucDoTinCay WITH (NOLOCK) WHERE LoaiMucDoTinCay = @LoaiMucDoTinCay) = 0 OR (SELECT IsDeleted FROM S_MucDoTinCay WITH (NOLOCK) WHERE LoaiMucDoTinCay = @LoaiMucDoTinCay) IS NULL
				BEGIN
					SET @ErrorCode = 1;
					SET @ErrorMessage = N'Đã tồn tại trên hệ thống, vui lòng thử lại.';
					RETURN;
				END
			ELSE
				BEGIN
					Update S_MucDoTinCay SET LoaiMucDoTinCay = @LoaiMucDoTinCay, IsDeleted = 0 Where LoaiMucDoTinCay = @LoaiMucDoTinCay
					SET @ErrorCode = '0'
					SET @ErrorMessage = N'Thêm thành công'
				END
		ELSE
			BEGIN
				INSERT INTO S_MucDoTinCay(
					LoaiMucDoTinCay
				)VALUES(
					@LoaiMucDoTinCay
				)
				SET @ErrorCode = '0'
				SET @ErrorMessage = N'Thêm thành công'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[MucDoTinCay_DELETE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MucDoTinCay_DELETE]
	-- Add the parameters for the stored procedure here
	@MucDoTinCayID INT = 0,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET NOCOUNT ON;
	
	BEGIN TRY
		IF @MucDoTinCayID != 0
			BEGIN
				IF NOT EXISTS ((SELECT MucDoTinCayID FROM S_VanBan WHERE MucDoTinCayID = @MucDoTinCayID))
					BEGIN
						Update S_MucDoTinCay SET IsDeleted = 1
						WHERE MucDoTinCayID = @MucDoTinCayID
						SET @ErrorCode = '0'
						SET @ErrorMessage = N'Xóa thành công'
					END
			END
		ELSE
			BEGIN
				SET @ErrorCode = '1'
				SET @ErrorMessage = N'Xóa thất bại'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[MucDoTinCay_EDIT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MucDoTinCay_EDIT]
	-- Add the parameters for the stored procedure here
	@MucDoTinCayID INT,
	@LoaiMucDoTinCay NVARCHAR(50),
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		IF EXISTS (SELECT MucDoTinCayID FROM S_MucDoTinCay WITH (NOLOCK) WHERE LoaiMucDoTinCay = @LoaiMucDoTinCay)
			BEGIN
				SET @ErrorCode = 1;
				SET @ErrorMessage = N'Đã tồn tại trên hệ thống, vui lòng thử lại.';
				RETURN;
			END
		ELSE
			BEGIN
				UPDATE S_MucDoTinCay
				SET LoaiMucDoTinCay = @LoaiMucDoTinCay
				WHERE MucDoTinCayID = @MucDoTinCayID
				SET @ErrorCode = '0'
				SET @ErrorMessage = N''
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[MucDoTinCay_GET_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MucDoTinCay_GET_BY_ID]
(
	@MucDoTinCayID INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF @MucDoTinCayID IS NULL
		BEGIN
			SET @ErrorCode = N'1';
			SET @ErrorMessage = N'Không tồn tại bản ghi.';
			RETURN;
		END
		ELSE
		BEGIN
			SELECT mdtc.MucDoTinCayID,mdtc.LoaiMucDoTinCay
			FROM S_MucDoTinCay mdtc
			WHERE (mdtc.IsDeleted = 0 OR mdtc.IsDeleted IS NULL) AND mdtc.MucDoTinCayID = @MucDoTinCayID
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[MucDoTinCay_GET_SEARCH_WITH_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MucDoTinCay_GET_SEARCH_WITH_PAGING]
	@InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	BEGIN TRY
			DECLARE @ROWS NVARCHAR(50) = '';
			SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
		BEGIN
			SET @query = 'SELECT tt.MucDoTinCayId,tt.LoaiMucDoTinCay
							FROM S_MucDoTinCay tt
							WHERE (tt.IsDeleted = 0 OR tt.IsDeleted IS NULL)' + @InWhere + ' ORDER BY ' + @InSort + ' tt.MucDoTinCayId DESC ' + ' OFFSET ' + @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY ';
			EXEC SP_EXECUTESQL @query;
            SET @queryRowCount = 'SELECT @TotalRecords = COUNT(tt.MucDoTinCayId)
							FROM S_MucDoTinCay tt
							WHERE (tt.IsDeleted = 0 OR tt.IsDeleted IS NULL)' + @InWhere;
            EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[NgonNgu_CREATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NgonNgu_CREATE]
	-- Add the parameters for the stored procedure here
	@TenNgonNgu NVARCHAR(50) = '',
	@ErrorCode  INT OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF EXISTS (SELECT NgonNguId FROM NgonNgu WITH (NOLOCK) WHERE TenNgonNgu = @TenNgonNgu)
			BEGIN
				IF (SELECT IsDeleted FROM NgonNgu WITH (NOLOCK) WHERE TenNgonNgu = @TenNgonNgu) = 0 OR (SELECT IsDeleted FROM NgonNgu WITH (NOLOCK) WHERE TenNgonNgu = @TenNgonNgu) IS NULL
					BEGIN
						SET @ErrorCode = 1;
						SET @ErrorMessage = N'Đã tồn tại trên hệ thống, vui lòng thử lại.';
						RETURN;
					END
				ELSE
					BEGIN
						Update NgonNgu SET TenNgonNgu = @TenNgonNgu, IsDeleted = 0 Where TenNgonNgu = @TenNgonNgu
						SET @ErrorCode = '0'
						SET @ErrorMessage = N'Thêm thành công'
					END
			END
		ELSE
			BEGIN
				INSERT INTO NgonNgu(
					TenNgonNgu
				)VALUES(
					@TenNgonNgu
				)
				SET @ErrorCode = '0'
				SET @ErrorMessage = N'Thêm thành công'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[NgonNgu_DELETE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NgonNgu_DELETE]
	-- Add the parameters for the stored procedure here
	@NgonNguID INT = 0,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET NOCOUNT ON;
	
	BEGIN TRY
		IF @NgonNguID != 0
			BEGIN
				IF NOT EXISTS (SELECT NgonNgu FROM S_Phong WHERE NgonNgu = @NgonNguID)
					BEGIN
						IF NOT EXISTS (SELECT NgonNguID FROM S_VanBan WHERE NgonNguID = @NgonNguID)
							BEGIN
								Update NgonNgu SET IsDeleted = 1
								WHERE NgonNguId = @NgonNguID
								SET @ErrorCode = '0'
								SET @ErrorMessage = N'Xóa thành công'
							END
					END
			END
		ELSE
			BEGIN
				SET @ErrorCode = '1'
				SET @ErrorMessage = N'Xóa thất bại'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[NgonNgu_EDIT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NgonNgu_EDIT]
	-- Add the parameters for the stored procedure here
	@NgonNguID INT,
	@TenNgonNgu NVARCHAR(50),
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		IF EXISTS (SELECT NgonNguId FROM NgonNgu WITH (NOLOCK) WHERE TenNgonNgu = @TenNgonNgu)
			BEGIN
				SET @ErrorCode = 1;
				SET @ErrorMessage = N'Đã tồn tại trên hệ thống, vui lòng thử lại.';
				RETURN;
			END
		ELSE
			BEGIN
				UPDATE NgonNgu
				SET TenNgonNgu = @TenNgonNgu
				WHERE NgonNguId = @NgonNguID
				SET @ErrorCode = '0'
				SET @ErrorMessage = N''
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[NgonNgu_GET_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NgonNgu_GET_BY_ID]
(
	@NgonNguID INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF @NgonNguID IS NULL
		BEGIN
			SET @ErrorCode = N'1';
			SET @ErrorMessage = N'Không tồn tại bản ghi.';
			RETURN;
		END
		ELSE
		BEGIN
			SELECT nn.NgonNguId,nn.TenNgonNgu
			FROM NgonNgu nn
			WHERE (nn.IsDeleted = 0 OR nn.IsDeleted IS NULL) AND nn.NgonNguId = @NgonNguID
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[NgonNgu_GET_SEARCH_WITH_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NgonNgu_GET_SEARCH_WITH_PAGING]
	@InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	BEGIN TRY
			DECLARE @ROWS NVARCHAR(50) = '';
			SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
		BEGIN
			SET @query = 'SELECT nn.NgonNguId,nn.TenNgonNgu
							FROM NgonNgu nn
							WHERE (nn.IsDeleted = 0 OR nn.IsDeleted IS NULL)' + @InWhere + ' ORDER BY ' + @InSort + ' nn.NgonNguId DESC ' + ' OFFSET ' + @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY ';
			EXEC SP_EXECUTESQL @query;
            SET @queryRowCount = 'SELECT @TotalRecords = COUNT(nn.NgonNguId)
							FROM NgonNgu nn
							WHERE (nn.IsDeleted = 0 OR nn.IsDeleted IS NULL)' + @InWhere;
            EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Organ_EDIT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Organ_EDIT]
	-- Add the parameters for the stored procedure here
	@CoQuanID int,
	@OrganCode NVARCHAR(50),
	@DiaChiID int,
	@TinhID int,
	@HuyenID int = NULL,
	@XaPhuongID int = NULL,
	@TenCoQuan NVARCHAR(50),
	@LoaiCoQuan int,
	@AddressDetail NVARCHAR(500) = N'',
	@Description NVARCHAR(1000) = N'',
	@Notes NVARCHAR(1000) = N'',
	@UpdatedBy VARCHAR(50) = N'',
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		declare @DChiID int,
			@DiaChiChiTiet nvarchar(300) = N'',
			@TenHuyen nvarchar(50) = '',
			@TenXaPhuong nvarchar(50) = N'',
			@TenTinh nvarchar(50) = N'',
			@districtId INT,
			@wardId INT;
			SET @districtId = @HuyenID;
			SET @wardId = @XaPhuongID;
	    BEGIN TRY
		IF @DiaChiID IS NOT NULL
			Begin
				IF @TinhID IS NOT NULL 
					BEGIN
							SET @TenTinh = (Select TenTinh from Tinh where TinhID = @TinhID)
							IF (@HuyenID IS NOT NULL AND @HuyenID != 0)
								BEGIN
									SET @TenHuyen = (Select TenHuyen from Huyen h, Tinh t where 1=1 and h.TinhID = t.TinhID AND HuyenID = @HuyenID AND T.TinhID = @TinhID)
									IF @TenHuyen != ''
									BEGIN
										IF (@XaPhuongID IS NOT NULL AND @XaPhuongID != 0)
										BEGIN
											SET @TenXaPhuong = (Select TenXaPhuong from XaPhuong x, Huyen h where 1=1 and x.HuyenID = h.HuyenID AND x.XaPhuongID = @XaPhuongID AND h.HuyenID = @HuyenID)
											IF @TenXaPhuong != ''
											BEGIN
												SET @DiaChiChiTiet = CONCAT(@TenXaPhuong, ', ', @TenHuyen, ', ', @TenTinh);
											END
											ELSE
											BEGIN
												SET @DiaChiChiTiet = CONCAT(@TenHuyen, ', ', @TenTinh);
												SET @wardId = NULL;
											END
										END
										ELSE
                                        BEGIN
                                            SET @XaPhuongID = N'';
											SET @DiaChiChiTiet = CONCAT(@TenHuyen, ', ', @TenTinh);
											SET @wardId = NULL;
                                        END
									END
									ELSE
									BEGIN
										SET @DiaChiChiTiet = @TenTinh
										SET @districtId = NULL;
										SET @wardId = NULL;
									END
								END
							ELSE
								BEGIN
									SET @TenHuyen = N'';
									SET @DiaChiChiTiet = @TenTinh;
									SET @districtId = NULL;
									SET @wardId = NULL;
								END
							--SET @DiaChiChiTiet = CONCAT(@TenXaPhuong, ', ', @TenHuyen, ', ', @TenTinh);
							Update DiaChi SET
								TinhID = @TinhID,
								HuyenID = @districtId,
								XaPhuongID = @wardId,
								DiaChiChiTiet = @DiaChiChiTiet
							WHERE DiaChiID = @DiaChiID
					END
			End
		-- cập nhật cơ quan
			UPDATE S_CoQuan
			SET 
				MaCoQuan = @OrganCode,
				TenCoQuan = @TenCoQuan,
				LoaiCoQuan = @LoaiCoQuan,
				UpdateDate = GETDATE(),
				UpdatedBy = @UpdatedBy,
				Description = @Description,
				Notes = @Notes,
				AddressDetail = @AddressDetail WHERE CoQuanID = @CoQuanID
		SET @ErrorCode = '0'
		SET @ErrorMessage = N''
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[Organ_GET_ALL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Organ_GET_ALL]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT cq.CoQuanID OrganID,
								 cq.TenCoQuan, -- đừng sửa chỗ này
								 cq.CreateBy,
								 lcq.TenLoaiCoQuan AS OrganType,
								 dc.DiaChiChiTiet AS AddressDetail,
								 cq.DiaChiID AS AddressID
								FROM dbo.S_CoQuan cq 
								INNER JOIN dbo.S_LoaiCoQuan lcq ON (cq.LoaiCoQuan = lcq.LoaiCoQuanID)
								INNER JOIN dbo.DiaChi dc ON (cq.DiaChiID = dc.DiaChiID) WHERE (cq.Deleted = 0 OR cq.Deleted IS NULL) AND cq.DiaChiID IS NOT NULL
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END


GO
/****** Object:  StoredProcedure [dbo].[ORGAN_GET_ALL_FOND_WITH_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ORGAN_GET_ALL_FOND_WITH_PAGING]
	@OrganId INT,
	@InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 1,
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	 @ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;
	BEGIN TRY
	DECLARE @query NVARCHAR(4000) = '', @queryRowCount NVARCHAR(4000) = '';
	SET @query = 'SELECT 
		c.CoQuanID,
		c.MaCoQuan as OrganCode,
		p.PhongSo as FontNumber,
		p.PhongID as FontID,
		p.TenPhong as FontName,
		p.GhiChu as Note
		FROM S_CoQuan c WITH (NOLOCK) INNER JOIN S_Phong p WITH (NOLOCK) ON c.CoQuanID = p.CoQuanID
		WHERE (p.isDeleted = 0 OR p.isDeleted IS NULL) AND p.CoQuanID = ' + CONVERT(NVARCHAR, @OrganId) + ' ' + @InWhere + ' ORDER BY p.PhongID DESC ' + @InSort + ' OFFSET ' + CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize)) + ' ROWS FETCH NEXT ' + CONVERT(NVARCHAR, @PageSize) + ' ROWS ONLY';
		print @query
	EXEC SP_EXECUTESQL @query;

	SET @queryRowCount = 'SELECT @TotalRecords = COUNT(p.CoQuanID)
						FROM S_CoQuan c WITH (NOLOCK) INNER JOIN S_Phong p WITH (NOLOCK) ON c.CoQuanID = p.CoQuanID
						WHERE (p.isDeleted = 0 OR p.isDeleted IS NULL) AND p.CoQuanID = ' + CONVERT(NVARCHAR, @OrganId) + ' ' + @InWhere;
	PRINT @queryRowCount;
	EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT
	SET @ErrorCode = '0';
	SET @ErrorMessage = '';
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[ORGAN_GET_ALL_GETIDANDNAME]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ORGAN_GET_ALL_GETIDANDNAME]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT cq.CoQuanID OrganID,
								 cq.TenCoQuan
								FROM dbo.S_CoQuan cq  WHERE (cq.Deleted = 0 OR cq.Deleted IS NULL) AND cq.DiaChiID IS NOT NULL
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END


GO
/****** Object:  StoredProcedure [dbo].[ORGAN_GET_ALL_GETIDANDNAME_SELECT2]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ORGAN_GET_ALL_GETIDANDNAME_SELECT2]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT cq.CoQuanID Id,
								 cq.TenCoQuan Text
								FROM dbo.S_CoQuan cq  WHERE (cq.Deleted = 0 OR cq.Deleted IS NULL) AND cq.DiaChiID IS NOT NULL
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END


GO
/****** Object:  StoredProcedure [dbo].[Organ_INSERT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Organ_INSERT]
	-- Add the parameters for the stored procedure here
	@OrganCode NVARCHAR(50),
	@TenCoQuan NVARCHAR(50) = N'',
	@TinhID INT,
	@HuyenID INT = NULL,
	@XaPhuongID INT = NULL,
	@LoaiCoQuan INT,
	@AddressDetail NVARCHAR(500) = N'',
	@CreateBy VARCHAR(50),
	@Description NVARCHAR(1000) = N'',
	@Notes NVARCHAR(1000) = N'',
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @DChiID int,
		@DiaChiChiTiet nvarchar(300) = N'',
		@TenHuyen nvarchar(50) = '',
		@TenXaPhuong nvarchar(50) = N'',
		@TenTinh nvarchar(50) = N''
	    BEGIN TRY
		IF EXISTS (SELECT CoQuanID FROM S_CoQuan, dbo.DiaChi WITH (NOLOCK) WHERE TenCoQuan = @TenCoQuan AND dbo.DiaChi.DiaChiID = dbo.S_CoQuan.DiaChiID)
			BEGIN
				SET @ErrorCode = 'EXISTS';
				SET @ErrorMessage = N'Cơ quan đã tồn tại trên hệ thống, vui lòng thử lại.';
				RETURN;
			END
		ELSE
			BEGIN
				IF @TinhID IS NOT NULL 
					BEGIN
						IF NOT EXISTS (SELECT DiaChiID from DiaChi where TinhID = @TinhID and HuyenID = @HuyenID and XaPhuongID = @XaPhuongID )
							Begin
								    SET @TenTinh = (Select TenTinh from Tinh where TinhID = @TinhID)
									IF (@HuyenID IS NOT NULL AND @HuyenID != 0)
										BEGIN
											SET @TenHuyen = (Select TenHuyen from Huyen where HuyenID = @HuyenID)
											IF (@XaPhuongID IS NOT NULL AND @XaPhuongID != 0)
												BEGIN
													SET @TenXaPhuong = (Select TenXaPhuong from XaPhuong where XaPhuongID = @XaPhuongID)
													SET @DiaChiChiTiet = CONCAT(@TenXaPhuong, ', ', @TenHuyen, ', ', @TenTinh);
												END
                                            ELSE
                                                BEGIN
                                                    SET @XaPhuongID = N'';
													SET @DiaChiChiTiet = CONCAT(@TenHuyen, ', ', @TenTinh);
                                                END
										END
										ELSE
											BEGIN
												SET @TenHuyen = N'';
												SET @DiaChiChiTiet = @TenTinh;
											END
									--SET @DiaChiChiTiet = CONCAT(@TenXaPhuong, ', ', @TenHuyen, ', ', @TenTinh);
									INSERT INTO DiaChi
									(
										TinhID,
										HuyenID,
										XaPhuongID,
										DiaChiChiTiet
									)
									values
									(
										@TinhID,
										@HuyenID,
										@XaPhuongID,
										@DiaChiChiTiet
									)
									SET @DChiID = SCOPE_IDENTITY();
							End
						ELSE
							Begin
									SET @DChiID = (SELECT DiaChiID from DiaChi where TinhID = @TinhID and HuyenID = @HuyenID and XaPhuongID = @XaPhuongID)
							End   
					END
				ElSE
					BEGIN
						SET @DChiID = NULL
					END
				IF NOT EXISTS (SELECT MaCoQuan FROM S_CoQuan WITH (NOLOCK) WHERE MaCoQuan = @OrganCode)
					BEGIN
						INSERT INTO 
						S_CoQuan (
								MaCoQuan,
								TenCoQuan,
								DiaChiID,
								LoaiCoQuan,
								CreateDate,
								CreateBy,
								Description,
								Notes,
								AddressDetail
							)
							VALUES(
								@OrganCode,
								@TenCoQuan,
								@DChiID,
								@LoaiCoQuan,
								GETDATE(),
								@CreateBy,
								@Description,
								@Notes,
								@AddressDetail
							)
					END
				ELSE
					BEGIN
						SET @ErrorCode = 'EXISTS'
						SET @ErrorMessage = N'Cơ quan đã tồn tại trên hệ thống, vui lòng thử lại với tên hoặc mã cơ quan khác.';
						RETURN;
					END
				SET @ErrorCode = '0'
				SET @ErrorMessage = N''
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END



GO
/****** Object:  StoredProcedure [dbo].[ORGAN_TYPE_GET_ALL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ORGAN_TYPE_GET_ALL]
@ErrorCode INT OUTPUT,
@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		SELECT TenLoaiCoQuan AS OrganType FROM S_LoaiCoQuan
		SET @ErrorCode = 0
		SET @ErrorMessage = N''
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER()
		SET @ErrorMessage = ERROR_MESSAGE()
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OrganType_CREATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrganType_CREATE]
	-- Add the parameters for the stored procedure here
	@TenLoaiCoQuan NVARCHAR(50) = '',
	@ErrorCode  INT OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		INSERT INTO S_LoaiCoQuan(
			TenLoaiCoQuan
		)VALUES(
			@TenLoaiCoQuan
		)
		SET @ErrorCode = '0'
		SET @ErrorMessage = N'Thêm thành công'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[OrganType_DELETE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrganType_DELETE]
	-- Add the parameters for the stored procedure here
	@LoaiCoQuanID INT = 0,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET NOCOUNT ON;
	
	BEGIN TRY
		IF @LoaiCoQuanID != 0
			BEGIN
				IF NOT EXISTS ((SELECT LoaiCoQuan FROM S_CoQuan WHERE LoaiCoQuan = @LoaiCoQuanID))
					BEGIN
						Update S_LoaiCoQuan SET IsDeleted = 1
						WHERE LoaiCoQuanID = @LoaiCoQuanID
						SET @ErrorCode = '0'
						SET @ErrorMessage = N'Xóa thành công'
					END
			END
		ELSE
			BEGIN
				SET @ErrorCode = '1'
				SET @ErrorMessage = N'Xóa thất bại'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[OrganType_EDIT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrganType_EDIT]
	-- Add the parameters for the stored procedure here
	@LoaiCoQuanID INT,
	@TenLoaiCoQuan NVARCHAR(50),
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		UPDATE S_LoaiCoQuan
		SET TenLoaiCoQuan = @TenLoaiCoQuan
		WHERE LoaiCoQuanID = @LoaiCoQuanID
		SET @ErrorCode = '0'
		SET @ErrorMessage = N''
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[OrganType_GET_ALL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrganType_GET_ALL]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			Select lcq.LoaiCoQuanID OrganTypeID,lcq.TenLoaiCoQuan OrganTypeName,lcq.GhiChu Note from S_LoaiCoQuan lcq WITH (NOLOCK)
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OrganType_GET_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrganType_GET_BY_ID]
(
	@LoaiCoQuanID INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF @LoaiCoQuanID IS NULL
		BEGIN
			SET @ErrorCode = N'1';
			SET @ErrorMessage = N'Không tồn tại bản ghi.';
			RETURN;
		END
		ELSE
		BEGIN
			SELECT lcq.LoaiCoQuanID OrganTypeID,lcq.TenLoaiCoQuan OrganTypeName,lcq.GhiChu Note
			FROM S_LoaiCoQuan lcq
			WHERE (lcq.IsDeleted = 0 OR lcq.IsDeleted IS NULL) AND lcq.LoaiCoQuanID = @LoaiCoQuanID
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[OrganType_GET_SEARCH_WITH_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrganType_GET_SEARCH_WITH_PAGING]
	@InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	BEGIN TRY
			DECLARE @ROWS NVARCHAR(50) = '';
			SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
		BEGIN
			SET @query = 'SELECT lcq.LoaiCoQuanID OrganTypeID,lcq.TenLoaiCoQuan OrganTypeName,lcq.GhiChu Note
							FROM S_LoaiCoQuan lcq
							WHERE (lcq.IsDeleted = 0 OR lcq.IsDeleted IS NULL)' + @InWhere + ' ORDER BY ' + @InSort + ' lcq.LoaiCoQuanID DESC ' + ' OFFSET ' + @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY ';
			EXEC SP_EXECUTESQL @query;
            SET @queryRowCount = 'SELECT @TotalRecords = COUNT(lcq.LoaiCoQuanID) FROM S_LoaiCoQuan lcq
									WHERE (lcq.IsDeleted = 0 OR lcq.IsDeleted IS NULL)' + @InWhere;
            EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[PROFILE_CREATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROFILE_CREATE]
(
	@TieuDeHoSo NVARCHAR(50),
	@MaHoSo NVARCHAR(50),
	@TenHoSo NVARCHAR(50),
	@NgayTao DATE,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @MaHS INT,@currYear DATETIME,
		@MaHSTop1 NVARCHAR(50),@currYearStr NVARCHAR(50)
		BEGIN
			SET @currYear = YEAR(GETDATE())
			SET @currYearStr = @currYear
			SET @MaHSTop1 = (SELECT TOP (1) hs.MaHoSo FROM S_HoSo hs WHERE (hs.IsDeleted = 0 or hs.IsDeleted IS NULL) ORDER BY hs.HoSoID DESC)
			IF @MaHSTop1 IS NOT NULL 
				BEGIN
					IF  CHARINDEX(@currYearStr, @MaHSTop1 ) > 0 
						BEGIN
							-- Ma se duoc cong them va cong voi nam 
							SET @MaHS = 1
						END
					ELSE
						BEGIN
							-- Ma se duoc quay tro ve 1 va cong voi nam
							SET @MaHS = 1
						END
				END
			INSERT INTO S_HoSo(MaHoSo,TenHoSo,TieuDeHoSo,NgayTao,IsDeleted) VALUES(@MaHS,@TenHoSo,@TieuDeHoSo,@NgayTao,0);
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[PROFILE_DELETE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROFILE_DELETE]
(
	@HoSoID INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
			IF NOT EXISTS(SELECT S_HoSo.HoSoID
					  FROM S_HoSo 
					  WHERE S_HoSo.HoSoID = @HoSoID)
			BEGIN
				SET @ErrorCode = '1'
				SET @ErrorMessage = N'Không tồn tại hộp số này'
				RETURN;
			END
			ELSE
				BEGIN
					Update S_HoSo SET isDeleted =1
					WHERE S_HoSo.HoSoID = @HoSoID;
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'Xóa thành công'
				END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[PROFILE_EXPORT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROFILE_EXPORT]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			Select sh.MaHoSo ProfileCode,sh.HopSoID GearBoxID,sh.TieuDeHoSo ProfileTitle,hs.MaHopSo GearBoxCode,
			  lhs.TenLoaiHoSo ProfileTypeName,sh.GhiChu Note,sh.ThoiGianBatDau StartTime,sh.ThoiGianKetThuc EndTime,
			  sh.ThoiHanBaoQuan ShelfLife
			  from S_HoSo sh
			left outer join S_LoaiHoSo lhs on lhs.LoaiHoSoID= sh.LoaiHoSoID
			left outer join S_HopSo hs on  hs.HopSoID= sh.HopSoID
			where (sh.IsDeleted = 0 or sh.IsDeleted IS NULL) and (hs.IsDeleted = 0 or hs.IsDeleted IS NULL)
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[PROFILE_GET_ALL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROFILE_GET_ALL]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			 SELECT hs.HoSoID AS ProfileId,
					hs.MaHoSo AS FileCode,
					hs.TieuDeHoSo AS Title,
					hps.TieuDeHopSo AS GearBoxTitle,
					hs.Status As Status
			 FROM S_HoSo hs WITH(NOLOCK) 
			 INNER JOIN S_LoaiHoSo lhs WITH (NOLOCK) ON hs.LoaiHoSoID = lhs.LoaiHoSoID
			 INNER JOIN S_HopSo hps WITH(NOLOCK) ON hs.HopSoID = hps.HopSoID 
			 WHERE (hs.IsDeleted = 0 OR hs.IsDeleted IS NULL) AND (hps.isDeleted = 0 OR hps.isDeleted IS NULL)
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END

GO
/****** Object:  StoredProcedure [dbo].[PROFILE_GET_ALL_DOCUMENTS_WITH_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROFILE_GET_ALL_DOCUMENTS_WITH_PAGING]
@ProfileId INT,
@InWhere      NVARCHAR(MAX)  = '', 
 @InSort       NVARCHAR(200)  = '', 
 @StartRow     INT            = 1,
 @PageSize     INT            = 10,
 @TotalRecords INT OUTPUT,
 @ErrorCode    NVARCHAR(100) OUTPUT,
 @ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
	DECLARE @query NVARCHAR(4000) = '', @queryRowCount NVARCHAR(4000) = '';
	SET @query = 'SELECT 
			s.VanBanId as DocumentId,
			s.HoSoID as ProfileId,
			s.MaDinhDanh as DocumentCode, 
			s.STTVanBan as DocOrdinal, 
			s.LoaiVanBanID as DocumentTypeId, 
			s.SoVanBan as CodeNumber, 
			s.KyHieuVanBan as CodeNotation, 
			s.NoiDung as Subject, 
			s.NgonNguID as LanguageId, 
			s.SoTo as PageAmount, 
			s.GhiChu as Description, 
			s.KyHieuThongTin as InforSign, 
			s.TuKhoa as Keyword, 
			s.ButTich as Autograph, 
			s.TinhTrangVatLyID as Format, 
			s.MucDoTinCayID as ConfidenceLevelId, 
			s.ComputerFileID as ComputerFileId, 
			s.NgayVanBan as IssuedDate,
			h.MaHoSo,
			s.isDeleted
		FROM S_VanBan s WITH (NOLOCK) INNER JOIN S_HoSo h ON s.HoSoID = h.HoSoID 
		WHERE (s.isDeleted = 0 OR s.isDeleted IS NULL) AND s.HoSoID = ' + CONVERT(NVARCHAR, @ProfileId) + ' ' + @InWhere + ' ORDER BY S.VanBanID ' + @InSort + ' OFFSET ' + CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize)) + ' ROWS FETCH NEXT ' + CONVERT(NVARCHAR, @PageSize) + ' ROWS ONLY';
		print @query
	EXEC SP_EXECUTESQL @query;

	SET @queryRowCount = 'SELECT @TotalRecords = COUNT(s.VanBanID)
		FROM S_VanBan s WITH (NOLOCK) INNER JOIN S_HoSo h ON s.HoSoID = h.HoSoID WHERE (s.isDeleted = 0 OR s.isDeleted IS NULL) AND s.HoSoID = ' + CONVERT(NVARCHAR, @ProfileId) + ' ' + @InWhere;
	PRINT @queryRowCount;
	EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT
	SET @ErrorCode = '0';
	SET @ErrorMessage = '';
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[PROFILE_GET_All_FILE_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROFILE_GET_All_FILE_BY_ID]
(
	@ProfileId INT,
	@PageIndex INT = 1,
	@PageSize INT = 5,
	@TotalRecords INT OUTPUT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @query NVARCHAR(4000) = N'',
				@queryRowsCount NVARCHAR(1000) = N'';
		SET @query = N'SELECT 
						ComputerFileID AS FileId,
						FileName,
						Url,
						Size,
						NguoiTao AS CreatedBy,
						PageNumber,
						NgayTao AS CreatedDate,
						HoSoID AS ProfileId,
						FolderPath,
						ClientUrl,
						Status
					FROM S_ComputerFile f WITH (NOLOCK)
					WHERE (f.isDeleted = 0 OR f.isDeleted IS NULL) AND f.HoSoID = ' + CONVERT(NVARCHAR, @ProfileId) + ' ORDER BY f.HoSoID DESC OFFSET ' + CONVERT(NVARCHAR, (@PageIndex -1) * @PageSize) + ' ROWS FETCH NEXT ' + CONVERT(NVARCHAR, @PageSize) + ' ROWS ONLY';
		SET @queryRowsCount = N'SET @TotalRecords = (SELECT COUNT(ComputerFileID) FROM S_ComputerFile f WITH(NOLOCK) WHERE (f.isDeleted = 0 OR f.isDeleted IS NULL) AND HoSoID = ' + CONVERT(NVARCHAR, @ProfileId) + ')';
		EXEC SP_EXECUTESQL @query;
		EXEC SP_EXECUTESQL @queryRowsCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[PROFILE_GET_BY_FILECODE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROFILE_GET_BY_FILECODE]
(
	@FileCode NVARCHAR(50),
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT
			S.[HoSoID] AS ProfileId,
            S.[MaHoSo] AS FileCode
		FROM S_HoSo S WITH (NOLOCK)
		WHERE S.MaHoSo = @FileCode AND (S.IsDeleted = 0 OR S.IsDeleted IS NULL)
			--Select * from S_HoSo sh
			--left outer join S_HopSo shs on shs.HopSoID = sh.HopSoID
			--where (sh.IsDeleted = 0 or sh.IsDeleted IS NULL) and HoSoID = @HoSoID
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';

	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[PROFILE_GET_BY_GEAR_BOX_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROFILE_GET_BY_GEAR_BOX_ID]
(
	 @GearBoxId INT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	 @ErrorMessage NVARCHAR(4000) OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT H.HoSoID as 'ProfileId',
			H.MaHoSo as 'FileCode',
			H.TieuDeHoSo as 'ProfileTitle',
			H.Status,
			H.HopSoID as GearBoxId,
			(SELECT COUNT(S.ComputerFileID) FROM S_ComputerFile S WHERE (S.IsDeleted = 0 OR S.IsDeleted IS NULL) AND S.HoSoID = H.HoSoID) AS TotalFiles,
			(SELECT COUNT(S.ComputerFileID) FROM S_ComputerFile S WHERE (S.IsDeleted = 0 OR S.IsDeleted IS NULL) AND S.Status = 1 AND S.HoSoID = H.HoSoID) AS TotalFilesCompleted
		FROM S_HoSo H
		WITH (NOLOCK)
		WHERE H.HopSoID = @GearBoxId
		SET @ErrorCode = '0'
		SET @ErrorMessage = N'Lấy dữ liệu thành công'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
    SET NOCOUNT OFF;
END

GO
/****** Object:  StoredProcedure [dbo].[PROFILE_GET_BY_GearBoxID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROFILE_GET_BY_GearBoxID]
(
	 @InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	 @ErrorMessage NVARCHAR(4000) OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @query NVARCHAR(MAX) = '';
		DECLARE @totalRows NVARCHAR(MAX) = '';
		DECLARE @ROWS NVARCHAR(50) = '';
		SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
		SET @query = 'SELECT hs.HoSoID AS ProfileId,
				hs.MaHoSo AS FileCode,
				hs.GhiChu AS Note,
				hs.SoHoSo AS ProfileNumber,
				hps.MaHopSo AS GearBoxId,
				lhs.TenLoaiHoSo AS ProfileTypeName,
				hs.TieuDeHoSo AS Title,
				hps.TieuDeHopSo AS GearBoxTitle,
				hs.TinhTrangVatLy AS Format,
				hs.ThoiHanBaoQuan AS Maintenance,
				hs.GhiChu AS Description
		 FROM S_HoSo hs WITH(NOLOCK) INNER JOIN S_LoaiHoSo lhs WITH (NOLOCK) ON hs.LoaiHoSoID = lhs.LoaiHoSoID
		 INNER JOIN S_HopSo hps WITH(NOLOCK) ON hs.HopSoID = hps.HopSoID WHERE (hs.IsDeleted = 0 OR hs.IsDeleted IS NULL) '
		  + @InWhere + ' 
		  ORDER BY hs.HoSoID ' + @InSort + ' OFFSET ' + @ROWS + ' ROWS FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY';
		 EXEC SP_EXECUTESQL @query;
		 SET @totalRows = 'SET @TotalRecords = (SELECT COUNT(hs.HoSoID)
							FROM S_HoSo hs WITH(NOLOCK) 
							INNER JOIN S_LoaiHoSo lhs WITH (NOLOCK) ON hs.LoaiHoSoID = lhs.LoaiHoSoID
							INNER JOIN S_HopSo hps WITH(NOLOCK) ON hs.HopSoID = hps.HopSoID WHERE (hs.IsDeleted = 0 OR hs.IsDeleted IS NULL) ' + @InWhere + ')';
		EXEC SP_EXECUTESQL @totalRows, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT
		SET @ErrorCode = '0'
		SET @ErrorMessage = 'Lấy dữ liệu thành công'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[PROFILE_GET_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROFILE_GET_BY_ID]
(
	@ProfileId INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT
			S.FontId,
			S.OrganId,
			S.TableOfContentId,
			S.[HoSoID] AS ProfileId,
			S.[HopSoID] AS GearBoxId,
            S.[MaHoSo] AS FileCode,
            S.[FileCatalog] AS FileCatalog,
            S.[SoHoSo] AS FileNotation,
            S.[TieuDeHoSo] AS Title,
			S.[UpdateBy] AS UpdateBy,
            S.[LoaiHoSoID] AS ProfileTypeId,
            S.[GhiChu] AS Description,
            S.[ThoiGianBatDau] AS StartDate,
            S.[ThoiGianKetThuc] AS EndDate,
            S.[ThoiHanBaoQuan] AS Maintenance,
            S.[CheDoSuDung] AS Rights,
            S.[NgonNgu] AS Language,
            S.[TongSoVanBan] AS TotalDoc,
            S.[KyHieuThongTin] AS InforSign,
            S.[TuKhoa] AS Keyword,
            S.[SoLuongTo] AS SheetNumber,
            S.[SoLuongTrang] AS PageNumber,
            S.[TinhTrangVatLy] AS [Format],
			S.Status,
			hps.TieuDeHopSo AS GearBoxTitle,
			hps.MaHopSo AS GearBoxCode,
			lhs.TenLoaiHoSo AS ProfileTypeName,
			(SELECT P.TenPhong FROM S_Phong P WHERE P.PhongID = S.FontId) AS FontName,
			(SELECT C.TenCoQuan FROM S_CoQuan C WHERE C.CoQuanID = S.OrganId) AS OrganName,
			(SELECT M.MucLucSo FROM S_MucLucHoSo M WHERE M.MucLucHoSoID = S.TableOfContentId) AS TableOfContentNumber,
			(SELECT COUNT(F.HoSoID) FROM S_ComputerFile F WITH (NOLOCK) WHERE F.HoSoID = S.HoSoID AND (F.IsDeleted = 0 OR F.IsDeleted IS NULL)) AS TotalFiles
		FROM S_HoSo S WITH (NOLOCK)
		INNER JOIN S_LoaiHoSo lhs WITH (NOLOCK) ON S.LoaiHoSoID = lhs.LoaiHoSoID 
		INNER JOIN S_HopSo hps WITH(NOLOCK) ON S.HopSoID = hps.HopSoID
		WHERE S.HoSoID = @ProfileId AND (S.IsDeleted = 0 OR S.IsDeleted IS NULL)
		
			--Select * from S_HoSo sh
			--left outer join S_HopSo shs on shs.HopSoID = sh.HopSoID
			--where (sh.IsDeleted = 0 or sh.IsDeleted IS NULL) and HoSoID = @HoSoID
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';

	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[PROFILE_GET_FILL_DATA_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROFILE_GET_FILL_DATA_BY_ID]
(
	@ProfileId INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT   
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF @ProfileId IS NULL
		BEGIN
			SET @ErrorCode = N'1';
			SET @ErrorMessage = N'Không tồn tại bản ghi.';
			RETURN;
		END
		ELSE
		BEGIN
			SELECT scq.CoQuanID OrganID,p.PhongID FontID,ml.MucLucHoSoID TableOfContID, hopso.HopSoID GearBoxID, hs.HopSoID ProfileID,hs.MaHoSo ProfileCode
			FROM S_HoSo hs
			inner join S_HopSo hopso on hopso.HopSoID = hs.HopSoID
			inner join S_MucLucHoSo ml on ml.MucLucHoSoID = hopso.MucLucHoSoID
			inner join S_LuuTru lt on lt.LuuTruID = ml.LuuTruID
			inner join S_Phong p on p.PhongID = lt.PhongID
			inner join S_CoQuan scq on scq.CoQuanID = p.CoQuanID
			WHERE hs.HoSoID = @ProfileId
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END

GO
/****** Object:  StoredProcedure [dbo].[PROFILE_GET_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROFILE_GET_PAGING] 
	@RowsPerPage INT = 10,
	@PageNumber INT = 0,
	@PageSize INT =10,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
	DECLARE @QUERY NVARCHAR(max) = '';
	DECLARE @CONDITION NVARCHAR(max) = '';
	DECLARE @RELATIONSHIP NVARCHAR(max) = '';
BEGIN
	-- Pagination query for the object you want to retrieve
	SET NOCOUNT ON;
	SET @CONDITION =  '(hs.IsDeleted = 0 or hs.IsDeleted IS NULL)'
	SET @RELATIONSHIP = 'LEFT OUTER JOIN S_HopSo shs on shs.HopSoID = hs.HopSoID' 
	SET @QUERY = 'SELECT * '+
			'FROM S_HoSo hs '+
			+@RELATIONSHIP+
			' WHERE ' +@CONDITION+
			'ORDER BY hs.HoSoID '+
			'OFFSET '+CONVERT(INT, @PageNumber*@RowsPerPage)+' ROWS '+
			'FETCH NEXT '+CONVERT(INT, @PageSize)+' ROWS ONLY '
    BEGIN TRY
		EXEC SP_EXECUTESQL @QUERY
		SET @ErrorCode = '0';
		SET @ErrorMessage = 'SUC';
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[PROFILE_UPDATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROFILE_UPDATE]
(
	@HoSoID INT,
	@TieuDeHoSo NVARCHAR(50),
	@MaHoSo NVARCHAR(50),
	@TenHoSo NVARCHAR(50),
	@NgayTao DATE,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @MaHS INT,@currYear DATETIME,
		@MaHSTop1 NVARCHAR(50),@currYearStr NVARCHAR(50)
		BEGIN
			SET @currYear = YEAR(GETDATE())
			SET @currYearStr = @currYear
			SET @MaHSTop1 = (SELECT TOP (1) hs.MaHoSo FROM S_HoSo hs WHERE (hs.IsDeleted = 0 or hs.IsDeleted IS NULL) ORDER BY hs.HoSoID DESC)
			IF @MaHSTop1 IS NOT NULL 
				BEGIN
					IF  CHARINDEX(@currYearStr, @MaHSTop1 ) > 0 
						BEGIN
							-- Ma se duoc cong them va cong voi nam 
							SET @MaHS = 1
						END
					ELSE
						BEGIN
							-- Ma se duoc quay tro ve 1 va cong voi nam
							SET @MaHS = 1
						END
				END
			INSERT INTO S_HoSo(MaHoSo,TenHoSo,TieuDeHoSo,NgayTao,IsDeleted) VALUES(@MaHS,@TenHoSo,@TieuDeHoSo,@NgayTao,0);
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[PROFILES_ADD_NEW]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROFILES_ADD_NEW]
	-- Add the parameters for the stored procedure here
	@FontId INT,
	@OrganId INT,
	@TableOfContentId INT,
	@GearBoxId INT = 0, -- mã hộp số { sửa tạm thời }
    @ProfileType INT,
    @FileCode NVARCHAR(50), -- mã hồ sơ
    @FileCatalog INT, -- số mục lục hoặc năm hình thành hồ sơ
    @FileNotation NVARCHAR(100), -- số hồ sơ
    @Title NVARCHAR(1000) = N'',
    @Maintenance NVARCHAR(200) = N'', -- thời hạn bảo quản
    @Rights NVARCHAR(200) = N'',
    @LanguageId NVARCHAR(50) = N'',
    @StartDate DATETIME,
    @EndDate DATETIME,
    @TotalDoc INT = 0,
    @Description NVARCHAR(1000) = N'',
    @Keyword NVARCHAR(200) = N'',
    @InforSign NVARCHAR(200) = N'',
    @SheetNumber INT = 0,
    @PageNumber INT = 0,
    @PhysicalStateId NVARCHAR(50) = N'',
    @CreateBy NVARCHAR(50) = N'',
    @JSONFILE NVARCHAR(MAX) = '',
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF EXISTS(SELECT HoSoID from S_HoSo WITH (NOLOCK) WHERE MaHoSo = @FileCode)
	BEGIN
		SET @ErrorCode = '-3'
		SET @ErrorMessage = N'Hồ sơ đã tồn tại trên hệ thống, vui lòng thử lại.'
		RETURN;
	END
	BEGIN TRY
		DECLARE @type INT;
        DECLARE @inJSON NVARCHAR(MAX) = '';
        -- Insert rows into table 'S_HoSo' in schema '[dbo]'
        INSERT INTO [dbo].[S_HoSo]
        ( -- Columns to insert data into
			[FontId],
			[OrganId],
			[TableOfContentId],
            [HopSoID],
            [MaHoSo],
            [FileCatalog],
            [SoHoSo],
            [TieuDeHoSo],
            [NgayTao],
            [CreateBy],
            [LoaiHoSoID],
            [GhiChu],
            [ThoiGianBatDau],
            [ThoiGianKetThuc],
            [ThoiHanBaoQuan],
            [CheDoSuDung],
            [NgonNgu],
            [TongSoVanBan],
            [KyHieuThongTin],
            [TuKhoa],
            [SoLuongTo],
            [SoLuongTrang],
            [TinhTrangVatLy],
			[Status]
        )
        VALUES
        ( -- First row: values for the columns in the list above
			@FontId,
			@OrganId,
			@TableOfContentId,
            @GearBoxId,
            @FileCode,
            @FileCatalog,
            @FileNotation,
            @Title,
            GETDATE(),
            @CreateBy,
            @ProfileType, -- loại hồ sơ
            @Description,
            @StartDate,
            @EndDate,
            @Maintenance,
            @Rights,
            @LanguageId,
            @TotalDoc,
            @InforSign,
            @Keyword,
            @SheetNumber,
            @PageNumber,
            @PhysicalStateId,
			0
        )
        
        DECLARE @Id INT = SCOPE_IDENTITY();
		-- Thêm thông tin file vào db
		IF @JSONFILE <> ''
			BEGIN
				INSERT INTO S_ComputerFile
				(HoSoID, FileName, Url, NguoiTao, NgayTao, PageNumber, Size, FolderPath, ClientUrl, Status)
				SELECT @Id, FileName, Url, CreatedBy, GETDATE(), PageNumber, Size, FolderPath, ClientUrl, 0 FROM OPENJSON(@JSONFILE)
				WITH (FileName NVARCHAR(300), Url NVARCHAR(4000), CreatedBy NVARCHAR(100), PageNumber INT, Size VARCHAR(20), FolderPath NVARCHAR(1000), ClientUrl NVARCHAR(1000))

				
			END
		-- cập nhật trạng thái cho hộp số
		UPDATE S_HopSo SET Status = 3 WHERE HopSoID = @GearBoxId;

		SET @ErrorCode = '0'
		SET @ErrorMessage = N'Thêm mới thành công, hi hi.'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
    SET NOCOUNT OFF;
END

GO
/****** Object:  StoredProcedure [dbo].[PROFILES_GET_SEARCH_WITH_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROFILES_GET_SEARCH_WITH_PAGING]
	@PageIndex INT,
	@PageSize INT = 5,
	@InWhere NVARCHAR(500) = '',
	@InSort NVARCHAR(200) = '',
	@TotalRecords INT OUTPUT,
	@ErrorCode INT OUTPUT,
	@ErrorMessage NVARCHAR(2000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @query NVARCHAR(MAX) = '';
		DECLARE @totalRows NVARCHAR(MAX) = '';
		SET @query = 'SELECT hs.HoSoID AS ProfileId,
				hs.MaHoSo AS FileCode,
				hps.HopSoID AS GearBoxId,
				hps.MaHopSo AS GearBoxCode,
				lhs.TenLoaiHoSo AS ProfileTypeName,
				hs.TieuDeHoSo AS Title,
				hps.TieuDeHopSo AS GearBoxTitle,
				hs.TinhTrangVatLy AS Format,
				hs.ThoiHanBaoQuan AS Maintenance,
				hs.GhiChu AS Description,
				hs.Status
		 FROM S_HoSo hs WITH(NOLOCK) INNER JOIN S_LoaiHoSo lhs WITH (NOLOCK) ON hs.LoaiHoSoID = lhs.LoaiHoSoID
		 INNER JOIN S_HopSo hps WITH(NOLOCK) ON hs.HopSoID = hps.HopSoID WHERE (hs.IsDeleted = 0 OR hs.IsDeleted IS NULL) '
		  + @InWhere + ' 
		  ORDER BY hs.HoSoID DESC ' + @InSort + ' OFFSET ' + CONVERT(NVARCHAR, (@PageIndex - 1) * @PageSize) + ' ROWS FETCH NEXT ' + CONVERT(NVARCHAR, @PageSize) + ' ROWS ONLY';
		 EXEC SP_EXECUTESQL @query;
		 SET @totalRows = 'SET @TotalRecords = (SELECT COUNT(hs.HoSoID)
							FROM S_HoSo hs WITH(NOLOCK) 
							INNER JOIN S_LoaiHoSo lhs WITH (NOLOCK) ON hs.LoaiHoSoID = lhs.LoaiHoSoID
							INNER JOIN S_HopSo hps WITH(NOLOCK) ON hs.HopSoID = hps.HopSoID WHERE (hs.IsDeleted = 0 OR hs.IsDeleted IS NULL) ' + @InWhere + ')';
		EXEC SP_EXECUTESQL @totalRows, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT
		SET @ErrorCode = '0'
		SET @ErrorMessage = ''
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
    SET NOCOUNT OFF;
END

GO
/****** Object:  StoredProcedure [dbo].[PROFILES_UPDATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROFILES_UPDATE]
	-- Add the parameters for the stored procedure here
	@FontId INT,
	@OrganId INT,
	@TableOfContentId INT,
	@ProfileId INT,
	@GearBoxId INT, -- mã hộp số
    @ProfileType INT,
    @FileCode NVARCHAR(50), -- mã hồ sơ
    @FileCatalog INT, -- số mục lục hoặc năm hình thành hồ sơ
    @FileNotation NVARCHAR(100), -- số hồ sơ
    @Title NVARCHAR(1000) = N'',
    @Maintenance NVARCHAR(200) = N'', -- thời hạn bảo quản
    @Rights NVARCHAR(200) = N'',
    @LanguageId NVARCHAR(50) = N'',
    @StartDate DATETIME,
    @EndDate DATETIME,
    @TotalDoc INT = 0,
    @Description NVARCHAR(1000) = N'',
    @Keyword NVARCHAR(200) = N'',
    @InforSign NVARCHAR(200) = N'',
    @SheetNumber INT = 0,
    @PageNumber INT = 0,
    @PhysicalStateId NVARCHAR(50) = N'',
    @UpdateBy NVARCHAR(50) = N'',
    @JSONFILE NVARCHAR(MAX) = N'',
	@JSONOVER NVARCHAR(MAX) = '',
	@FolderPath NVARCHAR(1000) = '',
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		-- nếu mã hồ sơ thay đổi
		DECLARE @olderPath NVARCHAR(1000) = (SELECT TOP 1 FolderPath FROM S_ComputerFile WHERE HoSoID = @ProfileId)
		IF NOT EXISTS (SELECT hs.MaHoSo FROM S_HoSo hs WHERE hs.MaHoSo = @FileCode)
		BEGIN
			UPDATE S_ComputerFile
			SET FolderPath = @FolderPath
			WHERE HoSoID = @ProfileId AND (IsDeleted = 0 OR IsDeleted IS NULL)
		END

        UPDATE [dbo].[S_HoSo]
		SET
			[FontId] = @FontId,
			[OrganId] = @OrganId,
			[TableOfContentId] = @TableOfContentId,
            [HopSoID] = @GearBoxId,
            [MaHoSo] = @FileCode,
            [FileCatalog] = @FileCatalog,
            [SoHoSo] = @FileNotation,
            [TieuDeHoSo] = @Title,
            [NgayCapNhat] = GETDATE(),
            [UpdateBy] = @UpdateBy,
            [LoaiHoSoID] = @ProfileType,
            [GhiChu] = @Description,
            [ThoiGianBatDau] = @StartDate,
            [ThoiGianKetThuc] = @EndDate,
            [ThoiHanBaoQuan] = @Maintenance,
            [CheDoSuDung] = @Rights,
            [NgonNgu] = @LanguageId,
            [TongSoVanBan] = @TotalDoc,
            [KyHieuThongTin] = @InforSign,
            [TuKhoa] = @Keyword,
            [SoLuongTo] = @SheetNumber,
            [SoLuongTrang] = @PageNumber,
            [TinhTrangVatLy] = @PhysicalStateId
        WHERE HoSoID = @ProfileId

		DECLARE @Id INT = (SELECT S.HoSoID FROM S_HoSo S WHERE S.HoSoID = @ProfileId);
		-- Thêm thông tin file vào db
		IF @JSONFILE <> ''
			BEGIN
				IF @JSONOVER <> '' -- Nếu có ghi đè
					BEGIN
						-- set isDeleted = 1 cho các file bị ghi đè 
						
						UPDATE U
						SET    U.IsDeleted = 1
						FROM   S_ComputerFile AS U
						JOIN   OPENJSON(@JSONOVER)
							   WITH (FileName NVARCHAR(300), Url NVARCHAR(200), ProfileId INT) J
							   ON J.ProfileId = U.HoSoID WHERE (U.IsDeleted = 0 OR U.IsDeleted IS NULL) AND U.FileName = J.FileName
					
					END
				INSERT INTO S_ComputerFile
				(HoSoID, FileName, Url, NguoiTao, NgayTao, PageNumber, Size, FolderPath, ClientUrl, Status)
				SELECT @ProfileId, FileName, Url, CreatedBy, GETDATE(), PageNumber, Size, FolderPath, ClientUrl, 0 FROM OPENJSON(@JSONFILE)
				WITH (FileName NVARCHAR(300), Url NVARCHAR(4000), CreatedBy NVARCHAR(100), PageNumber INT, Size VARCHAR(20), FolderPath NVARCHAR(1000), ClientUrl NVARCHAR(1000))

				-- khi có file được tải lên, update lại trạng thái hồ sơ
				UPDATE S_HoSo
				SET Status = 0 WHERE HoSoID = @ProfileId;

                -- cập nhật trạng thái cho hộp số
		        UPDATE S_HopSo SET Status = 3 WHERE HopSoID = @GearBoxId;
			END

		SET @ErrorCode = '0'
		SET @ErrorMessage = N'Cập nhật thành công, hi hi.'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
    SET NOCOUNT OFF;
END



GO
/****** Object:  StoredProcedure [dbo].[ProfileType_GET_ALL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProfileType_GET_ALL]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			select LoaiHoSoID as ProfileTypeId,
			TenLoaiHoSo as ProfileTypeName
			from S_LoaiHoSo WITH (NOLOCK)
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END

GO
/****** Object:  StoredProcedure [dbo].[ROLE_CREATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ROLE_CREATE]
	-- Add the parameters for the stored procedure here
	@RoleName NVARCHAR(50) = '',
	@ErrorCode  INT OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		INSERT INTO S_Role(
			RoleName
		)VALUES(
			@RoleName
		)
		SET @ErrorCode = '0'
		SET @ErrorMessage = N'Thêm nhóm quyền thành công'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[ROLE_CREATE_ROLE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ROLE_CREATE_ROLE]
	-- Add the parameters for the stored procedure here
	@RoleName NVARCHAR(50),
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF EXISTS(SELECT S_Role.RoleName FROM S_Role WHERE @RoleName = RoleName)
	BEGIN
		SET @ErrorCode = '1'
		SET @ErrorMessage = N'Quyền đã tồn tại'
		RETURN
	END
	BEGIN TRY
		INSERT INTO S_Role(
			RoleName
		)
		VALUES (@RoleName)

		SET @ErrorCode = '0'
		SET @ErrorMessage = N''
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[ROLE_DELETE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ROLE_DELETE]
	-- Add the parameters for the stored procedure here
	@RoleId INT = 0,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET NOCOUNT ON;
	
	BEGIN TRY
		IF @RoleId != 0
			BEGIN
				IF NOT EXISTS ((SELECT RoleID FROM S_User_Role WHERE RoleID = @RoleId))
					BEGIN
						IF NOT EXISTS ((SELECT RoleID FROM S_Role_URL WHERE RoleID = @RoleId))
							BEGIN 
								Update S_Role SET IsDeleted = 1
								WHERE S_Role.RoleID = @RoleId
								SET @ErrorCode = '0'
								SET @ErrorMessage = N'Xóa thành công'
							END
					END
			END
		ELSE
			BEGIN
				SET @ErrorCode = '1'
				SET @ErrorMessage = N'Xóa thất bại'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[ROLE_EDIT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ROLE_EDIT]
	-- Add the parameters for the stored procedure here
	@RoleId INT,
	@RoleName NVARCHAR(50),
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		UPDATE S_Role
		SET S_Role.RoleName = @RoleName
		WHERE S_Role.RoleID = @RoleId
		SET @ErrorCode = '0'
		SET @ErrorMessage = N''
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[ROLE_GET_ALL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ROLE_GET_ALL]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT r.RoleID RoleID, r.RoleName RoleName FROM S_Role r 
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[ROLE_GET_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ROLE_GET_BY_ID]
(
	@RoleID INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF @RoleID IS NULL
		BEGIN
			SET @ErrorCode = N'1';
			SET @ErrorMessage = N'Không tồn tại bản ghi.';
			RETURN;
		END
		ELSE
		BEGIN
			SELECT r.RoleID RoleId, r.RoleName RoleName
			FROM S_Role r
			WHERE (r.IsDeleted = 0 OR r.IsDeleted IS NULL) AND r.RoleID = @RoleID
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[ROLE_GET_BY_USERNAME]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ROLE_GET_BY_USERNAME]
(
	@UserName NVARCHAR(30) = '',
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF @UserName IS NULL
		BEGIN
			SET @ErrorCode = N'1';
			SET @ErrorMessage = N'Không tồn tại bản ghi.';
			RETURN;
		END
		ELSE
		BEGIN
			DECLARE @RoleID INT = 0;
			DECLARE @UserID INT = 0;
			SET @UserID =  (SELECT TOP 1 us.UserID FROM S_Users us
			WHERE (us.IsDeleted = 0 OR us.IsDeleted IS NULL) AND us.UserName = @UserName)

			IF @UserID IS NOT NULL AND @UserID != 0
				BEGIN
					SET @RoleID =  (SELECT TOP 1 ur.RoleID FROM S_User_Role ur
					WHERE ur.UserID = @UserID)
				END
			SELECT r.RoleName RoleName
			FROM S_Role r
			WHERE (r.IsDeleted = 0 OR r.IsDeleted IS NULL) AND r.RoleID = @RoleID
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[ROLE_GET_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ROLE_GET_PAGING] 
	-- Add the parameters for the stored procedure here
	@FromRecord INT,
	@PageSize INT,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
	DECLARE @QUERY nvarchar(max) = '';
	DECLARE @QUERY_TOTAL_ROWS nvarchar(max) = '';
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @QUERY = ' SELECT * '+
					' FROM S_Role ' +
					' ORDER BY RoleName ASC '+
					' OFFSET ' + CONVERT(NVARCHAR, @FromRecord) + ' ROWS ' +
					' FETCH NEXT ' + CONVERT(NVARCHAR, @PageSize) + ' ROW ONLY '
    BEGIN TRY
		EXEC SP_EXECUTESQL @QUERY
		SET @ErrorCode = '0';
		SET @ErrorMessage = 'SUC';
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[ROLE_GET_ROLE_BY_USER_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ROLE_GET_ROLE_BY_USER_ID]
	-- Add the parameters for the stored procedure here
	@UserId INT,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY
		SELECT S_Role.RoleID,
				RoleName
		From S_Role
		INNER JOIN S_User_Role
		ON S_User_Role.RoleID = S_Role.RoleID
		WHERE S_User_Role.UserID = @UserId

		SET @ErrorCode = '0'
		SET @ErrorMessage = 'SUC'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Role_GET_SEARCH_WITH_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Role_GET_SEARCH_WITH_PAGING]
	@InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	BEGIN TRY
			DECLARE @ROWS NVARCHAR(50) = '';
			SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
		BEGIN
			SET @query = 'SELECT r.RoleID RoleId, r.RoleName RoleName FROM S_Role r
									WHERE ((r.IsDeleted = 0 OR r.IsDeleted IS NULL))' + @InWhere + ' ORDER BY ' + @InSort + ' r.RoleID DESC ' + ' OFFSET ' + @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY ';
			EXEC SP_EXECUTESQL @query;
            SET @queryRowCount = 'SELECT @TotalRecords = COUNT(r.RoleID) FROM S_Role r
									WHERE ((r.IsDeleted = 0) OR (r.IsDeleted IS NULL))' + @InWhere;
            EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SIGNATURES_CREATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIGNATURES_CREATE]
	-- Add the parameters for the stored procedure here
	@FileName NVARCHAR(200) = '',
	@Size FLOAT,
	@Path NVARCHAR(500),
	@CreateBy NVARCHAR(50) = '',
	@ServerPath NVARCHAR(1000),
	@Overwrite TINYINT = 0,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		-- CẬP NHẬT LẠI TRẠNG THÁI CHO FILE NẾU GHI ĐÈ
		IF @Overwrite = 1
		BEGIN
			UPDATE DigitalSignatures
			SET IsDeleted = 1
			WHERE FileName = @FileName
		END
		
		INSERT INTO DigitalSignatures
		(
			FileName,
			Size,
			Path,
			CreateBy,
			CreateDate,
			Status,
			ServerPath
		)
		VALUES(
			@FileName,
			@Size,
			@Path,
			@CreateBy,
			GETDATE(),
			0,
			@ServerPath
		)
		SET @ErrorCode = '0'
		SET @ErrorMessage = N'Create new successfully.'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SIGNATURES_DELETE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIGNATURES_DELETE]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @status INT = 0;
		SET @status = (SELECT status FROM DigitalSignatures WHERE Id = @Id);
		IF @status = 1
			BEGIN
				SET @ErrorCode = 'USING';
				SET @ErrorMessage = N'Chữ ký đang được sử dụng, vui lòng thử lại.';
				RETURN;
			END
		ELSE
		BEGIN
			UPDATE DigitalSignatures
			SET isDeleted = 1
			WHERE Id = @Id
			SET @ErrorCode = '0'
			SET @ErrorMessage = N'Delete successfully.'
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SIGNATURES_GET_ALL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIGNATURES_GET_ALL]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT Id,
					FileName,
					Size,
					Path,
					CreateBy,
					CreateDate,
					Status,
					ServerPath
				FROM DigitalSignatures WITH (NOLOCK)
				WHERE (IsDeleted = 0 OR IsDeleted IS NULL) 
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SIGNATURES_GET_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIGNATURES_GET_BY_ID]
(
	@Id INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT Id, FileName, Status FROM DigitalSignatures WITH (NOLOCK)
			WHERE (IsDeleted = 0 OR IsDeleted IS NULL) AND Id = @Id
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SIGNATURES_GET_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SIGNATURES_GET_PAGING]
(
@InWhere      NVARCHAR(MAX)  = '', 
 @InSort       NVARCHAR(200)  = '', 
 @StartRow     INT            = 0,
 @Keywords     NVARCHAR(MAX)  = '', 
 @PageSize     INT            = 10,
 @TotalRecords INT OUTPUT,
 @ErrorCode    NVARCHAR(100) OUTPUT,
 @ErrorMessage NVARCHAR(4000) OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		DECLARE @query NVARCHAR(MAX)= '';
        DECLARE @queryRowCount NVARCHAR(MAX)= '';
        BEGIN TRY
			DECLARE @ROWS NVARCHAR(50) = '';
			SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
            SET @query = 'SELECT Id,
								 FileName,
								 Size,
								 Path,
								 CreateBy,
								 CreateDate,
								 Status
								FROM DigitalSignatures WITH (NOLOCK)
								WHERE (IsDeleted = 0 OR IsDeleted IS NULL) ' + @InWhere + ' ORDER BY ' + @InSort + ' Id ASC ' + ' OFFSET ' + @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY ';
            EXEC SP_EXECUTESQL @query;
            SET @queryRowCount = 'SELECT @TotalRecords = COUNT(Id)
								 FROM DigitalSignatures WITH (NOLOCK)
								 WHERE (IsDeleted = 0 OR IsDeleted IS NULL) ' + @InWhere;
            EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
            SET @ErrorCode = '0';
            SET @ErrorMessage = N'Lấy dữ liệu thành công';
        END TRY
        BEGIN CATCH
            SET @ErrorCode = ERROR_MESSAGE();
            SET @ErrorMessage = ERROR_MESSAGE();
        END CATCH;
        SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SIGNATURES_UPDATE_STATUS]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIGNATURES_UPDATE_STATUS]
	-- Add the parameters for the stored procedure here
	@Id INT,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @status INT = 0;
		SET @status = (SELECT status FROM DigitalSignatures WHERE Id = @Id);
		IF @status = 1
			BEGIN
				UPDATE DigitalSignatures
				SET Status = 0
				WHERE Id = @Id
			END
		ELSE
		BEGIN
			UPDATE DigitalSignatures
			SET Status = 1
			WHERE Id = @Id
			-- đồng thời cập nhật lại tất cả trạng thái của các chữ ký còn lại = 0;
			UPDATE DigitalSignatures
			SET Status = 0
			WHERE Id <> @Id;
		END
		SET @ErrorCode = '0'
		SET @ErrorMessage = N'Update successfully.'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[STATISTIC_BY_DATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STATISTIC_BY_DATE]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(NgayThemFile), NgayThemFile FROM S_VanBan
	GROUP BY  NgayThemFile
END
GO
/****** Object:  StoredProcedure [dbo].[STATISTIC_GET_NUMBER_OF_FILES]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STATISTIC_GET_NUMBER_OF_FILES]
	-- Add the parameters for the stored procedure here
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY
		SELECT 
			B.HoSoId as 'DocumentId', 
			ISNULL(A.NumberOfDocuments, 0) as 'NumberOfDocuments', 
			B.NumberOfFiles
		FROM
			(SELECT HoSoID, COUNT(HoSoID) as 'NumberOfDocuments'
			FROM S_VanBan
			GROUP BY HoSoID) A
		RIGHT JOIN 
			(SELECT S_ComputerFile.HoSoID, 
					COUNT(S_ComputerFile.HoSoID) as 'NumberOfFiles' 
			FROM S_HoSo
			LEFT JOIN S_ComputerFile
			ON S_ComputerFile.HoSoID = S_HoSo.HoSoID
			GROUP BY S_ComputerFile.HoSoID
			HAVING S_ComputerFile.HoSoID IS NOT NULL) B
		ON a.HoSoID = B.HoSoID
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[STATUS_GET_ALL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STATUS_GET_ALL]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT st.StatusID,st.StatusName,st.Note
			FROM CommonStatus st WITH (NOLOCK)
			WHERE st.IsDeleted = 0 or st.IsDeleted IS NULL
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Tab_GET_ALL_GETIDANDNAME_SELECT2]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Tab_GET_ALL_GETIDANDNAME_SELECT2]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT sm.MucLucHoSoID Id,sm.MucLucSo Text
			FROM S_MucLucHoSo sm
			WHERE sm.isDeleted = 0 or sm.isDeleted IS NULL
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[TableOfContents_DELETE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TableOfContents_DELETE]
	-- Add the parameters for the stored procedure here
	@MucLucHoSoID int,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRY
		IF NOT EXISTS(SELECT S_MucLucHoSo.MucLucHoSoID
					  FROM S_MucLucHoSo 
					  WHERE S_MucLucHoSo.MucLucHoSoID = @MucLucHoSoID)
			BEGIN
				SET @ErrorCode = '1'
				SET @ErrorMessage = N'Không tồn tại hộp số này'
				RETURN;
			END
			ELSE
				BEGIN
					Update S_MucLucHoSo SET isDeleted =1
					WHERE S_MucLucHoSo.MucLucHoSoID = @MucLucHoSoID;
					SET @ErrorCode = N'0';
					SET @ErrorMessage = N'Xóa thành công'
				END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[TableOfContents_EDIT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TableOfContents_EDIT]
	-- Add the parameters for the stored procedure here
	@MucLucHoSoID int,
	@LuuTruID int,
	--@KhoID int,
	@PhongID int,
	@TenMucLucHoSo NVARCHAR(50) = N'',
	@MucLucSo NVARCHAR(50) = N'',
	@MaDanhMuc NVARCHAR(50) = N'',
	@GhiChu NVARCHAR(50) = N'',
	@NgayCapNhat NVARCHAR(100) = '',
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @LTruID int
    BEGIN TRY
		IF @PhongID IS NOT NULL
			Begin
				if not exists (SELECT LuuTruID from S_LuuTru where PhongID = @PhongID )
					Begin
							INSERT INTO S_LuuTru(PhongID) values(@PhongID)
							SET @LTruID = @@IDENTITY
					End
				Else
					Begin
							SET @LTruID = (SELECT TOP(1) LuuTruID from S_LuuTru where PhongID = @PhongID)
					End   
			End
		--IF @LuuTruID IS NOT NULL
		--	Begin
		--		if not exists (SELECT LuuTruID from S_LuuTru where LuuTruID = @LuuTruID)
		--			Begin
		--				SET @LTruID = NULL
		--			End
		--		Else
		--			Begin
		--				SET @LTruID = (SELECT LuuTruID from S_LuuTru where LuuTruID = @LuuTruID)
		--			End   
		--	End
		ELSE
			Begin
				SET @LTruID = NULL
			END
		IF (SELECT COUNT(MucLucHoSoID) from S_MucLucHoSo where LuuTruID = @LTruID AND MucLucSo = @MucLucSo AND MucLucHoSoID != @MucLucHoSoID) >= 1
			BEGIN
				SET @ErrorCode = '1'
				SET @ErrorMessage = N'Thất bại'
			END
		ELSE
			BEGIN
				UPDATE S_MucLucHoSo
				SET TenMucLucHoSo = @TenMucLucHoSo, LuuTruID = @LTruID,MucLucSo=@MucLucSo,MaDanhMuc = @MaDanhMuc,GhiChu=@GhiChu,NgayCapNhat = @NgayCapNhat
				WHERE MucLucHoSoID = @MucLucHoSoID
				SET @ErrorCode = '0'
				SET @ErrorMessage = N'Sửa thành công'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[TableOfContents_GET_ALL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TableOfContents_GET_ALL]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT sm.MucLucHoSoID TabOfContID,sm.MucLucSo TabOfContNumber
			FROM S_MucLucHoSo sm
			WHERE sm.isDeleted = 0 or sm.isDeleted IS NULL
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[TableOfContents_GET_BY_FONTID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TableOfContents_GET_BY_FONTID]
(
	 @InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	 @ErrorMessage NVARCHAR(4000) OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	DECLARE @ROWS NVARCHAR(50) = '';
	SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
	BEGIN TRY
		IF @InWhere IS NULL
			BEGIN
				SET @ErrorCode = N'1';
				SET @ErrorMessage = N'Không tồn tại bản ghi.';
				RETURN;
			END
		ELSE
			BEGIN
				SET @query = 'SELECT COUNT(sh.HopSoID) AS GearBoxCount, sm.MucLucHoSoID TabOfContID,sm.TenMucLucHoSo TabOfContName,sm.MaDanhMuc TabOfContCode,
				sm.MucLucSo TabOfContNumber,sm.GhiChu Note
				FROM S_MucLucHoSo sm
				left join S_HopSo sh on sm.MucLucHoSoID = sh.MucLucHoSoID 
				inner join S_LuuTru lt on lt.LuuTruID = sm.LuuTruID
				inner join S_Phong sp on sp.PhongID = lt.PhongID
				inner join S_CoQuan cq on cq.CoQuanID = sp.CoQuanID
				WHERE ((sm.isDeleted = 0 OR sm.isDeleted IS NULL) AND (sp.isDeleted = 0 OR sp.isDeleted IS NULL) AND (sh.isDeleted = 0 OR sh.isDeleted IS NULL) AND (cq.Deleted = 0 OR cq.Deleted IS NULL) ) 
				' + @InWhere +' Group By sm.MucLucHoSoID,sh.MucLucHoSoID,sm.TenMucLucHoSo,sm.MaDanhMuc,
			sm.MucLucSo,sm.GhiChu ORDER BY ' + @InSort + ' sm.MucLucHoSoID DESC OFFSET ' + @ROWS + ' ROWS FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY ';
				EXEC SP_EXECUTESQL @query;
				SET @queryRowCount = '
								SELECT @TotalRecords = COUNT(DISTINCT sm.MucLucHoSoID)
								FROM S_MucLucHoSo sm
								left join S_HopSo sh on sm.MucLucHoSoID = sh.MucLucHoSoID 
								inner join S_LuuTru lt on lt.LuuTruID = sm.LuuTruID
								inner join S_Phong sp on sp.PhongID = lt.PhongID
								inner join S_CoQuan cq on cq.CoQuanID = sp.CoQuanID
								WHERE ((sm.isDeleted = 0 OR sm.isDeleted IS NULL) AND (sp.isDeleted = 0 OR sp.isDeleted IS NULL) AND (cq.Deleted = 0 OR cq.Deleted IS NULL) ) '  + @InWhere;
				EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
				SET @ErrorCode = N'0';
				SET @ErrorMessage = N'Lấy dữ liệu thành công';
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[TableOfContents_GET_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TableOfContents_GET_BY_ID]
(
	@MucLucHoSoID INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF @MucLucHoSoID IS NULL
		BEGIN
			SET @ErrorCode = N'1';
			SET @ErrorMessage = N'Không tồn tại bản ghi.';
			RETURN;
		END
		ELSE
		BEGIN
			SELECT sm.MucLucHoSoID TabOfContID,cq.TenCoQuan OrganName, sp.PhongSo FontCode,sm.TenMucLucHoSo TabOfContName,
			sm.MucLucSo TabOfContNumber,sm.MaDanhMuc TabOfContCode,sp.PhongID FontID,sm.GhiChu Note,sl.LuuTruID StorageID,
			cq.CoQuanID OrganID
			FROM S_MucLucHoSo sm
			join S_LuuTru sl on sl.LuuTruID = sm.LuuTruID
			join S_Phong sp on sl.PhongID = sp.PhongID
			left join S_Kho sk on sl.PhongID = sk.KhoID
			left join S_CoQuan cq on cq.CoQuanID = sp.CoQuanID
			WHERE sm.MucLucHoSoID = @MucLucHoSoID
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[TableOfContents_GET_BY_REPOSITORYID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TableOfContents_GET_BY_REPOSITORYID]
(
	@KhoID INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF @KhoID IS NULL
		BEGIN
			SET @ErrorCode = N'1';
			SET @ErrorMessage = N'Không tồn tại bản ghi.';
			RETURN;
		END
		ELSE
		BEGIN
			SELECT *
			FROM S_MucLucHoSo sm
			inner join S_HopSo sh on sh.MucLucHoSoID = sm.MucLucHoSoID
			inner join S_LuuTru sl on sl.LuuTruID = sm.LuuTruID
			inner join S_Phong sp on sl.PhongID = sp.PhongID
			inner join S_Kho sk on sl.PhongID = sk.KhoID
			WHERE sk.KhoID = @KhoID
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[TableOfContents_GET_BY_STORAGEID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TableOfContents_GET_BY_STORAGEID]
(
	@LuuTruID INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF @LuuTruID IS NULL
		BEGIN
			SET @ErrorCode = N'1';
			SET @ErrorMessage = N'Không tồn tại bản ghi.';
			RETURN;
		END
		ELSE
		BEGIN
			SELECT *
			FROM S_MucLucHoSo sm
			inner join S_HopSo sh on sh.MucLucHoSoID = sm.MucLucHoSoID
			inner join S_LuuTru sl on sl.LuuTruID = sm.LuuTruID
			inner join S_Phong sp on sl.PhongID = sp.PhongID
			inner join S_Kho sk on sl.PhongID = sk.KhoID
			WHERE sl.LuuTruID = @LuuTruID
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[TableOfContents_GET_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TableOfContents_GET_PAGING]
(
	 @InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	 @ErrorMessage NVARCHAR(4000) OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	BEGIN TRY
		BEGIN
		DECLARE @ROWS NVARCHAR(50) = '';
			SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
            SET @query = 'SELECT COUNT(sh.HopSoID) AS GearBoxCount,sh.MucLucHoSoID, sm.MucLucHoSoID TabOfContID,sm.TenMucLucHoSo TabOfContName,sm.MaDanhMuc TabOfContCode,
			sm.MucLucSo TabOfContNumber,sm.GhiChu Note,sm.NgayTao CreatTime,sm.NgayCapNhat UpdateTime
			FROM S_MucLucHoSo sm
			left join S_HopSo sh on sm.MucLucHoSoID = sh.MucLucHoSoID 
			inner join S_LuuTru lt on lt.LuuTruID = sm.LuuTruID
			inner join S_Phong sp on sp.PhongID = lt.PhongID
			inner join S_CoQuan cq on cq.CoQuanID = sp.CoQuanID
			WHERE ((sm.isDeleted = 0 OR sm.isDeleted IS NULL) AND (sp.isDeleted = 0 OR sp.isDeleted IS NULL) AND (sh.isDeleted = 0 OR sh.isDeleted IS NULL) AND (cq.Deleted = 0 OR cq.Deleted IS NULL) ) ' + @InWhere + '
			Group By sm.MucLucHoSoID,sh.MucLucHoSoID,sm.TenMucLucHoSo,sm.MaDanhMuc,
			sm.MucLucSo,sm.GhiChu,sm.NgayTao,sm.NgayCapNhat
			ORDER BY ' + @InSort + ' sm.MucLucHoSoID DESC ' + ' OFFSET ' + @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY ';
			EXEC SP_EXECUTESQL @query;
            SET @queryRowCount = 'SELECT @TotalRecords = COUNT(DISTINCT sm.MucLucHoSoID)
								FROM S_MucLucHoSo sm
								left join S_HopSo sh on sm.MucLucHoSoID = sh.MucLucHoSoID 
								inner join S_LuuTru lt on lt.LuuTruID = sm.LuuTruID
								inner join S_Phong sp on sp.PhongID = lt.PhongID
								inner join S_CoQuan cq on cq.CoQuanID = sp.CoQuanID
								WHERE ((sm.isDeleted = 0 OR sm.isDeleted IS NULL) AND (sp.isDeleted = 0 OR sp.isDeleted IS NULL) AND (cq.Deleted = 0 OR cq.Deleted IS NULL) ) ' + @InWhere;
            EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
            SET @ErrorCode = '0';
            SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[TableOfContents_INSERT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TableOfContents_INSERT]
	-- Add the parameters for the stored procedure here
	@PhongID int,
	@TenMucLucHoSo NVARCHAR(50) = N'',
	@MucLucSo NVARCHAR(50) = N'',
	@MaDanhMuc NVARCHAR(50) = N'',
	@GhiChu NVARCHAR(50) = N'',
	@NgayTao NVARCHAR(100) = '',
	@isDeleted INT= 0,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @LTruID int
    BEGIN TRY
		IF @PhongID IS NOT NULL
			Begin
				if not exists (SELECT LuuTruID from S_LuuTru where PhongID = @PhongID )
					Begin
							INSERT INTO S_LuuTru(PhongID) values(@PhongID)
							SET @LTruID = @@IDENTITY
					End
				Else
					Begin
							SET @LTruID = (SELECT Top(1) LuuTruID from S_LuuTru where PhongID = @PhongID)
					End   
			End
		ELSE
			Begin
				SET @LTruID = NULL
			END
		IF NOT EXISTS (SELECT MucLucHoSoID from S_MucLucHoSo where LuuTruID = @LTruID AND MucLucSo = @MucLucSo )
			BEGIN
				INSERT INTO S_MucLucHoSo(
				TenMucLucHoSo,
				MucLucSo, 
				MaDanhMuc, 
				GhiChu,
				LuuTruID,
				NgayTao,
				isDeleted
				)VALUES(
				@TenMucLucHoSo,
				@MucLucSo,
				@MaDanhMuc,
				@GhiChu,
				@LTruID,
				@NgayTao,
				@isDeleted
				)
				SET @ErrorCode = '0'
				SET @ErrorMessage = N'Thêm mới thành công'
			END
		ELSE
			SET @ErrorCode = '1'
			SET @ErrorMessage = N'Đã tồn tại mục lục'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[TinhTrangVatLy_CREATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TinhTrangVatLy_CREATE]
	-- Add the parameters for the stored procedure here
	@TinhTrang NVARCHAR(50) = '',
	@ErrorCode  INT OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF EXISTS (SELECT TinhTrangVatLyId FROM S_TinhTrangVatLy WITH (NOLOCK) WHERE TinhTrang = @TinhTrang)
			BEGIN
				IF (SELECT IsDeleted FROM S_TinhTrangVatLy WITH (NOLOCK) WHERE TinhTrang = @TinhTrang) = 0 OR (SELECT IsDeleted FROM S_TinhTrangVatLy WITH (NOLOCK) WHERE TinhTrang = @TinhTrang) IS NULL
					BEGIN
						SET @ErrorCode = 1;
						SET @ErrorMessage = N'Đã tồn tại trên hệ thống, vui lòng thử lại.';
						RETURN;
					END
				ELSE
					BEGIN
						Update S_TinhTrangVatLy SET TinhTrang = @TinhTrang, IsDeleted = 0 Where TinhTrang = @TinhTrang
						SET @ErrorCode = '0'
						SET @ErrorMessage = N'Thêm thành công'
					END
			END
		ELSE
			BEGIN
				INSERT INTO S_TinhTrangVatLy(
					TinhTrang
				)VALUES(
					@TinhTrang
				)
				SET @ErrorCode = '0'
				SET @ErrorMessage = N'Thêm thành công'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[TinhTrangVatLy_DELETE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TinhTrangVatLy_DELETE]
	-- Add the parameters for the stored procedure here
	@TinhTrangVatLyID INT = 0,
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET NOCOUNT ON;
	
	BEGIN TRY
		IF @TinhTrangVatLyID != 0
			BEGIN
				IF NOT EXISTS ((SELECT TinhTrangVatLyID FROM S_VanBan WHERE TinhTrangVatLyID = @TinhTrangVatLyID))
					BEGIN
						Update S_TinhTrangVatLy SET IsDeleted = 1
						WHERE TinhTrangVatLyId = @TinhTrangVatLyID
						SET @ErrorCode = '0'
						SET @ErrorMessage = N'Xóa thành công'
					END
			END
		ELSE
			BEGIN
				SET @ErrorCode = '1'
				SET @ErrorMessage = N'Xóa thất bại'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[TinhTrangVatLy_EDIT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TinhTrangVatLy_EDIT]
	-- Add the parameters for the stored procedure here
	@TinhTrangVatLyID INT,
	@TinhTrang NVARCHAR(50),
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		IF EXISTS (SELECT TinhTrangVatLyId FROM S_TinhTrangVatLy WITH (NOLOCK) WHERE TinhTrang = @TinhTrang)
			BEGIN
				SET @ErrorCode = 1;
				SET @ErrorMessage = N'Đã tồn tại trên hệ thống, vui lòng thử lại.';
				RETURN;
			END
		ELSE
			BEGIN
				UPDATE S_TinhTrangVatLy
				SET TinhTrang = @TinhTrang
				WHERE TinhTrangVatLyId = @TinhTrangVatLyID
				SET @ErrorCode = '0'
				SET @ErrorMessage = N''
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[TinhTrangVatLy_GET_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TinhTrangVatLy_GET_BY_ID]
(
	@TinhTrangVatLyID INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF @TinhTrangVatLyID IS NULL
		BEGIN
			SET @ErrorCode = N'1';
			SET @ErrorMessage = N'Không tồn tại bản ghi.';
			RETURN;
		END
		ELSE
		BEGIN
			SELECT tt.TinhTrangVatLyId,tt.TinhTrang
			FROM S_TinhTrangVatLy tt
			WHERE (tt.IsDeleted = 0 OR tt.IsDeleted IS NULL) AND tt.TinhTrangVatLyId = @TinhTrangVatLyID
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[TinhTrangVatLy_GET_SEARCH_WITH_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TinhTrangVatLy_GET_SEARCH_WITH_PAGING]
	@InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	BEGIN TRY
			DECLARE @ROWS NVARCHAR(50) = '';
			SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
		BEGIN
			SET @query = 'SELECT tt.TinhTrangVatLyId,tt.TinhTrang
							FROM S_TinhTrangVatLy tt
							WHERE (tt.IsDeleted = 0 OR tt.IsDeleted IS NULL)' + @InWhere + ' ORDER BY ' + @InSort + ' tt.TinhTrangVatLyId DESC ' + ' OFFSET ' + @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY ';
			EXEC SP_EXECUTESQL @query;
            SET @queryRowCount = 'SELECT @TotalRecords = COUNT(tt.TinhTrangVatLyId)
							FROM S_TinhTrangVatLy tt
							WHERE (tt.IsDeleted = 0 OR tt.IsDeleted IS NULL)' + @InWhere;
            EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[USER_ADD_NEW]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USER_ADD_NEW]
	@UserName NVARCHAR(50),
	@Password NVARCHAR(800),
	@PasswordSalt NVARCHAR(800),
	@NguoiTao NVARCHAR(50),
	@status SMALLINT,
	@roles SMALLINT,
	@create SMALLINT,
	@edit SMALLINT,
	@ErrorCode INT OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		-- KIỂM TRA USER ĐÃ TỒN TẠI TRÊN HỆ THỐNG
		IF EXISTS (SELECT UserID FROM S_Users WITH (NOLOCK) WHERE UserName = @UserName)
		BEGIN
			SET @ErrorCode = -1
			SET @ErrorMessage = N'Tài khoản đã tồn tại trên hệ thống, vui lòng thử lại với tài khoản khác.'
			RETURN;
		END
		ELSE
		BEGIN
			INSERT INTO S_Users
			(
				UserName,
				Password,
				PasswordSalt,
				NguoiTao,
				NgayTao,
				status
			)
			VALUES
			(
				@UserName,
				@Password,
				@PasswordSalt,
				@NguoiTao,
				GETDATE(),
				@status
			)
			DECLARE @id INT, @roleId INT, @roleName VARCHAR(20);
			SET @id = (SELECT UserID FROM S_Users WHERE UserName = @UserName)
			
			IF @roles = 1
			BEGIN
				SET @roleName = 'ADMIN'
			END
			ELSE
			BEGIN
				SET @roleName = 'USER'
				-- Thêm quyền vào bảng Menu
				DECLARE @menuRole VARCHAR(50)
				IF @create = 1
				BEGIN
					SET @menuRole = 'create'
				END
				ELSE
				BEGIN
					SET @menuRole = 'edit'
				END
				INSERT INTO S_Menu
				(
					Url,
					MenuName,
					MenuRole
				)
				VALUES
				(
					'http://localhost:4200/' + @menuRole,
					'Menu' + CONVERT(VARCHAR, @id),
					@menuRole
				)
				-- Thêm vào bảng S_Role_Url
				DECLARE @menuId INT;
				SET @menuId = (SELECT MenuId FROM S_Menu WHERE MenuName = 'Menu' + CONVERT(VARCHAR, @id))
				SET @roleId = (SELECT RoleID FROM S_Role WHERE RoleName = @roleName)
				INSERT INTO S_Role_URL
				(
					RoleID,
					MenuId
				)
				VALUES
				(
					@roleId,
					@menuId
				)
			END
			-- Thêm vào bảng S_User_Role
			SET @roleId = (SELECT RoleID FROM S_Role WHERE RoleName = @roleName)
			INSERT INTO S_User_Role
			(
				UserID,
				RoleID
			)
			VALUES
			(
				@id,
				@roleId
			)

		END
		SET @ErrorCode = 0
		SET @ErrorMessage = N'Thêm mới thành công, hihi'
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER()
		SET @ErrorMessage = ERROR_MESSAGE()
	END CATCH
    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[USER_CREATE]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USER_CREATE]
	-- Add the parameters for the stored procedure here
	@UserName NVARCHAR(50) = N'',
	@Password NVARCHAR(300) = N'',
	@PasswordSalt NVARCHAR(300) = N'',
	@NguoiTao NVARCHAR(50) = N'',
	@Status INT =0,
	@RoleID INT =0,
	@NgayTao NVARCHAR(100) = '',
	@isDeleted INT= 0,
	@ErrorCode  INT OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		declare @UserID int
		IF EXISTS (SELECT UserID FROM S_Users WITH (NOLOCK) WHERE UserName Like @UserName)
			BEGIN
				SET @ErrorCode ='1';
				SET @ErrorMessage = N'Đã tồn tại trên hệ thống, vui lòng thử lại.';
				RETURN;
			END
		ELSE
			BEGIN
				INSERT INTO S_Users(
					UserName ,
					Password,
					PasswordSalt,
					NguoiTao,
					Status,
					NgayTao,
					isDeleted 
				)VALUES(
					@UserName ,
					@Password,
					@PasswordSalt,
					@NguoiTao,
					@Status,
					@NgayTao,
					@isDeleted
				)
				SET @UserID = @@IDENTITY

				INSERT INTO S_User_Role (RoleID,UserID) VALUES(@RoleID,@UserID)

				SET @ErrorCode = '0'
				SET @ErrorMessage = N'Thêm thành công'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[USER_EDIT]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USER_EDIT]
	-- Add the parameters for the stored procedure here
	@UserID INT =0,
	@UserName NVARCHAR(50) = N'',
	@Password NVARCHAR(300) = N'',
	@PasswordSalt NVARCHAR(300) = N'',
	@NguoiCapNhat NVARCHAR(50) = N'',
	@Status INT =0,
	@RoleID INT =0,
	@NgayCapNhat NVARCHAR(100) = '',
	@ErrorCode NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(400) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		IF @UserID IS NOT NULL
			BEGIN
				IF @UserID = (SELECT UserID FROM S_Users WHERE UserID =@UserID)
					BEGIN
						IF EXISTS (SELECT UserName FROM S_Users WITH (NOLOCK) WHERE UserName = @UserName AND UserID != @UserID)
						BEGIN
							SET @ErrorCode = '1';
							SET @ErrorMessage = N'Đã tồn tại trên hệ thống, vui lòng thử lại.';
							RETURN;
						END
					ELSE
						BEGIN
							UPDATE S_Users
							SET UserName =@UserName,Password =@Password,PasswordSalt =@PasswordSalt,NguoiCapNhat =@NguoiCapNhat,status =@Status,
							NgayCapNhat =@NgayCapNhat
							WHERE UserID = @UserID

							IF EXISTS (SELECT UserID FROM S_User_Role WITH (NOLOCK) WHERE UserID = @UserID)
								BEGIN
									DELETE FROM S_User_Role WHERE UserID =@UserID
								END

							INSERT INTO S_User_Role (RoleID,UserID) VALUES(@RoleID,@UserID)
							SET @ErrorCode = '0'
							SET @ErrorMessage = N''
						END 
					END
			END
		ELSE
			BEGIN
				SET @ErrorCode = '1'
				SET @ErrorMessage = N'Cập nhật thất bại'
			END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_NUMBER();
		SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[USER_GET_ALL]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USER_GET_ALL]
(
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN
			SELECT us.UserName, us.UserID
			FROM S_Users us WITH (NOLOCK)
			WHERE us.IsDeleted = 0 or us.IsDeleted IS NULL
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[USER_GET_BY_ID]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USER_GET_BY_ID]
(
	@UserID INT,
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF @UserID IS NULL
		BEGIN
			SET @ErrorCode = N'1';
			SET @ErrorMessage = N'Không tồn tại bản ghi.';
			RETURN;
		END
		ELSE
		BEGIN
			SELECT u.UserID Id,u.UserName,u.Password,u.NguoiTao CreateBy,u.NguoiCapNhat UpdatedBy,u.status Status,r.RoleID,r.RoleName UserRole
			FROM S_Users u
			inner join S_User_Role ur on ur.UserID = u.UserID
			inner join S_Role r on r.RoleID = ur.RoleID
			WHERE u.UserID  = @UserID
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[USER_GET_BY_USERNAME]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USER_GET_BY_USERNAME]
(
	@UserName NVARCHAR(50) = '',
	@ErrorCode    NVARCHAR(100) OUTPUT, 
	@ErrorMessage NVARCHAR(4000) OUTPUT  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		IF @UserName IS NULL
		BEGIN
			SET @ErrorCode = N'1';
			SET @ErrorMessage = N'Không tồn tại bản ghi.';
			RETURN;
		END
		ELSE
		BEGIN
			SELECT u.UserID Id
			FROM S_Users u
			WHERE u.UserName = @UserName
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[USER_GET_CHECK_LOGIN]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USER_GET_CHECK_LOGIN]
(
	@UserID INT
)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT u.UserName,u.Password,u.passwordSalt
	FROM S_Users u
	WHERE u.UserID  = @UserID
    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[USER_GET_SEARCH_WITH_PAGING]    Script Date: 12/17/2022 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USER_GET_SEARCH_WITH_PAGING]
	@InWhere      NVARCHAR(MAX)  = '', 
	 @InSort       NVARCHAR(200)  = '', 
	 @StartRow     INT            = 0,
	 @Keywords     NVARCHAR(MAX)  = '', 
	 @PageSize     INT            = 10,
	 @TotalRecords INT OUTPUT,
	 @ErrorCode    NVARCHAR(100) OUTPUT,
	@ErrorMessage NVARCHAR(4000) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query NVARCHAR(MAX)= '';
    DECLARE @queryRowCount NVARCHAR(MAX)= '';
	BEGIN TRY
			DECLARE @ROWS NVARCHAR(50) = '';
			SET @ROWS = CONVERT(NVARCHAR, ((@StartRow - 1) * @PageSize));
			--LEFT JOIN S_Role_URL ru ON (r.RoleID = ru.RoleID)
			--LEFT JOIN S_Menu m ON (ru.MenuId = m.MenuId)
			--m.MenuRole as menuRole,
			--				m.MenuName
		BEGIN
			SET @query = 'SELECT u.UserID AS Id,
							UserName,
							Password,
							NguoiTao AS createBy,
							NgayTao AS createDate,
							u.status,
							r.RoleName as roleName
							FROM dbo.S_Users u
							LEFT JOIN S_User_Role ur ON (u.UserID = ur.UserID)
							LEFT JOIN S_Role r ON (ur.RoleID = r.RoleID)
							WHERE ((u.isDeleted = 0) OR (u.isDeleted IS NULL))' + @InWhere + ' ORDER BY ' + @InSort + ' u.UserID DESC ' + ' OFFSET ' + @ROWS + ' ROWS ' + ' FETCH NEXT ' + CAST(@PageSize AS NVARCHAR(10)) + ' ROWS ONLY ';
			EXEC SP_EXECUTESQL @query;
            SET @queryRowCount = 'SELECT @TotalRecords = COUNT(u.UserID) FROM dbo.S_Users u
									LEFT JOIN S_User_Role ur ON (u.UserID = ur.UserID)
									LEFT JOIN S_Role r ON (ur.RoleID = r.RoleID)
									WHERE ((u.isDeleted = 0) OR (u.isDeleted IS NULL))' + @InWhere;
            EXEC SP_EXECUTESQL @queryRowCount, N'@TotalRecords INT OUTPUT', @TotalRecords = @TotalRecords OUTPUT;
			SET @ErrorCode = N'0';
			SET @ErrorMessage = N'Lấy dữ liệu thành công';
		END
	END TRY
	BEGIN CATCH
		SET @ErrorCode = ERROR_MESSAGE();
        SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH

    SET NOCOUNT OFF;
END
GO
USE [master]
GO
ALTER DATABASE [SoHoa] SET  READ_WRITE 
GO
