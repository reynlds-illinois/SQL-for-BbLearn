/* This will show individual content ID's (PK1's) for a particular course.
   Be sure to change MY_COURSE_ID to your actual CID.
   
   contributed by reynlds@illinois.edu */

SET MARKUP HTML ON ENTMAP ON SPOOL ON PREFORMAT OFF;
SPOOL /oracle/coursefiles.xls;
SELECT FILE_ID, FILE_NAME, FULL_PATH from BBLEARN_cms_doc.XYF_URLS where FULL_PATH like '/courses/MY_COURSE_ID/%';
SPOOL OFF;