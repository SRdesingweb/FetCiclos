use ciclos_propedeuticos_2;

SELECT 
    cycle.*,
    ucr.*,
    dr.*
FROM
    cycle
        INNER JOIN
    user_cycle_request AS ucr ON cycle.id = ucr.id
        INNER JOIN
    degree_request AS dr ON ucr.id = dr.id
WHERE
    dr.state <> 2 AND dr.state <> 1;
    

