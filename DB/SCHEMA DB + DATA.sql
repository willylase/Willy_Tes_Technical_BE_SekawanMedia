USE [master]
GO
/****** Object:  Database [Tes_Backend_Developer_SekawanMedia]    Script Date: 09/06/2023 22:38:20 ******/
CREATE DATABASE [Tes_Backend_Developer_SekawanMedia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tes_Backend_Developer_SekawanMedia', FILENAME = N'C:\Users\User\Tes_Backend_Developer_SekawanMedia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tes_Backend_Developer_SekawanMedia_log', FILENAME = N'C:\Users\User\Tes_Backend_Developer_SekawanMedia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tes_Backend_Developer_SekawanMedia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET  MULTI_USER 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET QUERY_STORE = OFF
GO
USE [Tes_Backend_Developer_SekawanMedia]
GO
/****** Object:  Table [dbo].[Document_Status]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document_Status](
	[Document_Status_Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Document_Status_Description] [varchar](50) NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Is_Delete] [bit] NOT NULL,
	[Created_By] [varchar](50) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Document_Status] PRIMARY KEY CLUSTERED 
(
	[Document_Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document_Transaction]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document_Transaction](
	[Document_Transaction_Id] [uniqueidentifier] NOT NULL,
	[Document_Transaction_Name] [varchar](500) NOT NULL,
	[Document_Transaction_Date] [datetime] NOT NULL,
	[Period_Date_From] [datetime] NOT NULL,
	[Period_Date_To] [datetime] NOT NULL,
	[Document_Transaction_Notes] [varchar](max) NOT NULL,
	[Transaction_Document_Type_Id] [uniqueidentifier] NOT NULL,
	[Submit_By_User_Id] [uniqueidentifier] NOT NULL,
	[Submit_By_Name] [varchar](250) NOT NULL,
	[Submit_By_Roles_Id] [uniqueidentifier] NOT NULL,
	[Used_By_Driver_Id] [uniqueidentifier] NOT NULL,
	[Used_By_Driver_Name] [varchar](250) NOT NULL,
	[Kendaraan_Id] [uniqueidentifier] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Is_Delete] [bit] NOT NULL,
	[Created_By] [varchar](50) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Document_Transaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[Driver_Id] [uniqueidentifier] NOT NULL,
	[Driver_Name] [varchar](250) NOT NULL,
	[Driver_Phone_Number] [varchar](20) NOT NULL,
	[Driver_Email] [varchar](250) NOT NULL,
	[Driver_Address] [varchar](1000) NOT NULL,
	[Driver_Birthday] [datetime] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Is_Delete] [bit] NOT NULL,
	[Created_By] [varchar](50) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[Driver_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kendaraan]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kendaraan](
	[Kendaraan_Id] [uniqueidentifier] NOT NULL,
	[Nama_Pemilik] [varchar](250) NOT NULL,
	[Nomor_Registrasi] [varchar](50) NOT NULL,
	[Merk] [varchar](50) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Jenis] [varchar](50) NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[Tahun_Pembuatan] [varchar](5) NOT NULL,
	[Isi_Silinder] [varchar](10) NOT NULL,
	[Nomor_Rangka] [varchar](50) NOT NULL,
	[Nomor_Mesin] [varchar](50) NOT NULL,
	[Warna] [varchar](50) NOT NULL,
	[Bahan_Bakar] [varchar](50) NOT NULL,
	[Tahun_Registrasi] [varchar](50) NOT NULL,
	[Nomor_BPKB] [varchar](50) NOT NULL,
	[Nomor_STNK] [varchar](50) NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Is_Delete] [bit] NOT NULL,
	[Created_By] [varchar](50) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Kendaraan] PRIMARY KEY CLUSTERED 
(
	[Kendaraan_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Road_Maping_Transaction]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Road_Maping_Transaction](
	[Road_Maping_Transaction_Id] [uniqueidentifier] NOT NULL,
	[Road_Maping_Transaction_Name] [varchar](250) NOT NULL,
	[Transaction_Document_Type_Id] [uniqueidentifier] NOT NULL,
	[Steps_Numbers] [smallint] NOT NULL,
	[Steps_Approval_Roles_Id] [uniqueidentifier] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Is_Delete] [bit] NOT NULL,
	[Created_By] [varchar](50) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Road_Maping_Transaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Roles_Id] [uniqueidentifier] NOT NULL,
	[Roles_Code] [varchar](10) NOT NULL,
	[Roles_Description] [varchar](50) NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Is_Delete] [bit] NOT NULL,
	[Created_By] [varchar](50) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Roles_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_Document_Type]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_Document_Type](
	[Transaction_Document_Type_Id] [uniqueidentifier] NOT NULL,
	[Transaction_Document_Type_Name] [varchar](50) NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Is_Delete] [bit] NOT NULL,
	[Created_By] [varchar](50) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Transaction_Document_Type] PRIMARY KEY CLUSTERED 
(
	[Transaction_Document_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_Ticket_Flow]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_Ticket_Flow](
	[Transaction_Ticket_Flow_Id] [uniqueidentifier] NOT NULL,
	[Document_Transaction_Id] [uniqueidentifier] NOT NULL,
	[Submit_By_User_Id] [uniqueidentifier] NOT NULL,
	[Steps_Numbers] [smallint] NOT NULL,
	[Steps_Approval_Roles_Id] [uniqueidentifier] NOT NULL,
	[Inbox_Users_Id] [uniqueidentifier] NOT NULL,
	[Action_Date_Time] [datetime] NULL,
	[Is_Active_Inbox] [bit] NOT NULL,
	[Is_Approved] [bit] NOT NULL,
	[Is_Reject] [bit] NOT NULL,
	[Document_Status_Id] [smallint] NOT NULL,
	[Remarks] [varchar](1000) NULL,
	[Is_Active] [bit] NOT NULL,
	[Is_Delete] [bit] NOT NULL,
	[Created_By] [varchar](50) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Transaction_Ticket_Flow_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Users_Id] [uniqueidentifier] NOT NULL,
	[User_Full_Name] [varchar](250) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[User_Birthday] [datetime] NOT NULL,
	[User_Email] [varchar](250) NOT NULL,
	[User_Phone_Number] [varchar](20) NOT NULL,
	[Roles_Id] [uniqueidentifier] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Is_Delete] [bit] NOT NULL,
	[Created_By] [varchar](50) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [datetime] NULL,
	[User_Password] [varbinary](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Users_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_Login_History]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Login_History](
	[Users_Login_History_Id] [uniqueidentifier] NOT NULL,
	[Users_Id] [uniqueidentifier] NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[User_Password] [varbinary](500) NOT NULL,
	[Login_DateTime] [datetime] NOT NULL,
	[Logout_DateTime] [datetime] NULL,
	[Expired_DateTime] [datetime] NULL,
	[Is_Active] [bit] NOT NULL,
	[Is_Delete] [bit] NOT NULL,
	[Created_By] [varchar](50) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Users_Login_History_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Document_Status] ON 

INSERT [dbo].[Document_Status] ([Document_Status_Id], [Document_Status_Description], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (1, N'Submited', 1, 0, N'system', CAST(N'2023-06-08T18:25:14.727' AS DateTime), N'system', CAST(N'2023-06-08T18:25:14.727' AS DateTime))
INSERT [dbo].[Document_Status] ([Document_Status_Id], [Document_Status_Description], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (2, N'Waiting for Approval', 1, 0, N'system', CAST(N'2023-06-08T18:25:14.730' AS DateTime), N'system', CAST(N'2023-06-08T18:25:14.730' AS DateTime))
INSERT [dbo].[Document_Status] ([Document_Status_Id], [Document_Status_Description], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (3, N'Approved', 1, 0, N'system', CAST(N'2023-06-08T18:25:14.730' AS DateTime), N'system', CAST(N'2023-06-08T18:25:14.730' AS DateTime))
INSERT [dbo].[Document_Status] ([Document_Status_Id], [Document_Status_Description], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (4, N'Rejected', 1, 0, N'system', CAST(N'2023-06-08T18:25:14.730' AS DateTime), N'system', CAST(N'2023-06-08T18:25:14.730' AS DateTime))
INSERT [dbo].[Document_Status] ([Document_Status_Id], [Document_Status_Description], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (5, N'Edited', 1, 0, N'system', CAST(N'2023-06-08T18:25:14.730' AS DateTime), N'system', CAST(N'2023-06-08T18:25:14.730' AS DateTime))
SET IDENTITY_INSERT [dbo].[Document_Status] OFF
GO
INSERT [dbo].[Document_Transaction] ([Document_Transaction_Id], [Document_Transaction_Name], [Document_Transaction_Date], [Period_Date_From], [Period_Date_To], [Document_Transaction_Notes], [Transaction_Document_Type_Id], [Submit_By_User_Id], [Submit_By_Name], [Submit_By_Roles_Id], [Used_By_Driver_Id], [Used_By_Driver_Name], [Kendaraan_Id], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'252ed87e-a42f-49c5-98b3-222577217e02', N'Pemakaian Mobil Untuk Pengantaran Pihak Manajemen Ke Lokasi Meeting', CAST(N'2023-06-08T19:32:52.667' AS DateTime), CAST(N'2023-06-08T08:00:00.667' AS DateTime), CAST(N'2023-06-08T19:32:52.667' AS DateTime), N'', N'bef84279-81a9-43db-a06b-aca5b287f428', N'6f5c10c8-255a-43aa-8968-16748472a711', N'Kurniaman Lase', N'b3f692ed-1644-4d40-a969-89e5cda49f3b', N'84398a08-84fb-4fe5-8892-7324680a4208', N'Subambang', N'3cfbdc3a-7a06-4583-8f86-11c7890213fe', 1, 0, N'willy.lase', CAST(N'2023-06-09T03:26:50.667' AS DateTime), N'willy.lase', CAST(N'2023-06-09T03:26:50.667' AS DateTime))
INSERT [dbo].[Document_Transaction] ([Document_Transaction_Id], [Document_Transaction_Name], [Document_Transaction_Date], [Period_Date_From], [Period_Date_To], [Document_Transaction_Notes], [Transaction_Document_Type_Id], [Submit_By_User_Id], [Submit_By_Name], [Submit_By_Roles_Id], [Used_By_Driver_Id], [Used_By_Driver_Name], [Kendaraan_Id], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'de56a205-6d5b-4f84-a030-4cac6af17f68', N'Pemakaian Mobil Untuk Pengantaran Pihak Manajemen Ke Lokasi Meeting', CAST(N'2023-06-08T19:32:52.667' AS DateTime), CAST(N'2023-06-08T08:00:00.667' AS DateTime), CAST(N'2023-06-08T19:32:52.667' AS DateTime), N'', N'bef84279-81a9-43db-a06b-aca5b287f428', N'6f5c10c8-255a-43aa-8968-16748472a711', N'Kurniaman Lase', N'b3f692ed-1644-4d40-a969-89e5cda49f3b', N'84398a08-84fb-4fe5-8892-7324680a4208', N'Subambang', N'3cfbdc3a-7a06-4583-8f86-11c7890213fe', 1, 0, N'willy.lase', CAST(N'2023-06-09T03:26:51.647' AS DateTime), N'willy.lase', CAST(N'2023-06-09T03:26:51.647' AS DateTime))
INSERT [dbo].[Document_Transaction] ([Document_Transaction_Id], [Document_Transaction_Name], [Document_Transaction_Date], [Period_Date_From], [Period_Date_To], [Document_Transaction_Notes], [Transaction_Document_Type_Id], [Submit_By_User_Id], [Submit_By_Name], [Submit_By_Roles_Id], [Used_By_Driver_Id], [Used_By_Driver_Name], [Kendaraan_Id], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'47a87d15-93e8-4254-a1f2-5d679acf74bc', N'Pemakaian Mobil Untuk Pengantaran Pihak Manajemen Ke Lokasi Meeting', CAST(N'2023-06-08T19:32:52.667' AS DateTime), CAST(N'2023-06-08T08:00:00.667' AS DateTime), CAST(N'2023-06-08T19:32:52.667' AS DateTime), N'', N'bef84279-81a9-43db-a06b-aca5b287f428', N'6f5c10c8-255a-43aa-8968-16748472a711', N'Kurniaman Lase', N'b3f692ed-1644-4d40-a969-89e5cda49f3b', N'84398a08-84fb-4fe5-8892-7324680a4208', N'Subambang', N'3cfbdc3a-7a06-4583-8f86-11c7890213fe', 1, 0, N'willy.lase', CAST(N'2023-06-09T17:34:07.647' AS DateTime), N'willy.lase', CAST(N'2023-06-09T17:34:07.647' AS DateTime))
GO
INSERT [dbo].[Driver] ([Driver_Id], [Driver_Name], [Driver_Phone_Number], [Driver_Email], [Driver_Address], [Driver_Birthday], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'451d809c-5bb0-4401-909f-59a5a65572ea', N'Sutejo', N'0283938394', N'sutejo@gmail.com', N'Jalan Maju', CAST(N'1999-09-09T00:00:00.000' AS DateTime), 1, 0, N'system', CAST(N'2023-06-08T18:26:56.747' AS DateTime), N'system', CAST(N'2023-06-08T18:26:56.747' AS DateTime))
INSERT [dbo].[Driver] ([Driver_Id], [Driver_Name], [Driver_Phone_Number], [Driver_Email], [Driver_Address], [Driver_Birthday], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'84398a08-84fb-4fe5-8892-7324680a4208', N'Subambang', N'0283938394', N'subambang@gmail.com', N'Jalan Maju Mundur', CAST(N'1999-09-09T00:00:00.000' AS DateTime), 1, 0, N'system', CAST(N'2023-06-08T18:26:56.750' AS DateTime), N'system', CAST(N'2023-06-08T18:26:56.750' AS DateTime))
GO
INSERT [dbo].[Kendaraan] ([Kendaraan_Id], [Nama_Pemilik], [Nomor_Registrasi], [Merk], [Type], [Jenis], [Model], [Tahun_Pembuatan], [Isi_Silinder], [Nomor_Rangka], [Nomor_Mesin], [Warna], [Bahan_Bakar], [Tahun_Registrasi], [Nomor_BPKB], [Nomor_STNK], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'3cfbdc3a-7a06-4583-8f86-11c7890213fe', N'PT. SUMAJU', N'12030032', N'HONDA BRIO', N'IKFS (A/T)', N'PENUMPANG', N'MINIBUS', N'2018', N'1372', N'HSHSKDH30220', N'239EMDI2', N'ABU-ABU', N'SOLAR', N'2018', N'228390', N'3039303', 1, 0, N'system', CAST(N'2023-06-08T18:26:56.750' AS DateTime), NULL, NULL)
INSERT [dbo].[Kendaraan] ([Kendaraan_Id], [Nama_Pemilik], [Nomor_Registrasi], [Merk], [Type], [Jenis], [Model], [Tahun_Pembuatan], [Isi_Silinder], [Nomor_Rangka], [Nomor_Mesin], [Warna], [Bahan_Bakar], [Tahun_Registrasi], [Nomor_BPKB], [Nomor_STNK], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'65dce854-825f-44a7-b643-bbdbfc4d9673', N'PT. SUMAJU', N'12030030', N'SUZUKI', N'IKFS (A/T)', N'PENUMPANG', N'MINIBUS', N'2018', N'1372', N'HSHSKDH30220', N'239EMDI2', N'ABU-ABU', N'SOLAR', N'2018', N'228390', N'3039303', 1, 0, N'system', CAST(N'2023-06-08T18:26:56.750' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Road_Maping_Transaction] ([Road_Maping_Transaction_Id], [Road_Maping_Transaction_Name], [Transaction_Document_Type_Id], [Steps_Numbers], [Steps_Approval_Roles_Id], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'b1838828-8d7e-4fb0-8f9e-dbce35696785', N'Road-Maping-Transaction-Pemakaian-Mobil-Khusus-IT', N'bef84279-81a9-43db-a06b-aca5b287f428', 20, N'83d5561e-c428-4b93-b72e-7f7d25d6448f', 1, 0, N'system', CAST(N'2023-06-08T18:39:51.450' AS DateTime), N'system', CAST(N'2023-06-08T18:39:51.450' AS DateTime))
INSERT [dbo].[Road_Maping_Transaction] ([Road_Maping_Transaction_Id], [Road_Maping_Transaction_Name], [Transaction_Document_Type_Id], [Steps_Numbers], [Steps_Approval_Roles_Id], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'bc17d27b-1168-487c-a27c-ee8023db6c2a', N'Road-Maping-Transaction-Pemakaian-Mobil-Khusus-IT', N'bef84279-81a9-43db-a06b-aca5b287f428', 10, N'b3f692ed-1644-4d40-a969-89e5cda49f3b', 1, 0, N'system', CAST(N'2023-06-08T18:39:51.447' AS DateTime), N'system', CAST(N'2023-06-08T18:39:51.447' AS DateTime))
GO
INSERT [dbo].[Roles] ([Roles_Id], [Roles_Code], [Roles_Description], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'83d5561e-c428-4b93-b72e-7f7d25d6448f', N'MGR-IT', N'Manager IT', 1, 0, N'system', CAST(N'2023-06-08T18:06:19.410' AS DateTime), NULL, NULL)
INSERT [dbo].[Roles] ([Roles_Id], [Roles_Code], [Roles_Description], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'b3f692ed-1644-4d40-a969-89e5cda49f3b', N'ADM-IT', N'Admin IT', 1, 0, N'system', CAST(N'2023-06-08T18:06:00.970' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Transaction_Document_Type] ([Transaction_Document_Type_Id], [Transaction_Document_Type_Name], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'70646b95-097e-4751-9112-18656f2411fd', N'Pemakaian Sepeda Motor Kantor', 1, 0, N'system', CAST(N'2023-06-08T18:37:03.127' AS DateTime), NULL, NULL)
INSERT [dbo].[Transaction_Document_Type] ([Transaction_Document_Type_Id], [Transaction_Document_Type_Name], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'bef84279-81a9-43db-a06b-aca5b287f428', N'Pemakaian Mobil Kantor Khusus Karyawan IT', 1, 0, N'system', CAST(N'2023-06-08T18:37:03.127' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Transaction_Ticket_Flow] ([Transaction_Ticket_Flow_Id], [Document_Transaction_Id], [Submit_By_User_Id], [Steps_Numbers], [Steps_Approval_Roles_Id], [Inbox_Users_Id], [Action_Date_Time], [Is_Active_Inbox], [Is_Approved], [Is_Reject], [Document_Status_Id], [Remarks], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_date]) VALUES (N'31271f24-3321-4729-959f-0efcd2745348', N'de56a205-6d5b-4f84-a030-4cac6af17f68', N'6f5c10c8-255a-43aa-8968-16748472a711', 20, N'83d5561e-c428-4b93-b72e-7f7d25d6448f', N'a217ab93-727d-426a-adca-6cae7553e8f6', CAST(N'2023-06-09T17:54:17.073' AS DateTime), 0, 1, 0, 3, N'Saya tolak', 1, 0, N'willy.lase', CAST(N'2023-06-09T03:26:51.647' AS DateTime), N'string', CAST(N'2023-06-09T17:54:17.073' AS DateTime))
INSERT [dbo].[Transaction_Ticket_Flow] ([Transaction_Ticket_Flow_Id], [Document_Transaction_Id], [Submit_By_User_Id], [Steps_Numbers], [Steps_Approval_Roles_Id], [Inbox_Users_Id], [Action_Date_Time], [Is_Active_Inbox], [Is_Approved], [Is_Reject], [Document_Status_Id], [Remarks], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_date]) VALUES (N'aaee4916-ac4a-4efd-a427-2a474044e44d', N'47a87d15-93e8-4254-a1f2-5d679acf74bc', N'6f5c10c8-255a-43aa-8968-16748472a711', 20, N'83d5561e-c428-4b93-b72e-7f7d25d6448f', N'a217ab93-727d-426a-adca-6cae7553e8f6', NULL, 1, 0, 0, 2, N'', 1, 0, N'willy.lase', CAST(N'2023-06-09T17:34:07.647' AS DateTime), N'willy.lase', CAST(N'2023-06-09T17:34:07.647' AS DateTime))
INSERT [dbo].[Transaction_Ticket_Flow] ([Transaction_Ticket_Flow_Id], [Document_Transaction_Id], [Submit_By_User_Id], [Steps_Numbers], [Steps_Approval_Roles_Id], [Inbox_Users_Id], [Action_Date_Time], [Is_Active_Inbox], [Is_Approved], [Is_Reject], [Document_Status_Id], [Remarks], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_date]) VALUES (N'a1408f68-08d5-4ad5-961c-3f475754e524', N'252ed87e-a42f-49c5-98b3-222577217e02', N'6f5c10c8-255a-43aa-8968-16748472a711', 20, N'83d5561e-c428-4b93-b72e-7f7d25d6448f', N'a217ab93-727d-426a-adca-6cae7553e8f6', CAST(N'2023-06-09T14:27:09.763' AS DateTime), 0, 0, 1, 4, N'Saya tolak', 1, 0, N'willy.lase', CAST(N'2023-06-09T03:26:50.667' AS DateTime), N'string', CAST(N'2023-06-09T14:27:09.763' AS DateTime))
INSERT [dbo].[Transaction_Ticket_Flow] ([Transaction_Ticket_Flow_Id], [Document_Transaction_Id], [Submit_By_User_Id], [Steps_Numbers], [Steps_Approval_Roles_Id], [Inbox_Users_Id], [Action_Date_Time], [Is_Active_Inbox], [Is_Approved], [Is_Reject], [Document_Status_Id], [Remarks], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_date]) VALUES (N'1a6e59cf-d8e9-45fd-b348-41e04e56c5c3', N'252ed87e-a42f-49c5-98b3-222577217e02', N'6f5c10c8-255a-43aa-8968-16748472a711', 10, N'b3f692ed-1644-4d40-a969-89e5cda49f3b', N'6f5c10c8-255a-43aa-8968-16748472a711', CAST(N'2023-06-09T03:26:50.667' AS DateTime), 0, 0, 0, 1, N'', 1, 0, N'willy.lase', CAST(N'2023-06-09T03:26:50.667' AS DateTime), N'willy.lase', CAST(N'2023-06-09T03:26:50.667' AS DateTime))
INSERT [dbo].[Transaction_Ticket_Flow] ([Transaction_Ticket_Flow_Id], [Document_Transaction_Id], [Submit_By_User_Id], [Steps_Numbers], [Steps_Approval_Roles_Id], [Inbox_Users_Id], [Action_Date_Time], [Is_Active_Inbox], [Is_Approved], [Is_Reject], [Document_Status_Id], [Remarks], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_date]) VALUES (N'5f026d16-7411-48f4-a72c-98443e5aa78e', N'de56a205-6d5b-4f84-a030-4cac6af17f68', N'6f5c10c8-255a-43aa-8968-16748472a711', 10, N'b3f692ed-1644-4d40-a969-89e5cda49f3b', N'6f5c10c8-255a-43aa-8968-16748472a711', CAST(N'2023-06-09T03:26:51.647' AS DateTime), 0, 0, 0, 1, N'', 1, 0, N'willy.lase', CAST(N'2023-06-09T03:26:51.647' AS DateTime), N'willy.lase', CAST(N'2023-06-09T03:26:51.647' AS DateTime))
INSERT [dbo].[Transaction_Ticket_Flow] ([Transaction_Ticket_Flow_Id], [Document_Transaction_Id], [Submit_By_User_Id], [Steps_Numbers], [Steps_Approval_Roles_Id], [Inbox_Users_Id], [Action_Date_Time], [Is_Active_Inbox], [Is_Approved], [Is_Reject], [Document_Status_Id], [Remarks], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_date]) VALUES (N'5d604c6d-102a-4792-8154-ba432012f940', N'47a87d15-93e8-4254-a1f2-5d679acf74bc', N'6f5c10c8-255a-43aa-8968-16748472a711', 10, N'b3f692ed-1644-4d40-a969-89e5cda49f3b', N'6f5c10c8-255a-43aa-8968-16748472a711', CAST(N'2023-06-09T17:34:07.647' AS DateTime), 0, 0, 0, 1, N'', 1, 0, N'willy.lase', CAST(N'2023-06-09T17:34:07.647' AS DateTime), N'willy.lase', CAST(N'2023-06-09T17:34:07.647' AS DateTime))
GO
INSERT [dbo].[Users] ([Users_Id], [User_Full_Name], [Username], [User_Birthday], [User_Email], [User_Phone_Number], [Roles_Id], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date], [User_Password]) VALUES (N'6f5c10c8-255a-43aa-8968-16748472a711', N'Kurniaman Lase', N'kurniaman.lase', CAST(N'2001-09-14T00:00:00.000' AS DateTime), N'kurniamanlase@gmail.com', N'082167758683', N'b3f692ed-1644-4d40-a969-89e5cda49f3b', 1, 0, N'system', CAST(N'2023-06-08T18:07:48.993' AS DateTime), N'kurniaman.lase', CAST(N'2023-06-09T02:22:08.040' AS DateTime), 0x06AC0FF793B46B102460F1611107DFEF7AE61B9779A0A14F9B11374EC03D1DC2516292DF0B2155CEA28000CD6849B77CE1023D75C9FEFB7738F353DD8DA3B6FA)
INSERT [dbo].[Users] ([Users_Id], [User_Full_Name], [Username], [User_Birthday], [User_Email], [User_Phone_Number], [Roles_Id], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date], [User_Password]) VALUES (N'a217ab93-727d-426a-adca-6cae7553e8f6', N'Willy Lase', N'willy.lase', CAST(N'2001-09-14T00:00:00.000' AS DateTime), N'willykurniamanlase@gmail.com', N'082167758683', N'83d5561e-c428-4b93-b72e-7f7d25d6448f', 1, 0, N'system', CAST(N'2023-06-08T18:07:48.990' AS DateTime), N'willy.lase', CAST(N'2023-06-09T02:18:07.103' AS DateTime), 0x06AC0FF793B46B102460F1611107DFEF7AE61B9779A0A14F9B11374EC03D1DC2516292DF0B2155CEA28000CD6849B77CE1023D75C9FEFB7738F353DD8DA3B6FA)
GO
INSERT [dbo].[Users_Login_History] ([Users_Login_History_Id], [Users_Id], [Username], [User_Password], [Login_DateTime], [Logout_DateTime], [Expired_DateTime], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'cab8b329-966d-4b0d-b37f-36f47ab3fd3a', N'a217ab93-727d-426a-adca-6cae7553e8f6', N'willy.lase', 0x06AC0FF793B46B102460F1611107DFEF7AE61B9779A0A14F9B11374EC03D1DC2516292DF0B2155CEA28000CD6849B77CE1023D75C9FEFB7738F353DD8DA3B6FA, CAST(N'2023-06-08T18:08:39.970' AS DateTime), CAST(N'2023-06-08T18:20:01.160' AS DateTime), CAST(N'2023-06-08T23:08:39.970' AS DateTime), 0, 0, N'willy.lase', CAST(N'2023-06-08T18:08:39.970' AS DateTime), N'willy.lase', CAST(N'2023-06-08T18:20:01.160' AS DateTime))
INSERT [dbo].[Users_Login_History] ([Users_Login_History_Id], [Users_Id], [Username], [User_Password], [Login_DateTime], [Logout_DateTime], [Expired_DateTime], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'aaaffbae-6e78-4604-920f-4c7be9af92a4', N'a217ab93-727d-426a-adca-6cae7553e8f6', N'willy.lase', 0x06AC0FF793B46B102460F1611107DFEF7AE61B9779A0A14F9B11374EC03D1DC2516292DF0B2155CEA28000CD6849B77CE1023D75C9FEFB7738F353DD8DA3B6FA, CAST(N'2023-06-09T02:18:07.103' AS DateTime), NULL, CAST(N'2023-06-09T07:18:07.103' AS DateTime), 1, 0, N'willy.lase', CAST(N'2023-06-09T02:18:07.103' AS DateTime), NULL, NULL)
INSERT [dbo].[Users_Login_History] ([Users_Login_History_Id], [Users_Id], [Username], [User_Password], [Login_DateTime], [Logout_DateTime], [Expired_DateTime], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'8e97719e-bdc5-462b-a592-92b81be46451', N'6f5c10c8-255a-43aa-8968-16748472a711', N'kurniaman.lase', 0x06AC0FF793B46B102460F1611107DFEF7AE61B9779A0A14F9B11374EC03D1DC2516292DF0B2155CEA28000CD6849B77CE1023D75C9FEFB7738F353DD8DA3B6FA, CAST(N'2023-06-09T02:17:08.710' AS DateTime), NULL, CAST(N'2023-06-09T07:17:08.710' AS DateTime), 1, 0, N'kurniaman.lase', CAST(N'2023-06-09T02:17:08.710' AS DateTime), NULL, NULL)
INSERT [dbo].[Users_Login_History] ([Users_Login_History_Id], [Users_Id], [Username], [User_Password], [Login_DateTime], [Logout_DateTime], [Expired_DateTime], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'4e269de8-847f-42ff-a19b-ace11ecd5f4a', N'6f5c10c8-255a-43aa-8968-16748472a711', N'kurniaman.lase', 0x06AC0FF793B46B102460F1611107DFEF7AE61B9779A0A14F9B11374EC03D1DC2516292DF0B2155CEA28000CD6849B77CE1023D75C9FEFB7738F353DD8DA3B6FA, CAST(N'2023-06-08T18:09:57.207' AS DateTime), CAST(N'2023-06-08T18:20:33.930' AS DateTime), CAST(N'2023-06-08T23:09:57.207' AS DateTime), 0, 0, N'kurniaman.lase', CAST(N'2023-06-08T18:09:57.207' AS DateTime), N'kurniaman.lase', CAST(N'2023-06-08T18:20:33.930' AS DateTime))
INSERT [dbo].[Users_Login_History] ([Users_Login_History_Id], [Users_Id], [Username], [User_Password], [Login_DateTime], [Logout_DateTime], [Expired_DateTime], [Is_Active], [Is_Delete], [Created_By], [Created_Date], [Modified_By], [Modified_Date]) VALUES (N'9cf83c74-a102-4012-8627-f99f14d0eb17', N'6f5c10c8-255a-43aa-8968-16748472a711', N'kurniaman.lase', 0x06AC0FF793B46B102460F1611107DFEF7AE61B9779A0A14F9B11374EC03D1DC2516292DF0B2155CEA28000CD6849B77CE1023D75C9FEFB7738F353DD8DA3B6FA, CAST(N'2023-06-09T02:22:08.040' AS DateTime), NULL, CAST(N'2023-06-09T07:22:08.040' AS DateTime), 1, 0, N'kurniaman.lase', CAST(N'2023-06-09T02:22:08.040' AS DateTime), NULL, NULL)
GO
/****** Object:  StoredProcedure [dbo].[sp_Add_Transaction]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Willy Kurniaman Lase>
-- Create date: <08 Juni 2023>
-- Description:	<Submit Add Transaction Pemakaian Kendaraan>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Add_Transaction]
--DECLARE	-- Add the parameters for the stored procedure here
	 @Users_Id				UNIQUEIDENTIFIER	--=	'6F5C10C8-255A-43AA-8968-16748472A711'
	,@Username				VARCHAR(50)			--=	'willy.lase'
	,@Document_Transaction	VARCHAR(MAX)		--=	'<root>  <row Document_Transaction_Id="00000000-0000-0000-0000-000000000000" Document_Transaction_Name="Pemakaian Mobil Untuk Pengantaran Pihak Manajemen Ke Lokasi Meeting" Document_Transaction_Date="2023-06-08T19:32:52.666Z" Period_Date_From="2023-06-08T08:00:00.666Z" Period_Date_To="2023-06-08T19:32:52.666Z" Transaction_Document_Type_Id="BEF84279-81A9-43DB-A06B-ACA5B287F428" Submit_By_User_Id="6f5c10c8-255a-43aa-8968-16748472a711" Submit_By_Name="Kurniaman Lase" Submit_By_Roles_Id="b3f692ed-1644-4d40-a969-89e5cda49f3b" Used_By_Driver_Id="84398a08-84fb-4fe5-8892-7324680a4208" Used_By_Driver_Name="Subambang" Driver_Email="subambang@gmail.com" Kendaraan_Id="3cfbdc3a-7a06-4583-8f86-11c7890213fe" /></root>'
AS
BEGIN
	SET	XACT_ABORT ON
	BEGIN TRAN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE	@Default_Id						UNIQUEIDENTIFIER,
			@Document_Transaction_Id		UNIQUEIDENTIFIER,
			@DocStatusSubmited				SMALLINT,
			@DocStatusWaiting_for_Approval	SMALLINT,
			@hDocTransaction				INT,
			@Is_Success_Activity			BIT,
			@Response_DB_Message			VARCHAR(250),
			@Modified_DateTimeWIB			DATETIME

	DECLARE	@Transaction_Document_Type_Id	UNIQUEIDENTIFIER,
			@Submit_By_User_Id				UNIQUEIDENTIFIER,
			@Submit_By_Roles_Id				UNIQUEIDENTIFIER,
			@Used_By_Driver_Id				UNIQUEIDENTIFIER,
			@Users_Steps_Numbers			SMALLINT,
			@Step_Number_Rounding			INT
			
	DECLARE	@tempDocumentTransaction	TABLE
	(
		Document_Transaction_Id			UNIQUEIDENTIFIER,
		Document_Transaction_Name		VARCHAR(500),
		Document_Transaction_Date		DATETIME,
		Period_Date_From				DATETIME,
		Period_Date_To					DATETIME,
		Transaction_Document_Type_Id	UNIQUEIDENTIFIER,
		Submit_By_User_Id				UNIQUEIDENTIFIER,
		Submit_By_Name					VARCHAR(250),
		Submit_By_Roles_Id				UNIQUEIDENTIFIER,
		Used_By_Driver_Id				UNIQUEIDENTIFIER,
		Used_By_Driver_Name				VARCHAR(250),
		Kendaraan_Id					UNIQUEIDENTIFIER
	)

	DECLARE	@tempOutputDocTrans			TABLE
	(
		Document_Transaction_Id			UNIQUEIDENTIFIER
	)

	SET	@Default_Id				=	CAST(0X0 AS UNIQUEIDENTIFIER)
	SET	@Modified_DateTimeWIB	=	DATEADD(HOUR,7,GETUTCDATE())
	SET	@Response_DB_Message	=	'success'
	SET	@DocStatusSubmited		=	(SELECT TOP 1 Document_Status_Id FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Document_Status] WHERE Is_Active=1 AND Is_Delete=0 AND Document_Status_Description='Submited')
	SET	@DocStatusWaiting_for_Approval		=	(SELECT TOP 1 Document_Status_Id FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Document_Status] WHERE Is_Active=1 AND Is_Delete=0 AND Document_Status_Description='Waiting for Approval')


	IF(@Document_Transaction IS NULL OR @Document_Transaction='')
		BEGIN
			SET	@Response_DB_Message	=	'Mohon maaf, Data Document anda tidak lengkap!'
		END

	IF(@Response_DB_Message='success')	
		BEGIN
			SET	@Response_DB_Message		=	'Error Submit Data'
			
			EXEC sp_xml_preparedocument @hDocTransaction OUTPUT, @Document_Transaction
			INSERT INTO @tempDocumentTransaction(
						Document_Transaction_Id,
						Document_Transaction_Name,
						Document_Transaction_Date,
						Period_Date_From,
						Period_Date_To,
						Transaction_Document_Type_Id,
						Submit_By_User_Id,
						Submit_By_Name,
						Submit_By_Roles_Id,
						Used_By_Driver_Id,
						Used_By_Driver_Name,
						Kendaraan_Id
						)
			SELECT		Document_Transaction_Id,
						Document_Transaction_Name,
						Document_Transaction_Date,
						Period_Date_From,
						Period_Date_To,
						Transaction_Document_Type_Id,
						Submit_By_User_Id,
						Submit_By_Name,
						Submit_By_Roles_Id,
						Used_By_Driver_Id,
						Used_By_Driver_Name,
						Kendaraan_Id
			FROM OPENXML(@hDocTransaction,'root/row')
			WITH		(
						Document_Transaction_Id			UNIQUEIDENTIFIER	'@Document_Transaction_Id',
						Document_Transaction_Name		VARCHAR(500)		'@Document_Transaction_Name',
						Document_Transaction_Date		DATETIME			'@Document_Transaction_Date',
						Period_Date_From				DATETIME			'@Period_Date_From',
						Period_Date_To					DATETIME			'@Period_Date_To',
						Transaction_Document_Type_Id	UNIQUEIDENTIFIER	'@Transaction_Document_Type_Id',
						Submit_By_User_Id				UNIQUEIDENTIFIER	'@Submit_By_User_Id',
						Submit_By_Name					VARCHAR(250)		'@Submit_By_Name',
						Submit_By_Roles_Id				UNIQUEIDENTIFIER	'@Submit_By_Roles_Id',
						Used_By_Driver_Id				UNIQUEIDENTIFIER	'@Used_By_Driver_Id',
						Used_By_Driver_Name				VARCHAR(250)		'@Used_By_Driver_Name',
						Kendaraan_Id					UNIQUEIDENTIFIER	'@Kendaraan_Id'
						)
			EXEC sp_xml_removedocument @hDocTransaction

			----===GET DATA FROM TABLE TEMPORARY
			SELECT	@Submit_By_User_Id				=	docTrans.Submit_By_User_Id,
					@Submit_By_Roles_Id				=	docTrans.Submit_By_Roles_Id,
					@Transaction_Document_Type_Id	=	docTrans.Transaction_Document_Type_Id
			FROM @tempDocumentTransaction docTrans

			----===GET DATA ROAD MAP TRANSACTION====----
			SELECT	TOP 1
					@Users_Steps_Numbers			=	roadMapTrans.Steps_Numbers	
			FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Road_Maping_Transaction] roadMapTrans WITH (NOLOCK)
			WHERE	Is_Active						=	1
				AND	Is_Delete						=	0
				AND Transaction_Document_Type_Id	=	@Transaction_Document_Type_Id
				AND Steps_Approval_Roles_Id			=	@Submit_By_Roles_Id
			ORDER BY roadMapTrans.Steps_Numbers  ASC

			INSERT INTO [Tes_Backend_Developer_SekawanMedia].[dbo].[Document_Transaction](
						Document_Transaction_Id,
						Document_Transaction_Name,
						Document_Transaction_Date,
						Period_Date_From,
						Period_Date_To,
						Document_Transaction_Notes,
						Transaction_Document_Type_Id,
						Submit_By_User_Id,
						Submit_By_Name,
						Submit_By_Roles_Id,
						Used_By_Driver_Id,
						Used_By_Driver_Name,
						Kendaraan_Id,
						Is_Active,
						Is_Delete,
						Created_By,
						Created_Date,
						Modified_By,
						Modified_Date
						)
			OUTPUT		INSERTED.Document_Transaction_Id
			INTO		@tempOutputDocTrans
			SELECT		NEWID(),
						docTrans.Document_Transaction_Name,
						docTrans.Document_Transaction_Date,
						docTrans.Period_Date_From,
						docTrans.Period_Date_To,
						'',
						docTrans.Transaction_Document_Type_Id,
						docTrans.Submit_By_User_Id,
						docTrans.Submit_By_Name,
						docTrans.Submit_By_Roles_Id,
						docTrans.Used_By_Driver_Id,
						docTrans.Used_By_Driver_Name,
						docTrans.Kendaraan_Id,
						1,
						0,
						@Username,
						@Modified_DateTimeWIB,
						@Username,
						@Modified_DateTimeWIB
			FROM @tempDocumentTransaction docTrans
			SET	@Document_Transaction_Id		=	(SELECT Document_Transaction_Id FROM  @tempOutputDocTrans)

			IF(@Users_Steps_Numbers%10=0)
				BEGIN
					SET	@Step_Number_Rounding		=	@Users_Steps_Numbers
				END
			ELSE
				BEGIN
					SET	@Step_Number_Rounding		=	(10-@Users_Steps_Numbers%10)+@Users_Steps_Numbers
				END

			INSERT INTO [Tes_Backend_Developer_SekawanMedia].[dbo].[Transaction_Ticket_Flow](
						Transaction_Ticket_Flow_Id,
						Document_Transaction_Id,
						Submit_By_User_Id,
						Steps_Numbers,
						Steps_Approval_Roles_Id,
						Inbox_Users_Id,
						Action_Date_Time,
						Is_Active_Inbox,
						Is_Approved,
						Is_Reject,
						Document_Status_Id,
						Remarks,
						Is_Active,
						Is_Delete,
						Created_By,
						Created_Date,
						Modified_By,
						Modified_date
						)
			SELECT		NEWID(),
						@Document_Transaction_Id,
						@Submit_By_User_Id,
						@Users_Steps_Numbers			AS	Steps_Numbers,
						@Submit_By_Roles_Id				AS	Steps_Approval_Roles_Id,
						@Submit_By_User_Id				AS	Inbox_Users_Id,
						@Modified_DateTimeWIB,
						0,
						0,
						0,
						@DocStatusSubmited,
						'',
						1,
						0,
						@Username,
						@Modified_DateTimeWIB,
						@Username,
						@Modified_DateTimeWIB
			UNION		
			SELECT		NEWID(),
						@Document_Transaction_Id,
						@Submit_By_User_Id,
						roadMapTrans.Steps_Numbers				AS	Steps_Numbers,
						roadMapTrans.Steps_Approval_Roles_Id	AS	Steps_Approval_Roles_Id,
						users.Users_Id							AS	Inbox_Users_Id,
						NULL,
						CASE WHEN (Steps_Numbers BETWEEN @Users_Steps_Numbers AND @Step_Number_Rounding+10) AND (Steps_Numbers%10)=(0) THEN 1 ELSE 0 END,
						0,
						0,
						@DocStatusWaiting_for_Approval,
						'',
						1,
						0,
						@Username,
						@Modified_DateTimeWIB,
						CASE WHEN (Steps_Numbers BETWEEN @Users_Steps_Numbers AND @Step_Number_Rounding+10) AND (Steps_Numbers%10)=(0) THEN @Username ELSE NULL END,
						CASE WHEN (Steps_Numbers BETWEEN @Users_Steps_Numbers AND @Step_Number_Rounding+10) AND (Steps_Numbers%10)=(0) THEN @Modified_DateTimeWIB ELSE NULL END
			FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Road_Maping_Transaction] roadMapTrans WITH (NOLOCK)
			INNER JOIN [Tes_Backend_Developer_SekawanMedia].[dbo].[Users] users WITH (NOLOCK)
			ON		users.Is_Active								=	1
				AND	users.Is_Delete								=	0
				AND users.Roles_Id								=	roadMapTrans.Steps_Approval_Roles_Id
			WHERE	roadMapTrans.Is_Active						=	1
				AND	roadMapTrans.Is_Delete						=	0
				AND roadMapTrans.Transaction_Document_Type_Id	=	@Transaction_Document_Type_Id
				AND roadMapTrans.Steps_Numbers					>	@Users_Steps_Numbers

			SET	@Is_Success_Activity			=	1
			SET	@Response_DB_Message			=	'Pemesanan Kendaraan anda berhasil disubmit'

		END
	ELSE
		BEGIN
			SET	@Response_DB_Message	=	'Gagal memproses Request'
		END

	SELECT	@Is_Success_Activity		AS	Is_Success_Activity,
			@Response_DB_Message		AS	Response_DB_Message

	--ROLLBACK
	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Edit_Transaction]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Willy Kurniaman Lase>
-- Create date: <08 Juni 2023>
-- Description:	<Submit Edit Transaction Pemakaian Kendaraan>
-- =============================================
CREATE   PROCEDURE [dbo].[sp_Edit_Transaction]
	-- Add the parameters for the stored procedure here
	 @Users_Id					UNIQUEIDENTIFIER
	,@Username					VARCHAR(5)
	,@Document_Transaction_Id	UNIQUEIDENTIFIER
	,@Document_Transaction		VARCHAR(MAX)
AS
BEGIN
	SET	XACT_ABORT ON
	BEGIN TRAN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE	@Default_Id						UNIQUEIDENTIFIER,
			@DocStatusSubmited				SMALLINT,
			@DocStatusWaiting_for_Approval	SMALLINT,
			@DocStatusEdited				SMALLINT,
			@hDocTransaction				INT,
			@Is_Success_Activity			BIT,
			@Response_DB_Message			VARCHAR(250),
			@Modified_DateTimeWIB			DATETIME,
			@Verify_Document_Transaction_Id	UNIQUEIDENTIFIER

	DECLARE	@Transaction_Document_Type_Id	UNIQUEIDENTIFIER,
			@Submit_By_User_Id				UNIQUEIDENTIFIER,
			@Submit_By_Roles_Id				UNIQUEIDENTIFIER,
			@Used_By_Driver_Id				UNIQUEIDENTIFIER,
			@Users_Steps_Numbers			SMALLINT,
			@Step_Number_Rounding			INT
			
	DECLARE	@tempDocumentTransaction	TABLE
	(
		--Document_Transaction_Id			UNIQUEIDENTIFIER,
		Document_Transaction_Name		VARCHAR(500),
		Document_Transaction_Date		DATETIME,
		Document_Transaction_Type_Id	UNIQUEIDENTIFIER,
		Submit_By_User_Id				UNIQUEIDENTIFIER,
		Submit_By_Name					VARCHAR(250),
		Submit_By_Roles_Id				UNIQUEIDENTIFIER,
		Used_By_Driver_Id				UNIQUEIDENTIFIER,
		Used_By_Driver_Name				VARCHAR(250),
		Kendaraan_Id					UNIQUEIDENTIFIER
	)

	SET	@Default_Id				=	CAST(0X0 AS UNIQUEIDENTIFIER)
	SET	@Modified_DateTimeWIB	=	DATEADD(HOUR,7,GETUTCDATE())
	SET	@Response_DB_Message	=	'success'
	SET	@DocStatusSubmited		=	(SELECT TOP 1 Document_Status_Id FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Document_Status] WHERE Is_Active=1 AND Is_Delete=0 AND Document_Status_Description='Submited')
	SET	@DocStatusWaiting_for_Approval		=	(SELECT TOP 1 Document_Status_Id FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Document_Status] WHERE Is_Active=1 AND Is_Delete=0 AND Document_Status_Description='Waiting for Approval')
	SET	@DocStatusEdited					=	(SELECT TOP 1 Document_Status_Id FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Document_Status] WHERE Is_Active=1 AND Is_Delete=0 AND Document_Status_Description='Edited')


	IF(@Document_Transaction IS NULL OR @Document_Transaction='')
		BEGIN
			SET	@Response_DB_Message	=	'Mohon maaf, Data Document anda tidak lengkap!'
		END

	IF(@Response_DB_Message='success')	
		BEGIN
			SET	@Response_DB_Message		=	'Error Submit Data'
			EXEC sp_xml_preparedocument @hDocTransaction OUTPUT, @Document_Transaction
			INSERT INTO @tempDocumentTransaction(
						--Document_Transaction_Id,
						Document_Transaction_Name,
						Document_Transaction_Date,
						Document_Transaction_Type_Id,
						Submit_By_User_Id,
						Submit_By_Name,
						Submit_By_Roles_Id,
						Used_By_Driver_Id,
						Used_By_Driver_Name,
						Kendaraan_Id
						)
			SELECT		--Document_Transaction_Id,
						Document_Transaction_Name,
						Document_Transaction_Date,
						Document_Transaction_Type_Id,
						Submit_By_User_Id,
						Submit_By_Name,
						Submit_By_Roles_Id,
						Used_By_Driver_Id,
						Used_By_Driver_Name,
						Kendaraan_Id
			FROM OPENXML(@hDocTransaction,'root/row')
			WITH		(
						--Document_Transaction_Id			UNIQUEIDENTIFIER	'@Document_Transaction_Id',
						Document_Transaction_Name		VARCHAR(500)		'@Document_Transaction_Name',
						Document_Transaction_Date		DATETIME			'@Document_Transaction_Date',
						Document_Transaction_Type_Id	UNIQUEIDENTIFIER	'@Transaction_Document_Type_Id',
						Submit_By_User_Id				UNIQUEIDENTIFIER	'@Submit_By_User_Id',
						Submit_By_Name					VARCHAR(250)		'@Submit_By_Name',
						Submit_By_Roles_Id				UNIQUEIDENTIFIER	'@Submit_By_Roles_Id',
						Used_By_Driver_Id				UNIQUEIDENTIFIER	'@Used_By_Driver_Id',
						Used_By_Driver_Name				VARCHAR(250)		'@Used_By_Driver_Name',
						Kendaraan_Id					UNIQUEIDENTIFIER	'@Kendaraan_Id'
						)
			EXEC sp_xml_removedocument @hDocTransaction

			----===GET DATA FROM TABLE TEMPORARY
			SELECT	@Submit_By_User_Id				=	docTrans.Submit_By_User_Id,
					@Submit_By_Roles_Id				=	docTrans.Submit_By_Roles_Id,
					@Transaction_Document_Type_Id	=	docTrans.Document_Transaction_Type_Id
			FROM @tempDocumentTransaction docTrans

			SELECT	@Verify_Document_Transaction_Id			=	docTrans.Document_Transaction_Id
			FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Document_Transaction] docTrans WITH (NOLOCK)
			WHERE	docTrans.Is_Active						=	1
				AND	docTrans.Is_Delete						=	0
				AND docTrans.Submit_By_User_Id				=	@Submit_By_User_Id
				AND docTrans.Transaction_Document_Type_Id	=	@Transaction_Document_Type_Id
				AND docTrans.Document_Transaction_Id		=	@Document_Transaction_Id

			IF(ISNULL(@Verify_Document_Transaction_Id,@Default_Id)=@Default_Id)	
				BEGIN
					SET	@Response_DB_Message		=	'Dokumen Pemesanan Kendaraan Tidak Ditemukan'
				END
			ELSE
				BEGIN
					UPDATE targetData
					SET		targetData.Document_Transaction_Name	=	sourceData.Document_Transaction_Name,
							targetData.Document_Transaction_Date	=	sourceData.Document_Transaction_Date,
							targetData.Transaction_Document_Type_Id	=	sourceData.Document_Transaction_Type_Id,
							targetData.Submit_By_Name				=	sourceData.Submit_By_Name,
							targetData.Submit_By_User_Id			=	sourceData.Submit_By_User_Id,
							targetData.Submit_By_Roles_Id			=	sourceData.Submit_By_Roles_Id,
							targetData.Used_By_Driver_Id			=	sourceData.Used_By_Driver_Id,
							targetData.Used_By_Driver_Name			=	sourceData.Used_By_Driver_Name,
							targetData.Kendaraan_Id					=	sourceData.Kendaraan_Id,
							targetData.Modified_By					=	@Username,
							targetData.Modified_Date				=	@Modified_DateTimeWIB
					FROM @tempDocumentTransaction sourceData
					INNER JOIN [Tes_Backend_Developer_SekawanMedia].[dbo].[Document_Transaction] targetData
					ON		targetData.Is_Active					=	1
						AND	targetData.Is_Delete					=	0
						AND targetData.Submit_By_User_Id			=	@Submit_By_User_Id
						AND targetData.Transaction_Document_Type_Id	=	@Transaction_Document_Type_Id
						AND targetData.Document_Transaction_Id		=	@Verify_Document_Transaction_Id

					SET	@Is_Success_Activity			=	1
					SET	@Response_DB_Message			=	'Pemesanan Kendaraan anda berhasil disubmit'
	
				END
		END
	ELSE
		BEGIN
			SET	@Response_DB_Message	=	'Gagal memproses Request'
		END

	SELECT	@Is_Success_Activity		AS	Is_Success_Activity,
			@Response_DB_Message		AS	Response_DB_Message

	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_Kendaraan]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Willy Kurniaman Lase>
-- Create date: <08 Juni 2023>
-- Description:	<Get Master Data Kendaraan>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Get_Kendaraan] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	Kendaraan_Id,
			Nama_Pemilik,
			Nomor_Registrasi,
			Merk,
			Type,
			Jenis,
			Model,
			Tahun_Pembuatan,
			Isi_Silinder,
			Nomor_Rangka,
			Nomor_Mesin,
			Warna,
			Bahan_Bakar,
			Tahun_Registrasi,
			Nomor_BPKB,
			Nomor_STNK
	FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Kendaraan]
	WHERE	Is_Active			=	1
		AND	Is_Delete			=	0
	ORDER BY Created_Date DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_Road_Maping_Transaction]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Willy Kurniaman Lase>
-- Create date: <08 Juni 2023>
-- Description:	<Get Master Data Road Maping Transaction>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Get_Road_Maping_Transaction] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	Road_Maping_Transaction_Id,
			Road_Maping_Transaction_Name,
			Steps_Numbers,
			Steps_Approval_Roles_Id
	FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Road_Maping_Transaction]
	WHERE	Is_Active			=	1
		AND	Is_Delete			=	0
	ORDER BY Created_Date DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_Roles]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Willy Kurniaman Lase>
-- Create date: <08 Juni 2023>
-- Description:	<Get Master Data Roles>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Get_Roles] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	Roles_Id,
			Roles_Code,
			Roles_Description
	FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Roles]
	WHERE	Is_Active			=	1
		AND	Is_Delete			=	0
	ORDER BY Created_Date DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_Transaction]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Willy Kurniaman Lase>
-- Create date: <08 Juni 2023>
-- Description:	<Get Transaction>
-- =============================================
CREATE   PROCEDURE [dbo].[sp_Get_Transaction]
	-- Add the parameters for the stored procedure here
	 @Users_Id						UNIQUEIDENTIFIER
	,@Document_Transaction_Id		UNIQUEIDENTIFIER
	,@Submit_By_User_Id				UNIQUEIDENTIFIER
	,@Transaction_Document_Type_Id	UNIQUEIDENTIFIER
AS
BEGIN
	SET XACT_ABORT ON 
	BEGIN TRAN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE	@Default_Id						UNIQUEIDENTIFIER,
			@Modified_DateTimeWIB			DATETIME


	DECLARE	@tempTicketFlow					TABLE
	(
		Submit_Users_Id						UNIQUEIDENTIFIER,
		Steps_Numbers						SMALLINT,
		Steps_Approval_Roles_Id				UNIQUEIDENTIFIER,
		Inbox_Users_Id						UNIQUEIDENTIFIER,
		Action_Date_Time					DATETIME,
		Is_Active_Inbox						BIT,
		Is_Reject							BIT,
		Is_Approved							BIT,
		Document_Status_Description			VARCHAR(250),
		Remarks								VARCHAR(MAX),
		Username							VARCHAR(50),
		User_Full_Name						VARCHAR(250),
		Roles_Description					VARCHAR(50),
		Modified_By							VARCHAR(50),
		Modified_Date						DATETIME
	)

    -- Insert statements for procedure here
	SELECT	docTrans.Document_Transaction_Id,
			docTrans.Document_Transaction_Name,
			docTrans.Document_Transaction_Date,
			docTrans.Document_Transaction_Notes,
			docTrans.Transaction_Document_Type_Id,
			transDocType.Transaction_Document_Type_Name,
			docTrans.Submit_By_User_Id,
			docTrans.Submit_By_Name,
			docTrans.Submit_By_Roles_Id,
			docTrans.Used_By_Driver_Id,
			docTrans.Used_By_Driver_Name,
			driver.Driver_Phone_Number,
			driver.Driver_Email,
			kendaraan.Kendaraan_Id,
			kendaraan.Nama_Pemilik,
			kendaraan.Nomor_STNK,
			kendaraan.Nomor_BPKB,
			kendaraan.Warna,
			kendaraan.Jenis,
			kendaraan.Model,
			kendaraan.Bahan_Bakar,
			kendaraan.Merk
	FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Document_Transaction] docTrans WITH (NOLOCK)
	INNER JOIN [Tes_Backend_Developer_SekawanMedia].[dbo].[Driver] driver WITH (NOLOCK)
	ON		driver.Is_Active			=	1
		AND	driver.Is_Delete			=	0
		AND driver.Driver_Id			=	docTrans.Used_By_Driver_Id
	INNER JOIN [Tes_Backend_Developer_SekawanMedia].[dbo].[Kendaraan] kendaraan WITH (NOLOCK)
	ON		kendaraan.Is_Active			=	1
		AND	kendaraan.Is_Delete			=	0
		AND kendaraan.Kendaraan_Id		=	docTrans.Kendaraan_Id
	INNER JOIN [Tes_Backend_Developer_SekawanMedia].[dbo].[Transaction_Document_Type] transDocType WITH (NOLOCK)
	ON		transDocType.Is_Active		=	1
		AND	transDocType.Is_Delete		=	0
		AND transDocType.Transaction_Document_Type_Id	=	docTrans.Transaction_Document_Type_Id
	WHERE	docTrans.Is_Active			=	1
		AND	docTrans.Is_Delete			=	0
		AND docTrans.Submit_By_User_Id				=	@Submit_By_User_Id
		AND docTrans.Transaction_Document_Type_Id	=	@Transaction_Document_Type_Id
		AND docTrans.Document_Transaction_Id		=	@Document_Transaction_Id

	INSERT INTO @tempTicketFlow
	SELECT	docFlow.Submit_By_User_Id,
			docFlow.Steps_Numbers,
			docFlow.Steps_Approval_Roles_Id,
			docFlow.Inbox_Users_Id,
			docFlow.Action_Date_Time,
			docFlow.Is_Active_Inbox,
			docFlow.Is_Reject,
			docFlow.Is_Approved,
			docStatus.Document_Status_Description,
			docFlow.Remarks,
			users.Username,
			users.User_Full_Name,
			roles.Roles_Description,
			docFlow.Modified_By,
			docFlow.Modified_date
	FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Transaction_Ticket_Flow] docFlow WITH (NOLOCK)
	INNER JOIN [Tes_Backend_Developer_SekawanMedia].[dbo].[Roles] roles WITH (NOLOCK)
	ON		roles.Is_Active					=	1
		AND	roles.Is_Delete					=	0
		AND roles.Roles_Id					=	docFlow.Steps_Approval_Roles_Id
	INNER JOIN [Tes_Backend_Developer_SekawanMedia].[dbo].[Document_Status] docStatus WITH (NOLOCK)
	ON		docStatus.Is_Active				=	1
		AND	docStatus.Is_Delete				=	0
		AND docStatus.Document_Status_Id	=	docFlow.Document_Status_Id
	INNER JOIN [Tes_Backend_Developer_SekawanMedia].[dbo].[Users] users WITH (NOLOCK)
	ON		users.Is_Active					=	1
		AND	users.Is_Delete					=	0
		AND users.Users_Id					=	docFlow.Inbox_Users_Id
	WHERE	docFlow.Is_Active						=	1
		AND	docFlow.Is_Delete						=	0
		AND docFlow.Submit_By_User_Id				=	@Submit_By_User_Id
		AND docFlow.Document_Transaction_Id			=	@Document_Transaction_Id


	SELECT	ticketFlow.Steps_Numbers,
			ticketFlow.User_Full_Name,
			ticketFlow.Roles_Description,
			ticketFlow.Document_Status_Description
	FROM @tempTicketFlow ticketFlow
	ORDER BY ticketFlow.Steps_Numbers ASC

	SELECT	ISNULL(ticketFlow.Steps_Numbers,0)															AS Steps_Numbers,
			ISNULL(ticketFlow.User_Full_Name,'')														AS User_Full_Name,
			ISNULL(ticketFlow.Roles_Description,'')														AS Roles_Description,
			ISNULL(ticketFlow.Document_Status_Description,'')											AS Document_Status_Description,
			ISNULL(ticketFlow.Action_Date_Time, ISNULL(ticketFlow.Modified_Date,@Modified_DateTimeWIB))	AS Action_Date_Time,
			ISNULL(ticketFlow.Is_Active_Inbox,0) 														AS Is_Active_Inbox,
			ISNULL(ticketFlow.Is_Reject,0)																AS Is_Reject,
			ISNULL(ticketFlow.Is_Approved,0)															AS Is_Approved,
			ISNULL(ticketFlow.Remarks,'')																AS Remarks
	FROM @tempTicketFlow ticketFlow
	WHERE	ticketFlow.Steps_Numbers <= (SELECT TOP 1 Steps_Numbers FROM @tempTicketFlow WHERE  Modified_Date IS NOT NULL AND Modified_By IS NOT NULL ORDER BY Steps_Numbers DESC)
	ORDER BY ticketFlow.Steps_Numbers ASC


	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_Transaction_Document_Type]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Willy Kurniaman Lase>
-- Create date: <08 Juni 2023>
-- Description:	<Get Master Data Transaction Document Type>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Get_Transaction_Document_Type]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	Transaction_Document_Type_Id,
			Transaction_Document_Type_Name
	FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Transaction_Document_Type]
	WHERE	Is_Active			=	1
		AND	Is_Delete			=	0
	ORDER BY Created_Date DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_Worklist_Inbox]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Willy Kurniaman Lase>
-- Create date: <08 Juni 2023>
-- Description:	<Get Worklist Inbox>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Get_Worklist_Inbox]
	-- Add the parameters for the stored procedure here
	 @Users_Id						UNIQUEIDENTIFIER
	,@DateFrom						DATETIME
	,@DateTo						DATETIME
	,@Transaction_Document_Type_Id	UNIQUEIDENTIFIER
	,@Is_Inbox						BIT
	,@Search						VARCHAR(250)
AS
BEGIN
	SET XACT_ABORT ON
	BEGIN TRAN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE	@Default_Id			UNIQUEIDENTIFIER

	DECLARE	@tempTranDocType	TABLE
	(
		Transaction_Document_Type_Id		UNIQUEIDENTIFIER
	)

	SET	@Default_Id			=	CAST(0X0 AS UNIQUEIDENTIFIER)

	IF(@Transaction_Document_Type_Id=@Default_Id)
		BEGIN
			INSERT INTO @tempTranDocType
			SELECT Transaction_Document_Type_Id
			FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Transaction_Document_Type]
			WHERE	Is_Active				=	1
				AND	Is_Delete				=	0
		END
	ELSE
		BEGIN
			INSERT INTO @tempTranDocType
			SELECT	@Transaction_Document_Type_Id
		END	

    -- Insert statements for procedure here
	SELECT	docTrans.Document_Transaction_Id,
			docTrans.Document_Transaction_Name,
			docTrans.Document_Transaction_Date,
			docTrans.Transaction_Document_Type_Id,
			transDocType.Transaction_Document_Type_Name,
			docTrans.Submit_By_Name,
			docTrans.Submit_By_User_Id,
			docTrans.Submit_By_Roles_Id,
			docTrans.Kendaraan_Id,
			kendaraan.Merk,
			docTrans.Used_By_Driver_Id,
			docTrans.Used_By_Driver_Name,
			ticketFlow.Document_Status_Id,
			docStatus.Document_Status_Description
	FROM  [Tes_Backend_Developer_SekawanMedia].[dbo].[Document_Transaction] docTrans WITH (NOLOCK)
	INNER JOIN [Tes_Backend_Developer_SekawanMedia].[dbo].[Transaction_Ticket_Flow] ticketFlow WITH (NOLOCK)
	ON		ticketFlow.Is_Active				=	1
		AND	ticketFlow.Is_Delete				=	0
		AND ticketFlow.Modified_date			BETWEEN @DateFrom AND @DateTo
		AND ticketFlow.Is_Active_Inbox			=	@Is_Inbox
		AND ticketFlow.Inbox_Users_Id			=	@Users_Id
		AND ticketFlow.Document_Transaction_Id	=	docTrans.Document_Transaction_Id
	INNER JOIN [Tes_Backend_Developer_SekawanMedia].[dbo].[Transaction_Document_Type] transDocType WITH (NOLOCK)
	ON		transDocType.Is_Active				=	1
		AND	transDocType.Is_Delete				=	0
		AND transDocType.Transaction_Document_Type_Id	=	docTrans.Transaction_Document_Type_Id
	INNER JOIN [Tes_Backend_Developer_SekawanMedia].[dbo].[Kendaraan] kendaraan WITH (NOLOCK)
	ON		kendaraan.Is_Active					=	1
		AND	kendaraan.Is_Delete					=	0
		AND kendaraan.Kendaraan_Id				=	docTrans.Kendaraan_Id
	INNER JOIN [Tes_Backend_Developer_SekawanMedia].[dbo].[Document_Status] docStatus WITH (NOLOCK)
	ON		docStatus.Is_Active					=	1
		AND	docStatus.Is_Delete					=	0
		AND docStatus.Document_Status_Id		=	ticketFlow.Document_Status_Id
	WHERE	docTrans.Is_Active					=	1
		AND	docTrans.Is_Delete					=	0
		AND docTrans.Transaction_Document_Type_Id	IN	(SELECT Transaction_Document_Type_Id FROM @tempTranDocType)
		AND (docTrans.Document_Transaction_Name	LIKE '%' + @Search + '%' 
			OR	docTrans.Submit_By_Name			LIKE '%' + @Search + '%' 
			OR	docTrans.Used_By_Driver_Name	LIKE '%' + @Search + '%' 
			OR	transDocType.Transaction_Document_Type_Name LIKE '%' + @Search + '%' 
			OR	kendaraan.Merk					LIKE '%' + @Search + '%' 
			)
	ORDER BY ISNULL(docTrans.Modified_Date,docTrans.Created_Date) DESC

	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Willy Kurniaman Lase>
-- Create date: <08 Juni 2023>
-- Description:	<Login>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Login]
--DECLARE	-- Add the parameters for the stored procedure here
	@Email			VARCHAR(250)	--=	'kurniamanlase@gmail.com'
	,@Password		VARCHAR(50)		--=	'willylase'
AS
BEGIN
	SET XACT_ABORT ON 
	BEGIN TRAN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE	@Default_Id				UNIQUEIDENTIFIER,
			@Hash_Password			VARBINARY(500),
			@Is_Error				BIT,
			@Is_Bad_Password		BIT,
			@Is_Success_Activity	BIT,
			@Is_Active				BIT,
			@Response_DB_Message	VARCHAR(250),
			@User_Password			VARBINARY(500),
			@Username				VARCHAR(50),
			@User_Full_Name			VARCHAR(250),
			@Users_Id				UNIQUEIDENTIFIER,
			@Roles_Id				UNIQUEIDENTIFIER,
			@Roles_Description		VARCHAR(250),
			@User_Phone_Number		VARCHAR(20),
			@User_Birthday			DATETIME,
			@User_Email				VARCHAR(250),
			@Modified_DateTimeWIB	DATETIME

	SET	@Default_Id				=	CAST(0X0 AS UNIQUEIDENTIFIER)
	SET	@Response_DB_Message	=	'Selamat Datang'
	SET	@Is_Error				=	1
	SET	@Is_Success_Activity	=	0
	SET	@Hash_Password			=	HASHBYTES('SHA2_512',@Password)
	SET	@Modified_DateTimeWIB	=	DATEADD(HOUR,7,GETUTCDATE())

	SELECT	TOP 1
			@User_Password			=	users.User_Password,
			@Username				=	users.Username,
			@User_Full_Name			=	Users.User_Full_Name,
			@Users_Id				=	users.Users_Id,
			@Roles_Id				=	users.Roles_Id,
			@Roles_Description		=	roles.Roles_Description,
			@User_Phone_Number		=	users.User_Phone_Number,
			@User_Birthday			=	users.User_Birthday,
			@User_Email				=	users.User_Email,
			@Is_Active				=	users.Is_Active
	FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Users] users WITH (NOLOCK)
	INNER JOIN [Tes_Backend_Developer_SekawanMedia].[dbo].[Roles] roles WITH (NOLOCK)
	ON		roles.Is_Active			=	1
		AND	roles.Is_Delete			=	0
		AND roles.Roles_Id			=	users.Roles_Id
	WHERE	users.Is_Active			IN	(0,1)
		AND	users.Is_Delete			=	0
		AND users.User_Email		=	@Email

	IF(@Users_Id IS NULL)
		BEGIN
			SET	@Response_DB_Message	=	'Email atau Password Salah atau User tidak ditemukan'
		END
	ELSE IF(ISNULL(@Is_Active,0)=0)
		BEGIN
			SET	@Response_DB_Message	=	'Akun anda terlock! Segera hubungi admin'
		END
	ELSE  IF(@User_Password<>@Hash_Password)
		BEGIN
			SET	@Response_DB_Message	=	'Password yang anda masukkan salah'
		END
	ELSE 
		BEGIN
			SET	@Is_Error				=	0
		END

	IF(@Is_Error=0)
		BEGIN
			EXEC [Tes_Backend_Developer_SekawanMedia].[dbo].[sp_Login_History] @Users_Id, @Username, @Hash_Password, @Is_Success_Activity OUTPUT
		END
	ELSE
		BEGIN
			SET	@Is_Success_Activity	=	CASE @Is_Error WHEN 1 THEN 0 ELSE 1 END
		END

	SELECT	CONVERT(BIT,ISNULL(@Is_Success_Activity,0))	AS	Is_Success_Activity,
			CASE WHEN (ISNULL(@Is_Success_Activity,0)=0 AND @Response_DB_Message='Selamat Datang') THEN 'Gagal melakukan Permintaan Login'
			ELSE	@Response_DB_Message	END	AS	Response_DB_Message

	SELECT	@Users_Id			AS	Users_Id,
			@User_Full_Name		AS	User_Full_Name,
			@Username			AS	Username,
			@User_Email			AS	User_Email,
			@User_Phone_Number	AS	User_Phone_Number,
			@User_Birthday		AS	User_Birthday,
			@Roles_Id			AS	Roles_Id,
			@Roles_Description	AS	Roles_Description
	WHERE	@Is_Success_Activity	=	1






	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Login_History]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Willy Kurniaman Lase>
-- Create date: <08  Juni 2023>
-- Description:	<Login History>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Login_History]
	-- Add the parameters for the stored procedure here
	@Users_Id			UNIQUEIDENTIFIER,
	@Username			VARCHAR(50),
	@Hash_Password		VARBINARY(500),
	@Is_Success			BIT OUTPUT
AS
BEGIN
	SET XACT_ABORT ON
	BEGIN TRAN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE	@Num_Hours				INT,
			@Is_Logout				BIT,
			@Modified_DateTimeWIB	DATETIME

	SET	@Num_Hours	=	5
	SET	@Is_Logout	=	0
	SET	@Modified_DateTimeWIB	=	DATEADD(HOUR,7,GETUTCDATE())

	UPDATE [Tes_Backend_Developer_SekawanMedia].[dbo].[Users]
	SET	Modified_By		=	@Username,
		Modified_Date	=	@Modified_DateTimeWIB
	WHERE	Is_Active		=	1
		AND	Is_Delete		=	0
		AND Username		=	@Username
		AND Users_Id		=	@Users_Id
		AND User_Password	=	@Hash_Password

	INSERT INTO [Tes_Backend_Developer_SekawanMedia].[dbo].[Users_Login_History]
           ([Users_Login_History_Id]
           ,[Users_Id]
           ,[Username]
           ,[User_Password]
           ,[Login_DateTime]
           ,[Logout_DateTime]
           ,[Expired_DateTime]
           ,[Is_Active]
           ,[Is_Delete]
           ,[Created_By]
           ,[Created_Date]
           ,[Modified_By]
           ,[Modified_Date])
     VALUES
           (NEWID()
           ,@Users_Id
           ,@Username
           ,@Hash_Password
           ,DATEADD(hour,7, GETUTCDATE())
           ,NULL
		   ,dateadd(HOUR, @num_hours, DATEADD(hour,7, GETUTCDATE()))
           ,1
           ,0
           ,@Username
           ,DATEADD(hour,7, GETUTCDATE())
           ,NULL
           ,NULL)

	SELECT	@Is_Success	=	1
		


	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LogOut]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Willy Kurniaman Lase>
-- Create date: <08 Juni 2023>
-- Description:	<Logout>
-- =============================================
CREATE PROCEDURE [dbo].[sp_LogOut] 
--DECLARE	-- Add the parameters for the stored procedure here
	@Users_Id				UNIQUEIDENTIFIER	--=	'6F5C10C8-255A-43AA-8968-16748472A711'
	,@Username				VARCHAR(50)			--=	'kurniaman.lase'
AS
BEGIN
	SET XACT_ABORT ON
	BEGIN TRAN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [Tes_Backend_Developer_SekawanMedia].[dbo].[Users_Login_History]
	SET	Logout_DateTime		=	DATEADD(HOUR,7,GETUTCDATE()),
		Modified_By			=	@Username,
		Modified_Date		=	DATEADD(HOUR,7,GETUTCDATE()),
		Is_Active			=	0
	WHERE	Is_Active		=	1
		AND	Is_Delete		=	0
		AND Username		=	@Username
		AND Users_Id		=	@Users_Id

	SELECT	CONVERT(BIT,1)	AS	Is_Success_Activity,
			'Logout Success'	AS	Response_DB_Message
	
	COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Ticket_Flow]    Script Date: 09/06/2023 22:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Willy Kurniaman Lase>
-- Create date: <08 Juni 2023>
-- Description:	<Submit Action Ticket Flow Approve/Reject>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Ticket_Flow] 
	-- Add the parameters for the stored procedure here
	@Users_Id					UNIQUEIDENTIFIER
	,@Username					VARCHAR(50)
	,@Validate_Ticket_Flow		VARCHAR(MAX)
AS
BEGIN
	SET XACT_ABORT ON
	BEGIN TRAN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE	@Default_Id						UNIQUEIDENTIFIER,
			@DocStatusApprove				SMALLINT,
			@DocStatusReject				SMALLINT,
			@Is_Success_Activity			BIT,
			@Response_DB_Message			VARCHAR(250),
			@Verify_Document_Transaction_Id	UNIQUEIDENTIFIER,
			@hTicketFlow					INT,
			@Modified_DateTimeWIB			DATETIME

	DECLARE	@Document_Transaction_Id		UNIQUEIDENTIFIER,
			@Submit_By_User_Id				UNIQUEIDENTIFIER,
			@Remarks						VARCHAR(1000),
			@Is_Approved					BIT,
			@Is_Reject						BIT

	DECLARE	@Current_Step_Numbers			SMALLINT,
			@Next_Steps_Numbers				SMALLINT,
			@Step_Number_Rounding			INT,
			@Last_Step_Number				SMALLINT

	DECLARE	@tempTicketFlow					TABLE
	(
		Document_Transaction_Id		UNIQUEIDENTIFIER,
		Submit_By_User_Id			UNIQUEIDENTIFIER,
		Remarks						VARCHAR(1000),
		Is_Approved					BIT,
		Is_Reject					BIT
	)

	DECLARE	@tempDocFlow				TABLE
	(
		 Transaction_Ticket_Flow_Id				uniqueidentifier
		,Document_Transaction_Id				uniqueidentifier
		,Submit_Users_Id						uniqueidentifier 
		,Steps_Numbers							smallint 
		,Steps_Approval_Roles_Id				uniqueidentifier 
		,Inbox_Users_Id							uniqueidentifier 
		,Action_Date_Time						datetime 
		,Is_Active_Inbox						bit 
		,Is_Reject								bit 
		,Is_Approved							bit 
		,Document_Status_Id						smallint 
		,Remarks								varchar(1000) 
		,Is_Active								bit 
		,Is_Delete								bit 
		,Created_By								varchar(50) 
		,Created_Date							datetime 
		,Modified_By							varchar(50) 
		,Modified_Date							datetime 
	)

	SET	@Is_Success_Activity		=	0
	SET	@Default_Id					=	CAST(0X0 AS UNIQUEIDENTIFIER)
	SET	@DocStatusApprove			=	(SELECT TOP 1 Document_Status_Id FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Document_Status] WHERE Is_Active=1 AND Is_Delete=0 AND Document_Status_Description='Approved')
	SET	@DocStatusReject			=	(SELECT TOP 1 Document_Status_Id FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Document_Status] WHERE Is_Active=1 AND Is_Delete=0 AND Document_Status_Description='Rejected')
	SET	@Response_DB_Message		=	'Success Validate'
	SET	@Modified_DateTimeWIB		=	DATEADD(HOUR,7,GETUTCDATE())

	EXEC sp_xml_preparedocument @hTicketFlow OUTPUT, @Validate_Ticket_Flow
	INSERT INTO @tempTicketFlow(
								Document_Transaction_Id,
								Submit_By_User_Id,
								Remarks,
								Is_Approved,
								Is_Reject
								)
	SELECT						Document_Transaction_Id,
								Submit_By_User_Id,
								Remarks,
								Is_Approved,
								Is_Reject
	FROM OPENXML(@hTicketFlow,'root/row')
	WITH						(
								Document_Transaction_Id		UNIQUEIDENTIFIER	'@Document_Transaction_Id',
								Submit_By_User_Id			UNIQUEIDENTIFIER	'@Submit_By_User_Id',
								Remarks						VARCHAR(1000)		'@Remarks',
								Is_Approved					BIT					'@Is_Approved',
								Is_Reject					BIT					'@Is_Reject'
								)
	EXEC sp_xml_removedocument @hTicketFlow

	SELECT	@Document_Transaction_Id	=	Document_Transaction_Id,
			@Submit_By_User_Id			=	Submit_By_User_Id,
			@Remarks					=	Remarks,
			@Is_Approved				=	Is_Approved,
			@Is_Reject					=	Is_Reject
	FROM @tempTicketFlow 

	SELECT	@Verify_Document_Transaction_Id	=	Document_Transaction_Id
	FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Document_Transaction] WITH (NOLOCK)
	WHERE	Is_Active				=	1
		AND	Is_Delete				=	0
		AND Submit_By_User_Id		=	@Submit_By_User_Id
		AND Document_Transaction_Id	=	@Document_Transaction_Id


	IF(@Verify_Document_Transaction_Id IS NULL)
		BEGIN
			SET	@Response_DB_Message	=	'Dokumen tidak ditemukan!'
		END	
	ELSE IF((@Is_Approved=1 AND @Is_Reject=0) OR
			(@Is_Approved=0 AND @Is_Reject=1))
		BEGIN
			SET	@Response_DB_Message	=	'Success Validate'
		END
	ELSE
		BEGIN
			SET	@Response_DB_Message	=	'Mohon maaf, Perintah Ambigu! Dokumen ini hanya bisa di Setujui atau di Tolak'
		END

	IF(@Response_DB_Message='Success Validate')
		BEGIN
			INSERT INTO @tempDocFlow
			SELECT * FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Transaction_Ticket_Flow]
			WHERE	Is_Active				=	1
				AND	Is_Delete				=	0
				AND Submit_By_User_Id		=	@Submit_By_User_Id
				AND Document_Transaction_Id	=	@Verify_Document_Transaction_Id

			---====CURRENT STEP
			SELECT	TOP 1
					@Current_Step_Numbers				=	currentStep.Steps_Numbers
			FROM @tempDocFlow currentStep
			WHERE	currentStep.Is_Active				=	1
				AND	currentStep.Is_Delete				=	0
				AND currentStep.Submit_Users_Id			=	@Submit_By_User_Id
				AND currentStep.Document_Transaction_Id	=	@Verify_Document_Transaction_Id
				AND currentStep.Inbox_Users_Id			=	@Users_Id
			ORDER BY currentStep.Steps_Numbers ASC

			---===NEXT STEP
			SELECT	TOP 1
					@Next_Steps_Numbers			=	nextStep.Steps_Numbers
			FROM	@tempDocFlow currentStep
			INNER JOIN @tempDocFlow nextStep
			ON		nextStep.Is_Active			=	1
				AND	nextStep.Is_Delete			=	0
				AND nextStep.Submit_Users_Id	=	@Submit_By_User_Id
				AND nextStep.Is_Active_Inbox	=	0
				AND nextStep.Steps_Numbers%10	IN	(0,2,4,6,8)
				AND nextStep.Steps_Numbers		>	currentStep.Steps_Numbers
				AND nextStep.Document_Transaction_Id	=	@Verify_Document_Transaction_Id
			WHERE	currentStep.Is_Active		=	1
				AND	currentStep.Is_Delete		=	0
				AND currentStep.Is_Active_Inbox	=	1
				AND currentStep.Submit_Users_Id	=	@Submit_By_User_Id
				AND currentStep.Inbox_Users_Id	=	@Users_Id
				AND currentStep.Document_Transaction_Id	=	@Verify_Document_Transaction_Id
			ORDER BY nextStep.Steps_Numbers ASC

			--===FINAL OR LAST STEP
			SELECT	TOP 1
					@Last_Step_Number			=	finalStep.Steps_Numbers
			FROM @tempDocFlow finalStep
			WHERE	finalStep.Is_Active			=	1
				AND	finalStep.Is_Delete			=	0
				AND finalStep.Submit_Users_Id	=	@Submit_By_User_Id
				AND finalStep.Document_Transaction_Id	=	@Verify_Document_Transaction_Id
			ORDER BY finalStep.Steps_Numbers DESC


			IF(@Is_Approved=1)
				BEGIN
					---===UPDATE CURRENT STEP
					UPDATE	targetData
					SET		targetData.Action_Date_Time		=	@Modified_DateTimeWIB,
							targetData.Is_Active_Inbox		=	0,
							targetData.Is_Reject			=	@Is_Reject,
							targetData.Is_Approved			=	@Is_Approved,
							targetData.Remarks				=	@Remarks,
							targetData.Modified_By			=	@Username,
							targetData.Modified_date		=	@Modified_DateTimeWIB,
							targetData.Document_Status_Id	=	@DocStatusApprove
					FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Transaction_Ticket_Flow]	targetData
					WHERE	Is_Active					=	1
						AND Is_Delete					=	0
						AND Is_Active_Inbox				=	1
						AND Submit_By_User_Id			=	@Submit_By_User_Id
						AND Steps_Numbers				=	@Current_Step_Numbers
						AND Document_Transaction_Id		=	@Verify_Document_Transaction_Id

					----====UPDATE NEXT STEP
					UPDATE	targetData
					SET		targetData.Is_Active_Inbox	=	1,
							targetData.Modified_By		=	@Username,
							targetData.Modified_date	=	@Modified_DateTimeWIB
					FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Transaction_Ticket_Flow] targetData
					WHERE	Is_Active					=	1
						AND Is_Delete					=	0
						AND Is_Active_Inbox				=	0
						AND Submit_By_User_Id			=	@Submit_By_User_Id
						AND Steps_Numbers				=	@Next_Steps_Numbers
						AND Document_Transaction_Id		=	@Verify_Document_Transaction_Id

					SET	@Is_Success_Activity			=	1
					SET	@Response_DB_Message			=	'Dokumen berhasil di Setujui'
				END
			ELSE  IF(@Is_Reject=1)
				BEGIN
					---===UPDATE CURRENT STEP
					UPDATE	targetData
					SET		targetData.Action_Date_Time		=	@Modified_DateTimeWIB,
							targetData.Is_Active_Inbox		=	0,
							targetData.Is_Reject			=	@Is_Reject,
							targetData.Is_Approved			=	@Is_Approved,
							targetData.Remarks				=	@Remarks,
							targetData.Modified_By			=	@Username,
							targetData.Modified_date		=	@Modified_DateTimeWIB,
							targetData.Document_Status_Id	=	@DocStatusReject
					FROM [Tes_Backend_Developer_SekawanMedia].[dbo].[Transaction_Ticket_Flow]	targetData
					WHERE	Is_Active					=	1
						AND Is_Delete					=	0
						AND Is_Active_Inbox				=	1
						AND Submit_By_User_Id			=	@Submit_By_User_Id
						AND Steps_Numbers				=	@Current_Step_Numbers
						AND Document_Transaction_Id		=	@Verify_Document_Transaction_Id

					SET	@Is_Success_Activity			=	1
					SET	@Response_DB_Message			=	'Dokumen berhasil di Tolak'
				END


		END

	SELECT	@Is_Success_Activity		AS	Is_Success_Activity,
			@Response_DB_Message		AS	Response_DB_Message

	--ROLLBACK
	COMMIT
END
GO
USE [master]
GO
ALTER DATABASE [Tes_Backend_Developer_SekawanMedia] SET  READ_WRITE 
GO
