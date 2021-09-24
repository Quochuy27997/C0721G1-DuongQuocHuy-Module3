DROP DATABASE IF EXISTS manager_furama;
CREATE DATABASE IF NOT EXISTS manager_furama;
USE manager_furama;
CREATE TABLE nha_vien(
idNhanVien INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
hoTen VARCHAR(255) NOT NULL,
idViTri INT NOT NULL,
idTrinhDo INT NOT NULL,
idBoPhan INT NOT NULL,
ngaySinh DATE,
soCMND VARCHAR(45),
luong INT,
SDT  VARCHAR(45),
email VARCHAR(45),
diaChi   VARCHAR(45)
);