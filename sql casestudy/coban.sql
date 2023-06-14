use furama;
select * from nhan_vien nv 
where (nv.ho_ten like("H%") or nv.ho_ten like("T%") or nv.ho_ten like("K%") and (char_length(nv.ho_ten) <16) );


select * from khach_hang kh
where (year(now()) - year(kh.ngay_sinh) between 18 and 50 ) 
and (kh.dia_chi like ("%Đà Nẵng") or kh.dia_chi like ("%Quảng Trị"));


select kh.*,count(hd.ma_hop_dong) as so_luong from khach_hang kh 
inner join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
inner join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
where lk.ten_loai_khach = "Diamond"
group by kh.ma_khach_hang
order by so_luong asc;


select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, (ifnull(dv.chi_phi_thue,0) + ifnull(dk.gia,0) * ifnull(ct.so_luong,0)) as `tong tien` 
from khach_hang kh 
left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
left join hop_dong_chi_tiet ct on ct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join dich_vu_di_kem dk on dk.ma_dich_vu_di_kem = ct.ma_dich_vu_di_kem
left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
group by hd.ma_hop_dong
order by kh.ma_khach_hang;

-- cau 6

-- 6.	Hiển thị dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu from dich_vu dv 
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu 
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
where dv.ten_dich_vu not in (select dv.ten_dich_vu from dich_vu dv 
left join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu where hd.ngay_lam_hop_dong like("2021-01-%") or hd.ngay_lam_hop_dong like("2021-02-%") or hd.ngay_lam_hop_dong like("2021-03-%"))
group by dv.ten_dich_vu;

-- cau7
-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu from dich_vu dv 
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu 
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
where hd.ngay_lam_hop_dong like("2020-%") and dv.ten_dich_vu not in (select dv.ten_dich_vu from  dich_vu dv 
left join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu where hd.ngay_lam_hop_dong like("2021-%"))
group by dv.ten_dich_vu;

-- cau8
-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select distinct kh.ho_ten from khach_hang kh;
select kh.ho_ten from khach_hang kh
group by kh.ho_ten;
select kh.ho_ten from khach_hang kh
union select kh.ho_ten from khach_hang kh;

-- cau9
-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(hd.ngay_lam_hop_dong) as thang , count(1) as so_luong_khach_hang
 from hop_dong hd
 group by month(hd.ngay_lam_hop_dong)
 order by month(hd.ngay_lam_hop_dong);

-- 10
-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
 select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, sum(hd.ma_hop_dong) as so_luong_dich_vu_di_kem from hop_dong hd
 join hop_dong_chi_tiet ct on ct.ma_hop_dong = hd.ma_hop_dong
 group by hd.ma_hop_dong;
 
 -- 11
 -- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
 
 select dvdk.ma_dich_vu_di_kem , dvdk.ten_dich_vu_di_kem from khach_hang kh
 join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
 join hop_dong_chi_tiet ct on ct.ma_hop_dong = hd.ma_hop_dong
 join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = ct.ma_dich_vu_di_kem
 join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
 where lk.ten_loai_khach = "Diamond" and (kh.dia_chi like("%Vinh") or kh.dia_chi like("%Quảng Ngãi"));