-- 1. Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh
-- viên, Tên sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã
-- sinh viên tăng dần
create view view_hocsinh as
select MaSV,HoSV,HocBong from dmsv order by MaSV;
select * from view_hocsinh;

-- 2. Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên,
-- Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.
select MaSV,HoSV,Phai,NgaySinh from dmsv order by Phai;

-- 3. Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông
-- tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
select HoSV,NgaySinh,HocBong from dmsv order by NgaySinh,HocBong desc;

-- 4. Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã
-- môn, Tên môn, Số tiết.
create view view_mh_start_like_T as
select * from dmmh where TenMH like "T%";

-- 5. Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm
-- các thông tin: Họ tên sinh viên, Ngày sinh, Phái.
select (TenSV),NgaySinh,Phai from dmsv where TenSV like "%I";

-- 6. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm
-- các thông tin: Mã khoa, Tên khoa.
select * from dmkhoa where TenKhoa like "_N%";

-- 7. Liệt kê những sinh viên mà họ có chứa chữ Thị.
select * from dmsv where HoSV like "%Thi%";

-- 8. Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các
-- thông tin: Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ
-- được sắp xếp theo thứ tự Mã khoa giảm dần
select MaSV,TenSV,MaKhoa,HocBong from  dmsv where HocBong > 100000;

-- 9. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm
-- các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.
select MaSV,TenSV,MaKhoa,HocBong from  dmsv where HocBong > 150000 and NoiSinh like "Hà Nội";

-- 10.Danh sách các sinh viên của khoa Anh văn và khoa Vật lý, gồm các thông
-- tin: Mã sinh viên, Mã khoa, Phái.
select sv.MaSV,sv.MaKhoa,sv.Phai from dmsv sv join dmkhoa k on sv.MaKhoa = k.MaKhoa where k.TenKhoa like "Anh văn" or k.TenKhoa like "Vật lý";

-- 11.Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày
-- 05/06/1992 gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học
-- bổng.
select * from dmsv where NgaySinh between '1991/01/01' and '1992/06/05';

-- 12.Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các
-- thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa.
select MaSV,NgaySinh,Phai,MaKhoa from  dmsv where HocBong between 80000 and 150000;

-- 13.Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông
-- tin: Mã môn học, Tên môn học, Số tiết.
select * from dmmh where SoTiet between 30 and 45;

-- 14.Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các
-- thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.
select * from dmsv sv join dmkhoa k on sv.MaKhoa = k.MaKhoa
where sv.Phai like "Nam" and (k.TenKhoa like "Anh văn" or k.TenKhoa like "Tin học");

-- 15.Liệt kê những sinh viên nữ, tên có chứa chữ N
select * from dmsv where Phai like "%N%" and Phai like "Nữ";

-- 16.Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các
-- thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.
select * from dmsv where NoiSinh like "Hà Nội" and month(NgaySinh) = 2;

-- 17.Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh
-- viên, Tuổi,Học bổng.
select TenSV,(year(now()) - year(NgaySinh)) age,HocBong from dmsv where (year(now()) - year(NgaySinh)) > 20;

-- 18.Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh
-- viên, Tuổi, Tên khoa.
select TenSV,(year(now()) - year(NgaySinh)) age,k.TenKhoa from dmsv sv 
join dmkhoa k on sv.MaKhoa = k.MaKhoa
where (year(now()) - year(NgaySinh)) between 20 and 25;

-- 19.Danh sách sinh viên sinh vào mùa xuân năm 1990, gồm các thông tin: Họ
-- tên sinh viên,Phái, Ngày sinh.
select * from dmsv where date(NgaySinh) between '1990/01/01' and '1990/03/31';

-- 20.Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên,
-- Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học
-- bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển
-- thị là “Mức trung bình”
select MaSV,MaKhoa,Phai,
case
	when HocBong > 500000 then "Học bổng cao"
    else "Học bổng trung bình"
end 'Mức học bổng' from dmsv;

-- 21.Cho biết tổng số sinh viên của toàn trường
select * from dmsv;

-- 22.Cho biết tổng sinh viên và tổng sinh viên nữ.
select Phai,count(MaSV) from dmsv group by Phai;

