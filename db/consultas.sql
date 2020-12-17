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
	
	
	/* Consulta chat*/
	
	SELECT
	chats.id, 
	chats.`name` AS chat_name, 
	messages.user_send_id, 
	messages.user_recive_id, 
	messages.text, 
	messages.chat_id, 
	messages.created_at, 
	`user`.`name` AS name_user_send
FROM
	chats
	INNER JOIN
	messages
	ON 
		chats.id = messages.chat_id
	INNER JOIN
	`user`
	ON 
		messages.user_send_id = `user`.id
WHERE
	(
		messages.user_send_id = 2 OR
		messages.user_recive_id = 2
	) AND
	(
		messages.user_send_id = 1 OR
		messages.user_recive_id = 1
	)
	
	
	
	
	SELECT	chats.id, chats.`name` AS chat_name, messages.user_send_id, messages.user_recive_id, messages.text, messages.chat_id, messages.created_at, `user`.`name` AS name_user_send FROM chats INNER JOIN messages ON chats.id = messages.chat_id INNER JOIN `user` ON messages.user_send_id = `user`.id WHERE ( messages.user_send_id = 2 OR messages.user_recive_id = 2 ) AND ( messages.user_send_id = 1 OR messages.user_recive_id = 1 )
	
	
	
	
	SELECT  chats.id, chats.`name` AS chat_name, messages.user_send_id, messages.user_recive_id, messages.text, messages.chat_id, messages.created_at, `user`.`name` AS name_user_send FROM chats INNER JOIN messages ON chats.id = messages.chat_id INNER JOIN `user` ON messages.user_send_id = `user`.id  WHERE ( messages.user_send_id = 2 OR messages.user_recive_id = 2 )  AND ( messages.user_send_id = 1 OR messages.user_recive_id = 1 )
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	