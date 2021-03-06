USE [blog2]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 09/20/2012 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nickname] [varchar](250) NOT NULL,
	[pass] [varchar](250) NOT NULL,
	[email] [varchar](250) NOT NULL,
	[fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[contenido]    Script Date: 09/20/2012 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contenido](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUs] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[titulo] [varchar](250) NOT NULL,
	[content] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[comentario]    Script Date: 09/20/2012 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comentario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUs] [int] NOT NULL,
	[idCont] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[content] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK__comentari__idCon__0AD2A005]    Script Date: 09/20/2012 15:56:34 ******/
ALTER TABLE [dbo].[comentario]  WITH CHECK ADD FOREIGN KEY([idCont])
REFERENCES [dbo].[contenido] ([id])
GO
/****** Object:  ForeignKey [FK__comentario__idUs__09DE7BCC]    Script Date: 09/20/2012 15:56:34 ******/
ALTER TABLE [dbo].[comentario]  WITH CHECK ADD FOREIGN KEY([idUs])
REFERENCES [dbo].[usuario] ([id])
GO
/****** Object:  ForeignKey [FK__contenido__idUs__0519C6AF]    Script Date: 09/20/2012 15:56:34 ******/
ALTER TABLE [dbo].[contenido]  WITH CHECK ADD FOREIGN KEY([idUs])
REFERENCES [dbo].[usuario] ([id])
GO
