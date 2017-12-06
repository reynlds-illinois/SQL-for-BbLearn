/* This query will show all the courses with "ForceComplete" assessments enabled.
   
   contributed by reynlds@illinois.edu */

column course_id format A25
column title format A100
SELECT cm.course_id, 'ForceComplete', gm.title
FROM bblearn.gradebook_main gm, bblearn.qti_asi_data qad, bblearn.course_main cm, bblearn.course_assessment ca
WHERE gm.qti_asi_data_pk1=qad.pk1
    AND qad.crsmain_pk1=cm.pk1
    AND ca.qti_asi_data_pk1=qad.pk1
/* -change the following line per term- */
    AND cm.course_id like '%120178%'
    AND ca.force_completion_ind='Y'
ORDER BY cm.course_id