/* This query looks at the number of accesses of the Retention Center
   pages within the activity accumulator. You can filter by date range,
   user, course and content PK1.
   
   contributed by reynlds@illinois.edu */

/* the following line adds additional details to the timestamp */
alter session set nls_date_format = 'MM/DD/YY HH24:MI:SS';

select PK1, EVENT_TYPE, USER_PK1, COURSE_PK1, DATA, TIMESTAMP, SESSION_ID from BBLEARN.ACTIVITY_ACCUMULATOR
WHERE DATA like '%webapps/retention%'
    AND course_pk1 = 'XXXXXX'
    AND user_pk1 = 'XXXXXX'
    AND content_pk1 = 'XXXXXX'
AND timestamp BETWEEN to_date('12/01/17 00:00:01', 'MM/DD/YY HH24:MI:SS') AND to_date('12/02/17 23:59:59', 'MM/DD/YY HH24:MI:SS')
