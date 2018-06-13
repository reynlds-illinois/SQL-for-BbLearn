/* this query will find all courses that contain NO users.
   this includes Instructors (which are technically still users).
   You can squeeze it down by term by modifying the course_id.
   (see SQL inline below) 
   
   contributed by reynlds@illinois.edu */

select cm.course_id, cm.course_name, nvl(cu.colname2,0)
from BBLEARN.course_main cm
left outer join (select crsmain_pk1, count(*) colname2 
    from bblearn.course_users group by crsmain_pk1) cu 
    on cm.pk1=cu.crsmain_pk1 
    where (cu.colname2 is null) 
        AND cm.course_id like '%120171%'   /* <--change this for diff term or
                                                 comment it out for ALL */
group by cm.course_id, cm.course_name, colname2;
