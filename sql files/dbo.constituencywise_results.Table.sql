USE [Bharat Loksabha Election 24]
GO
/****** Object:  Table [dbo].[constituencywise_results]    Script Date: 04-Nov-24 11:09:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[constituencywise_results](
	[S_No] [int] NOT NULL,
	[Parliament_Constituency] [varchar](100) NOT NULL,
	[Constituency_Name] [varchar](100) NOT NULL,
	[Winning_Candidate] [varchar](150) NOT NULL,
	[Total_Votes] [int] NOT NULL,
	[Margin] [int] NOT NULL,
	[Constituency_ID] [varchar](100) NOT NULL,
	[Party_ID] [int] NOT NULL,
 CONSTRAINT [PK_constituencywise_results] PRIMARY KEY CLUSTERED 
(
	[Parliament_Constituency] ASC,
	[Constituency_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
