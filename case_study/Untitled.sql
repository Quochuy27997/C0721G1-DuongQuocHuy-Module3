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
('L??? t??n'),
('Ph???c v???'),
('Chuy??n vi??n'),
('Gi??m s??t'),
('Qu???n l??'),
('Gi??m ?????c');

INSERT INTO trinh_do (ten_trinh_do)
VALUES
('Trung c???p'),
('Cao ?????ng'),
('?????i h???c'),
('Sau ?????i h???c');

INSERT INTO bo_phan (ten_bo_phan)
VALUES
('Sale - Marketing'),
('H??nh ch??nh'),
('Qu???n l??'),
('Ph???c v???');

INSERT INTO loai_khach (ten_loai_khach)
VALUES
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

INSERT INTO kieu_thue (ten_kieu_thue, gia)
VALUES
('N??m', 800000000),
('Th??ng', 90000000),
('Ng??y', 4000000),
('Gi???', 600000);

INSERT INTO loai_dich_vu (ten_loai_dich_vu)
VALUES
('Villa'),
('House'),
('Room');

INSERT INTO dich_vu_di_kem (ten_dich_vu_di_kem, gia, don_vi, trang_thai_kha_dung)
VALUES
('massage', 1000000, 1, '??ang s??? d???ng'),
('karaoke', 500000, 1, '??ang s??? d???ng'),
('Th???c ??n', 300000, 1, '??ang s??? d???ng'),
('Gym', 800000, 1, '??ang s??? d???ng'),
('N?????c u???ng', 100000, 1, '??ang s??? d???ng'),
('Tham quan', 1000000, 1, '??ang s??? d???ng');

INSERT INTO nhan_vien (ho_ten_nhan_vien, id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi)
VALUES
('Nguy???n V??n D????ng', 5, 3, 4, '1987-01-25', '201752386', 30000000, '090379867', 'asd123@gmail.com', 'Hu???'),
('?????ng V??n B??nh', 5, 4, 4, '1980-2-11', '200345367', 30000000, '0905134023', 'binh123@gmail.com', 'H?? N???i'),
('L?? Th??? H????ng', 6, 4, 4, '1975-01-25', '200465745', 25000000, '0905067945', 'huong678@gmail.com', '???? N???ng'),
('Nguy???n Th??? ??nh H???ng', 4, 3, 1, '1980-06-22', '2005612354', 22000000, '0903478178', 'hongabc@gmail.com', '???? N???ng'),
('Tr???n V??n Kh??i', 4, 3, 1, '1976-06-06', '200457091', 15000000, '0905514352', 'khoi76@gmail.com', 'Qu???ng Ng??i'),
('L?? Tu???n', 3, 3, 1, '1988-03-27', '201367212', 15000000, '0905474595', 'tuan88@gmail.com', '???? N???ng'),
('L?? Th??? V??n', 1, 2, 2, '1996-08-20', '201400389', 10000000, '0905578001', 'dbnlop12@gmail.com', '???? N???ng'),
('V?? V??n Ho??', 3, 3, 1, '1990-01-25', '201423490', 14000000, '090398712', 'hoa90@gmail.com', 'TP. H??? Ch?? Minh'),
('L?? B?? T??', 2, 1, 3, '1996-05-30', '201450023', 6000000, '0905560018', 'tu96abc@gmail.com', '???? N???ng'),
('D????ng B?? Tr???c', 2, 1, 3, '1993-08-27', '201587110', 7500000, '0905865132', 'trachsbc@gmail.com', 'Qu???ng B??nh'),
('Nguy???n Th??? Tuy???t', 1, 2, 2, '2000-03-29', '201609134', 9000000, '0905589100', 'cvbop1508@gmail.com', '???? N???ng');

 INSERT INTO khach_hang(id_loai_khach,ho_ten,ngay_sinh,so_CMND,so_dien_thoai,email,dia_chi)
        VALUES(1,'Nguy???n Ti???n D??ng','2000-12-31','201570309','0123455552','dfgloip0054@gmail.com','???? N???ng'),
        (4,'??o??n Th??? Vy','1970-02-20','203126897','0903579772','vy123@gmail.com','Hu???'),
        (1,'Tr???n Th??? B??nh','1985-08-27','201756613','0935328973','binh123@gmail.com','???? N???ng'),
        (3,'Nguy???n V??n D????ng','1988-6-26','2015335123','0903567432','duongnguyen@gmail.com','TP. H??? Ch?? Minh'),
        (1, 'Nguy???n V??n Long', '1974-03-22', '203412539', '0978523146', 'vbnjad238@gmail.com', 'Qu??ng Ng??i'),
         (1, 'Nguy???n V??n Linh', '1990-07-22', '203412539', '0978523146', 'vbnjad238@gmail.com', 'Qu??ng Ng??i'),
          (1, 'Nguy???n H????ng', '1985-03-22', '203498739', '0973523146', 'vbnj12ad238@gmail.com', 'Vinh'),
        
        (2,'?????ng Th??? Tuy???t','1990-03-25','2018453654','0123456789','tuyetdang@gmail.com','H?? N???i'),
        (1,'?????ng Th??? Thi','1990-03-25','2018434654','0123424589','thidang@gmail.com','H?? N???i');
        
 INSERT INTO dich_vu (ten_dich_vu, dien_tich, so_tang, so_nguoi_toi_da, chi_phi_thue, id_kieu_thue, id_loai_dich_vu, trang_thai)
