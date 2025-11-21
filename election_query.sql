
-- Q1. What is the total number of parliamentary seats available for elections in India?
SELECT DISTINCT COUNT(Parliament_Constituency) AS Total_statesSeats
FROM constituencywise_results;


-- Q2.What is the total number of seats available for elections in each state?
SELECT 
	s.State AS State_Name, 
    COUNT(cr.Constituency_ID) AS Total_Seats_Available
FROM constituencywise_results cr
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
GROUP BY s.State
ORDER BY s.State;


-- Q3. How many total seats were won by the NDA alliance across India?
SELECT 
    SUM(CASE 
        WHEN party IN (
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
            'Rashtriya Lok Dal - RLD',
            'Sikkim Krantikari Morcha - SKM'
        ) THEN Won
        ELSE 0 
    END) AS NDA_Total_Seats_Won
FROM partywise_results;


-- Q4. List the number of seats won by each party within the NDA alliance.
SELECT 
    party AS Party_Name,
    won AS Seats_Won
FROM partywise_results
WHERE party IN (
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
            'Rashtriya Lok Dal - RLD',
			'Sikkim Krantikari Morcha - SKM')
ORDER BY Seats_Won DESC;


-- Q5. How many total seats were won by the I.N.D.I.A. alliance across India?
SELECT 
    SUM(CASE 
        WHEN party IN (
            'Indian National Congress - INC',
            'Aam Aadmi Party - AAAP',
            'All India Trinamool Congress - AITC',
            'Bharat Adivasi Party - BHRTADVSIP',
            'Communist Party of India  (Marxist) - CPI(M)',
            'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)', 'Communist Party of India - CPI',
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
        ) THEN Won
        ELSE 0 
    END) AS INDIA_Total_Seats_Won
FROM partywise_results;


-- Q6.List the number of seats won by each party within the I.N.D.I.A. alliance.
SELECT 
    party AS Party_Name,
    won AS Seats_Won
FROM partywise_results
WHERE party IN (
				'Indian National Congress - INC',
				'Aam Aadmi Party - AAAP',
				'All India Trinamool Congress - AITC',
				'Bharat Adivasi Party - BHRTADVSIP',
				'Communist Party of India  (Marxist) - CPI(M)',
				'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)', 'Communist Party of India - CPI',
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
ORDER BY Seats_Won DESC;


-- Q7.Add a new column party_alliance in the partywise_results table to classify each party as NDA, I.N.D.I.A., or OTHER.
ALTER TABLE partywise_results
ADD party_alliance VARCHAR(50);

UPDATE partywise_results
SET party_alliance = 'I.N.D.I.A'
WHERE party IN (
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
				);

UPDATE partywise_results
SET party_alliance = 'NDA'
WHERE Party IN (
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
            'Rashtriya Lok Dal - RLD',
			'Sikkim Krantikari Morcha - SKM'
				);

UPDATE partywise_results
SET party_alliance = 'OTHER'
WHERE party_alliance IS NULL;


-- Q8.Which alliance (NDA, I.N.D.I.A., or OTHER) won the highest number of seats across India?
SELECT 
    p.party_alliance,
    COUNT(cr.Constituency_ID) AS Seats_Won
FROM constituencywise_results cr
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
GROUP BY p.party_alliance
ORDER BY Seats_Won DESC;


-- Q9. Display the winning candidate’s name, party, alliance, total votes, and margin of victory for a particular state and constituency.
SELECT cr.Winning_Candidate, p.Party, p.party_alliance, cr.Total_Votes, cr.Margin, 
       cr.Constituency_Name, s.State
FROM constituencywise_results cr
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID;


-- Q10.Which parties won the most seats in a particular state (example: Andhra Pradesh), 
-- and how many seats did each party win?
SELECT p.Party, COUNT(cr.Constituency_ID) AS Seats_Won
FROM constituencywise_results cr
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE s.State = 'Andhra Pradesh'
GROUP BY p.Party
ORDER BY Seats_Won DESC;


-- Q11.Find the total number of seats won by NDA, I.N.D.I.A., 
-- and OTHER alliances in each state.
SELECT 
    s.State AS State_Name,
    SUM(CASE WHEN p.party_alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seats_Won,
    SUM(CASE WHEN p.party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
    SUM(CASE WHEN p.party_alliance = 'OTHER' THEN 1 ELSE 0 END) AS OTHER_Seats_Won
FROM constituencywise_results cr
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
GROUP BY s.State
ORDER BY s.State;


-- Q12.Which candidates received the highest number of EVM votes (Top 10)?
SELECT  cr.Constituency_Name, cd.Constituency_ID, cd.Candidate, cd.EVM_Votes
FROM constituencywise_details cd
JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE cd.EVM_Votes = (
    SELECT MAX(cd1.EVM_Votes)
    FROM constituencywise_details cd1
    WHERE cd1.Constituency_ID = cd.Constituency_ID
)
ORDER BY cd.EVM_Votes DESC;


-- Q13.Which candidate won and who was the runner-up in each constituency of Maharashtra?
WITH RankedCandidates AS (
    SELECT cd.Constituency_ID, cd.Candidate, cd.Party, cd.EVM_Votes, cd.Postal_Votes,
           cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
           ROW_NUMBER() OVER (PARTITION BY cd.Constituency_ID 
                              ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS VoteRank
    FROM constituencywise_details cd
    JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
    JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN states s ON sr.State_ID = s.State_ID
    WHERE s.State = 'Maharashtra'
)
SELECT cr.Constituency_Name,
       MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate,
       MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate
FROM RankedCandidates rc
JOIN constituencywise_results cr ON rc.Constituency_ID = cr.Constituency_ID
GROUP BY cr.Constituency_Name
ORDER BY cr.Constituency_Name;


-- Q14. For Maharashtra, find the total seats, total candidates, total parties, total votes (EVM + Postal), and vote breakdown.
SELECT 
    COUNT(DISTINCT cr.Constituency_ID) AS Total_Seats,
    COUNT(DISTINCT cd.Candidate) AS Total_Candidates,
    COUNT(DISTINCT p.Party) AS Total_Parties,
    SUM(cd.EVM_Votes + cd.Postal_Votes) AS Total_Votes,
    SUM(cd.EVM_Votes) AS Total_EVM_Votes,
    SUM(cd.Postal_Votes) AS Total_Postal_Votes
FROM constituencywise_results cr
JOIN constituencywise_details cd ON cr.Constituency_ID = cd.Constituency_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
WHERE s.State = 'Maharashtra';
