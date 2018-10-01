-- CREATE TRIGGER `hash_user_password`
--   BEFORE INSERT
--   ON `home`.`users`
--   FOR EACH ROW
--   BEGIN
--     SET NEW.password = md5(NEW.password);
--   END;

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

-- CREATE PROCEDURE report_3_user_matches(IN userId INT)
--   COMMENT '10 последних матчей пользователя'
--   BEGIN
--     SELECT
--       userId
--       , ms.status
--       , m.datetime_finish AS 'дата окончания'
--       , TIMESTAMPDIFF(MINUTE, m.datetime_start, m.datetime_finish)
--                           AS 'длительность в минутах'
--     FROM matches m
--       JOIN users_has_characters uhc1 ON m.fk_team_1_us_has_cha_1 = uhc1.pk
--       JOIN users_has_characters uhc2 ON m.fk_team_1_us_has_cha_2 = uhc2.pk
--       JOIN users_has_characters uhc3 ON m.fk_team_1_us_has_cha_3 = uhc3.pk
--       JOIN users_has_characters uhc4 ON m.fk_team_2_us_has_cha_1 = uhc4.pk
--       JOIN users_has_characters uhc5 ON m.fk_team_2_us_has_cha_2 = uhc5.pk
--       JOIN users_has_characters uhc6 ON m.fk_team_2_us_has_cha_3 = uhc6.pk
--       JOIN matches_statuses ms ON m.fk_status = ms.pk
--     WHERE
--       uhc1.fk_user = userId OR
--       uhc2.fk_user = userId OR
--       uhc3.fk_user = userId OR
--       uhc4.fk_user = userId OR
--       uhc5.fk_user = userId OR
--       uhc6.fk_user = userId
--     ORDER BY m.datetime_finish
--     LIMIT 10;
--   END;

CREATE PROCEDURE report_1_char_top3()
  COMMENT '3 часто используемых персонажа у трёх игроков с наивысшим рейтингом'
  BEGIN
    SELECT
        uc.fk_character        'идентификатор персонажа'
      , ch.name                'имя'
      , count(uc.fk_character) 'частота использования'
    FROM matches_party mp
      JOIN users_has_characters uc ON uc.pk = mp.fk_user_char
      JOIN characters ch ON ch.pk = uc.fk_character
    WHERE uc.fk_user IN (SELECT fk_user
                         FROM (
                                SELECT
                                  fk_user
                                  , login
                                  , sum(ball) AS rating
                                FROM ratings_balls rb
                                  JOIN users AS us ON us.pk = rb.fk_user
                                GROUP BY fk_user
                                ORDER BY rating DESC
                                LIMIT 3
                              ) rat2)
    GROUP BY uc.fk_character
    ORDER BY 'частота использования' DESC
    LIMIT 3;
  END;

CREATE PROCEDURE report_3_user_matches(IN userId INT)
  COMMENT '10 последних матчей пользователя'
  BEGIN
    SELECT
      userId
      , ms.status
      , m.datetime_finish AS 'дата окончания матча'
      , TIMESTAMPDIFF(MINUTE, m.datetime_start, m.datetime_finish)
                          AS 'длительность матча в минутах'
    FROM matches m
      JOIN matches_statuses ms ON m.fk_status = ms.pk
      JOIN matches_party mp ON mp.fk_match = m.pk
      JOIN users_has_characters uc ON uc.pk = mp.fk_user_char
                                      AND uc.fk_user = userId
    ORDER BY m.datetime_finish DESC
    LIMIT 10;
  END;