VALUES
('Thu?? Villa 3', 350, 2, 10, 3500000, 1, 1, 'C??n ph??ng'),
('Thu?? Villa 2', 360, 2, 10, 4000000, 2, 2, 'C??n ph??ng'),
('Thu?? Villa 1', 370, 3, 10, 5500000, 3, 3, 'C??n ph??ng'),
('Thu?? House 1', 250, 2, 6, 3800000, 1, 2, 'C??n ph??ng'),
('Thu?? House 2', 260, 2, 6, 3600000, 2, 2, 'C??n ph??ng'),
('Thu?? House 3', 270, 2, 6, 4000000, 3, 2, 'C??n ph??ng'),
('Thu?? Room 1', 150, 1, 4, 2500000, 1, 3, 'C??n ph??ng'),
('Thu?? Room 2', 150, 1, 4, 2300000, 2, 3, 'C??n ph??ng'),
('Thu?? Room 4', 150, 1, 4, 2700000, 3, 3, 'C??n ph??ng'),
('Thu?? Room 5', 150, 1, 4, 2700000, 3, 3, 'C??n ph??ng'),
('Thu?? Room 3', 150, 1, 4, 2800000, 4, 3, 'C??n ph??ng');    
   
        

      

			
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
Task 2: Hi???n th??? th??ng tin c???a t???t c??? nh??n vi??n c?? trong h??? th???ng c?? t??n b???t ?????u l?? m???t trong c??c k?? t??? ???H???, ???T??? ho???c ???K??? 
v?? c?? t???i ??a 15 k?? t???.
*/
SELECT 
    *
FROM
    nhan_vien
WHERE (SELECT substring_index(ho_ten_nhan_vien,' ',-1)) REGEXP '^T|K|H'
        AND char_length(ho_ten_nhan_vien)<=15;
/*    
Task 3: Hi???n th??? th??ng tin c???a t???t c??? kh??ch h??ng c?? ????? tu???i t??? 18 ?????n 50 tu???i v?? c?? ?????a ch??? ??? ??????? N???ng??? ho???c ???Qu???ng Tr??????.
*/

SELECT 
    *
FROM
    khach_hang
WHERE
    (TIMESTAMPDIFF(YEAR,
        ngay_sinh,
        CURDATE()) BETWEEN 18 AND 50)
        AND (dia_chi = '???? N???ng'
        OR dia_chi = 'Qu???ng Tr???');    
        
/*
Task4: ?????m xem t????ng ???ng v???i m???i kh??ch h??ng ???? t???ng ?????t ph??ng bao nhi??u l???n. K???t qu??? hi???n th??? ???????c s???p x???p t??ng d???n theo s??? l???n 
?????t ph??ng c???a kh??ch h??ng. Ch??? ?????m nh???ng kh??ch h??ng n??o c?? T??n lo???i kh??ch h??ng l?? ???Diamond???.
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

/* task 5:5.	Hi???n th??? IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, 
NgayLamHopDong, NgayKetThuc, TongTien (V???i TongTien ???????c t??nh theo c??ng th???c nh?? sau:
 ChiPhiThue + SoLuong*Gia, v???i SoLuong v?? Gi?? l?? t??? b???ng DichVuDiKem) cho t???t c??? c??c Kh??ch h??ng ???? t???ng ?????t ph???ng.
 (Nh???ng Kh??ch h??ng n??o ch??a t???ng ?????t ph??ng c??ng ph???i hi???n th??? ra).*/
 
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
Task6: Hi???n th??? IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu c???a t???t c??? c??c lo???i D???ch v??? ch??a t???ng ???????c 
Kh??ch h??ng th???c hi???n ?????t t??? qu?? 1 c???a n??m 2019 (Qu?? 1 l?? th??ng 1, 2, 3).
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
Task 7: Hi???n th??? th??ng tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu c???a t???t c??? c??c lo???i d???ch v??? 
???? t???ng ???????c Kh??ch h??ng ?????t ph??ng trong n??m 2018 nh??ng ch??a t???ng ???????c Kh??ch h??ng ?????t ph??ng trong n??m 2019.
*/
    SELECT dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich,dv.so_nguoi_toi_da,
 dv.chi_phi_thue,ldv.ten_loai_dich_vu,hd.ngay_lam_hop_dong
