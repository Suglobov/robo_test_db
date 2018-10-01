-- we don't know how to generate schema home (class Schema) :(
CREATE TABLE achievements
(
  pk      INT AUTO_INCREMENT
    PRIMARY KEY,
  name    VARCHAR(255) NULL,
  message VARCHAR(255) NULL
);

CREATE TABLE characters_levels
(
  pk         INT AUTO_INCREMENT
    PRIMARY KEY,
  level      TINYINT UNSIGNED NULL,
  experience INT UNSIGNED     NULL
);

CREATE TABLE characters_lines
(
  pk   INT AUTO_INCREMENT
    PRIMARY KEY,
  name VARCHAR(255) NULL
);

CREATE TABLE characters
(
  pk             INT AUTO_INCREMENT
    PRIMARY KEY,
  name           VARCHAR(255)    NULL,
  fk_first_line  INT DEFAULT '1' NULL,
  fk_second_line INT DEFAULT '4' NULL,
  CONSTRAINT character_name_uindex
  UNIQUE (name),
  CONSTRAINT characters_characters_lines_pk_fk
  FOREIGN KEY (fk_first_line) REFERENCES characters_lines (pk),
  CONSTRAINT characters_characters_lines_pk_fk_2
  FOREIGN KEY (fk_second_line) REFERENCES characters_lines (pk)
);

CREATE INDEX characters_characters_lines_pk_fk
  ON characters (fk_first_line);

CREATE INDEX characters_characters_lines_pk_fk_2
  ON characters (fk_second_line);

CREATE TABLE characters_parametrs
(
  pk                INT AUTO_INCREMENT
    PRIMARY KEY,
  fk_character      INT              NULL,
  level             TINYINT UNSIGNED NULL,
  move_speed        INT UNSIGNED     NULL,
  physical_attack   INT UNSIGNED     NULL,
  magic_attack      INT UNSIGNED     NULL,
  first_line_value  INT UNSIGNED     NULL,
  second_line_value INT UNSIGNED     NULL,
  CONSTRAINT characters_parametrs_characters_pk_fk
  FOREIGN KEY (fk_character) REFERENCES characters (pk)
);

CREATE INDEX characters_parametrs_characters_pk_fk
  ON characters_parametrs (fk_character);

CREATE TABLE matches_logs_events
(
  pk   INT AUTO_INCREMENT
    PRIMARY KEY,
  name VARCHAR(255) NULL
);

CREATE TABLE matches_statuses
(
  pk     INT AUTO_INCREMENT
    PRIMARY KEY,
  status VARCHAR(255) NULL,
  CONSTRAINT match_status_status_uindex
  UNIQUE (status)
);

CREATE TABLE matches
(
  pk              INT AUTO_INCREMENT
    PRIMARY KEY,
  fk_status       INT      NULL,
  datetime_start  DATETIME NULL,
  datetime_finish DATETIME NULL,
  CONSTRAINT matches_match_status_pk_fk
  FOREIGN KEY (fk_status) REFERENCES matches_statuses (pk)
);

CREATE INDEX matches_match_status_pk_fk
  ON matches (fk_status);

CREATE TABLE ratings_messages
(
  pk      INT AUTO_INCREMENT
    PRIMARY KEY,
  message VARCHAR(255) NULL
);

CREATE TABLE users
(
  pk                INT AUTO_INCREMENT
    PRIMARY KEY,
  login             VARCHAR(255)                NOT NULL,
  password          TEXT                        NOT NULL,
  registration_date DATE                        NOT NULL,
  last_visit_date   DATETIME                    NOT NULL,
  rating_ball       INT UNSIGNED DEFAULT '0'    NULL,
  experience        BIGINT UNSIGNED DEFAULT '0' NULL,
  CONSTRAINT users_login_uindex
  UNIQUE (login)
);

CREATE TABLE ratings_balls
(
  pk            INT AUTO_INCREMENT
    PRIMARY KEY,
  fk_user       INT      NULL,
  fk_message    INT      NULL,
  ball          INT      NULL,
  ball_datetime DATETIME NULL,
  CONSTRAINT ratings_balls_users_pk_fk
  FOREIGN KEY (fk_user) REFERENCES users (pk),
  CONSTRAINT ratings_balls_rating_message_pk_fk
  FOREIGN KEY (fk_message) REFERENCES ratings_messages (pk)
);

