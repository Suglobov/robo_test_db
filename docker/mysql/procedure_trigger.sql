CREATE TRIGGER `hash_user_password`
  BEFORE INSERT
  ON `home`.`users`
  FOR EACH ROW
  BEGIN
    SET NEW.password = md5(NEW.password);
  END;

CREATE PROCEDURE rating_users()
  COMMENT 'rating users'
  BEGIN
    SELECT
      fk_user
      , login
      , sum(ball) AS rating
    FROM ratings_balls
      JOIN users AS us ON us.pk = ratings_balls.fk_user
    GROUP BY fk_user
    ORDER BY rating DESC;
  END;

CREATE PROCEDURE report_3_user_matches(IN userId INT)
  COMMENT '10 последних матчей пользователя'
  BEGIN
    SELECT
      userId
      , ms.status
      , m.datetime_finish AS 'дата окончания'
      , TIMESTAMPDIFF(MINUTE, m.datetime_start, m.datetime_finish)
                          AS 'длительность в минутах'
    FROM matches m
      JOIN users_has_characters uhc1 ON m.fk_team_1_us_has_cha_1 = uhc1.pk
      JOIN users_has_characters uhc2 ON m.fk_team_1_us_has_cha_2 = uhc2.pk
      JOIN users_has_characters uhc3 ON m.fk_team_1_us_has_cha_3 = uhc3.pk
      JOIN users_has_characters uhc4 ON m.fk_team_2_us_has_cha_1 = uhc4.pk
      JOIN users_has_characters uhc5 ON m.fk_team_2_us_has_cha_2 = uhc5.pk
      JOIN users_has_characters uhc6 ON m.fk_team_2_us_has_cha_3 = uhc6.pk
      JOIN matches_statuses ms ON m.fk_status = ms.pk
    WHERE
      uhc1.fk_user = userId OR
      uhc2.fk_user = userId OR
      uhc3.fk_user = userId OR
      uhc4.fk_user = userId OR
      uhc5.fk_user = userId OR
      uhc6.fk_user = userId
    ORDER BY m.datetime_finish
    LIMIT 10;
  END;