FROM dich_vu dv LEFT JOIN loai_dich_vu ldv ON ldv.id_loai_dich_vu = dv.id_loai_dich_vu
LEFT JOIN hop_dong hd ON hd.id_dich_vu=dv.id_dich_vu
WHERE ( NOT (year(hd.ngay_lam_hop_dong)=2019) ) AND year(hd.ngay_lam_hop_dong)=2018;

/*
Task 8: Hi???n th??? th??ng tin HoTenKhachHang c?? trong h??? th???ng, v???i y??u c???u HoTenKhachHang kh??ng tr??ng nhau. 
H???c vi??n s??? d???ng theo 3 c??ch kh??c nhau ????? th???c hi???n y??u c???u tr??n
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

/* 9.	Th???c hi???n th???ng k?? doanh thu theo th??ng, ngh??a l?? t????ng ???ng v???i m???i th??ng trong n??m 2019 
th?? s??? c?? bao nhi??u kh??ch h??ng th???c hi???n ?????t ph??ng. */

SELECT COUNT(hd.id_hop_dong) as so_luong_hop_dong,
month(hd.ngay_lam_hop_dong) as thang

FROM hop_dong hd
WHERE year(hd.ngay_lam_hop_dong)=2019
GROUP BY month(hd.ngay_lam_hop_dong);

/* 10.	Hi???n th??? th??ng tin t????ng ???ng v???i t???ng H???p ?????ng th?? ???? s??? d???ng bao nhi??u D???ch v??? ??i k??m.
 K???t qu??? hi???n th??? bao g???m IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem 
 (???????c t??nh d???a tr??n vi???c count c??c IDHopDongChiTiet). */

SELECT hd.id_hop_dong,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,hd.tien_dat_coc
,COUNT(hdct.id_dich_vu_di_kem) AS so_luong_dich_vu_di_kem

FROM hop_dong hd JOIN hop_dong_chi_tiet hdct ON hd.id_hop_dong=hdct.id_hop_dong
GROUP BY hdct.id_hop_dong;

/* 11.	Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???? ???????c s??? d???ng b???i nh???ng Kh??ch h??ng c?? 
TenLoaiKhachHang l?? ???Diamond??? v?? c?? ?????a ch??? l?? ???Vinh??? ho???c ???Qu???ng Ng??i???.*/

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
AND (kh.dia_chi='Vinh'OR kh.dia_chi='Qu???ng Ng??i');

/* 12.	Hi???n th??? th??ng tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang,
 TenDichVu, SoLuongDichVuDikem (???????c t??nh d???a tr??n t???ng H???p ?????ng chi ti???t), TienDatCoc c???a t???t c??? 
 c??c d???ch v??? ???? t???ng ???????c kh??ch h??ng ?????t v??o 3 th??ng cu???i n??m 2019 
nh??ng ch??a t???ng ???????c kh??ch h??ng ?????t v??o 6 th??ng ?????u n??m 2019.*/

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

/* Task 13. Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???????c s??? d???ng nhi???u nh???t
 b???i c??c Kh??ch h??ng ???? ?????t ph??ng. (L??u ?? l?? c?? th??? c?? nhi???u d???ch v??? c?? 
 s??? l???n s??? d???ng nhi???u nh?? nhau).
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
Task 14: Hi???n th??? th??ng tin t???t c??? c??c D???ch v??? ??i k??m ch??? m???i ???????c s??? d???ng m???t l???n duy nh???t. 
Th??ng tin hi???n th??? bao g???m IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
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
Task 15: Hi???n thi th??ng tin c???a t???t c??? nh??n vi??n bao g???m IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi 
m???i ch??? l???p ???????c t???i ??a 3 h???p ?????ng t??? n??m 2018 ?????n 2019.
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
Task 16: X??a nh???ng Nh??n vi??n ch??a t???ng l???p ???????c h???p ?????ng n??o t??? n??m 2017 ?????n n??m 2019.
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
    


    
    
    
    
    
    
    
    
    
    
    
