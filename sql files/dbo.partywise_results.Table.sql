USE [Bharat Loksabha Election 24]
GO
/****** Object:  Table [dbo].[partywise_results]    Script Date: 04-Nov-24 11:09:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partywise_results](
	[Party] [varchar](150) NOT NULL,
	[Won] [int] NOT NULL,
	[Party_ID] [int] NOT NULL,
	[party_alliance] [varchar](50) NULL,
 CONSTRAINT [PK_partywise_results] PRIMARY KEY CLUSTERED 
(
	[Party_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
