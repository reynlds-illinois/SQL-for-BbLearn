/* This will extract blob info from any answers submitted on an exam. You'll need
   to know the PK1 of the student and the PK1 of the assessment. You'll also need
   to run BLOB2CLOB prior to set the function.
   contributed by reynlds@illinois.edu */

SET LONG 100000
select blob2clob(qr.data), a.pk1 as "ATTEMPT_PK1", u.user_id, gm.title
from bblearn.qti_result_data qr
    left join bblearn.qti_result_data qr1 on qr1.pk1 = qr.parent_pk1
    left join bblearn.qti_asi_data qa1 on qa1.pk1=qr.qti_asi_data_pk1
    left join bblearn.qti_asi_data qa2 on qa2.pk1=qa1.parent_pk1
    left join bblearn.attempt a on a.qti_result_data_pk1 = qr1.parent_pk1
    left join bblearn.gradebook_grade gg on gg.pk1 = a.gradebook_grade_pk1
    left join bblearn.gradebook_main gm on gm.pk1 = gg.gradebook_main_pk1
    left join bblearn.course_users cu on gg.course_users_pk1=cu.pk1
    left join bblearn.users u on cu.users_pk1=u.pk1
/* modify the following two lines with actual PK1 info */
        where u.pk1=USER_PK1
        and qa2.parent_pk1=TEST_PK1;