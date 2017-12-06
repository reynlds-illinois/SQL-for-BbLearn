/* This query will show all users with the secondary role of BbMobile. This role
   is assigned when a user logs on with a mobile app the first time.
   
   contributed by reynlds@illinois.edu */
   
SELECT u.user_id, u.firstname, u.lastname,u.email, u.LAST_LOGIN_DATE
FROM bblearn.user_roles ur, bblearn.institution_roles ir, bblearn.users u
WHERE ir.role_id = 'BbMobile' and ur.institution_roles_pk1 = ir.pk1 and ur.users_pk1 = u.pk1 and u.LAST_LOGIN_DATE > '01-SEP-2017'
ORDER BY u.LAST_LOGIN_DATE desc