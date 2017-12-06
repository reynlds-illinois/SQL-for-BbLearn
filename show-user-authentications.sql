/* use this query to pull auth data from the auth_provider_log and
   report on it. Alternatively you can create joins and extra
   qualifiers to filter the results down further. 

   EVENT_TYPEs:
   0 - valid logon
   1 - invalid username
   2 - invalid password
   3 - valid logout
   4 - session expired
   
   contributed by reynlds@illinois.edu */

alter session set nls_date_format = 'MM/DD/YY HH24:MI:SS';
column USERNAME format a10      /* line limited to 10 chars */
column IP_ADDRESS format a16    /* line limited to 16 chars */
column APPSERVER_ID format a35  /* line limited to 35 chars */
column USER_AGENT format a120   /* line limited to 120 chars */
SELECT LOG_DATE, USERNAME, IP_ADDRESS, EVENT_TYPE, APPSERVER_ID, USER_AGENT
    FROM BBLEARN.AUTH_PROVIDER_LOG
WHERE USERNAME = 'MyStudent'      /* change for new username <<<<<<<<<<<<<<<<<*/
    AND LOG_DATE between to_date('12/01/17 00:00:01', 'MM/DD/YY HH24:MI:SS') and to_date('12/01/17 23:59:59', 'MM/DD/YY HH24:MI:SS')
ORDER BY LOG_DATE
