use furama;
select * from nhan_vien nv 
where (nv.ho_ten like("H%") or nv.ho_ten like("T%") or nv.ho_ten like("K%") ) and (length(nv.ho_ten) <=15);