CREATE INDEX ratings_balls_rating_message_pk_fk
  ON ratings_balls (fk_message);

CREATE INDEX ratings_balls_users_pk_fk
  ON ratings_balls (fk_user);

CREATE TRIGGER hash_user_password
  BEFORE INSERT
  ON users
  FOR EACH ROW
  BEGIN
    SET NEW.password = md5(NEW.password);
  END;

CREATE TABLE users_has_achievements
(
  pk             INT AUTO_INCREMENT
    PRIMARY KEY,
  fk_user        INT NULL,
  fk_achievement INT NULL,
  CONSTRAINT users_has_achievements_users_pk_fk
  FOREIGN KEY (fk_user) REFERENCES users (pk),
  CONSTRAINT users_has_achievements_achievements_pk_fk
  FOREIGN KEY (fk_achievement) REFERENCES achievements (pk)
);

CREATE INDEX users_has_achievements_achievements_pk_fk
  ON users_has_achievements (fk_achievement);

CREATE INDEX users_has_achievements_users_pk_fk
  ON users_has_achievements (fk_user);

CREATE TABLE users_has_characters
(
  pk           INT AUTO_INCREMENT
    PRIMARY KEY,
  fk_user      INT NULL,
  fk_character INT NULL,
  CONSTRAINT user_has_character_users_pk_fk
  FOREIGN KEY (fk_user) REFERENCES users (pk),
  CONSTRAINT user_has_character_character_pk_fk
  FOREIGN KEY (fk_character) REFERENCES characters (pk)
);

CREATE TABLE matches_logs
(
  pk             INT AUTO_INCREMENT
    PRIMARY KEY,
  fk_match       INT      NULL,
  fk_user_char_1 INT      NULL,
  fk_user_char_2 INT      NULL,
  datetime_event DATETIME NULL,
  fk_event       INT      NULL,
  CONSTRAINT matches_logs_matches_pk_fk
  FOREIGN KEY (fk_match) REFERENCES matches (pk),
  CONSTRAINT matches_logs_users_has_characters_pk_fk
  FOREIGN KEY (fk_user_char_1) REFERENCES users_has_characters (pk),
  CONSTRAINT matches_logs_users_has_characters_pk_fk_2
  FOREIGN KEY (fk_user_char_2) REFERENCES users_has_characters (pk),
  CONSTRAINT matches_logs_matches_logs_events_pk_fk
  FOREIGN KEY (fk_event) REFERENCES matches_logs_events (pk)
);

CREATE INDEX matches_logs_matches_logs_events_pk_fk
  ON matches_logs (fk_event);

CREATE INDEX matches_logs_matches_pk_fk
  ON matches_logs (fk_match);

CREATE INDEX matches_logs_users_pk_fk
  ON matches_logs (fk_user_char_1);

CREATE INDEX matches_logs_users_pk_fk_2
  ON matches_logs (fk_user_char_2);

CREATE TABLE matches_party
(
  pk           INT AUTO_INCREMENT
    PRIMARY KEY,
  fk_match     INT NULL,
  team         INT NULL,
  fk_user_char INT NULL,
  CONSTRAINT matches_party_matches_pk_fk
  FOREIGN KEY (fk_match) REFERENCES matches (pk),
  CONSTRAINT matches_party_users_has_characters_pk_fk
  FOREIGN KEY (fk_user_char) REFERENCES users_has_characters (pk)
);

CREATE INDEX matches_party_matches_pk_fk
  ON matches_party (fk_match);

CREATE INDEX matches_party_users_has_characters_pk_fk
  ON matches_party (fk_user_char);

CREATE INDEX user_has_character_character_pk_fk
  ON users_has_characters (fk_character);

CREATE INDEX user_has_character_users_pk_fk
  ON users_has_characters (fk_user);

CREATE TABLE users_levels
(
  pk         INT AUTO_INCREMENT
    PRIMARY KEY,
  level      TINYINT UNSIGNED NULL,
  experience BIGINT UNSIGNED  NULL
);

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

