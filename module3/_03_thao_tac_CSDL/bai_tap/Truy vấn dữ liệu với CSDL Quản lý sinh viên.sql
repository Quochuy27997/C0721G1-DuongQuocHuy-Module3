USE quan_li_sinh_vien;
SELECT * FROM student WHERE student_name REGEXP '^h';
SELECT * FROM class WHERE start_date REGEXP '12';
SELECT * FROM subject WHERE credit>=3 AND credit<=5;
UPDATE student
SET class_id = 2
WHERE student_id=1;
SELECT  s.student_name, sub.sub_name, m.mark
from student s join mark m on s.student_id=m.student_id join subject sub on m.sub_id=sub.sub_id
ORDER BY mark DESC, student_name;