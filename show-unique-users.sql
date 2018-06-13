/* This query will show the number of users and their role, sorted by term.
   Update the ds.BATCH_UID to change the term. You could also do multiple
   terms by reformating as:  ('120161','120168','120171')

   This is the same query used by the tenth day report.
   
   contributed by reynlds@illinois.edu */

select CR.COURSE_ROLE ROLE,
     count(unique(CU.USERS_PK1)) COUNT
from BBLEARN.COURSE_USERS CU
     join BBLEARN.COURSE_ROLES CR on(CR.COURSE_ROLE = CU.ROLE) 
     join BBLEARN.COURSE_MAIN CM on(CM.PK1 = CU.CRSMAIN_PK1) 
     join BBLEARN.DATA_SOURCE DS on(DS.PK1 = CM.DATA_SRC_PK1) 
where cm.AVAILABLE_IND = 'Y'
     and ds.BATCH_UID like ('120168')
group by CR.COURSE_ROLE
