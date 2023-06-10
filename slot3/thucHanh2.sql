use quanlysinhvien;
select * from student sv
where sv.StudentName like ("h%");
select * from class c
where c.StartDate like("%-12-%");
select * from subject s
 where s.Credit between 3 and 5;
 update student
 set ClassID = 2
 where StudentName = "Hung";
 select sv.StudentName ,s.SubName,m.Mark from mark m 
 cross join subject s on m.SubId = s.SubId
 cross join student sv on m.StudentId = sv.StudentId
 order by m.mark desc, sv.studentName asc;
 
