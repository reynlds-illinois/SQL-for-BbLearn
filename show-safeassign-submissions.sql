/* This query will return SafeAssign submissions based on term code.
   
   contributed by reynlds@illinois.edu */
   
SELECT cm.COURSE_ID,cm.course_name, gm.title
FROM bblearn.COURSE_MAIN cm
    JOIN bblearn.mdb_safeassign_item msi ON (msi.crsmain_pk1 = cm.PK1)
    JOIN bblearn.gradebook_main gm ON gm.pk1 = msi.GRADEBOOK_MAIN_PK1
/* update the following to filter by course_id */
    WHERE cm.course_id LIKE '%XXXXXX%' 
ORDER by cm.course_id