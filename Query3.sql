-- Query 3: List each contestant's total votes by region and method for a specific episode (you pick the episode title). Rank this from highest to lowest.

SELECT  
	Contestant.Name, Episode.Title,Voting.Region, Voting.Method, sum(Voting.Votes) As TotalVotes
FROM 
	Voting
Inner Join Episode ON
	Voting.EpisodeID = Episode.EpisodeID
Inner Join Contestant ON
	Voting.ContestantID = Contestant.ContestantID
WHERE 
	Episode.Title = 'Tiger Shark Day'
Group by 
	Contestant.ContestantID, Voting.Region, Voting.Method
Order by 
	TotalVotes DESC
