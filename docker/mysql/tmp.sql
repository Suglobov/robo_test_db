SELECT
  ml.fk_user_char_1
#   , s1.*
#   , s2.*
  , s1.count1 / s2.count2 d
#   , sum(s2.count2) s
FROM matches_logs ml
  JOIN (SELECT
          ml2.fk_user_char_1
          , COUNT(ml2.fk_user_char_1) count1
        FROM matches_logs ml2
          JOIN users_has_characters uc1 ON uc1.pk = ml2.fk_user_char_1
        GROUP BY ml2.fk_user_char_1) s1 ON s1.fk_user_char_1 = ml.fk_user_char_1
  JOIN (SELECT
          ml3.fk_user_char_2
          , COUNT(ml3.fk_user_char_2) count2
        FROM matches_logs ml3
          JOIN users_has_characters uc1 ON uc1.pk = ml3.fk_user_char_2
        GROUP BY ml3.fk_user_char_2) s2 ON s2.fk_user_char_2 = ml.fk_user_char_1
GROUP BY ml.fk_user_char_1
ORDER BY d DESC
