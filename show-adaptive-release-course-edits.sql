/* This will show edits made to Adaptive Release for a particular course.
   Be sure to change MY_COURSE_ID to your actual course_id.
   contributed by reynlds@illinois.edu */

select u.user_id, cm.course_id, cc.title, aa.data, aa.timestamp, aa.session_id
from bblearn.activity_accumulator aa
JOIN bblearn.users u on aa.user_pk1=u.pk1
JOIN bblearn.course_main cm on aa.course_pk1=cm.pk1
JOIN bblearn.course_contents cc on aa.content_pk1=cc.pk1
where aa.course_pk1=(select pk1 from bblearn.course_main where course_id='MY_COURSE_ID')
and (data='/webapps/blackboard/execute/content/adaptiveReleaseRules' OR data='/webapps/blackboard/execute/manageQuickRule')
ORDER BY aa.timestamp DESC;
  