select E.emp
  from (select distinct emp from EmpSkills) as E
 where not exists (select skill from Skills
                   except
                   select skill from EmpSkills as ES where ES.emp = E.emp);

-- 別解
select emp
  from EmpSkills as ES1
 where not exists (select skill from Skills
                   except
                   select skill from EmpSkills as ES2 where ES1.emp = ES2.emp);
