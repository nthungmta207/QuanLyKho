USE [master]
GO
/****** Object:  Database [WebEducation]    Script Date: 10/30/2017 6:18:19 PM ******/
CREATE DATABASE [WebEducation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'webeducation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\webeducation.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'webeducation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\webeducation_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebEducation] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebEducation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebEducation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebEducation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebEducation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebEducation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebEducation] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebEducation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebEducation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebEducation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebEducation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebEducation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebEducation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebEducation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebEducation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebEducation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebEducation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebEducation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebEducation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebEducation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebEducation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebEducation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebEducation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebEducation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebEducation] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebEducation] SET  MULTI_USER 
GO
ALTER DATABASE [WebEducation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebEducation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebEducation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebEducation] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebEducation', N'ON'
GO
USE [WebEducation]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 10/30/2017 6:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[PhoneNumber] [char](15) NULL,
	[Title] [nvarchar](250) NULL,
	[Content] [ntext] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 10/30/2017 6:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[UserID] [bigint] NOT NULL,
	[RoleID] [bigint] NOT NULL CONSTRAINT [DF_Credential_RoleID]  DEFAULT ((1)),
	[Note] [nvarchar](50) NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 10/30/2017 6:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[IDEvenInfo] [bigint] NOT NULL,
	[IDUser] [bigint] NOT NULL,
	[DateRegister] [date] NULL,
	[Note] [nvarchar](50) NULL,
 CONSTRAINT [PK_Event_1] PRIMARY KEY CLUSTERED 
