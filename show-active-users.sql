/* This query is very close to the query used by Bb to generate the number
   of active users as shown on a Managed Hosting Insight Report
   contributed by reynlds@illinois.edu */

SELECT 'ActiveUsers=' || COUNT(u.user_id) ct FROM bblearn.users u
WHERE EXISTS ( SELECT 'x' FROM bblearn.course_users cu WHERE cu.users_pk1 = u.pk1
    AND cu.row_status = 0
    AND cu.available_ind='Y'
    AND crsmain_pk1 in (select pk1 from bblearn.course_main where course_main.row_status=0
    AND course_main.available_ind='Y'
    AND course_main.service_level='F' ) )
    AND u.row_status = 0
    AND u.available_ind = 'Y'