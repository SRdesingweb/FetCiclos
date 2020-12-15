/*
use ciclos_propedeuticos_2;
*/ /*
SELECT
	cycle.id, 
	cycle.`name`, 
	ucr.user_id, 
	dr.degree_project_name, 
	dr.observation, 
	dr.state, 
    DATE_FORMAT(dr.degree_date, "%m %d %y") AS degree_date,
	dr.create_time
FROM
	cycle
	LEFT JOIN
	user_cycle_request AS ucr
	ON 
		cycle.id = ucr.id
	LEFT JOIN
	degree_request AS dr
	ON 
		ucr.id = dr.id

*/
SELECT
	*
FROM
	user_cycle_request
	RIGHT JOIN
	cycle
	ON 
		user_cycle_request.cycle_id = cycle.id
WHERE
	user_cycle_request.user_id = 1 