(
	[IDEvenInfo] ASC,
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventInfo]    Script Date: 10/30/2017 6:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EventInfo](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [ntext] NULL,
	[Content] [ntext] NULL,
	[Image] [varchar](50) NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HistoryTest]    Script Date: 10/30/2017 6:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistoryTest](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDUser] [bigint] NULL,
	[IDTest] [bigint] NULL,
	[Date] [datetime] NULL,
	[Answer] [varchar](250) NULL,
	[UseAnswer] [varchar](250) NULL,
	[Result] [int] NULL,
	[Rate] [int] NULL,
	[Feedback] [ntext] NULL,
 CONSTRAINT [PK_HistoryTest_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[News]    Script Date: 10/30/2017 6:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Content] [ntext] NULL,
	[Author] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[Image] [varchar](200) NULL,
	[MultipleImages] [xml] NULL,
 CONSTRAINT [PK_New] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/30/2017 6:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [bigint] NOT NULL,
	[Role] [varchar](150) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 10/30/2017 6:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Test]    Script Date: 10/30/2017 6:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Test](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Tag] [varchar](50) NULL,
	[Number] [int] NULL,
	[Answer] [varchar](250) NULL,
	[Time] [int] NULL,
	[Source] [varchar](50) NULL,
	[Level] [int] NULL,
	[Url] [varchar](250) NULL,
	[Rate] [int] NULL,
	[IDSubject] [bigint] NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/30/2017 6:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](32) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[image] [varchar](150) NULL,
	[status] [bit] NULL CONSTRAINT [DF_User_status]  DEFAULT ((1)),
	[Hobby] [ntext] NULL,
	[EXP] [int] NULL CONSTRAINT [DF_User_EXP]  DEFAULT ((0)),
	[NumberTest] [int] NULL CONSTRAINT [DF_User_EXNum]  DEFAULT ((0)),
	[Level] [int] NULL CONSTRAINT [DF_User_Level]  DEFAULT ((0)),
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Credential] ([UserID], [RoleID], [Note]) VALUES (1, 2, NULL)
INSERT [dbo].[Credential] ([UserID], [RoleID], [Note]) VALUES (2, 3, NULL)
INSERT [dbo].[Credential] ([UserID], [RoleID], [Note]) VALUES (3, 2, NULL)
INSERT [dbo].[Event] ([IDEvenInfo], [IDUser], [DateRegister], [Note]) VALUES (1, 1, NULL, NULL)
INSERT [dbo].[Event] ([IDEvenInfo], [IDUser], [DateRegister], [Note]) VALUES (1, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[EventInfo] ON 

INSERT [dbo].[EventInfo] ([ID], [Title], [Content], [Image], [Date]) VALUES (1, N'Ra mắt Thư viện đề thi thử THPT QG 2018 trên webeducation.com', N'Tháng 11 là thời điểm các em học sinh THPT bắt đầu ôn thi học kỳ I. Đây cũng là lúc mùa thi thử THPT QG bắt đầu. Sở dĩ các thí sinh ôn thi THPT QG đều đầu tư rất nhiều thời gian và công sức cho việc luyện đề là bởi việc luyện đề quyết định đến 70% kết quả làm bài thi THPT QG của thí sinh. Thế nhưng, đây cũng là lúc các thí sinh rất đau đầu bởi kỳ thi THPT QG đang ngày càng đến gần rồi mà biết tìm đâu cho ra một bộ đề thi thử vừa đầy đủ vừa đảm bảo chất lượng? 

Hiện nay, cùng với sự phát triển của công nghệ thông tin, các em hoàn toàn có thể tìm được trên internet nhiều đề thi thử để tham khảo nhưng sẽ gặp phải những vấn đề tưởng chừng như nhỏ mà lại không hề nhỏ sau đây:

1.	Lượng đề thi thử lớn nhưng không phải đề thi thử của trường nào cũng đảm bảo chất lượng (được xây dựng đúng cấu trúc chuẩn của Bộ GD&ĐT và bám sát nội dung chương trình thi THPT QG 2018). Khi đó, các em vừa mất thời gian tìm kiếm đề vừa bị choán ngợp trong lượng đề lớn và nếu không chọn đúng đề thi thử chất lượng, các em còn bị mất rất nhiều thời gian vào việc làm đề mà không đem lại hiệu quả gì. Điều này sẽ ảnh hưởng rất lớn đến tâm lý và quỹ thời gian ôn thi quý báu của các em.

2.	Đề thi thử mà các em tìm được trên internet thường là các ảnh chụp đề, rất bất tiện khi muốn xem và làm đề. 

3. Đặc biệt, vì là đề làm offline, không có đồng hồ bấm giờ tạo sức ép về mặt thời gian và tâm lý nên hiệu quả luyện đề không được cao.

4.	Đề thi không có đáp án, lời giải chi tiết để tham khảo. 

5. Trong quá trình làm đề, các em không được tương tác với bạn bè, thầy cô, không được giải đáp thắc mắc khi gặp bài tập khó.

Hiểu được những khó khăn mà các em gặp phải, BQT Moon.vn quyết định xây dựng THƯ VIỆN ĐỀ THI THỬ THPT QG 2018. 

THƯ VIỆN ĐỀ THI THỬ THPT QG 2018 được xây dựng cho 5 môn học trên Moon.vn là: Toán, Lý, Hóa, Sinh, Anh; được khai giảng đồng loạt vào ngày 10/11/2017 với cấu trúc chung gồm có 3 phần như sau:

1. 30-50 đề thi khảo sát chất lượng học kỳ I

2. Trên 200 đề thi thử THPT QG 2018

3. 30-50 đề thi Học sinh giỏi các tỉnh

Lưu ý: các đề trong thư viện này đều được tổng hợp và chọn lọc từ nguồn đề của các trường THPT trên khắp cả nước, đặc biệt là các trường chuyên, trường điểm.', N'20171214100518.jpg', CAST(N'2017-12-13' AS Date))
INSERT [dbo].[EventInfo] ([ID], [Title], [Content], [Image], [Date]) VALUES (3, N'Hà Nội: Tập dượt thi THPT quốc gia 2017', N'Theo công văn Hướng dẫn thực hiện kiểm tra, khảo sát đối với lớp 12 THPT của Hà Nội, mỗi học sinh dự kiểm tra 4 bài, trong đó có 3 bài kiểm tra bắt buộc (Toán, Ngữ văn, tiếng Anh) và một bài kiểm tra tự chọn Khoa học tự nhiên (tổ hợp các môn Vật lý, Hóa học, Sinh học) hoặc Khoa học xã hội (tổ hợp các môn Lịch sử, Địa lí, Giáo dục công dân).

Riêng học viên học chương trình GDTX cấp THPT dự thi 3 bài, trong đó có 2 bài bắt buộc (Toán, Ngữ văn) và một bài tự chọn Khoa học tự nhiên (tổ hợp các môn Vật lý, Hóa học, Sinh học) hoặc Khoa học xã hội (tổ hợp các môn Lịch sử, Địa lý).

Hình thức kiểm tra: Môn Ngữ văn kiểm tra theo hình thức tự luận, các bài kiểm tra còn lại kiểm tra theo hình thức trắc nghiệm.

Sở GD&ĐT Hà Nội sẽ ra đề kiểm tra khảo sát theo nội dung chương trình qui định, bám sát cấu trúc, mức độ đề thi của kì thi THPT quốc gia. Phạm vi kiến thức kiểm tra khảo sát theo kế hoạch dạy học tính đến hết ngày 11/3.

Việc tổ chức khảo sát cũng được giao trách nhiệm cho các cụm trưởng THPT trong việc xác lập điểm thi (có thể thiết lập điểm thi liên trường). Công tác sao in đề thi, coi thi, chấm thi được thực hiện như quy định thi THPT quốc gia.

Bài kiểm tra khảo sát được rọc phách, chấm tập trung theo đơn vị Cụm đảm bảo khách quan, trung thực, chính xác. Sở GD&ĐT thành lập các đoàn kiểm tra việc thực hiện sao in đề, coi, chấm kiểm tra khảo sát tại các Cụm trường THPT; tổ chức chấm thẩm định xác suất một số Cụm trường THPT.

Bố trí cán bộ, giáo viên các trường, trung tâm trong cụm làm nhiệm vụ giám sát coi kiểm tra chéo giữa các trường, trung tâm trong cụm đảm bảo nguyên tắc 07 phòng kiểm tra có 01 cán bộ giám sát và chọn cử 01 Phó Hiệu trưởng trường THPT làm Tổ trưởng. Bố trí cán bộ, giáo viên tham gia giám sát công tác chấm kiểm tra khảo sát.

Theo ông Chử Xuân Dũng, Phó giám đốc Sở GD&ĐT Hà Nội, Sở không bắt buộc các trường lấy điểm từ kết quả thi mà tùy theo điều kiện của mỗi trường có thể lấy kết quả cho điểm kiểm tra thường xuyên. Không dùng kết quả này cho điểm kiểm tra định kì.

Dự kiến thời gian khảo sát là 2,5 ngày, từ ngày 20/3 đến hết sáng 22/3. Chậm nhất ngày 31/3/2017, các Cụm trưởng trường THPT nộp kết quả kiểm khảo sát của các trường, trung tâm trong cụm về phòng GDPT, GDTX-CN và phòng QLT&KĐCLGD, Sở GD&ĐT gồm bản đã ký đóng dấu và dữ liệu đã có kết quả khảo sát.', N'20171214100540.jpg', CAST(N'2017-12-13' AS Date))
INSERT [dbo].[EventInfo] ([ID], [Title], [Content], [Image], [Date]) VALUES (4, N'Hướng dẫn ghi phiếu đăng ký dự thi THPT quốc gia và xét tuyển ĐH,CĐ 2017', N'Sau ngày 20/4/2017, thí sinh không được thay đổi Điểm thi và các thông tin về bài thi/môn thi đã đăng ký.

Theo hướng dẫn của Bộ GD&ĐT, các đơn vị ĐKDT thực hiện: thu 02 Phiếu ĐKDT, bản photocopy 2 mặt Chứng minh nhân dân trên 1 mặt giấy A4, 02 ảnh 4x6 cm và một phong bì thư đã dán tem ghi rõ họ tên địa chỉ nhận của thí sinh để trong Túi đựng hồ sơ theo mẫu của Bộ GDĐT; nhập dữ liệu của thí sinh vào phần mềm QLT.

Ngay sau khi nhập xong dữ liệu, cán bộ máy tính in thông tin đăng ký xét công nhận tốt nghiệp THPT của thí sinh từ phần mềm quản lý thi, giao cho giáo viên chủ nhiệm hoặc cán bộ được phân công tổ chức cho học sinh rà soát, ký xác nhận. Thí sinh tự do có thể nộp hồ sơ xét công nhận tốt nghiệp THPT cùng hồ sơ ĐKDT.

Phiếu ĐKDT số 1 lưu tại đơn vị ĐKDT, Phiếu ĐKDT số 2 giao lại cho thí sinh.

Thí sinh lưu ý, “Cao đẳng” dùng trong hướng dẫn này được hiểu là “Cao đẳng nhóm ngành đào tạo giáo viên”
Mục SỞ GDĐT…MÃ SỞ: Thí sinh đăng ký tại đơn vị đăng ký dự thi thuộc sở nào thì ghi tên sở đó vào vị trí trống, sau đó điền 2 chữ số biểu thị mã sở vào 2 ô trống tiếp theo, mã sở GDĐT do Bộ GDĐT quy định.

Mục Số phiếu: Nơi tiếp nhận đăng ký dự thi ghi, thí sinh không ghi mục này.

Mục 1, 2: Ghi theo hướng dẫn trên Phiếu đăng ký dự thi THPT quốc gia và xét tuyển sinh vào đại học, cao đẳng (sau đây gọi tắt là Phiếu ĐKDT).

Mục 3: a) Nơi sinh của thí sinh chỉ cần ghi rõ tên tỉnh hoặc thành phố, nếu sinh ở nước ngoài thí sinh chỉ cần ghi rõ tên quốc gia (theo tiếng Việt). b) Dân tộc ghi đúng theo giấy khai sinh.

Mục 4: Đối với Chứng minh nhân dân mẫu cũ, ghi 9 chữ số vào 9 ô cuối bên phải, ba ô đầu để trống; đối với Chứng minh nhân dân mẫu mới hoặc Thẻ căn cước công dân, ghi đủ 12 chữ số vào các ô tương ứng.

Mục 5: Mã tỉnh (thành phố), mã huyện (quận) và mã xã (phường) chỉ đối với các xã (phường) thuộc diện đặc biệt khó khăn sẽ do Bộ GDĐT quy định. Thí sinh cần tra cứu tại nơi đăng ký dự thi để ghi đúng mã tỉnh (thành phố), mã huyện (quận), mã xã (phường) nơi thí sinh có hộ khẩu thường trú hiện tại vào các ô tương ứng ở bên phải.

Thí sinh không có hộ khẩu thường trú tại xã đặc biệt khó khăn thì bỏ trống ô mã xã. Sau khi điền đủ các mã đơn vị hành chính, thí sinh ghi rõ tên tỉnh (thành phố), huyện (quận), xã (phường) vào dòng trống. Đối với thí sinh thuộc diện ưu tiên đối tượng hoặc khu vực có liên quan đến hộ khẩu thường trú, đề nghị phải khẳng định thời gian có hộ khẩu thường trú trên 18 tháng tại khu vực 1 hoặc trên 18 tháng ở xã đặc biệt khó khăn trong thời gian học THPT bằng cách đánh dấu vào ô tương ứng.

Mục 6: Ghi tên trường và địa chỉ đến huyện (quận), tỉnh (thành phố) của trường vào dòng kẻ chấm. Ghi mã tỉnh nơi trường đóng vào 2 ô đầu, ghi mã trường vào 3 ô tiếp theo (mã trường ghi theo quy định của Sở GDĐT, nếu mã trường có 1 chữ số thì 2 ô đầu tiên ghi số 0, nếu mã trường có 2 chữ số thì ô đầu tiên ghi số 0). Đối với thí sinh là công an, quân nhân được cử tham gia dự thi để xét tuyển ĐH, CĐ thì ghi mã tỉnh tương ứng với tỉnh nơi đóng quân và mã trường THPT là 900. Đối với thí sinh có thời gian học ở nước ngoài thì những năm học ở nước ngoài ghi mã tỉnh tương ứng với tỉnh theo hộ khẩu thường trú tại Việt Nam và mã trường THPT là 800. Mục tên lớp: ghi rõ tên lớp 12 nơi học sinh đang học (ví dụ 12A1, 12A2,...), đối với học sinh là thí sinh tự do ghi “TDO”.

Mục 7: Ghi rõ điện thoại, email (nếu có). Đối với thí sinh có yêu cầu điều chỉnh đăng ký xét tuyển tuyển sinh trực tuyến, cần đăng ký số điện thoại di động cá nhân (của mình) để được cấp mật khẩu sử dụng một lần (OTP) qua tin nhắn đảm bảo cho sự bảo mật khi đăng ký xét tuyển trực tuyến.

Mục 8: Thí sinh phải ghi rõ họ tên người liên hệ, địa chỉ chi tiết: xóm (số nhà), thôn (đường phố, ngõ ngách), xã (phường), huyện (quận), tỉnh (thành phố). Địa chỉ này đồng thời là địa chỉ nhận Giấy báo trúng tuyển nếu thí sinh trúng tuyển.

Mục 9: Thí sinh có nguyện vọng lấy kết quả dự thi để xét tuyển sinh đại học, cao đẳng nhóm ngành đào tạo giáoviên thì đánh dấu (X) vào ô bên cạnh

Mục 10: Thí sinh bắt buộc phải đánh dấu (X) vào một trong 2 ô để biểu thị rõ thí sinh học theo chương trình THPT hay chương trình GDTX.

Mục 11: Đối với thí sinh tự do, đánh dấu (X) vào một trong 2 ô để phân biệt rõ là thí sinh tự do chưa tốt nghiệp THPT hay đã tốt nghiệp THPT (tính đến thời điểm dự thi).

Mục 12: Thí sinh đăng ký dự thi tại cụm thi nào thì ghi tên cụm thi và mã cụm thi do Bộ GDĐT quy định vào vị trí tương ứng.

Mục 13: Học sinh đang học lớp 12 THPT tại trường nào thì nộp ĐKDT tại trường đó. Các đối tượng khác nộp ĐKDT tại các địa điểm do Sở GDĐT quy định. Mã đơn vị ĐKDT ghi theo hướng dẫn của nơi nhận ĐKDT.

Mục 14: Đối với thí sinh hiện đang là học sinh lớp 12 (chưa tốt nghiệp THPT) phải đăng ký bài thi tại điểm a, thí sinh không được phép chọn các môn thi thành phần ở điểm b. Đối với thí sinh tự do, tùy theo mục đích dự thi, tùy theo việc lựa chọn tổ hợp môn xét tuyển đại học, cao đẳng có thể chọn cả bài thi (tại điểm a) hoặc chỉ chọn một số môn thành phần (tại điểm b) cho phù hợp.

Trường hợp thí sinh tự do chưa tốt nghiệp THPT có những môn thi (để xét công nhận tốt nghiệp) năm trước đủ điều kiện bảo lưu, nếu muốn bảo lưu bài thi/môn thi thành phần nào thì phải ghi điểm bài thi/môn thi đó ở Mục 15, tuy nhiên thí sinh vẫn có thể chọn thi bài thi/môn thi thành phần (đã xin bảo lưu) để lấy kết quả xét tuyển sinh đại học, cao đẳng. Đối với thí sinh học theo chương trình GDTX có thể chọn môn thi ngoại ngữ nếu có nguyện vọng sử dụng môn ngoại ngữ trong tổ hợp môn xét tuyển sinh đại học, cao đẳng.

Cách chọn bài thi/môn thi thành phần: Thí sinh đăng ký dự thi bài thi/môn thi thành phần nào thì đánh dấu (X) vào ô bài thi/môn thi thành phần tương ứng, riêng đối với bài thi Ngoại ngữ thí sinh điền mã số tương ứng với ngôn ngữ cụ thể như sau: N1 – Tiếng Anh; N2 – Tiếng Nga; N3 – Tiếng Pháp; N4 – Tiếng Trung Quốc; N5 – Tiếng Đức; N6 – Tiếng Nhật.

Mục 15: Đối với thí sinh xin miễn thi ngoại ngữ, cần ghi rõ loại chứng chỉ đủ điều kiện miễn thi hoặc ghi rõ là thành viên đội tuyển quốc gia dự thi Olympic quốc tế môn Ngoại ngữ theo quy định của Bộ GDĐT.

Mục 16: Thí sinh đã dự thi THPT năm trước, nếu có những môn thi đủ điều kiện bảo lưu theo quy định, thí sinh muốn bảo lưu môn nào thì ghi điểm môn đó vào ô tương ứng. Đối với những môn được bảo lưu, thí sinh vẫn có thể đăng ký dự thi (bài thi hoặc môn thi thành phần) ở Mục 13 nếu có nguyện vọng sử dụng kết quả thi xét tuyển sinh đại học, cao đẳng.

Mục 17: Thí sinh tự xác định đối tượng ưu tiên, ghi đúng ký hiệu các đối tượng ưu tiên theo quy định tại Quy chế tuyển sinh đại học hệ chính quy; tuyển sinh cao đẳng nhóm ngành đào tạo giáo viên hệ chính quy hoặc văn bản hướng dẫn Nếu khai thiếu trung thực sẽ bị xử lý theo các quy định hiện hành. Thí sinh thuộc diện ưu tiên phải nộp đủ giấy tờ minh chứng hợp pháp cho trường khi đến nhập học.

Mục 18: Đối với thí sinh dự thi có mục đích xét tuyển ĐH, CĐ cần ghi mã khu vực vào ô trống như sau: Khu vực 1 (KV1) điền chữ số 1, Khu vực 2 nông thôn (KV2-NT) điền 2NT, Khu vực 2 (KV2) điền chữ số 2, Khu vực 3 (KV3) điền chữ số 3. Trong 3 năm học THPT hoặc tương đương, học ở đâu lâu hơn hưởng ưu tiên khu vực ở đó.

Nếu mỗi năm học một trường có mức ưu tiên khu vực khác nhau hoặc nửa thời gian học ở trường này, nửa thời gian học ở trường kia thì tốt nghiệp THPT ở đâu hưởng ưu tiên khu vực tại đó. Đối với thí sinh được ưu tiên theo hộ khẩu thường trú, căn cứ vào quy định của Quy chế tuyển sinh đại học hệ chính quy; tuyển sinh cao đẳng nhóm ngành đào tạo giáo viên hệ chính quy và hướng dẫn của Bộ GDĐT để ghi cho đúng khu vực ưu tiên được hưởng.

Phần mềm đăng ký dự thi sẽ tự động xác định mức hưởng ưu tiên khu vực theo Quy chế tuyển sinh đại học hệ chính quy; tuyển sinh cao đẳng nhóm ngành đào tạo giáo viên hệ chính quy khi thí sinh khai đầy đủ Mục 5 và Mục 6; nếu thấy khác với thông tin khai trên phiếu ĐKDT, thí sinh cần kiểm tra lại thông tin đã khai tại các mục này.

Mục 19: Ghi theo hướng dẫn trên phiếu ĐKDT.

Mục 20: Đối với thí sinh thi với mục đích lấy kết quả để xét học liên thông lên cao đẳng, đại học cần đánh dấu (X) vào ô đã tốt nghiệp ở bậc học nào tương ứng: Đã tốt nghiệp trung cấp (TC) hoặc Đã tốt nghiệp cao đẳng (CĐ).

Mục 21: Mục này dành cho thí sinh có nguyện vọng xét tuyển sinh đại học; tuyển sinh cao đẳng nhóm ngành đào tạo giáo viên. Để ghi thông tin ở mục này, thí sinh cần tìm hiểu kỹ thông tin tuyển sinh của trường có nguyện vọng học được đăng tải trên Cổng thông tin tuyển sinh của Bộ GDĐT và trang thông tin của các trường để có thông tin đăng ký chính xác về mã trường, mã ngành/nhóm ngành, tên ngành/nhóm ngành, tổ hợp môn xét tuyển. Thí sinh đăng ký nguyện vọng nào không đúng với quy định của các trường thì nguyện vọng đó sẽ không được nhập vào hệ thống phần mềm để trường xét tuyển.', N'20171214100551.jpg', CAST(N'2017-12-13' AS Date))
INSERT [dbo].[EventInfo] ([ID], [Title], [Content], [Image], [Date]) VALUES (5, N'TPHCM đổi lịch thi lớp 10 để “tránh” kỳ thi THPT quốc gia', N'Ông Nguyễn Tiến Đạt, Phó GĐ Sở GD-ĐT TPHCM cho hay, kế hoạch này dựa trên thời gian tổ chức kỳ thi THPT quốc gia của Bộ GD-ĐT. Do kỳ thi THPT quốc gia năm nay tổ chức vào ngày 22 đến 24/6 nên kỳ thi tuyển sinh vào lớp 10 của TPHCM sẽ diễn ra sớm hơn để tránh cập rập cùng lúc hai kỳ thi.

Dự kiến kỳ thi vào lớp 10 sẽ diễn ra vào đầu tháng 6/2017, lịch cụ thể chờ UBND TPHCM phê duyệt và sẽ sớm công bố để học sinh, phụ huynh và các trường nắm rõ. Năm 2016, kỳ thi tuyển sinh vào lớp 10 ở TPHCM tổ chức vào ngày 11 - 12/6.
Ông Nguyễn Tiến Đạt, Phó GĐ Sở GD-ĐT TPHCM cho hay, kế hoạch này dựa trên thời gian tổ chức kỳ thi THPT quốc gia của Bộ GD-ĐT. Do kỳ thi THPT quốc gia năm nay tổ chức vào ngày 22 đến 24/6 nên kỳ thi tuyển sinh vào lớp 10 của TPHCM sẽ diễn ra sớm hơn để tránh cập rập cùng lúc hai kỳ thi.

Dự kiến kỳ thi vào lớp 10 sẽ diễn ra vào đầu tháng 6/2017, lịch cụ thể chờ UBND TPHCM phê duyệt và sẽ sớm công bố để học sinh, phụ huynh và các trường nắm rõ. Năm 2016, kỳ thi tuyển sinh vào lớp 10 ở TPHCM tổ chức vào ngày 11 - 12/6.', N'20171214100610.jpg', CAST(N'2017-12-13' AS Date))
INSERT [dbo].[EventInfo] ([ID], [Title], [Content], [Image], [Date]) VALUES (6, N'Hà Nội: Đã có lịch thi thử kỳ thi THPT quốc gia 2017', N'Theo công văn Hướng dẫn thực hiện kiểm tra, khảo sát đối với lớp 12 THPT của Hà Nội, mỗi học sinh dự kiểm tra 4 bài, trong đó có 3 bài kiểm tra bắt buộc (Toán, Ngữ văn, tiếng Anh) và một bài kiểm tra tự chọn Khoa học tự nhiên (tổ hợp các môn Vật lý, Hóa học, Sinh học) hoặc Khoa học xã hội (tổ hợp các môn Lịch sử, Địa lí, Giáo dục công dân).

Riêng học viên học chương trình GDTX cấp THPT dự thi 3 bài, trong đó có 2 bài bắt buộc (Toán, Ngữ văn) và một bài tự chọn Khoa học tự nhiên (tổ hợp các môn Vật lý, Hóa học, Sinh học) hoặc Khoa học xã hội (tổ hợp các môn Lịch sử, Địa lý).

Hình thức kiểm tra: Môn Ngữ văn kiểm tra theo hình thức tự luận, các bài kiểm tra còn lại kiểm tra theo hình thức trắc nghiệm.

Sở GD&ĐT Hà Nội sẽ ra đề kiểm tra khảo sát theo nội dung chương trình qui định, bám sát cấu trúc, mức độ đề thi của kì thi THPT quốc gia. Phạm vi kiến thức kiểm tra khảo sát theo kế hoạch dạy học tính đến hết ngày 11/3.

Việc tổ chức khảo sát cũng được giao trách nhiệm cho các cụm trưởng THPT trong việc xác lập điểm thi (có thể thiết lập điểm thi liên trường). Công tác sao in đề thi, coi thi, chấm thi được thực hiện như quy định thi THPT quốc gia.

Bài kiểm tra khảo sát được rọc phách, chấm tập trung theo đơn vị Cụm đảm bảo khách quan, trung thực, chính xác. Sở GD&ĐT thành lập các đoàn kiểm tra việc thực hiện sao in đề, coi, chấm kiểm tra khảo sát tại các Cụm trường THPT; tổ chức chấm thẩm định xác suất một số Cụm trường THPT.

Bố trí cán bộ, giáo viên các trường, trung tâm trong cụm làm nhiệm vụ giám sát coi kiểm tra chéo giữa các trường, trung tâm trong cụm đảm bảo nguyên tắc 07 phòng kiểm tra có 01 cán bộ giám sát và chọn cử 01 Phó Hiệu trưởng trường THPT làm Tổ trưởng. Bố trí cán bộ, giáo viên tham gia giám sát công tác chấm kiểm tra khảo sát.

Theo ông Chử Xuân Dũng, Phó giám đốc Sở GD&ĐT Hà Nội, Sở không bắt buộc các trường lấy điểm từ kết quả thi mà tùy theo điều kiện của mỗi trường có thể lấy kết quả cho điểm kiểm tra thường xuyên. Không dùng kết quả này cho điểm kiểm tra định kì.

Dự kiến thời gian khảo sát là 2,5 ngày, từ ngày 20/3 đến hết sáng 22/3. Chậm nhất ngày 31/3/2017, các Cụm trưởng trường THPT nộp kết quả kiểm khảo sát của các trường, trung tâm trong cụm về phòng GDPT, GDTX-CN và phòng QLT&KĐCLGD, Sở GD&ĐT gồm bản đã ký đóng dấu và dữ liệu đã có kết quả khảo sát.', N'20171214100622.jpg', CAST(N'2017-12-13' AS Date))
SET IDENTITY_INSERT [dbo].[EventInfo] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([ID], [Title], [Content], [Author], [Date], [Image], [MultipleImages]) VALUES (6, N'''Buồng'' thí nghiệm hóa học mini', N'TTO - Trăn trở trước thực trạng giáo viên "dạy chay", học sinh "học chay" môn hóa học tại các trường phổ thông, hai giảng viên đại học đã chế tạo ''buồng'' thí nghiệm hóa học mini đa năng.
TS Chu Mạnh Nhương (35 tuổi, giảng viên khoa hóa học Trường ĐH Sư phạm Thái Nguyên) và cộng sự là ThS Nguyễn Văn Trung (58 tuổi, giảng viên khoa hóa học) đã cùng lên ý tưởng chế tạo "buồng" thí nghiệm này.

Buồng thí nghiệm nặng chỉ 5-7kg, có thể di chuyển dễ dàng từ phòng này qua phòng khác, tạo thuận lợi cho giáo viên và học sinh làm các thí nghiệm hóa học mà không ngại khí độc hại thải ra môi trường.

Sáng chế này tham dự cuộc thi "Tri thức trẻ vì giáo dục năm 2017", do Trung ương Đoàn, Bộ GD-ĐT, Tập đoàn Thiên Long phối hợp với báo Tuổi Trẻ tổ chức.

Thí nghiệm là "linh hồn" của hóa học

Nhen nhóm ý tưởng từ vài năm trước, đến tháng 4-2017 giảng viên trẻ Chu Mạnh Nhương mới cùng thầy Trung bắt tay chế tạo buồng thí nghiệm hóa học mini đa năng. 

Thầy Nhương kể khi bắt đầu đề xuất ý tưởng về buồng thí nghiệm, có rất nhiều người thắc mắc: đã có tư liệu trình chiếu, phần mềm mô phỏng, thí nghiệm ảo, video... thì thiết kế đồ dùng thí nghiệm dạy học liệu có cần thiết không? 

"Chúng tôi tiếp thu hết, nhưng quan trọng là giáo viên phải làm thí nghiệm và học sinh phải được thực hành. Thí nghiệm là "linh hồn" của hóa học. Phần mềm mô phỏng, thí nghiệm ảo... chỉ là công cụ bổ trợ cho giáo viên khi triển khai bài học" - thầy Nhương quả quyết.

Sau hai tuần mày mò nghiên cứu, ngày đi dạy tối về chế tạo, cuối cùng buồng thí nghiệm hóa học mini của hai người thầy luôn trăn trở với môn hóa đã hoàn thành và đưa vào thử nghiệm thành công. 

Thầy Nhương cho hay kết cấu của buồng thí nghiệm rất đơn giản, làm từ nhựa mica trong suốt, chia làm hai tầng. 

Tầng dưới có hai ngăn trên và dưới: ngăn dưới dùng làm không gian tiến hành thí nghiệm, ngăn trên được gắn phễu thu khí, quạt hút gió, tum thu khí - thu hút các chất dễ bay hơi lên ống thu khí, và đi vào bình xử lý khí (chứa than gỗ).

Còn tầng trên chứa một phần ống tum, ống nhựa thu khí, và được bố trí các bình đựng chất xử lý khí (như than gỗ, vôi sống, chè cám, bột gạo rang khô, silicagen...) nhằm xử lý triệt để các chất khí và hơi hút từ tầng dưới.

"Than gỗ, chè cám dễ kiếm và rẻ tiền. Tác dụng của sản phẩm rất rõ là hút được trên 90% khí độc khi làm thí nghiệm, hiệu quả xử lý triệt để nếu được cải tiến. 

Với buồng hóa học mini này, thầy trò sẽ có cảm giác an toàn, hứng thú trong khi làm thí nghiệm, không còn sợ hít phải khí độc tràn ra ngoài" - TS Chu Mạnh Nhương cho biết.

Học sinh bớt e dè môn hóa

Tại những nơi thí nghiệm hóa học thường có các tủ hút khí độc. Tuy nhiên, tủ loại này rất nặng, cố định một chỗ, lại hay bị hỏng do sự ăn mòn của hóa chất. Buồng thí nghiệm hóa học của TS Nhương và đồng nghiệp đã khắc phục được những hạn chế trên.

Hiện nay trên thế giới cũng có nhiều buồng thí nghiệm hóa học hiện đại song giá khá đắt, không phù hợp với việc dạy học ở trường THPT. 

Do đó TS Nhương và thầy Trung mong muốn buồng thí nghiệm hóa học mini được triển khai phổ biến, nhân rộng ra ở các trường đại học, viện nghiên cứu, phòng thực hành hóa ở trường phổ thông với giá cả phải chăng. Mức giá với mô hình buồng thí điểm từ 1,5-2 triệu đồng/buồng. 

"Đưa buồng thí nghiệm tham gia chương trình Tri thức trẻ vì giáo dục, chúng tôi mong muốn nhận được ý kiến đóng góp về chuyên môn của các chuyên gia, giáo sư để sản phẩm được cải tiến, hoàn thiện hơn" - thầy Nhương bày tỏ.

Từ khi có buồng hóa học mini, phòng thí nghiệm của khoa hóa học Trường ĐH Sư phạm Thái Nguyên trở nên nhộn nhịp với các nhóm sinh viên nghiên cứu khoa học đến thực hành môn hóa. 

"Tiếp xúc với buồng thí nghiệm này, em bị cuốn hút ngay, cảm thấy hứng thú với môn hóa học. Em thích làm thí nghiệm và làm say mê. 

Em mong sản phẩm này sẽ được phổ biến rộng rãi đến học sinh, sinh viên, nhất là các bạn trẻ đam mê môn hóa" - bạn Nguyễn Đạt Sơn, sinh viên năm 3, khoa hóa học Trường ĐH Sư phạm Thái Nguyên, chia sẻ.', N'HÀ THANH - QUANG DỰ', NULL, N'20171214095410.jpg', NULL)
INSERT [dbo].[News] ([ID], [Title], [Content], [Author], [Date], [Image], [MultipleImages]) VALUES (16, N'Nên sáp nhập các trường tiểu học dưới 10 lớp', N'LTS: Xung quanh việc phình to số lượng cán bộ biên chế trong ngành giáo dục, tác giả Thuận Phương có bài viết phân tích nguyên nhân từ việc thành lập khá nhiều các trường tiểu học chưa đủ cơ cấu lớp theo quy định trong cùng một địa bàn.

Qua đó, tác giả cũng đưa ra những cách thức giải quyết tình trạng trên. Tòa soạn trân trọng gửi đến độc giả bài viết.

Ngành giáo dục hiện nay đang chiếm 52% biên chế sự nghiệp của cả nước (1,2 triệu người trong tổng số 2,3 triệu), chiếm 70% ngân sách cho quỹ lương khối sự nghiệp và đã dùng tới 80% ngân sách nhà nước phân để trả lương.

Nghị quyết số 19 của Hội nghị Ban Chấp Hành Trung ương khóa 12 đã được Tổng bí thư Nguyễn Phú Trọng ký ban hành ngày 25/10/2017, trong đó nêu rõ phải tinh giản ít nhất 10% biên chế trong sự nghiệp công lập trong đó có ngành giáo dục.

Nói đến việc tinh giản biên chế người ta thường nghĩ ngay đến đội ngũ giáo viên. Thế nhưng ít ai quan tâm đến việc dư thừa đội ngũ cán bộ quản lý và nhân viên văn phòng.

Hiện nay, ngành giáo dục ở khá nhiều địa phương trong cả nước chưa thực hiện được việc tinh giản biên chế vì đội ngũ giáo viên đã đủ hoặc còn thiếu.

Nhưng đội ngũ cán bộ quản lý, nhân viên văn phòng và các chức danh kiêm nhiệm trong nhà trường lại ngày một phình to, do thành lập khá nhiều trường tiểu học chưa đủ cơ cấu lớp theo quy định trong cùng một địa bàn.', N'Thuận Phương', NULL, N'20171213063016.jpg', NULL)
INSERT [dbo].[News] ([ID], [Title], [Content], [Author], [Date], [Image], [MultipleImages]) VALUES (17, N'Thư viện đại học thời 4.0 sẽ ra sao?', N'Lần đầu tiên, một hội thảo quy mô được tổ chức để phân tích, đánh giá những “tác động của cuộc cách mạng công nghiệp 4.0 đến hoạt động thông tin – thư viện” được tổ chức tại Trường Đại học Bách Khoa Đà Nẵng.

Tham gia hội thảo có đại diện các trung tâm học liệu của nhiều trường đại học lớn khu vực miền Trung – Tây Nguyên.

Thư viện 4.0 trên điện thoại di động

Tiến sĩ Lê Phước Cường – Phó giám đốc phụ trách Trung tâm Học liệu và Truyền thông (Đại học Bách Khoa Đà Nẵng) cho rằng, cuộc cách mạng công nghiệp 4.0 dù mới bắt đầu nhưng nó đang phá vỡ cấu trúc của hầu hết các ngành công nghiệp ở mọi quốc gia.

Điều này báo trước sự chuyển đổi của toàn bộ hệ thống sản xuất, quản lý và quản trị.
“Giáo dục đại học Việt Nam có sứ mệnh quan trọng là tạo ra nguồn nhân lực đủ về chất và lượng, đáp ứng yêu cầu của nền kinh tế tri thức.

Trong đó, hoạt động thông tin – thư viện thực hiện nhiệm vụ đảm bảo thông tin tài liệu phục vụ cán bộ quản lý, cán bộ giảng dạy, nghiên cứu sinh, học viên, sinh viên”.

Cũng theo Tiến sĩ Cường, cách mạng công nghiệp 4.0 đang rút ngắn tối đa khoảng cách giữa thế giới thực và thế giới ảo thông qua các công nghệ tiên tiến, sự đổi mới, sáng tạo không ngừng.', N'TẤN TÀI', CAST(N'2017-12-12' AS Date), N'20171214095636.jpg', NULL)
INSERT [dbo].[News] ([ID], [Title], [Content], [Author], [Date], [Image], [MultipleImages]) VALUES (18, N'Nếu không đậu lớp 10 công lập', N'Đó là lời khuyên của ông Nguyễn Tiến Đạt, Phó Giám đốc Sở Giáo dục và Đào tạo Thành phố Hồ Chí Minh tại chương trình ''''Hỏi -đáp trực tuyến tuyển sinh lớp 10 năm học 2017-2018'''' do Sở tổ chức ngày 15/4.

Đã có hàng trăm câu hỏi của phụ huynh học sinh liên quan đến vấn đề thi, học bài thi và kinh nghiệm thi như thế nào cho hiệu quả, cách chọn nguyện vọng, làm hồ sơ thi, nội dung đề thi đổi mới ra sao. Những câu hỏi, nếu không đậu vào lớp 10 thì sẽ phải làm sao cũng được rất nhiều phụ huynh và học sinh qua tâm.

Mỗi học sinh sẽ có một mã đề thi

Học sinh Nguyễn Thị Minh Thư (quận Tân Phú) đặt câu hỏi: ''''Cấu trúc đề thi năm nay có gì thay đổi so với năm ngoái không? Điểm chuẩn có tăng lên không?

Nếu em được 7 điểm môn toán, 6 điểm môn văn và 8 điểm môn tiếng Anh thì em đăng ký vào trường nào là phù hợp ở quận Tân Phú hay các quận lân cận''''.

Học sinh Nguyễn Anh Tuấn cũng đặt câu hỏi: ''''Em thấy có rất nhiều anh chị năm trước mắc dù đã cố gắng ôn thi nhưng kết quả không như mong đợi, vậy làm sao để em có cách ôn thi cho có kết quả tốt''''.
Bà Võ Thị Kim Mai (quận 12) thì đặt câu hỏi: ''''Con tôi nói năm nay cấu trúc đề thi sẽ thay đổi, có ít câu hỏi lý thuyết và sẽ ra nhiều câu thực tế. Không biết thông tin con tôi nói đúng hay sai, nếu đúng thì tính thực tế của đề sẽ đạt bao nhiêu?''''...

Trả lời những thắc mắc trên, đại diện Phòng Giáo dục trung học, Sở Giáo dục và Đào tạo Thành phố cho biết, việc đổi mới đề thi năm nay sẽ không thay đổi nhiều và đột ngột so với các năm học trước.

Nội dung đề thi nằm trong phạm vi lớp 9 theo chương trình của Bộ Giáo dục và Đào tạo đã ban hành, kể cả đề chuyên cũng vậy.

Việc quan trọng là các em học sinh phải chọn nguyện vọng đúng với sức học của mình để có kết quả tốt chứ không phải học ôn, luyện thi quá tải.

Đại diện sở cũng cho biết, đề thi năm nay tiếp tục ra theo hướng tăng cường câu hỏi mở, đặc biệt là môn toán và ngữ văn để giúp học sinh vận dụng kiến thức lý thuyết vào thực tiễn cuộc sống.

Theo ông Đạt, năm nay mỗi học sinh sẽ có một mã đề thi. Có nghĩa rằng, một mã đề thi sẽ được áp dụng cho một học sinh, cho các môn thi mà học sinh sẽ thi. 

Không biết chọn nguyên vọng thế nào

Cũng đã rất nhiều câu hỏi liên quan đến lựa chọn nguyện vọng như thế nào cho phù hợp của phụ huynh và học sinh đưa ra.

Điển hình là câu hỏi của anh Nguyện Long (quận Tân Bình): ''''Con tôi đang học lớp 9 chuyên Anh tại Trường trung học phổ thông Hoàng Hoa Thám. Vậy khi cháu chọn thi vào trường chuyên với môn chuyên là tiếng Anh thì cháu được đăng ký tối đa bảy nguyện vọng.

Nếu bây giờ cháu chọn thi chuyên Anh nhưng khi thi tốt nghiệp không đạt loại giỏi thì có được điều chỉnh nguyện vọng dự thi không. Nếu cháu muốn thi lớp 10 chuyên Anh ở Trường trung học phổ thông Nguyễn Thượng Hiền thì có được chọn bảy nguyện vọng không''''. 

Đại diện Phòng khảo thí và kiểm định chất lượng giáo dục của Sở cho biết, học sinh không đậu các nguyện vọng chuyên vẫn được xét tiếp các nguyện vọng như những thí sinh khác.

Thí sinh muốn thi chuyên bắt buộc phải đạt xếp loại tốt nghiệp là giỏi và xếp loại học lực, xếp loại hạnh kiểm các năm học lớp 6,7,8 phải từ khá trở lên. Vì thế, phụ huynh sẽ điều chỉnh lại trong phiếu đăng ký dự thi sau khi có kết quả xếp loại tốt nghiệp.

Trường Nguyễn Thượng Hiện vẫn có trong danh sách các trường chuyên nên sẽ chọn nguyện vọng theo quy định cho khối chuyên.', N'DIỆU THUẦN', CAST(N'2017-12-13' AS Date), N'20171214100355.JPG', NULL)
INSERT [dbo].[News] ([ID], [Title], [Content], [Author], [Date], [Image], [MultipleImages]) VALUES (19, N'Chọn ngành học dựa trên đam mê hay tiền bạc?', N'LTS: Từ ngày hôm nay (20/7) các thí sinh dự kì thi THPT Quốc gia 2016 đã bắt đầu tra cứu được điểm thi [tại đây], vậy là một mùa tuyển sinh nữa lại đến với bao “trăn trở” trong cách chọn trường, chọn nghề của thí sinh.

Đứng trước nhiều lựa chọn ngành nghề và trường học, thầy giáo Nguyễn Văn Lự đã có những lời khuyên gửi đến các em trước khi các em quyết định chọn cho mình.

Tòa soạn trân trọng gửi đến độc giả bài viết!

Với kết quả điểm thi, nhiều thí sinh và gia đình đang băn khoăn nên chọn học nghề gì, trường nào? 

Chọn nghề vì tiền hay vì đam mê?

Theo thông tin công bố, quý I năm 2016, nước ta vẫn còn khoảng 225.000 cử nhân, thạc sĩ thất nghiệp.
 
Những ngành học dễ kiếm việc theo xu thế thị trường và cho thu nhập cao vẫn là lựa chọn hàng đầu của các thí sinh khi chọn trường, chính điều này đã khiến nguồn nhân lực nhiều ngành thiếu, thừa trầm trọng trong khi chất lượng đào tạo lại không đáp ứng được nhu cầu tuyển dụng.

Nói về việc chọn nghề của các thí sinh dự kì thi THPT quốc gia; dựa trên các ngành nghề để lựa chọn hiện nay, tôi nhận thấy:
Những thí sinh có xuất thân từ gia đình khá giả; là nữ giới hoặc có học lực từ khá giỏi trở lên thường chọn những ngành nghề liên quan đến sự sáng tạo, an toàn theo sự đam mê của mình.

Chính những sự lựa chọn này thường cho họ nhiều cơ hội phát triển và thể hiện tài năng của mình, do vậy các em cũng dễ gặt hái được thành công hơn, nhận được sự kính trọng của nhiều người.

Lựa chọn những nghề này, các em tâm niệm lấy mục đích chính là giúp đỡ người khác, gắn sự làm giàu cho bản thân với “phát triển xã hội”, thiện lương và không bất hợp pháp… và tôi xin gọi những nghề này ngắn gọn bằng cụm từ “những nghề hạnh phúc”.

Những “nghề hạnh phúc” nhất cho chúng ta nhiều cơ hội kiếm việc làm, không chỉ trong biên chế Nhà nước, không chỉ trong thị trường việc làm tư nhân mà mỗi người đều có khả năng làm những ông chủ thực sự trong lĩnh vực của mình.', N'NGUYỄN VĂN LỰ', CAST(N'2017-12-13' AS Date), N'20171214100405.jpg', NULL)
INSERT [dbo].[News] ([ID], [Title], [Content], [Author], [Date], [Image], [MultipleImages]) VALUES (20, N'Đề môn Hóa khó', N'Tại điểm thi Đại học Sư phạm Hà Nội, bước ra cổng trường với khuôn mặt buồn rầu, thí sinh quê Đan Phượng cho biết: “Đề khó, nhiều câu em phân vân giữa hai đáp án nên không chắc mình làm đúng được nhiều. Với bài làm này chắc em chỉ đạt được 6 điểm”. 
Đánh giá về đề thi, bạn Ngọc – thí sinh khối A chia sẻ: “Đề thi năm nay khó hơn năm ngoái và có sự phân hóa rõ rệt, 30 câu đầu tương đối dễ, 20 câu sau khó dần đều. 

Mặc dù kiến thức hoàn toàn nằm trong chương trình sách giáo khoa nhưng không hề dễ. Với đề thi này, thực sự rất khó để đạt điểm 9,10”. 

Cùng chung nhận xét, bạn Bảo Trang lo lắng: “Hóa học là môn tự chọn để em xét tốt nghiệp nhưng đề khó và dài, các câu bài tập cần phải tính toán quá nhiều”. 

Tại điểm thi Đại học Thủy Lợi thì bạn Nguyễn Hà Anh (THPT Ngọc Hồi) cho rằng: “Đề thi năm nay em thấy rất khó, phần hóa hữu cơ khó hơn so với năm ngoái. 

30 câu đầu dễ chỉ đủ cho các bạn xét tốt nghiệp, 20 câu cuối dành cho các bạn xét tuyển Đại học, cao đẳng. Dù thi khối A nhưng em vẫn không hài lòng với bài làm của mình”.', N'THÙY LINH - PHƯƠNG THẢO', CAST(N'2017-12-13' AS Date), N'20171214100414.jpg', NULL)
INSERT [dbo].[News] ([ID], [Title], [Content], [Author], [Date], [Image], [MultipleImages]) VALUES (21, N'Test 14.12.2017', N'qwertyuiop', N'Hung', CAST(N'2017-12-14' AS Date), N'20171214031334.jpg', NULL)
SET IDENTITY_INSERT [dbo].[News] OFF
INSERT [dbo].[Role] ([ID], [Role]) VALUES (1, N'Client')
INSERT [dbo].[Role] ([ID], [Role]) VALUES (2, N'Admin')
INSERT [dbo].[Role] ([ID], [Role]) VALUES (3, N'Member')
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([ID], [Name], [Quantity]) VALUES (1, N'Toán học', NULL)
INSERT [dbo].[Subject] ([ID], [Name], [Quantity]) VALUES (2, N'Vật lí', NULL)
INSERT [dbo].[Subject] ([ID], [Name], [Quantity]) VALUES (3, N'Hóa học', NULL)
INSERT [dbo].[Subject] ([ID], [Name], [Quantity]) VALUES (4, N'Sinh học', NULL)
INSERT [dbo].[Subject] ([ID], [Name], [Quantity]) VALUES (5, N'Tiếng anh', NULL)
SET IDENTITY_INSERT [dbo].[Subject] OFF
SET IDENTITY_INSERT [dbo].[Test] ON 

INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (5, N'101', N'Đề thi Toán THPT 1 ', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (7, N'Toán 102', N'Toán 2', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20173.pdf', NULL, 1)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (8, N'HNVC', N'Toán 3', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20174.pdf', NULL, 1)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (11, N'Math 4', N'Toán 4', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20171214064657.pdf', NULL, 1)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (12, N'English 1', N'TIếng Anh 1', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20171214064843.pdf', NULL, 5)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (13, N'English 2', N'TIếng Anh 2', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20171214064954.pdf', NULL, 5)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (14, N'English 3', N'TIếng Anh 3', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20171214065057.pdf', NULL, 5)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (15, N'English 4', N'TIếng Anh 4', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20171214065133.pdf', NULL, 5)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (16, N'Bio 1', N'Sinh Học 1', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20171214065210.PDF', NULL, 4)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (17, N'Bio 2', N'Sinh Học 2', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20171214065300.PDF', NULL, 4)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (18, N'Bio 3', N'Sinh Học 3', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20171214065348.PDF', NULL, 4)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (19, N'Bio 4', N'Sinh Học 4', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20171214065425.PDF', NULL, 4)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (20, N'Physic 1', N'Vật lý 1', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20171214065513.PDF', NULL, 2)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (21, N'Physic 2', N'Vật lý 2', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20171214065556.PDF', NULL, 2)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (22, N'Physic 3', N'Vật lý 3', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20171214065629.PDF', NULL, 2)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (23, N'Physic 4', N'Vật lý 4', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20171214065657.PDF', NULL, 2)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (24, N'Chem 1', N'Hóa học 1', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20171214065805.pdf', NULL, 3)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (25, N'Chem 2', N'Hóa học 2', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20171214065839.pdf', NULL, 3)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (26, N'Chem 3', N'Hóa học 3', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20171214065909.pdf', NULL, 3)
INSERT [dbo].[Test] ([ID], [Code], [Title], [Tag], [Number], [Answer], [Time], [Source], [Level], [Url], [Rate], [IDSubject]) VALUES (27, N'Chem 4', N'Hóa học 4', NULL, 50, N'D,B,B,C,B,D,A,C,D,B,B,C,A,C,D,D,C,B,C,B,D,C,C,B,D,D,A,D,A,B,C,D,C,B,C,A,B,C,B,D,B,B,C,C,D,D,C,D,A,D', 90, NULL, 1, N'20171214065948.pdf', NULL, 3)
SET IDENTITY_INSERT [dbo].[Test] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Address], [Email], [Phone], [image], [status], [Hobby], [EXP], [NumberTest], [Level]) VALUES (1, N'admin', N'123123', N'Phạm Hùng', NULL, N'phamhungdg96@gmail.com', N'0981802889', NULL, 1, N'                                ', 1, 0, 1)
INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Address], [Email], [Phone], [image], [status], [Hobby], [EXP], [NumberTest], [Level]) VALUES (2, N'qwe', N'123', N'qwe', NULL, NULL, NULL, NULL, 1, NULL, 0, 0, 0)
INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Address], [Email], [Phone], [image], [status], [Hobby], [EXP], [NumberTest], [Level]) VALUES (3, N'admin2', N'123123', N'Nguyễn Thế Hùng', N'Hà Nội', N'nthungmta@gmail.com', N'01696981907', N'20171214120416.jpg', 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Credential]  WITH CHECK ADD  CONSTRAINT [FK_Credential_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Credential] CHECK CONSTRAINT [FK_Credential_Role]
GO
ALTER TABLE [dbo].[Credential]  WITH CHECK ADD  CONSTRAINT [FK_Credential_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Credential] CHECK CONSTRAINT [FK_Credential_User]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_EventInfo] FOREIGN KEY([IDEvenInfo])
REFERENCES [dbo].[EventInfo] ([ID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_EventInfo]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_User]
GO
ALTER TABLE [dbo].[HistoryTest]  WITH CHECK ADD  CONSTRAINT [FK_HistoryTest_Test] FOREIGN KEY([IDTest])
REFERENCES [dbo].[Test] ([ID])
GO
ALTER TABLE [dbo].[HistoryTest] CHECK CONSTRAINT [FK_HistoryTest_Test]
GO
ALTER TABLE [dbo].[HistoryTest]  WITH CHECK ADD  CONSTRAINT [FK_HistoryTest_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[HistoryTest] CHECK CONSTRAINT [FK_HistoryTest_User]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_Subject] FOREIGN KEY([IDSubject])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_Subject]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Test'
GO
USE [master]
GO
ALTER DATABASE [WebEducation] SET  READ_WRITE 
GO
