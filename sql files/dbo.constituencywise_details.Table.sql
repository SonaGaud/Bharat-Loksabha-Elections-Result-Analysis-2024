USE [Bharat Loksabha Election 24]
GO
/****** Object:  Table [dbo].[constituencywise_details]    Script Date: 04-Nov-24 11:09:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[constituencywise_details](
	[S_N] [int] NOT NULL,
	[Candidate] [varchar](100) NOT NULL,
	[Party] [varchar](100) NOT NULL,
	[EVM_Votes] [int] NOT NULL,
	[Postal_Votes] [int] NOT NULL,
	[Total_Votes] [int] NOT NULL,
	[of_Votes] [float] NOT NULL,
	[Constituency_ID] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
