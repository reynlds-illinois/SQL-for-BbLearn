/* find users with incomplete tests from today

   contributed by reynlds@illinois.edu */

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
SELECT u.user_id, a.date_modified, cm.course_id
FROM bblearn.attempt a, bblearn.gradebook_grade gbg, bblearn.course_users cu, bblearn.users u, bblearn.course_main cm 
WHERE a.status=3 and a.date_modified > (sysdate-1)
    AND a.date_modified < (sysdate-0.05)
    AND a.gradebook_grade_pk1=gbg.pk1
    AND cu.pk1=gbg.course_users_pk1
    AND u.pk1=cu.users_pk1
    AND cm.course_id NOT LIKE '%120168%'
/* GROUP BY cm.course_id, u.user_id, a.date_modified; */