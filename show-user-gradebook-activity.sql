/* This will show ALL gradebook activity for a user. You'll need to know the PK1
   of the user in order to use it. The output is sorted by date, ascending.
   submitted by reynlds@illinois.edu */

select
  PK1,
  GRADEBOOK_MAIN_PK1
  USER_PK1,
  USERNAME,
  GRADE,
  to_CHAR ( ATTEMPT_CREATION, 'YYYY-MM-DD HH24:MI:SS' )
  MODIFIER_PK1,
  MODIFIER_ROLE,
  MODIFIER_USERNAME,
  EVENT_KEY,
  to_char( DATE_LOGGED, 'YYYY-MM-DD HH24:MI:SS' )
    from bblearn.gradebook_log where user_pk1 = 386943 order by DATE_LOGGED;
