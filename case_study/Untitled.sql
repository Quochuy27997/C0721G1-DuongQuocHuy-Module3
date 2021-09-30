DROP DATABASE IF EXISTS manager_furama;
CREATE DATABASE IF NOT EXISTS manager_furama;
USE manager_furama;
CREATE TABLE vi_tri (
    id_vi_tri INT AUTO_INCREMENT PRIMARY KEY,
    ten_vi_tri VARCHAR(45) NOT NULL
);

CREATE TABLE trinh_do (
    id_trinh_do INT AUTO_INCREMENT PRIMARY KEY,
    ten_trinh_do VARCHAR(45) NOT NULL
);

CREATE TABLE bo_phan (
    id_bo_phan INT AUTO_INCREMENT PRIMARY KEY,
    ten_bo_phan VARCHAR(45) NOT NULL
);

CREATE TABLE nhan_vien (
    id_nhan_vien INT AUTO_INCREMENT PRIMARY KEY,
    ho_ten_nhan_vien VARCHAR(255) NOT NULL,
    id_vi_tri INT NOT NULL,
    id_trinh_do INT NOT NULL,
    id_bo_phan INT NOT NULL,
    FOREIGN KEY (id_vi_tri)
        REFERENCES vi_tri (id_vi_tri) on update cascade on delete cascade,
    FOREIGN KEY (id_trinh_do)
        REFERENCES trinh_do (id_trinh_do) on update cascade on delete cascade,
    FOREIGN KEY (id_bo_phan)
        REFERENCES bo_phan (id_bo_phan) on update cascade on delete cascade,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    luong INT NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    dia_chi VARCHAR(255) NOT NULL
);

CREATE TABLE loai_khach (
    id_loai_khach INT AUTO_INCREMENT PRIMARY KEY,
    ten_loai_khach VARCHAR(45) NOT NULL
);

CREATE TABLE khach_hang (
    id_khach_hang INT AUTO_INCREMENT PRIMARY KEY,
    id_loai_khach INT NOT NULL,
    FOREIGN KEY (id_loai_khach)
        REFERENCES loai_khach (id_loai_khach) on update cascade on delete cascade,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    dia_chi VARCHAR(255) NOT NULL
);

CREATE TABLE kieu_thue (
    id_kieu_thue INT AUTO_INCREMENT PRIMARY KEY,
    ten_kieu_thue VARCHAR(45) NOT NULL,
    gia INT NOT NULL
);

CREATE TABLE loai_dich_vu (
    id_loai_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(45) NOT NULL
);

CREATE TABLE dich_vu (
    id_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu VARCHAR(45) NOT NULL,
    dien_tich INT NOT NULL,
    so_tang INT NOT NULL,
    so_nguoi_toi_da INT NOT NULL,
    chi_phi_thue INT NOT NULL,
    id_kieu_thue INT NOT NULL,
    id_loai_dich_vu INT NOT NULL,
    FOREIGN KEY (id_kieu_thue)
        REFERENCES kieu_thue (id_kieu_thue) on update cascade on delete cascade,
    FOREIGN KEY (id_loai_dich_vu)
        REFERENCES loai_dich_vu (id_loai_dich_vu) on update cascade on delete cascade,
    trang_thai VARCHAR(45) NOT NULL
);

CREATE TABLE hop_dong (
    id_hop_dong INT AUTO_INCREMENT PRIMARY KEY,
    id_nhan_vien INT NOT NULL,
    id_khach_hang INT NOT NULL,
    id_dich_vu INT NOT NULL,
    FOREIGN KEY (id_nhan_vien)
        REFERENCES nhan_vien (id_nhan_vien) on update cascade on delete cascade,
    FOREIGN KEY (id_khach_hang)
        REFERENCES khach_hang (id_khach_hang) on update cascade on delete cascade,
    FOREIGN KEY (id_dich_vu)
        REFERENCES dich_vu (id_dich_vu) on update cascade on delete cascade,
    ngay_lam_hop_dong DATE NOT NULL,
    ngay_ket_thuc DATE NOT NULL,
    tien_dat_coc INT NOT NULL,
    tong_tien INT
);

CREATE TABLE dich_vu_di_kem (
    id_dich_vu_di_kem INT AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
    gia INT NOT NULL,
    don_vi INT NOT NULL,
    trang_thai_kha_dung VARCHAR(45) NOT NULL
);

