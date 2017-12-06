/* This will show which courses have the NEEDS GRADING link enabled.
   contributed by reynlds@illinois.edu */

select distinct course_id from bblearn.course_main cm, bblearn.course_contents cc 
where cc.crsmain_pk1=cm.pk1 and exists 
(select 1 from bblearn.course_content_group ccg, bblearn.group_attempt ga 
where ccg.course_contents_pk1=cc.pk1 and ccg.groups_pk1 is null 
and ga.course_content_group_pk1=ccg.pk1);
