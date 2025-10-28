SELECT * FROM `arctic-analyzer-475917-b0.airbnbtrainuser.test` LIMIT 1000
--- total number of users
SELECT COUNT(*)  AS `nb_of_user`
FROM (
	SELECT user_id
	FROM `arctic-analyzer-475917-b0.airbnbtrainuser.test`
	GROUP BY user_id
) new_sessions;

---Active users, operation >10
SELECT COUNT(*)  AS `nb_activeuser`
FROM (
	SELECT user_id
	FROM `arctic-analyzer-475917-b0.airbnbtrainuser.test`
	GROUP BY user_id
	HAVING COUNT(user_id) >= 10
) active;

----- inner join table test and train
SELECT COUNT(*) AS total_insc
FROM (
  SELECT DISTINCT user_id
  FROM `arctic-analyzer-475917-b0.airbnbtrainuser.test`
) AS new_sessions
JOIN `arctic-analyzer-475917-b0.airbnbtrainuser.train` AS tu
  ON new_sessions.user_id = tu.id;

--nb of user who reserve
SELECT COUNT(*) AS `nb_user_book`
FROM (
	SELECT user_id
	FROM `arctic-analyzer-475917-b0.airbnbtrainuser.test`
	WHERE action_detail = 'reservations'
	GROUP BY user_id
) booking;

---nb of user pay
SELECT COUNT(*) AS `nb_user_pay`
FROM (
	SELECT user_id
	FROM `arctic-analyzer-475917-b0.airbnbtrainuser.test`
	WHERE action_detail = 'payment_instruments'
	GROUP BY user_id
) payed

--- nb rebook user
SELECT COUNT(*) AS `nb_user_repay`
FROM (
	SELECT user_id
	FROM `arctic-analyzer-475917-b0.airbnbtrainuser.test`
	WHERE action_detail = 'reservations'
	GROUP BY user_id
	HAVING COUNT(user_id) >= 2
) re_booking