-- 23.Cho biết tổng số sinh viên của từng khoa.
select MaKhoa,count(MaSV) from dmsv group by MaKhoa;

-- 24.Cho biết số lượng sinh viên học từng môn.
select mh.TenMH,count(sv.MaSV) from dmsv sv
join ketqua kq on kq.MaSV = sv.MaSV
join dmmh mh on mh.MaMH = kq.MaMH
group by mh.MaMH;

-- 25.Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có
-- trong bảng kq)
select mh.TenMH,count(kq.MaMH) from dmmh mh 
join ketqua kq on kq.MaMH = mh.MaMH
group by kq.MaMH;

-- 26.Cho biết tổng số học bổng của mỗi khoa.
select kh.TenKhoa,count(sv.HocBong) from dmsv sv 
join dmkhoa kh on sv.MaKhoa = kh.MaKhoa
group by kh.MaKhoa;

-- 27.Cho biết học bổng cao nhất của mỗi khoa.


-- 28.Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa.
select * from dmsv sv 
join dmkhoa kh on sv.MaKhoa = kh.MaKhoa
group by kh.MaKhoa;

-- 29.Cho biết số lượng sinh viên theo từng độ tuổi.
select (year(now()) - year(NgaySinh)),count(MaSV) from dmsv group by (year(now()) - year(NgaySinh));

-- 30.Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường.
select year(NgaySinh),count(MaSV) from dmsv group by year(NgaySinh) having count(MaSV) >= 2;

-- 31.Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường.
select NoiSinh,count(MaSV) from dmsv group by NoiSinh having count(MaSV) >= 2; 

-- 32.Cho biết những môn nào có trên 3 sinh viên dự thi.
select mh.TenMH,count(kq.MaSV) from ketqua kq 
join dmmh mh on kq.MaMH = mh.MaMH
group by mh.MaMH having count(kq.MaSV) >= 3;

-- 33.Cho biết những sinh viên thi lại trên 2 lần.
select sv.* from dmsv sv 
join ketqua kq on sv.MaSV = kq.MaSV 
where kq.LanThi >= 2;

-- 34.Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0
select sv.TenSV,avg(kq.Diem) from dmsv sv 
join ketqua kq on sv.MaSV = kq.MaSV
where sv.Phai like "Nam"
group by sv.MaSV;

-- 35.Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1.


-- 36.Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam
select count(sv.MaSV) from dmsv sv
join dmkhoa kh on sv.MaKhoa = kh.MaKhoa
where sv.Phai like "Nam"
group by kh.MaKhoa having count(sv.MaSV) >= 2;

-- 37.Cho biết những khoa có 2 sinh đạt học bổng từ 200.000 đến 300.000.
select kh.TenKhoa,count(sv.MaSV) from dmsv sv 
join dmkhoa kh on sv.MaKhoa = kh.MaKhoa
where sv.HocBong between 200000  and 300000
group by kh.MaKhoa;

-- 38.Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn
-- trong lần thi 1.
select 
	mh.TenMH,
	count(case when kq.Diem >= 4 then sv.MaSV end) as 'Qua môn',
	count(case when kq.Diem < 4 then sv.MaSV end) as 'Rớt môn'
from dmsv sv 
join ketqua kq on sv.MaSV = kq.MaSV
join dmmh mh on mh.MaMH = kq.MaMH
where kq.LanThi = 1
group by kq.MaMH;

-- 39.Cho biết sinh viên nào có học bổng cao nhất.
select * from dmsv where HocBong = (select max(HocBong) from dmsv);

-- 40.Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất.
select * from dmsv where MaSV in (select MaSV from ketqua where Diem = (select max(Diem) from ketqua where MaMH = "01" and LanThi = 1));

-- 41.Cho biết sinh viên khoa anh văn có tuổi lớn nhất.
select * from dmsv sv
join dmkhoa kh on sv.MaKhoa = kh.MaKhoa
where kh.TenKhoa like "Anh văn" and (year(now()) - year(sv.NgaySinh)) = (select max(year(now()) - year(sv.NgaySinh)) from dmsv);

