use quanlysinhvien;
select * from subject s
where s.credit = (select max(s.credit) from subject s);
select s.* from subject s 
inner join mark m on m.SubId = s.SubId
where m.Mark = (select max(m.mark)  from mark m);
select sv.*, Avg(m.mark) as DiemTB from student sv
inner join mark m on m.StudentId = sv.StudentId
group by m.StudentId
