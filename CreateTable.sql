USE [SAMPLE_DB]
GO

/****** Script:  Table [dbo].[tMenuMaster]   ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tMenuMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tMenuMaster]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tMenuMaster](
	[ID_Field] [int] NOT NULL,
	[TPA_Code] [char](5) NOT NULL,
	[Menu_Code] [char](2) NOT NULL,
	[Menu_Description] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tMenuMaster] PRIMARY KEY CLUSTERED 
(
	[ID_Field] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [s_SAMPLE_DB]
) ON [s_SAMPLE_DB]

GO

SET ANSI_PADDING OFF
GO


USE [SAMPLE_DB]
GO

/****** Script:  Table [dbo].[tDealerMenu]   ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tDealerMenu]') AND type in (N'U'))
DROP TABLE [dbo].[tDealerMenu]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tDealerMenu](
	[Dealer_ID] [int] NOT NULL,
	[Menu_Code] [char](2) NOT NULL,
	[Activation_Date] [date] NULL,
	[eRating] [bit] NULL,
	[eContracting] [bit] NULL,
 CONSTRAINT [PK_tDealerMenu] PRIMARY KEY CLUSTERED 
(
	[Dealer_ID] ASC,
	[Menu_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [s_SAMPLE_DB]
) ON [s_SAMPLE_DB]

GO

SET ANSI_PADDING OFF
GO

