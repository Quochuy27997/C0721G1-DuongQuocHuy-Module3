USE QuanLySinhVien;
SELECT * FROM student WHERE StudentName REGEXP '^h';
SELECT * FROM class WHERE StartDate REGEXP '12';
SELECT * FROM Subject WHERE Credit>=3 AND Credit<=5;
UPDATE student
SET ClassId = 2
WHERE StudentId=1;
SELECT  S.StudentName, Sub.SubName, M.Mark
from student S join Mark M on S.StudentId=M.StudentId join Subject Sub on M.SubId=Sub.SubId
ORDER BY Mark DESC, StudentName;