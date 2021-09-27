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
        (2,'Đặng Thị Tuyết','1990-03-25','2018453654','0123456789','tuyetdang@gmail.com','Hà Nội');
        
 INSERT INTO dich_vu (ten_dich_vu, dien_tich, so_tang, so_nguoi_toi_da, chi_phi_thue, id_kieu_thue, id_loai_dich_vu, trang_thai)
VALUES
('Thuê Villa 3', 350, 2, 10, 3500000, 1, 1, 'Còn phòng'),
('Thuê Villa 2', 360, 2, 10, 4000000, 2, 1, 'Còn phòng'),
('Thuê Villa 1', 370, 3, 10, 5500000, 3, 1, 'Còn phòng'),
('Thuê House 1', 250, 2, 6, 3800000, 1, 2, 'Còn phòng'),
('Thuê House 2', 260, 2, 6, 3600000, 2, 2, 'Còn phòng'),
('Thuê House 3', 270, 2, 6, 4000000, 3, 2, 'Còn phòng'),
('Thuê Room 1', 150, 1, 4, 2500000, 1, 3, 'Còn phòng'),
('Thuê Room 2', 150, 1, 4, 2300000, 2, 3, 'Còn phòng'),
('Thuê Room 4', 150, 1, 4, 2700000, 3, 3, 'Còn phòng'),
('Thuê Room 3', 150, 1, 4, 2800000, 4, 3, 'Còn phòng');       
        
INSERT INTO hop_dong (id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc)
VALUES
      ( 4, 3, 1, '2019-05-01', '2019-05-10', 4500000),
(5, 4, 5, '2018-10-01', '2018-10-31', 3500000),
(3, 3, 1, '2018-12-07', '2018-12-17', 3700000),
(2, 4, 2, '2019-10-15', '2019-10-28', 4500000),
(4, 3, 1, '2019-03-15', '2019-03-27', 4000000),
(2, 3, 2, '2018-11-20', '2018-11-25', 4500000),
(2, 2, 1, '2019-11-01', '2019-11-09', 4800000) ;

			
	 INSERT INTO hop_dong(id_nhan_vien,id_khach_hang,id_dich_vu,
   ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,tong_tien)
   VALUES	(1,2,1,'2021-01-24','2021-10-25',5000000,5000000),
			(2,1,3,'2018-02-24','2021-10-25',2000000,5000000),
			(3,3,1,'2019-03-24','2021-10-25',1000000,1000000),
			(2,1,2,'2021-04-24','2021-10-25',2000000,5000000),
			(2,1,1,'2021-05-24','2021-10-25',2000000,5000000);

   INSERT INTO hop_dong_chi_tiet(so_luong,id_hop_dong,id_dich_vu_di_kem)
   VALUES (1, 1, 3),
(3, 1, 2),
(6, 2, 5),
(7, 5, 1),
(1, 2, 2),
(11, 3, 4),
(5, 3, 5);

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
ORDER BY so_lan_dat_phong;    


    