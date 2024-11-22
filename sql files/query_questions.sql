use [Bharat Loksabha Election 24]

-- Q.1 total seats in bharat 

select  distinct count(Const_no) as total_seats from statewise_results

select distinct count(parliament_constituency) as total_seats from constituencywise_results 

-- Q.2 What is the total number of seats available for elections in each state 

select s.state as state_name, count (cr.parliament_constituency) as total_seats 
from constituencywise_results cr inner join 
statewise_results sr on 
cr.parliament_constituency = sr.Parliament_Constituency inner join 
states s on sr.state_id = s.state_id group by s.state

-- Q.3 Total Seats Won by NDA Alliance

select sum(case when party  in 
			(   'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
            )   then [won]
			    else 0 end) 
as Seats_Won_By_NDA_Allience from partywise_results

-- Q. 4 Seats won by each party in NDA Allience

select party as Party_Name, Won as seats_won_by_NDA from partywise_results
where party in 
		  ( 'Bharatiya Janata Party - BJP', 
            'Telugu Desam - TDP', 
			'Janata Dal  (United) - JD(U)',
            'Shiv Sena - SHS', 
            'AJSU Party - AJSUP', 
            'Apna Dal (Soneylal) - ADAL', 
            'Asom Gana Parishad - AGP',
            'Hindustani Awam Morcha (Secular) - HAMS', 
            'Janasena Party - JnP', 
			'Janata Dal  (Secular) - JD(S)',
            'Lok Janshakti Party(Ram Vilas) - LJPRV', 
            'Nationalist Congress Party - NCP',
            'Rashtriya Lok Dal - RLD', 
            'Sikkim Krantikari Morcha - SKM'
          ) 
order by seats_won_by_NDA Desc

-- Q. 5 Total Seats Won by INDI Alliance

select sum(case when party in
		 (
			'Indian National Congress - INC',
			'Aam Aadmi Party - AAAP',
			'All India Trinamool Congress - AITC',
			'Bharat Adivasi Party - BHRTADVSIP',
			'Communist Party of India  (Marxist) - CPI(M)',
			'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
			'Communist Party of India - CPI',
			'Dravida Munnetra Kazhagam - DMK',	
			'Indian Union Muslim League - IUML',
			'Jammu & Kashmir National Conference - JKN',
			'Jharkhand Mukti Morcha - JMM',
			'Kerala Congress - KEC',
			'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
			'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
			'Rashtriya Janata Dal - RJD',
			'Rashtriya Loktantrik Party - RLTP',
			'Revolutionary Socialist Party - RSP',
			'Samajwadi Party - SP',
			'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
			'Viduthalai Chiruthaigal Katchi - VCK'
		 ) then [won]
		   else 0 end)
as Seats_Won_By_INDI_Allience from partywise_results

-- Q. 6 Seats won by each party in INDI Allience

select party as Party_Name, Won as seats_won_by_INDI from partywise_results
where party in
		 (
			'Indian National Congress - INC',
			'Aam Aadmi Party - AAAP',
			'All India Trinamool Congress - AITC',
			'Bharat Adivasi Party - BHRTADVSIP',
			'Communist Party of India  (Marxist) - CPI(M)',
			'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
			'Communist Party of India - CPI',
			'Dravida Munnetra Kazhagam - DMK',	
			'Indian Union Muslim League - IUML',
			'Jammu & Kashmir National Conference - JKN',
			'Jharkhand Mukti Morcha - JMM',
			'Kerala Congress - KEC',
			'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
			'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
			'Rashtriya Janata Dal - RJD',
			'Rashtriya Loktantrik Party - RLTP',
			'Revolutionary Socialist Party - RSP',
			'Samajwadi Party - SP',
			'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
			'Viduthalai Chiruthaigal Katchi - VCK'
		 )
order by seats_won_by_INDI Desc

-- Q. 7 Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

alter table partywise_results
add party_alliance varchar(50)

update partywise_results
set party_alliance = 'NDA'
where party in 
	(
		'Bharatiya Janata Party - BJP', 
        'Telugu Desam - TDP', 
		'Janata Dal  (United) - JD(U)',
        'Shiv Sena - SHS', 
        'AJSU Party - AJSUP', 
        'Apna Dal (Soneylal) - ADAL', 
        'Asom Gana Parishad - AGP',
        'Hindustani Awam Morcha (Secular) - HAMS', 
        'Janasena Party - JnP', 
		'Janata Dal  (Secular) - JD(S)',
        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
        'Nationalist Congress Party - NCP',
        'Rashtriya Lok Dal - RLD'
	)

update partywise_results
set party_alliance = 'INDI'
where party in
	(
		'Indian National Congress - INC',
		'Aam Aadmi Party - AAAP',
		'All India Trinamool Congress - AITC',
		'Bharat Adivasi Party - BHRTADVSIP',
		'Communist Party of India  (Marxist) - CPI(M)',
		'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
		'Communist Party of India - CPI',
		'Dravida Munnetra Kazhagam - DMK',	
		'Indian Union Muslim League - IUML',
		'Jammu & Kashmir National Conference - JKN',
		'Jharkhand Mukti Morcha - JMM',
		'Kerala Congress - KEC',
		'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
		'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
		'Rashtriya Janata Dal - RJD',
		'Rashtriya Loktantrik Party - RLTP',
		'Revolutionary Socialist Party - RSP',
		'Samajwadi Party - SP',
		'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
		'Viduthalai Chiruthaigal Katchi - VCK'
	)

update partywise_results
set party_alliance = 'OTHER'
where party_alliance is NULL

-- one line query for total seats won by each alliance and others
select party_alliance,
sum(won) as seats from partywise_results
group by party_alliance order by seats desc

