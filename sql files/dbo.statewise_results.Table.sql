USE [Bharat Loksabha Election 24]
GO
/****** Object:  Table [dbo].[statewise_results]    Script Date: 04-Nov-24 11:09:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statewise_results](
	[Constituency] [varchar](100) NOT NULL,
	[Const_No] [int] NOT NULL,
	[Parliament_Constituency] [varchar](100) NOT NULL,
	[Leading_Candidate] [varchar](150) NOT NULL,
	[Trailing_Candidate] [varchar](100) NULL,
	[Margin] [int] NOT NULL,
	[Status] [varchar](100) NOT NULL,
	[State_ID] [varchar](100) NOT NULL,
	[State] [varchar](100) NOT NULL,
 CONSTRAINT [PK_statewise_results] PRIMARY KEY CLUSTERED 
(
	[Parliament_Constituency] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
