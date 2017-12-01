/* This will show all System Admin users including their last login time
   contributed by reynlds@illinois.edu */

SELECT 
  u.USER_ID, 
  u.LAST_LOGIN_DATE, 
  u.LASTNAME, 
  u.FIRSTNAME, 
  sr.SYSTEM_ROLE, 
  'Secondary' RoleType
FROM 
  bblearn.users u 
  INNER JOIN bblearn.domain_admin da ON (u.pk1 = da.user_pk1) 
  INNER JOIN bblearn.system_roles sr ON (da.system_role = sr.system_role) 
  WHERE sr.SYSTEM_ROLE  = 'Z'
UNION 
SELECT 
	u.USER_ID, 
	u.LAST_LOGIN_DATE, 
	u.LASTNAME, 
	u.FIRSTNAME, 
	sr.SYSTEM_ROLE, 
	'Primary' AS RoleType
FROM 
	bblearn.USERS u 
	INNER JOIN bblearn.SYSTEM_ROLES sr ON (u.SYSTEM_ROLE = sr.SYSTEM_ROLE) 
	WHERE sr.SYSTEM_ROLE = 'Z'