-- 42.Cho biết khoa nào có đông sinh viên nhất.
select kh.TenKhoa,count(sv.MaSV) from dmsv sv
join dmkhoa kh on sv.MaKhoa = kh.MaKhoa
group by kh.MaKhoa
order by count(sv.MaSV) desc limit 1;

-- 43.Cho biết khoa nào có đông nữ nhất.
select kh.TenKhoa,count(sv.MaSV) from dmsv sv
join dmkhoa kh on sv.MaKhoa = kh.MaKhoa
where sv.Phai = "Nữ"
group by kh.MaKhoa
order by count(sv.MaSV) desc limit 1;

-- 44.Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất.
select * from dmmh where MaMH in (
select mh.MaMH from ketqua kq 
join dmmh mh on kq.MaMH = mh.MaMH
where kq.LanThi = 1 and kq.Diem < 4
group by mh.MaMH
order by count(kq.MaSV) desc);

-- 45.Cho biết sinh viên không học khoa anh văn có điểm thi môn phạm lớn hơn
-- điểm thi văncủa sinh viên học khoa anh văn.


-- 46.Cho biết sinh viên có nơi sinh cùng với Hải.
select * from dmsv where NoiSinh = (select NoiSinh from dmsv where TenSV = "Hải");

-- 47.Cho biết những sinh viên nào có học bổng lớn hơn tất cả học bổng của
-- sinh viên thuộc khoa anh văn


-- 48.Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên
-- học khóa anh văn


-- 49. ho biết sinh viên nào có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm
-- thi lần 1 môn cơ sở dữ liệu của những sinh viên khác.


-- 50.Cho biết những sinh viên đạt điểm cao nhất trong từng môn.
select sv.* from dmsv sv 
join ketqua kq on sv.MaSV = kq.MaSV
where kq.Diem in (select max(kq.Diem) from dmsv sv 
join ketqua kq on sv.MaSV = kq.MaSV 
group by kq.MaMH);

-- 51.Cho biết những khoa không có sinh viên học.
select * from dmsv sv
right join dmkhoa kh on sv.MaKhoa = kh.MaKhoa 
where sv.MaKhoa is null;

-- 52.Cho biết sinh viên chưa thi môn cơ sở dữ liệu.
select  sv.* from dmsv sv
right join ketqua kq on sv.MaSV = kq.MaSV
where kq.MaMH = '01' and kq.MaSV is null;

-- 53.Cho biết sinh viên nào không thi lần 1 mà có dự thi lần 2.


-- 54.Cho biết môn nào không có sinh viên khoa anh văn học.


-- 55.Cho biết những sinh viên khoa anh văn chưa học môn văn phạm.


-- 56.Cho biết những sinh viên không rớt môn nào.
-- select * from dmsv sv
-- join ketqua kq on sv.MaSV = kq.MaSV
-- group by sv.MaSV

-- 57.Cho biết những sinh viên học khoa anh văn có học bổng và những sinh viên
-- chưa bao giờ rớt.


-- 58.Cho biết khoa nào có đông sinh viên nhận học bổng nhất và khoa nào khoa
-- nào có ít sinh viên nhận học bổng nhất.


-- 59.Cho biết 3 sinh viên có học nhiều môn nhất.
select sv.* from dmsv sv
join ketqua kq on sv.MaSV = kq.MaSV
group by kq.MaMH 
order by count(kq.MaSV) limit 3;

-- 60.Cho biết những môn được tất cả các sinh viên theo học.
select mh.* from dmmh mh
join ketqua kq on mh.MaMH = kq.MaMH 
group by kq.MaMH 
having count(distinct kq.MaSV) = (select count(*) from dmsv);

-- 61.Cho biết những sinh viên học những môn giống sinh viên có mã số A02 học.
select sv.* from dmsv sv
join ketqua kq on sv.MaSV = kq.MaSV 
where kq.MaMH in (select MaMH from ketqua where MaSV = "A02");

-- 62.Cho biết những sinh viên học những môn bằng đúng những môn mà sinh
-- viên A02 học 
select sv.* from dmsv sv 
join ketqua kq on sv.MaSV = kq.MaSV
where kq.MaMH in (select MaMH from ketqua where MaSV = "A02");
