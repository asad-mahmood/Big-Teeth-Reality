-- Query 2: Determine which actions will take the longest. Rank all actions from longest to shortest.

SELECT 
	*
FROM 
	Actions
ORDER BY 
	Actions.EstimatedTime DESC
