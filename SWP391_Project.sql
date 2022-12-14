USE [master]
GO

CREATE DATABASE [SWP391_Project_Test]
GO
ALTER DATABASE [SWP391_Project_Test] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391_Project_Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391_Project_Test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWP391_Project_Test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391_Project_Test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391_Project_Test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP391_Project_Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391_Project_Test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP391_Project_Test] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391_Project_Test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391_Project_Test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391_Project_Test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391_Project_Test] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SWP391_Project_Test] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SWP391_Project_Test]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](150) NULL,
	[status] [bit] NULL,
	[email] [nvarchar](100) NULL,
	[phone] [nvarchar](100) NULL,
	[fullname] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[gender] [bit] NULL,
	[avatar] [nvarchar](max) NULL,
	[roleId] [int] NULL,
	[created_date] [datetime] NULL CONSTRAINT [DF_Account_created_date]  DEFAULT (getdate()),
	[modify_date] [datetime] NULL CONSTRAINT [DF_Account_modify_date]  DEFAULT (getdate()),
	[password_token] [nvarchar](45) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Answer](
	[answerId] [int] IDENTITY(1,1) NOT NULL,
	[content] [varchar](255) NULL,
	[correct] [bit] NULL,
	[quesId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[answerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answerDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[questionId] [int] NULL,
	[answerId] [int] NULL,
	[userId] [int] NULL,
	[quizId] [int] NULL,
	[attempt] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[blogId] [int] IDENTITY(1,1) NOT NULL,
	[blogName] [nvarchar](255) NULL,
	[subId] [int] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[blogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](255) NULL,
	[value] [nvarchar](255) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Exam](
	[CE_id] [int] IDENTITY(1,1) NOT NULL,
	[examId] [int] NULL,
	[userId] [int] NULL,
	[date_taken] [date] NULL,
	[time_exam] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[CE_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Exam_Detail](
	[CE_id] [int] IDENTITY(1,1) NOT NULL,
	[questionId] [int] NULL,
	[answerId] [int] NULL,
	[truth] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CE_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dimension](
	[dimId] [int] IDENTITY(1,1) NOT NULL,
	[typeId] [varchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Dimension] PRIMARY KEY CLUSTERED 
(
	[dimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Exam](
	[examId] [int] IDENTITY(1,1) NOT NULL,
	[isFree] [bit] NULL,
	[created_date] [date] NULL,
	[updated_date] [date] NULL,
	[title] [varchar](255) NULL,
	[subId] [int] NULL,
	[categoryId] [int] NULL,
	[level] [varchar](255) NULL,
	[passRate] [float] NULL,
	[userId] [int] NULL,
	[number] [int] NULL,
	[content] [varchar](255) NULL,
	[exam_typeId] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[examId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam_Detail](
	[examId] [int] IDENTITY(1,1) NOT NULL,
	[quesId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[examId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Exam_Type](
	[exam_typeId] [varchar](255) NOT NULL,
	[exam_typeName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[exam_typeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lesson](
	[lessonId] [int] IDENTITY(1,1) NOT NULL,
	[lessonName] [varchar](255) NULL,
	[typeId] [varchar](255) NULL,
	[order] [int] NULL,
	[video_url] [varchar](255) NULL,
	[content] [varchar](255) NULL,
	[topicId] [int] NULL,
	[status] [bit] NULL,
	[subId] [int] NULL,
	[description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[lessonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post](
	[postId] [int] IDENTITY(1,1) NOT NULL,
	[thumbnail] [varchar](255) NULL,
	[userId] [int] NULL,
	[categoryBlogId] [int] NULL,
	[content] [varchar](max) NULL,
	[created_date] [date] NULL CONSTRAINT [DF_Post_created_date]  DEFAULT (getdate()),
	[edit_date] [date] NULL,
	[status] [bit] NULL,
	[brifInfor] [varchar](255) NULL,
	[title] [varchar](255) NULL,
	[postFileId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[postId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post_File](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[typeId] [varchar](255) NULL,
	[filePost] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PricePackage](
	[priceId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[acessDuration] [int] NULL,
	[price] [float] NULL,
	[salePrice] [float] NULL,
	[status] [bit] NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_PricePackage] PRIMARY KEY CLUSTERED 
(
	[priceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[questionId] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](255) NULL,
	[subjectId] [int] NULL,
	[lessonId] [int] NULL,
	[topicId] [int] NULL,
	[level] [nvarchar](255) NULL,
	[status] [bit] NULL,
	[quizId] [int] NULL,
	[dimmensionId] [int] NULL,
	[isMultipleChoice] [bit] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[questionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Quiz](
	[quesId] [int] NOT NULL,
	[quizId] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionDimension](
	[dimId] [int] NULL,
	[questionId] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Quiz](
	[quizId] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NULL,
	[level] [varchar](255) NULL,
	[img_url] [varchar](255) NULL,
	[start_time] [time](7) NULL,
	[end_time] [time](7) NULL,
	[status] [bit] NULL,
	[rate] [float] NULL,
	[hasJoin] [bit] NULL,
	[subId] [int] NULL,
	[userId] [int] NULL,
	[quesId] [int] NULL,
	[lessonId] [int] NULL,
	[duration] [int] NULL,
	[typeId] [varchar](255) NULL,
	[description] [varchar](max) NULL,
	[totalQues] [int] NULL,
	[attempt] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[quizId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUIZ_POINT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[point] [float] NULL,
	[quizId] [int] NULL,
	[taken_date] [date] NULL,
	[pointPercent] [float] NULL,
	[numQuesTrue] [float] NULL,
	[attempt] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Registration_Subject](
	[regisId] [int] IDENTITY(1,1) NOT NULL,
	[regis_Date] [date] NULL CONSTRAINT [DF_Registration_Subject_regis_Date]  DEFAULT (getdate()),
	[statis] [varchar](255) NULL,
	[subId] [int] NULL,
	[priceId] [int] NULL,
	[userId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[regisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Setting](
	[settingId] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[value] [varchar](255) NULL,
	[typeId] [varchar](255) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[settingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Slider](
	[sliderId] [int] IDENTITY(1,1) NOT NULL,
	[slider_url] [varchar](255) NULL,
	[status] [bit] NULL,
	[title] [varchar](255) NULL,
	[content] [varchar](255) NULL,
	[backlink] [varchar](255) NULL,
	[notes] [varchar](255) NULL,
	[isShow] [bit] NULL,
	[subId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[sliderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subjectId] [int] IDENTITY(1,1) NOT NULL,
	[subjectName] [nvarchar](255) NULL,
	[categoryId] [int] NULL,
	[status] [bit] NULL,
	[tagLine] [int] NULL,
	[title] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectDimension](
	[subjectId] [int] NOT NULL,
	[dimId] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectPrice](
	[priceId] [int] NULL,
	[subjectId] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Topic](
	[topicId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[status] [bit] NULL,
	[subId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[topicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Type](
	[typeId] [varchar](255) NOT NULL,
	[typeName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[typeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Exam] ADD  CONSTRAINT [DF_Exam_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Exam] ADD  CONSTRAINT [DF_Exam_updated_date]  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([quesId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[answerDetail]  WITH CHECK ADD FOREIGN KEY([answerId])
REFERENCES [dbo].[Answer] ([answerId])
GO
ALTER TABLE [dbo].[answerDetail]  WITH CHECK ADD FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[answerDetail]  WITH CHECK ADD FOREIGN KEY([quizId])
REFERENCES [dbo].[Quiz] ([quizId])
GO
ALTER TABLE [dbo].[answerDetail]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([userId])
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Subject] FOREIGN KEY([subId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Subject]
GO
ALTER TABLE [dbo].[Customer_Exam]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Exam_Exam] FOREIGN KEY([examId])
REFERENCES [dbo].[Exam] ([examId])
GO
ALTER TABLE [dbo].[Customer_Exam] CHECK CONSTRAINT [FK_Customer_Exam_Exam]
GO
ALTER TABLE [dbo].[Customer_Exam_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Exam_Customer_Exam] FOREIGN KEY([CE_id])
REFERENCES [dbo].[Customer_Exam] ([CE_id])
GO
ALTER TABLE [dbo].[Customer_Exam_Detail] CHECK CONSTRAINT [FK_Customer_Exam_Customer_Exam]
GO
ALTER TABLE [dbo].[Customer_Exam_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Exam_Detail_Question] FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[Customer_Exam_Detail] CHECK CONSTRAINT [FK_Customer_Exam_Detail_Question]
GO
ALTER TABLE [dbo].[Dimension]  WITH CHECK ADD  CONSTRAINT [FK_Dimension_Type] FOREIGN KEY([typeId])
REFERENCES [dbo].[Type] ([typeId])
GO
ALTER TABLE [dbo].[Dimension] CHECK CONSTRAINT [FK_Dimension_Type]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Account] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([userId])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Account]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([categoryId])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Category]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Exam_Type] FOREIGN KEY([exam_typeId])
REFERENCES [dbo].[Exam_Type] ([exam_typeId])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Exam_Type]
GO
ALTER TABLE [dbo].[Exam_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Detail_Exam] FOREIGN KEY([examId])
REFERENCES [dbo].[Exam] ([examId])
GO
ALTER TABLE [dbo].[Exam_Detail] CHECK CONSTRAINT [FK_Exam_Detail_Exam]
GO
ALTER TABLE [dbo].[Exam_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Detail_Question] FOREIGN KEY([quesId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[Exam_Detail] CHECK CONSTRAINT [FK_Exam_Detail_Question]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Subject] FOREIGN KEY([subId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Subject]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Account] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([userId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Account]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Blog] FOREIGN KEY([categoryBlogId])
REFERENCES [dbo].[Blog] ([blogId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Blog]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Post_File] FOREIGN KEY([postFileId])
REFERENCES [dbo].[Post_File] ([id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Post_File]
GO
ALTER TABLE [dbo].[Post_File]  WITH CHECK ADD  CONSTRAINT [FK_Post_File_Type] FOREIGN KEY([typeId])
REFERENCES [dbo].[Type] ([typeId])
GO
ALTER TABLE [dbo].[Post_File] CHECK CONSTRAINT [FK_Post_File_Type]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Lesson] FOREIGN KEY([lessonId])
REFERENCES [dbo].[Lesson] ([lessonId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Lesson]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Subject]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Topic] FOREIGN KEY([topicId])
REFERENCES [dbo].[Topic] ([topicId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Topic]
GO
ALTER TABLE [dbo].[Question_Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Question_Quiz_Question] FOREIGN KEY([quesId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[Question_Quiz] CHECK CONSTRAINT [FK_Question_Quiz_Question]
GO
ALTER TABLE [dbo].[Question_Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Question_Quiz_Quiz] FOREIGN KEY([quizId])
REFERENCES [dbo].[Quiz] ([quizId])
GO
ALTER TABLE [dbo].[Question_Quiz] CHECK CONSTRAINT [FK_Question_Quiz_Quiz]
GO
ALTER TABLE [dbo].[QuestionDimension]  WITH CHECK ADD  CONSTRAINT [FK_QuestionDimension_Dimension] FOREIGN KEY([dimId])
REFERENCES [dbo].[Dimension] ([dimId])
GO
ALTER TABLE [dbo].[QuestionDimension] CHECK CONSTRAINT [FK_QuestionDimension_Dimension]
GO
ALTER TABLE [dbo].[QuestionDimension]  WITH CHECK ADD  CONSTRAINT [FK_QuestionDimension_Question] FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[QuestionDimension] CHECK CONSTRAINT [FK_QuestionDimension_Question]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Account] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([userId])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_Account]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Lesson] FOREIGN KEY([lessonId])
REFERENCES [dbo].[Lesson] ([lessonId])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_Lesson]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Subject] FOREIGN KEY([subId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_Subject]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Type] FOREIGN KEY([typeId])
REFERENCES [dbo].[Type] ([typeId])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_Type]
GO
ALTER TABLE [dbo].[QUIZ_POINT]  WITH CHECK ADD FOREIGN KEY([quizId])
REFERENCES [dbo].[Quiz] ([quizId])
GO
ALTER TABLE [dbo].[QUIZ_POINT]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([userId])
GO
ALTER TABLE [dbo].[Registration_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Subject_Account] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([userId])
GO
ALTER TABLE [dbo].[Registration_Subject] CHECK CONSTRAINT [FK_Registration_Subject_Account]
GO
ALTER TABLE [dbo].[Registration_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Subject_PricePackage] FOREIGN KEY([priceId])
REFERENCES [dbo].[PricePackage] ([priceId])
GO
ALTER TABLE [dbo].[Registration_Subject] CHECK CONSTRAINT [FK_Registration_Subject_PricePackage]
GO
ALTER TABLE [dbo].[Registration_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Subject_Subject] FOREIGN KEY([subId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Registration_Subject] CHECK CONSTRAINT [FK_Registration_Subject_Subject]
GO
ALTER TABLE [dbo].[Setting]  WITH CHECK ADD  CONSTRAINT [FK_Setting_Type] FOREIGN KEY([typeId])
REFERENCES [dbo].[Type] ([typeId])
GO
ALTER TABLE [dbo].[Setting] CHECK CONSTRAINT [FK_Setting_Type]
GO
ALTER TABLE [dbo].[Slider]  WITH CHECK ADD  CONSTRAINT [FK_Slider_Subject] FOREIGN KEY([subId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Slider] CHECK CONSTRAINT [FK_Slider_Subject]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([categoryId])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_Category]
GO
ALTER TABLE [dbo].[SubjectDimension]  WITH CHECK ADD  CONSTRAINT [FK_SubjectDimension_Dimension] FOREIGN KEY([dimId])
REFERENCES [dbo].[Dimension] ([dimId])
GO
ALTER TABLE [dbo].[SubjectDimension] CHECK CONSTRAINT [FK_SubjectDimension_Dimension]
GO
ALTER TABLE [dbo].[SubjectDimension]  WITH CHECK ADD  CONSTRAINT [FK_SubjectDimension_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[SubjectDimension] CHECK CONSTRAINT [FK_SubjectDimension_Subject]
GO
ALTER TABLE [dbo].[SubjectPrice]  WITH CHECK ADD  CONSTRAINT [FK_SubjectPrice_PricePackage] FOREIGN KEY([priceId])
REFERENCES [dbo].[PricePackage] ([priceId])
GO
ALTER TABLE [dbo].[SubjectPrice] CHECK CONSTRAINT [FK_SubjectPrice_PricePackage]
GO
ALTER TABLE [dbo].[SubjectPrice]  WITH CHECK ADD  CONSTRAINT [FK_SubjectPrice_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[SubjectPrice] CHECK CONSTRAINT [FK_SubjectPrice_Subject]
GO
USE [master]
GO
ALTER DATABASE [SWP391_Project_Test] SET  READ_WRITE 
GO
