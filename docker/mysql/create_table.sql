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

CREATE TABLE matches
(
  pk                     INT AUTO_INCREMENT
    PRIMARY KEY,
  fk_status              INT      NULL,
  datetime_start         DATETIME NULL,
  datetime_finish        DATETIME NULL,
  fk_team_1_us_has_cha_1 INT      NULL,
  fk_team_1_us_has_cha_2 INT      NULL,
  fk_team_1_us_has_cha_3 INT      NULL,
  fk_team_2_us_has_cha_1 INT      NULL,
  fk_team_2_us_has_cha_2 INT      NULL,
  fk_team_2_us_has_cha_3 INT      NULL,
  CONSTRAINT matches_match_status_pk_fk
  FOREIGN KEY (fk_status) REFERENCES matches_statuses (pk),
  CONSTRAINT matches_users_has_characters_pk_fk
  FOREIGN KEY (fk_team_1_us_has_cha_1) REFERENCES users_has_characters (pk),
  CONSTRAINT matches_users_has_characters_pk_fk_2
  FOREIGN KEY (fk_team_1_us_has_cha_2) REFERENCES users_has_characters (pk),
  CONSTRAINT matches_users_has_characters_pk_fk_3
  FOREIGN KEY (fk_team_1_us_has_cha_3) REFERENCES users_has_characters (pk),
  CONSTRAINT matches_users_has_characters_pk_fk_4
  FOREIGN KEY (fk_team_2_us_has_cha_1) REFERENCES users_has_characters (pk),
  CONSTRAINT matches_users_has_characters_pk_fk_5
  FOREIGN KEY (fk_team_2_us_has_cha_2) REFERENCES users_has_characters (pk),
  CONSTRAINT matches_users_has_characters_pk_fk_6
  FOREIGN KEY (fk_team_2_us_has_cha_3) REFERENCES users_has_characters (pk)
);

CREATE INDEX matches_match_status_pk_fk
  ON matches (fk_status);

CREATE INDEX matches_users_has_characters_pk_fk
  ON matches (fk_team_1_us_has_cha_1);

CREATE INDEX matches_users_has_characters_pk_fk_2
  ON matches (fk_team_1_us_has_cha_2);

CREATE INDEX matches_users_has_characters_pk_fk_3
  ON matches (fk_team_1_us_has_cha_3);

CREATE INDEX matches_users_has_characters_pk_fk_4
  ON matches (fk_team_2_us_has_cha_1);

CREATE INDEX matches_users_has_characters_pk_fk_5
  ON matches (fk_team_2_us_has_cha_2);

CREATE INDEX matches_users_has_characters_pk_fk_6
  ON matches (fk_team_2_us_has_cha_3);

CREATE TABLE matches_logs
(
  pk             INT AUTO_INCREMENT
    PRIMARY KEY,
  fk_match       INT      NULL,
  fk_user_1      INT      NULL,
  fk_user_2      INT      NULL,
  datetime_event DATETIME NULL,
  fk_event       INT      NULL,
  CONSTRAINT matches_logs_matches_pk_fk
  FOREIGN KEY (fk_match) REFERENCES matches (pk),
  CONSTRAINT matches_logs_users_pk_fk
  FOREIGN KEY (fk_user_1) REFERENCES users (pk),
  CONSTRAINT matches_logs_users_pk_fk_2
  FOREIGN KEY (fk_user_2) REFERENCES users (pk)
);

CREATE INDEX matches_logs_matches_pk_fk
  ON matches_logs (fk_match);

CREATE INDEX matches_logs_users_pk_fk
  ON matches_logs (fk_user_1);

CREATE INDEX matches_logs_users_pk_fk_2
  ON matches_logs (fk_user_2);

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

