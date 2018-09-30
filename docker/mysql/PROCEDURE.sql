CREATE PROCEDURE rating_users()
  COMMENT 'rating users'
  BEGIN
    SELECT
      fk_user,
      sum(ball) AS rating
    FROM ratings_balls
    GROUP BY fk_user
    ORDER BY rating DESC;
  END;
