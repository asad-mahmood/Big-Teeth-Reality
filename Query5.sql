-- Query 5: What is the highest estimated danger level for any event?

SELECT 
	Event.EventID, Event.Title ,Event.EstimatedDanger
FROM 
	Event
ORDER BY 
	Event.EstimatedDanger DESC
LIMIT 1


