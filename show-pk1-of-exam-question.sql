/* This will find the PK1 of an individual exam question within a course. You'll
   need to know the EXACT name of the assessment (MY_EXAM_TITLE), and be sure to
   change MY_COURSE_ID to your actual CID.
   contributed by reynlds@illinois.edu */

select * from bblearn.qti_asi_data qad where parent_pk1=(
select pk1 from bblearn.qti_asi_data qad where parent_pk1=(
select qad.pk1 from bblearn.qti_asi_data qad, bblearn.course_main cm, bblearn.course_contents cc, bblearn.course_assessment ca, bblearn.link l
    where cm.course_id='MY_COURSE_ID'
        and cm.pk1=cc.crsmain_pk1
        and cc.pk1=l.course_contents_pk1
        and l.link_source_pk1=ca.pk1
        and ca.qti_asi_data_pk1=qad.pk1
        and cc.title = 'MY_EXAM_TITLE')
);