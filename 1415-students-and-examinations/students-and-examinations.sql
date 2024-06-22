/* Write your T-SQL query statement below */
--Combine every student with every subject
WITH fr AS(
    SELECT *
    FROM STUDENTS
    CROSS JOIN SUBJECTS
)
SELECT fr.student_id, student_name, fr.subject_name, COUNT(b.subject_name) as "attended_exams"
from fr
LEFT JOIN examinations as b on fr.student_id = b.student_id AND fr.subject_name = b.subject_name
GROUP BY fr.student_id, student_name, fr.subject_name