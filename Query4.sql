-- Query 4: Identify which contestants have not participated in any events.

SELECT 
	Contestant.ContestantID, Contestant.Name
FROM 
	Contestant
LEFT JOIN EventContestant ON
	Contestant.ContestantID = EventContestant.ContestantID
WHERE 
	EventContestant.EventID IS NULL AND Contestant.Finalist = 'TRUE'
