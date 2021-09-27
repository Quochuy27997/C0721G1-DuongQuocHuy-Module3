DROP DATABASE IF EXISTS quan_ly_ban_hang;
CREATE DATABASE quan_ly_ban_hang;
USE quan_ly_ban_hang;
CREATE TABLE customer(
c_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
c_name VARCHAR(60) NOT NULL,
c_age INT
);
CREATE TABLE `order`(
o_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
c_id INT NOT NULL,
o_date DATE,
o_total_price INT ,
FOREIGN KEY(c_id)
REFERENCES customer(c_id)
);
CREATE TABLE product(
p_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
p_name VARCHAR(60) NOT NULL,
p_price INT NOT NULL
);

CREATE TABLE order_detail(
o_id INT NOT NULL,
p_id INT NOT NULL,
o_quantity INT NOT NULL,
PRIMARY KEY(o_id,p_id),
FOREIGN KEY(o_id)
REFERENCES `order`(o_id),
FOREIGN KEY(p_id)
REFERENCES product(p_id)

);