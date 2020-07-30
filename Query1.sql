-- Query 1: Calculate the average producer and director ratings for a specific event's team members (you pick the event title).

SELECT 
	Event.Title, AVG(Contestant.ProducerRating), AVG(Contestant.DirectorRating)
FROM 
	Event
INNER JOIN EventContestant ON 
	Event.EventID = EventContestant.EventID
INNER JOIN Contestant ON 
	EventContestant.ContestantID = Contestant.ContestantID
WHERE 
	EventContestant.Team = '1' AND Event.Title = 'Hug a Tiger Shark'
