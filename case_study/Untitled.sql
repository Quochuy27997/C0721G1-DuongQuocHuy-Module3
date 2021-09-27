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