CREATE TABLE hop_dong_chi_tiet (
    id_hop_dong_chi_tiet INT AUTO_INCREMENT PRIMARY KEY,
    id_hop_dong INT NOT NULL,
    id_dich_vu_di_kem INT NOT NULL,
    FOREIGN KEY (id_hop_dong)
        REFERENCES hop_dong (id_hop_dong) on update cascade on delete cascade,
    FOREIGN KEY (id_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (id_dich_vu_di_kem) on update cascade on delete cascade,
    so_luong INT NOT NULL
);



INSERT INTO vi_tri (ten_vi_tri)
VALUES
('Lễ tân'),
('Phục vụ'),
('Chuyên viên'),
('Giám sát'),
('Quản lý'),
('Giám đốc');

INSERT INTO trinh_do (ten_trinh_do)
VALUES
('Trung cấp'),
('Cao đẳng'),
('Đại học'),
('Sau đại học');

INSERT INTO bo_phan (ten_bo_phan)
VALUES
('Sale - Marketing'),
('Hành chính'),
('Quản lý'),
('Phục vụ');

INSERT INTO loai_khach (ten_loai_khach)
VALUES
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

INSERT INTO kieu_thue (ten_kieu_thue, gia)
VALUES
('Năm', 800000000),
('Tháng', 90000000),
('Ngày', 4000000),
('Giờ', 600000);

INSERT INTO loai_dich_vu (ten_loai_dich_vu)
VALUES
('Villa'),
('House'),
('Room');

INSERT INTO dich_vu_di_kem (ten_dich_vu_di_kem, gia, don_vi, trang_thai_kha_dung)
VALUES
('massage', 1000000, 1, 'Đang sử dụng'),
('karaoke', 500000, 1, 'Đang sử dụng'),
('Thức ăn', 300000, 1, 'Đang sử dụng'),
('Gym', 800000, 1, 'Đang sử dụng'),
('Nước uống', 100000, 1, 'Đang sử dụng'),
('Tham quan', 1000000, 1, 'Đang sử dụng');

INSERT INTO nhan_vien (ho_ten_nhan_vien, id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi)
VALUES
('Nguyễn Văn Dương', 5, 3, 4, '1987-01-25', '201752386', 30000000, '090379867', 'asd123@gmail.com', 'Huế'),
('Đặng Văn Bình', 5, 4, 4, '1980-2-11', '200345367', 30000000, '0905134023', 'binh123@gmail.com', 'Hà Nội'),
('Lê Thị Hương', 6, 4, 4, '1975-01-25', '200465745', 25000000, '0905067945', 'huong678@gmail.com', 'Đà Nẵng'),
('Nguyễn Thị Ánh Hồng', 4, 3, 1, '1980-06-22', '2005612354', 22000000, '0903478178', 'hongabc@gmail.com', 'Đà Nẵng'),
('Trần Văn Khôi', 4, 3, 1, '1976-06-06', '200457091', 15000000, '0905514352', 'khoi76@gmail.com', 'Quảng Ngãi'),
('Lê Tuấn', 3, 3, 1, '1988-03-27', '201367212', 15000000, '0905474595', 'tuan88@gmail.com', 'Đà Nẵng'),
('Lê Thị Vân', 1, 2, 2, '1996-08-20', '201400389', 10000000, '0905578001', 'dbnlop12@gmail.com', 'Đà Nẵng'),
('Võ Văn Hoà', 3, 3, 1, '1990-01-25', '201423490', 14000000, '090398712', 'hoa90@gmail.com', 'TP. Hồ Chí Minh'),
('Lê Bá Tú', 2, 1, 3, '1996-05-30', '201450023', 6000000, '0905560018', 'tu96abc@gmail.com', 'Đà Nẵng'),
('Dương Bá Trạc', 2, 1, 3, '1993-08-27', '201587110', 7500000, '0905865132', 'trachsbc@gmail.com', 'Quảng Bình'),
('Nguyễn Thị Tuyết', 1, 2, 2, '2000-03-29', '201609134', 9000000, '0905589100', 'cvbop1508@gmail.com', 'Đà Nẵng');

 INSERT INTO khach_hang(id_loai_khach,ho_ten,ngay_sinh,so_CMND,so_dien_thoai,email,dia_chi)
        VALUES(1,'Nguyễn Tiến Dũng','2000-12-31','201570309','0123455552','dfgloip0054@gmail.com','Đà Nẵng'),
        (4,'Đoàn Thị Vy','1970-02-20','203126897','0903579772','vy123@gmail.com','Huế'),
        (1,'Trần Thị Bình','1985-08-27','201756613','0935328973','binh123@gmail.com','Đà Nẵng'),
        (3,'Nguyễn Văn Dương','1988-6-26','2015335123','0903567432','duongnguyen@gmail.com','TP. Hồ Chí Minh'),
        (1, 'Nguyễn Văn Long', '1974-03-22', '203412539', '0978523146', 'vbnjad238@gmail.com', 'Quãng Ngãi'),
         (1, 'Nguyễn Văn Linh', '1990-07-22', '203412539', '0978523146', 'vbnjad238@gmail.com', 'Quãng Ngãi'),
          (1, 'Nguyễn Hương', '1985-03-22', '203498739', '0973523146', 'vbnj12ad238@gmail.com', 'Vinh'),
        
        (2,'Đặng Thị Tuyết','1990-03-25','2018453654','0123456789','tuyetdang@gmail.com','Hà Nội'),
        (1,'Đặng Thị Thi','1990-03-25','2018434654','0123424589','thidang@gmail.com','Hà Nội');
        
 INSERT INTO dich_vu (ten_dich_vu, dien_tich, so_tang, so_nguoi_toi_da, chi_phi_thue, id_kieu_thue, id_loai_dich_vu, trang_thai)
VALUES
('Thuê Villa 3', 350, 2, 10, 3500000, 1, 1, 'Còn phòng'),
('Thuê Villa 2', 360, 2, 10, 4000000, 2, 2, 'Còn phòng'),
('Thuê Villa 1', 370, 3, 10, 5500000, 3, 3, 'Còn phòng'),
('Thuê House 1', 250, 2, 6, 3800000, 1, 2, 'Còn phòng'),
('Thuê House 2', 260, 2, 6, 3600000, 2, 2, 'Còn phòng'),
('Thuê House 3', 270, 2, 6, 4000000, 3, 2, 'Còn phòng'),
('Thuê Room 1', 150, 1, 4, 2500000, 1, 3, 'Còn phòng'),
('Thuê Room 2', 150, 1, 4, 2300000, 2, 3, 'Còn phòng'),
('Thuê Room 4', 150, 1, 4, 2700000, 3, 3, 'Còn phòng'),
('Thuê Room 5', 150, 1, 4, 2700000, 3, 3, 'Còn phòng'),
('Thuê Room 3', 150, 1, 4, 2800000, 4, 3, 'Còn phòng');    
   
        

      

			
	 INSERT INTO hop_dong(id_nhan_vien,id_khach_hang,id_dich_vu,
   ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,tong_tien)
   VALUES	(1,2,1,'2021-01-24','2021-10-25',5000000,5000000),
			(2,1,3,'2018-02-24','2021-10-25',2000000,5000000),
			(3,3,1,'2019-03-24','2021-10-25',1000000,1000000),
			(2,1,2,'2021-04-24','2021-10-25',2000000,5000000),
			(2,1,1,'2021-05-24','2021-10-25',2000000,5000000),
            (1,3,1,'2019-02-24','2021-10-25',1000000,1000000),
            (3,3,1,'2019-07-24','2021-10-25',1000000,1000000),
            (3,3,1,'2019-07-24','2021-10-25',1000000,1000000),
            (7,5,1,'2019-02-24','2019-10-25',1000000,1000000),
            (4,6,1,'2020-07-24','2020-10-25',1000000,1000000),
            (8,7,1,'2021-02-24','2021-11-25',1000000,1000000),
            (8,7,10,'2019-11-24','2021-11-25',1000000,1000000),
            (8,9,10,'2019-10-24','2019-11-25',1000000,1000000);
            
            

   INSERT INTO hop_dong_chi_tiet(so_luong,id_hop_dong,id_dich_vu_di_kem)
   VALUES (1, 1, 3),
	(3, 2, 2),
	(6, 3, 5),
	(7, 4, 1),
	(1, 5, 2),
	(11, 6, 4),
	(5, 7, 5),
	(4, 8, 3),
(2,9,2),
(3,10,4),
(3,12,4),
(5,11,3);



USE manager_furama;
/*
Task 2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” 
và có tối đa 15 ký tự.
*/
SELECT 
    *
FROM
    nhan_vien
WHERE (SELECT substring_index(ho_ten_nhan_vien,' ',-1)) REGEXP '^T|K|H'
        AND char_length(ho_ten_nhan_vien)<=15;
/*    
Task 3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
*/

SELECT 
    *
FROM
    khach_hang
WHERE
    (TIMESTAMPDIFF(YEAR,
        ngay_sinh,
        CURDATE()) BETWEEN 18 AND 50)
        AND (dia_chi = 'Đà Nẵng'
        OR dia_chi = 'Quảng Trị');    
        
/*
Task4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần 
đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
*/
SELECT 
    kh.ho_ten,
    lk.ten_loai_khach,
    COUNT(hd.id_dich_vu) AS so_lan_dat_phong
FROM
    khach_hang kh
        JOIN
    loai_khach lk ON kh.id_loai_khach = lk.id_loai_khach
        JOIN
    hop_dong hd ON kh.id_khach_hang = hd.id_khach_hang
        JOIN
    dich_vu dv ON dv.id_dich_vu = hd.id_dich_vu
WHERE
    lk.ten_loai_khach = 'Diamond'
GROUP BY kh.id_khach_hang
ORDER BY so_lan_dat_phong, ten_khach_hang;    

/* task 5:5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, 
NgayLamHopDong, NgayKetThuc, TongTien (Với TongTien được tính theo công thức như sau:
 ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng.
 (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).*/
 
SELECT 
    kh.id_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.id_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    SUM(dv.chi_phi_thue + dvdk.gia * dvdk.don_vi) AS tong_tien
FROM
    khach_hang kh
        LEFT JOIN
    hop_dong hd ON kh.id_khach_hang = hd.id_khach_hang
        LEFT JOIN
    dich_vu dv ON dv.id_dich_vu = hd.id_dich_vu
        LEFT JOIN
    loai_khach lk ON lk.id_loai_khach = kh.id_loai_khach
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hdct.id_hop_dong = hd.id_hop_dong
        LEFT JOIN
    dich_vu_di_kem dvdk ON dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
    GROUP BY kh.id_khach_hang;
    
 /*
Task6: Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được 
Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
*/

SELECT
 dv.id_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM 
dich_vu dv
JOIN
loai_dich_vu ldv ON dv.id_loai_dich_vu= ldv.id_loai_dich_vu
JOIN 
hop_dong hd ON hd.id_dich_vu=dv.id_dich_vu
WHERE NOT (month(hd.ngay_lam_hop_dong)=1 OR month(hd.ngay_lam_hop_dong)=2 OR
 month(hd.ngay_lam_hop_dong)=3);

/*
Task 7: Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ 
đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng trong năm 2019.
*/
    SELECT dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich,dv.so_nguoi_toi_da,
 dv.chi_phi_thue,ldv.ten_loai_dich_vu,hd.ngay_lam_hop_dong
FROM dich_vu dv LEFT JOIN loai_dich_vu ldv ON ldv.id_loai_dich_vu = dv.id_loai_dich_vu
LEFT JOIN hop_dong hd ON hd.id_dich_vu=dv.id_dich_vu
WHERE ( NOT (year(hd.ngay_lam_hop_dong)=2019) ) AND year(hd.ngay_lam_hop_dong)=2018;

/*
Task 8: Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoTenKhachHang không trùng nhau. 
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
*/
/* Bang Group By*/
SELECT ho_ten
FROM khach_hang
GROUP BY ho_ten;
/* Bang UNION*/
SELECT ho_ten
FROM khach_hang
UNION 
SELECT ho_ten
FROM khach_hang;
/* bang DISTINCT */
SELECT DISTINCT  ho_ten
FROM khach_hang;

/* 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 
thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng. */

SELECT COUNT(hd.id_hop_dong) as so_luong_hop_dong,
month(hd.ngay_lam_hop_dong) as thang

FROM hop_dong hd
WHERE year(hd.ngay_lam_hop_dong)=2019
GROUP BY month(hd.ngay_lam_hop_dong);

/* 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm.
 Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem 
 (được tính dựa trên việc count các IDHopDongChiTiet). */

SELECT hd.id_hop_dong,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,hd.tien_dat_coc
,COUNT(hdct.id_dich_vu_di_kem) AS so_luong_dich_vu_di_kem

FROM hop_dong hd JOIN hop_dong_chi_tiet hdct ON hd.id_hop_dong=hdct.id_hop_dong
GROUP BY hdct.id_hop_dong;

/* 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có 
TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.*/

SELECT
dvdk.id_dich_vu_di_kem,
dvdk.ten_dich_vu_di_kem,
dvdk.gia,
dvdk.don_vi
FROM dich_vu_di_kem dvdk 
JOIN hop_dong_chi_tiet hdct ON dvdk.id_dich_vu_di_kem=hdct.id_dich_vu_di_kem
JOIN hop_dong hd ON hd.id_hop_dong=hdct.id_hop_dong
JOIN khach_hang kh ON kh.id_khach_hang=hd.id_khach_hang
JOIN loai_khach lk ON lk.id_loai_khach=kh.id_loai_khach
WHERE 
lk.ten_loai_khach='Diamond'
AND (kh.dia_chi='Vinh'OR kh.dia_chi='Quảng Ngãi');

/* 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang,
 TenDichVu, SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả 
 các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 
nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.*/

SELECT 
H.id_hop_dong,
    D.id_dich_vu,
    H.ngay_lam_hop_dong,
    N.ho_ten_nhan_vien,
    K.ho_ten,
    K.so_dien_thoai,
    COUNT(T.id_dich_vu_di_kem) AS so_luong_dich_vu_di_kem
FROM dich_vu D
Join hop_dong H  on D.id_dich_vu = H.id_dich_vu
 JOIN  nhan_vien N on H.id_nhan_vien =N.id_nhan_vien
 JOIN khach_hang K on K.id_khach_hang=H.id_khach_hang
 JOIN hop_dong_chi_tiet T on T.id_hop_dong = H.id_hop_dong
JOIN dich_vu_di_kem V on V.id_dich_vu_di_kem = T.id_dich_vu_di_kem
WHERE year(ngay_lam_hop_dong)=2019 AND quarter(ngay_lam_hop_dong)=4
AND D.id_dich_vu NOT IN (SELECT
            D.id_dich_vu
        FROM
            dich_vu D
                JOIN
            hop_dong H ON D.id_dich_vu = H.id_dich_vu
        WHERE
            (QUARTER(H.ngay_lam_hop_dong) = 1
                OR QUARTER(H.ngay_lam_hop_dong) = 2)
                AND (YEAR(H.ngay_lam_hop_dong) = 2019))
GROUP BY T.id_hop_dong;

/* Task 13. Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất
 bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có 
 số lần sử dụng nhiều như nhau).
 */
 SELECT
 hdct.id_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem,
    COUNT(hdct.id_dich_vu_di_kem) AS so_luong_dich_vu_di_kem
 FROM hop_dong_chi_tiet hdct
 JOIN dich_vu_di_kem dvdk ON dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
 GROUP BY hdct.id_dich_vu_di_kem
HAVING COUNT(hdct.id_dich_vu_di_kem) >= ALL (SELECT 
        COUNT(hdct.id_dich_vu_di_kem)
    FROM
        hop_dong_chi_tiet hdct
    GROUP BY hdct.id_dich_vu_di_kem);
    
    /*
Task 14: Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
*/
 SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT 
   *
FROM
    hop_dong hd
        JOIN
    dich_vu dv ON hd.id_dich_vu = dv.id_dich_vu
        JOIN
    loai_dich_vu ldv ON ldv.id_loai_dich_vu = dv.id_loai_dich_vu
        JOIN
    hop_dong_chi_tiet hdct ON hdct.id_hop_dong = hd.id_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
   
GROUP BY hdct.id_dich_vu_di_kem
HAVING COUNT(hdct.id_dich_vu_di_kem) = 1;

/*
Task 15: Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi 
mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.
*/

SELECT
	nv.id_nhan_vien,
	nv.ho_ten_nhan_vien,
	td.ten_trinh_do,
	bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi,
    COUNT(hd.id_hop_dong) AS so_luong_lap_hop_dong
FROM nhan_vien nv
JOIN hop_dong hd ON nv.id_nhan_vien=hd.id_nhan_vien
JOIN trinh_do td ON nv.id_trinh_do=td.id_trinh_do
JOIN bo_phan bp ON bp.id_bo_phan=nv.id_bo_phan
WHERE YEAR(hd.ngay_lam_hop_dong) between 2018 and 2019
GROUP By nv.id_nhan_vien
HAVING count(hd.id_hop_dong)<=3;

/*
Task 16: Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.
*/
SET SQL_SAFE_UPDATES=0;
	DELETE FROM nhan_vien
	WHERE id_nhan_vien NOT IN(
	SELECT 
	id_nhan_vien
    FROM (SELECT 
    nv.id_nhan_vien
    FROM nhan_vien nv
    
    JOIN hop_dong hd ON nv.id_nhan_vien=hd.id_nhan_vien
    WHERE year(hd.ngay_lam_hop_dong) BETWEEN 2017 and 2019
    GROUP BY id_nhan_vien
    HAVING COUNT(hd.id_hop_dong)>0)) ;
SET SQL_SAFE_UPDATES=1; 
    


    
    
    
    
    
    
    
    
    
    
    