-- one line query for NDA alliance
select party, won from partywise_results
where party_alliance = 'NDA'
order by won desc

-- one line query for INDI alliance
select party, won from partywise_results
where party_alliance = 'INDI'
order by won desc

-- Q. 8 Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?
SELECT 
    p.party_alliance,
    COUNT(cr.Constituency_ID) AS Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
WHERE 
    p.party_alliance IN ('NDA', 'INDI', 'OTHER')
GROUP BY 
    p.party_alliance
ORDER BY 
    Seats_Won DESC;

-- Q. 9 Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?

select cr.winning_candidate, pr.party, pr.party_alliance, cr.total_votes, cr.margin, cr.Constituency_Name, s.state  from constituencywise_results cr
join partywise_results pr on pr.Party_ID = cr.Party_ID 
join statewise_results sr on sr.Parliament_Constituency = cr.Parliament_Constituency 
join states s on s.State_ID = sr.State_ID 
where s.state = 'Uttar Pradesh' and cr.Constituency_Name = 'GORAKHPUR' 

-- Q. 10 What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?

select cd.Candidate, cd.Party, cd.EVM_Votes, cd.Postal_Votes, cd.Total_Votes, cr.Constituency_Name from constituencywise_details cd
join constituencywise_results cr on cd.Constituency_ID = cr.Constituency_ID
where cr.Constituency_Name = 'VARANASI' order by cd.Total_Votes desc

-- Q. 11 Which parties won the most seats in specific State, and how many seats did each party win?

select pr.party, count(cr.Constituency_ID) as seats_won from constituencywise_results cr 
join partywise_results pr on pr.Party_ID = cr.Party_ID
join statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
where sr.state = 'Gujarat' group by pr.party order by seats_won desc


-- Q. 12 What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024

select s.state, 
sum(case when pr.party_alliance = 'NDA' then 1 else 0 end) as Seats_won_by_NDA,
sum(case when pr.party_alliance = 'INDI' then 1 else 0 end) as Seats_won_by_INDI,
sum(case when pr.party_alliance = 'OTHER' then 1 else 0 end) as Seats_won_by_OTHER 
from partywise_results pr join constituencywise_results cr on pr.Party_ID = cr.Party_ID
join statewise_results sr on sr.Parliament_Constituency = cr.Parliament_Constituency
join states s ON sr.State_ID = s.State_ID
where pr.party_alliance in ('NDA', 'INDI', 'OTHER')
group by s.state order by s.State

-- Q. 13 Which candidates received the highest number of EVM votes in the top 10 constituencies, 
          -- and what are their respective party alliances?

SELECT TOP 10 cr.Constituency_Name, cd.Candidate, pr.party, pr.party_alliance, cd.EVM_Votes
FROM constituencywise_details cd
JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
JOIN partywise_results pr ON cr.Party_ID = pr.Party_ID
ORDER BY cd.EVM_Votes DESC

-- Q. 14 Which candidates received the highest number of postal votes in the top 10 constituencies, 
          -- and what are their respective party alliances?
-- 1. query
SELECT TOP 10 cr.Constituency_Name, cd.Constituency_ID, cd.Candidate, pr.party, pr.party_alliance, cd.Postal_Votes
FROM constituencywise_details cd
JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
JOIN partywise_results pr ON cr.Party_ID = pr.Party_ID
ORDER BY cd.Postal_Votes DESC;

-- 2. query
SELECT TOP 10
    cr.Constituency_Name,
    cd.Constituency_ID,
    cd.Candidate,
	pr.party, 
	pr.party_alliance,
    cd.Postal_Votes
FROM 
    constituencywise_details cd
JOIN 
    constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
JOIN 
	partywise_results pr on cr.Party_ID = pr.Party_ID
WHERE 
    cd.Postal_Votes = (
        SELECT MAX(cd1.Postal_Votes)
        FROM constituencywise_details cd1
        WHERE cd1.Constituency_ID = cd.Constituency_ID
    )
ORDER BY 
    cd.Postal_Votes DESC;

-- Q. 15 Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?
WITH RankedCandidates AS (
    SELECT 
        cd.Constituency_ID,
        cd.Candidate,
        cd.Party,
        cd.EVM_Votes,
        cd.Postal_Votes,
        cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
        ROW_NUMBER() OVER (PARTITION BY cd.Constituency_ID ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS VoteRank
    FROM 
        constituencywise_details cd
    JOIN 
        constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
    JOIN 
        statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN 
        states s ON sr.State_ID = s.State_ID
    WHERE 
        s.State = 'Maharashtra'
)
SELECT 
    cr.Constituency_Name,
    MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate,
    MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate
FROM 
    RankedCandidates rc
JOIN 
    constituencywise_results cr ON rc.Constituency_ID = cr.Constituency_ID
GROUP BY 
    cr.Constituency_Name
ORDER BY 
    cr.Constituency_Name;

-- Q. 16 For the state of Maharashtra, what are the total number of seats, total number of candidates, total 
    -- number of parties, total votes (including EVM and postal), and the breakdown of EVM and postal votes?
SELECT 
    COUNT(DISTINCT cr.Constituency_ID) AS Total_Seats,
    COUNT(DISTINCT cd.Candidate) AS Total_Candidates,
    COUNT(DISTINCT p.Party) AS Total_Parties,
    SUM(cd.EVM_Votes + cd.Postal_Votes) AS Total_Votes,
    SUM(cd.EVM_Votes) AS Total_EVM_Votes,
    SUM(cd.Postal_Votes) AS Total_Postal_Votes
FROM 
    constituencywise_results cr
JOIN 
    constituencywise_details cd ON cr.Constituency_ID = cd.Constituency_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN 
    states s ON sr.State_ID = s.State_ID
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
WHERE 
    s.State = 'Maharashtra';