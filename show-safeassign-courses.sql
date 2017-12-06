/* This query will pull all of the courses that contain SafeAssign submissions
   and order them by PK1. Currently it limits to a single term, but
   this can be updated for any term or all (*).
   
   contributed by reynlds@illinois.edu */

SELECT cm.pk1, cm.course_id, cm.course_name
FROM bblearn.course_contents cc, bblearn.course_main cm, bblearn.mdb_safeassign_item sa
    WHERE cc.crsmain_pk1 = cm.pk1
    AND sa.crsmain_pk1 = cm.pk1
    AND sa.disabled = 'N'
/* change following line with term or delete for all */
    AND cm.course_id LIKE '%120171%'
GROUP BY cm.pk1, cm.course_id , cm.course_name
ORDER BY cm.pk1;
