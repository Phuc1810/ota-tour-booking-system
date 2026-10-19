-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th8 09, 2026 lúc 02:46 AM
-- Phiên bản máy phục vụ: 9.1.0
-- Phiên bản PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tourdulich`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `MaAdmin` int NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(150) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `MaTK` int DEFAULT NULL,
  PRIMARY KEY (`MaAdmin`),
  UNIQUE KEY `MaTK` (`MaTK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

DROP TABLE IF EXISTS `binhluan`;
CREATE TABLE IF NOT EXISTS `binhluan` (
  `MaBL` int NOT NULL AUTO_INCREMENT,
  `MaTin` int NOT NULL,
  `MaKH` int NOT NULL,
  `NoiDung` text NOT NULL,
  `NgayBinhLuan` datetime DEFAULT CURRENT_TIMESTAMP,
  `TrangThai` varchar(50) DEFAULT 'Hiển thị',
  `PhanHoi` text,
  PRIMARY KEY (`MaBL`),
  KEY `MaTin` (`MaTin`),
  KEY `MaKH` (`MaKH`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`MaBL`, `MaTin`, `MaKH`, `NoiDung`, `NgayBinhLuan`, `TrangThai`, `PhanHoi`) VALUES
(1, 21, 11, 'Bài viết hay và có hữu ích', '2026-07-17 15:40:45', 'Hiển thị', NULL),
(2, 8, 11, 'Bài viết hay!', '2026-08-03 09:40:49', 'Hiển thị', NULL),
(3, 11, 11, 'bài viết hay', '2026-08-03 15:45:47', 'Hiển thị', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chinhanh`
--

DROP TABLE IF EXISTS `chinhanh`;
CREATE TABLE IF NOT EXISTS `chinhanh` (
  `MaCN` int NOT NULL AUTO_INCREMENT,
  `TenChiNhanh` varchar(255) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `SDT` varchar(20) DEFAULT NULL,
  `MaCTY` int DEFAULT NULL,
  PRIMARY KEY (`MaCN`),
  KEY `MaCTY` (`MaCTY`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `chinhanh`
--

INSERT INTO `chinhanh` (`MaCN`, `TenChiNhanh`, `DiaChi`, `SDT`, `MaCTY`) VALUES
(1, 'Chi Nhánh Hà Nội', '12 Hoàn Kiếm, Phường Hàng Trống, Hà Nội', '0243 888 999', 1),
(2, 'Chi Nhánh Nha Trang', '98 Trần Phú, TP Nha Trang, Khánh Hòa', '0258 666 777', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuongtrinhkhuyenmai`
--

DROP TABLE IF EXISTS `chuongtrinhkhuyenmai`;
CREATE TABLE IF NOT EXISTS `chuongtrinhkhuyenmai` (
  `MaCTKM` int NOT NULL AUTO_INCREMENT,
  `TenKM` varchar(255) DEFAULT NULL,
  `NoiDung` text,
  `AnhDaiDien` varchar(255) DEFAULT NULL,
  `PhanTramGiam` float DEFAULT NULL,
  `NgayBatDau` date DEFAULT NULL,
  `NgayKetThuc` date DEFAULT NULL,
  `TrangThai` enum('Hoạt động','Sắp diễn ra','Ngừng hoạt động','Hết hạn','Chờ duyệt') DEFAULT 'Hoạt động',
  PRIMARY KEY (`MaCTKM`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `chuongtrinhkhuyenmai`
--

INSERT INTO `chuongtrinhkhuyenmai` (`MaCTKM`, `TenKM`, `NoiDung`, `AnhDaiDien`, `PhanTramGiam`, `NgayBatDau`, `NgayKetThuc`, `TrangThai`) VALUES
(1, 'Giáng Sinh 2025 – Sale Cuối Năm', 'Chương trình khuyến mãi Giáng Sinh áp dụng cho một số tour. Ưu đãi lên đến 30%.', 'img/km-giangsinh.jpg', 30, '2025-12-01', '2025-12-31', 'Hết hạn'),
(2, 'Black Friday 2025', 'Khuyến mãi Black Friday áp dụng cho một số tour trong tháng 11.', 'img/km-blackfriday.jpg', 30, '2025-11-20', '2025-11-30', 'Hết hạn'),
(3, 'Mừng Xuân Sang - Lộc Vàng 2026', 'Chương trình giảm giá đặc biệt đón chào năm mới. Áp dụng cho các tour khởi hành từ ngày 18/5/2025 đến 1/1/2026', 'img/km_20251218_185441_6943eb81ba5a0.jpg', 40, '2025-12-18', '2026-01-01', 'Hết hạn'),
(4, 'Siêu sale 8.8', 'Siêu sale lớn đặc biệt trong năm cho các tour được đặt từ ngày 8/8 đến 10/8', 'img/km_4_1766061535.jpg', 0, '2026-08-08', '2026-08-10', 'Hoạt động'),
(5, 'Chào Xuân 2026 - Lì Xì Đầu Năm', 'Chương trình giảm giá đặc biệt cho các tour khởi hành dịp Tết Âm Lịch. Săn vé ngay để nhận ưu đãi!', 'img/km_20251218_210917_69440b0d15669.jpg', 70, '2026-01-10', '2026-02-20', 'Hết hạn'),
(6, 'a', 'a', 'img/km_20260109_042249_6960202955684.jpg', 40, '2026-01-09', '2026-01-29', 'Hết hạn'),
(26, 'Khuyến mãi Chào Thu 2026 - Vi vu không lo giá', 'Chương trình ưu đãi đặc biệt dành cho tất cả các khách hàng đặt tour trong giai đoạn mùa Thu 2026. Áp dụng giảm giá cho một số tour đặc biệt. Nhanh tay đặt chỗ để nhận ngay ưu đãi giảm giá trực tiếp trên tổng hóa đơn', 'promotions/promotion_26_1784038905.jpg', 15, '2026-08-02', '2026-08-31', 'Hoạt động'),
(27, 'Siêu sale 9.9', 'Siêu sale lớn đặc biệt trong tháng 9 cho các tour được đặt từ ngày 9/9 đến 15/9', 'promotions/promotion_27_1786096674.jpg', 25, '2026-09-09', '2026-09-15', 'Sắp diễn ra');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `congty`
--

DROP TABLE IF EXISTS `congty`;
CREATE TABLE IF NOT EXISTS `congty` (
  `MaCTY` int NOT NULL AUTO_INCREMENT,
  `TenCongTy` varchar(255) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `SoDienThoai` varchar(20) DEFAULT NULL,
  `Logo_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Logo_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`MaCTY`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `congty`
--

INSERT INTO `congty` (`MaCTY`, `TenCongTy`, `DiaChi`, `Email`, `SoDienThoai`, `Logo_1`, `Logo_2`) VALUES
(1, 'Công Ty TNHH Du Lịch VietJourney', '180 Cao Lỗ, P.Chánh Hưng, TP HCM', 'kinhdoanh.vietjourney@gmail.com', '083 252 0843', 'img/logo_1.png', 'img/logo_2.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgia`
--

DROP TABLE IF EXISTS `danhgia`;
CREATE TABLE IF NOT EXISTS `danhgia` (
  `MaDG` int NOT NULL AUTO_INCREMENT,
  `SoSao` int NOT NULL,
  `NoiDung` text COLLATE utf8mb4_general_ci,
  `NgayDG` date NOT NULL,
  `MaKH` int NOT NULL,
  `MaTour` int NOT NULL,
  `TrangThai` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'Hiển thị',
  `PhanHoi` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`MaDG`),
  UNIQUE KEY `uq_danhgia_kh_tour` (`MaKH`,`MaTour`),
  KEY `idx_danhgia_matour` (`MaTour`),
  KEY `idx_danhgia_makh` (`MaKH`),
  KEY `idx_danhgia_ngaydg` (`NgayDG`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhgia`
--

INSERT INTO `danhgia` (`MaDG`, `SoSao`, `NoiDung`, `NgayDG`, `MaKH`, `MaTour`, `TrangThai`, `PhanHoi`) VALUES
(1, 4, '', '2026-01-27', 11, 1, 'Hiển thị', 'Cảm ơn bạn đã đánh giá tour.'),
(2, 4, '', '2026-08-01', 11, 40, 'Hiển thị', NULL),
(3, 5, '', '2026-01-09', 11, 16, 'Hiển thị', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dondattour`
--

DROP TABLE IF EXISTS `dondattour`;
CREATE TABLE IF NOT EXISTS `dondattour` (
  `MaDon` int NOT NULL AUTO_INCREMENT,
  `NgayDat` datetime DEFAULT NULL,
  `SoLuongNguoiLon` int DEFAULT NULL,
  `SoLuongTreEm` int DEFAULT NULL,
  `SoLuongTreNho` int DEFAULT NULL,
  `GiaNguoiLonApDung` decimal(15,2) DEFAULT NULL,
  `GiaTreEmApDung` decimal(15,2) DEFAULT NULL,
  `TongTienGoc` decimal(15,2) DEFAULT NULL,
  `TongTienPhaiTra` decimal(15,2) DEFAULT NULL,
  `TrangThai` varchar(50) DEFAULT NULL,
  `MaKH` int DEFAULT NULL,
  `MaTour` int DEFAULT NULL,
  `MaCTKM` int DEFAULT NULL,
  PRIMARY KEY (`MaDon`),
  KEY `MaKH` (`MaKH`),
  KEY `MaTour` (`MaTour`),
  KEY `MaCTKM` (`MaCTKM`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `dondattour`
--

INSERT INTO `dondattour` (`MaDon`, `NgayDat`, `SoLuongNguoiLon`, `SoLuongTreEm`, `SoLuongTreNho`, `GiaNguoiLonApDung`, `GiaTreEmApDung`, `TongTienGoc`, `TongTienPhaiTra`, `TrangThai`, `MaKH`, `MaTour`, `MaCTKM`) VALUES
(6, '2025-12-14 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã huỷ', 11, 1, 1),
(7, '2025-12-14 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã huỷ', 11, 1, 1),
(8, '2025-12-14 00:00:00', 1, 1, 0, 850000.00, 595000.00, 1445000.00, 1228250.00, 'Đã huỷ', 11, 27, NULL),
(9, '2025-12-14 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã huỷ', 11, 1, 1),
(10, '2025-12-14 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã huỷ', 11, 1, 1),
(11, '2025-12-14 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã hoàn tất', 11, 1, 1),
(12, '2025-12-14 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã hoàn tất', 11, 1, 1),
(13, '2025-12-14 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã huỷ', 11, 1, 1),
(14, '2025-12-14 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã hoàn tất', 11, 1, 1),
(15, '2025-12-15 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã hoàn tất', 11, 1, 1),
(16, '2025-12-15 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã huỷ', 11, 1, 1),
(17, '2025-12-15 00:00:00', 1, 0, 0, 7000.00, 4900.00, 7000.00, 6300.00, 'Đã hoàn tất', 11, 11, NULL),
(18, '2025-12-15 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã hoàn tất', 11, 1, 1),
(19, '2025-12-15 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã hoàn tất', 15, 1, 1),
(20, '2025-12-15 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã hoàn tất', 15, 1, 1),
(21, '2025-12-15 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã hoàn tất', 11, 1, 1),
(22, '2025-12-15 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã huỷ', 11, 1, 1),
(23, '2025-12-15 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã hoàn tất', 11, 1, 1),
(24, '2025-12-15 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã huỷ', 11, 1, 1),
(25, '2025-12-15 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã huỷ', 11, 1, 1),
(26, '2025-12-15 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã huỷ', 11, 1, 1),
(27, '2025-12-15 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã hoàn tất', 11, 1, 1),
(28, '2025-12-15 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã huỷ', 11, 1, 1),
(29, '2025-12-16 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã huỷ', 15, 1, 1),
(30, '2025-12-16 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã hoàn tất', 11, 1, 1),
(31, '2025-12-16 00:00:00', 2, 0, 0, 1200000.00, 840000.00, 2400000.00, 2040000.00, 'Đã hoàn tất', 11, 20, NULL),
(32, '2025-12-16 00:00:00', 1, 0, 0, 650000.00, 455000.00, 650000.00, 552500.00, 'Đã huỷ', 11, 25, NULL),
(33, '2025-12-16 00:00:00', 2, 1, 0, 650000.00, 455000.00, 1755000.00, 1491750.00, 'Đã huỷ', 11, 25, NULL),
(34, '2025-12-16 00:00:00', 2, 2, 1, 650000.00, 455000.00, 2210000.00, 1878500.00, 'Đã huỷ', 11, 25, NULL),
(35, '2025-12-16 00:00:00', 1, 0, 0, 2850000.00, 1995000.00, 2850000.00, 1995000.00, 'Đã huỷ', 11, 12, 1),
(36, '2025-12-16 00:00:00', 3, 0, 0, 2850000.00, 1995000.00, 8550000.00, 5985000.00, 'Đã huỷ', 11, 12, 1),
(37, '2025-12-16 00:00:00', 3, 1, 2, 2850000.00, 1995000.00, 10545000.00, 7381500.00, 'Đã huỷ', 11, 12, 1),
(38, '2025-12-16 00:00:00', 3, 1, 2, 2850000.00, 1995000.00, 10545000.00, 7381500.00, 'Đã hoàn tất', 11, 12, 1),
(39, '2025-12-16 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã hoàn tất', 11, 1, 1),
(40, '2025-12-16 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã hoàn tất', 11, 1, 1),
(41, '2025-12-16 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã hoàn tất', 15, 1, 1),
(42, '2025-12-16 00:00:00', 2, 1, 0, 10000.00, 7000.00, 27000.00, 18900.00, 'Đã huỷ', 11, 1, 1),
(43, '2025-12-17 00:00:00', 2, 0, 0, 10000.00, 7000.00, 20000.00, 14000.00, 'Đã huỷ', 11, 1, 1),
(44, '2025-12-17 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã huỷ', 11, 1, 1),
(45, '2025-12-18 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 6000.00, 'Đã huỷ', 11, 1, 4),
(46, '2025-12-18 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 4000.00, 'Đã huỷ', 11, 1, 4),
(47, '2025-12-18 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 5000.00, 'Đã huỷ', 11, 1, 4),
(48, '2025-12-18 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 5000.00, 'Đã huỷ', 11, 1, 4),
(49, '2025-12-18 00:00:00', 1, 0, 0, 2150000.00, 1505000.00, 2150000.00, 1720000.00, 'Đã huỷ', 11, 9, NULL),
(50, '2025-12-18 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 4000.00, 'Đã huỷ', 11, 1, 4),
(51, '2025-12-20 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 4000.00, 'Đã hoàn tất', 11, 1, 4),
(52, '2025-12-22 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 7000.00, 'Đã hoàn tất', 11, 1, 1),
(53, '2025-12-23 00:00:00', 1, 0, 0, 3900000.00, 2730000.00, 3900000.00, 3315000.00, 'Đã hoàn tất', 11, 16, NULL),
(54, '2025-12-23 00:00:00', 1, 2, 2, 10000.00, 7000.00, 24000.00, 16800.00, 'Đã hoàn tất', 11, 1, 1),
(55, '2026-01-09 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã huỷ', 11, 1, NULL),
(56, '2026-01-09 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã huỷ', 11, 1, NULL),
(57, '2026-01-09 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã huỷ', 11, 1, NULL),
(58, '2026-01-09 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã huỷ', 11, 1, NULL),
(59, '2026-01-27 00:00:00', 1, 0, 0, 7000.00, 4900.00, 7000.00, 6300.00, 'Đã hoàn tất', 11, 11, NULL),
(60, '2026-01-27 00:00:00', 1, 0, 0, 2850000.00, 1995000.00, 2850000.00, 2422500.00, 'Đã hoàn tiền', 11, 2, NULL),
(61, '2026-01-27 00:00:00', 2, 0, 0, 2850000.00, 1995000.00, 5700000.00, 4845000.00, 'Đã hoàn tiền', 11, 2, NULL),
(84, '2026-06-22 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã huỷ', 15, 1, NULL),
(85, '2026-07-02 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã huỷ', 15, 1, NULL),
(86, '2026-07-02 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã huỷ', 15, 1, NULL),
(87, '2026-07-02 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã huỷ', 11, 1, NULL),
(88, '2026-07-02 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã huỷ', 15, 1, NULL),
(89, '2026-07-02 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã hoàn tất', 11, 1, NULL),
(90, '2026-07-02 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã hoàn tất', 11, 1, NULL),
(91, '2026-07-02 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã hoàn tất', 11, 1, NULL),
(92, '2026-07-03 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã hoàn tất', 11, 1, NULL),
(93, '2026-07-06 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã hoàn tất', 11, 1, NULL),
(94, '2026-07-06 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã huỷ', 11, 1, NULL),
(95, '2026-07-12 00:00:00', 1, 0, 0, 2850000.00, 1995000.00, 2850000.00, 2422500.00, 'Đã huỷ', 11, 2, NULL),
(96, '2026-07-15 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã hoàn tất', 11, 1, NULL),
(97, '2026-07-15 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Yêu cầu huỷ', 11, 1, NULL),
(98, '2026-07-15 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã hoàn tất', 11, 1, NULL),
(99, '2026-07-15 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã huỷ', 11, 1, NULL),
(100, '2026-07-15 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã huỷ', 11, 1, NULL),
(101, '2026-07-16 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã hoàn tiền', 11, 1, NULL),
(102, '2026-07-16 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã hoàn tiền', 11, 1, NULL),
(103, '2026-07-19 00:00:00', 2, 0, 0, 2850000.00, 1995000.00, 5700000.00, 4845000.00, 'Đã huỷ', 11, 2, NULL),
(104, '2026-07-19 00:00:00', 1, 0, 0, 2850000.00, 1995000.00, 2850000.00, 2422500.00, 'Đã huỷ', 11, 2, NULL),
(105, '2026-07-23 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã huỷ', 11, 1, NULL),
(106, '2026-07-26 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã hoàn tất', 11, 1, NULL),
(107, '2026-07-31 00:00:00', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã huỷ', 11, 1, NULL),
(108, '2026-07-31 09:34:10', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã huỷ', 11, 1, NULL),
(109, '2026-07-31 09:51:03', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã huỷ', 11, 1, NULL),
(110, '2026-07-31 10:08:07', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã huỷ', 11, 1, NULL),
(111, '2026-07-31 10:30:15', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Yêu cầu huỷ', 11, 1, NULL),
(112, '2026-08-03 15:40:50', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã hoàn tiền', 11, 1, NULL),
(113, '2026-08-05 15:43:37', 1, 0, 0, 4500000.00, 3150000.00, 4500000.00, 4050000.00, 'Đã huỷ', 11, 47, NULL),
(114, '2026-08-06 15:16:08', 1, 0, 0, 10000.00, 7000.00, 10000.00, 9000.00, 'Đã hoàn tiền', 11, 1, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinhanhtour`
--

DROP TABLE IF EXISTS `hinhanhtour`;
CREATE TABLE IF NOT EXISTS `hinhanhtour` (
  `MaAnh` int NOT NULL AUTO_INCREMENT,
  `DuongDan` varchar(255) DEFAULT NULL,
  `LaAnhChinh` tinyint(1) DEFAULT NULL,
  `LoaiAnh` enum('banner','noibat','khuyenmai','chitiet') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'noibat',
  `MaTour` int DEFAULT NULL,
  PRIMARY KEY (`MaAnh`),
  KEY `MaTour` (`MaTour`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `hinhanhtour`
--

INSERT INTO `hinhanhtour` (`MaAnh`, `DuongDan`, `LaAnhChinh`, `LoaiAnh`, `MaTour`) VALUES
(1, 'img/hanoi.jpg', 1, 'banner', 1),
(2, 'img/sapa.jpg', 1, 'banner', 2),
(3, 'img/hagiang.jpg', 1, 'banner', 3),
(4, 'img/ninhbinh.jpg', 1, 'banner', 4),
(5, 'img/halong.jpg', 1, 'noibat', 5),
(6, 'img/mocchau.jpg', 1, 'noibat', 6),
(7, 'img/langson.jpg', 1, 'noibat', 7),
(8, 'img/yentu.jpg', 1, 'noibat', 8),
(9, 'img/maichau.jpg', 1, 'noibat', 9),
(10, 'img/caobang.jpg', 1, 'noibat', 10),
(11, 'img/hue.jpg', 1, 'noibat', 11),
(12, 'img/danang-hoian.jpg', 1, 'noibat', 12),
(13, 'img/dalat.jpg', 1, '', 13),
(14, 'img/quynhon.jpg', 1, '', 14),
(15, 'img/phongnha.jpg', 1, '', 15),
(16, 'img/nhatrang.jpg', 1, '', 16),
(17, 'img/buonmathuot.jpg', 1, '', 17),
(18, 'img/binhba.jpg', 1, '', 18),
(19, 'img/lyson.jpg', 1, '', 19),
(20, 'img/hangen.jpg', 1, '', 20),
(21, 'img/cantho.jpg', 1, '', 21),
(22, 'img/camau.jpg', 1, '', 22),
(23, 'img/phuquoc.jpg', 1, '', 23),
(24, 'img/vungtau.jpg', 1, '', 24),
(25, 'img/tayninh.jpg', 1, '', 25),
(26, 'img/bentre.jpg', 1, '', 26),
(27, 'img/dongthap.jpg', 1, '', 27),
(28, 'img/dainam.jpg', 1, '', 28),
(29, 'img/longan.jpg', 1, '', 29),
(30, 'img/soctrang.jpg', 1, '', 30),
(31, 'img/tb-hanoi.jpg', 1, '', 31),
(32, 'img/tb-sapa.jpg', 1, '', 32),
(33, 'img/tb-danang.jpg', 1, '', 33),
(34, 'img/tb-hoian.jpg', 1, '', 34),
(35, 'img/tb-nhatrang.jpg', 1, '', 35),
(36, 'img/tb-cantho.jpg', 1, '', 36),
(37, 'img/tb-mientay.jpg', 1, '', 37),
(38, 'img/tb-vungtau.jpg', 1, '', 38),
(39, 'img/tb-phuquoc.jpg', 1, NULL, 39),
(40, 'img/tb-xuyenviet.jpg', 1, '', 40),
(41, 'img/tour_41_1766217745.jpg', 1, 'noibat', 41),
(42, 'tours/tour_42_1783841212.jpg', 1, 'noibat', 42),
(43, 'img/sapa.jpg', 1, 'banner', 45),
(44, 'tours/tour_46_1785830101.jpg', 1, 'noibat', 46),
(45, 'tours/tour_47_20260805_150113_Rg7IwEqn.jpg', 1, 'noibat', 47),
(46, 'tours/tour_48_20260805_150113_ajqNrcmM.jpg', 1, 'noibat', 48),
(47, 'tours/tour_49_20260805_150113_YLVz0BtU.jpg', 1, 'noibat', 49),
(48, 'tours/tour_50_20260805_150113_T86drxrG.jpg', 1, 'noibat', 50),
(49, 'tours/tour_51_1786173199.jpg', 1, NULL, 51);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoantien`
--

DROP TABLE IF EXISTS `hoantien`;
CREATE TABLE IF NOT EXISTS `hoantien` (
  `MaHT` int NOT NULL AUTO_INCREMENT,
  `SoTienHoan` int NOT NULL,
  `NgayHoan` datetime NOT NULL,
  `LyDo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NganHang` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SoTaiKhoan` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TenTaiKhoan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MaDon` int NOT NULL,
  `PhanTramHoan` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MaHT`),
  KEY `idx_hoantien_madon` (`MaDon`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hoantien`
--

INSERT INTO `hoantien` (`MaHT`, `SoTienHoan`, `NgayHoan`, `LyDo`, `NganHang`, `SoTaiKhoan`, `TenTaiKhoan`, `MaDon`, `PhanTramHoan`) VALUES
(1, 1211250, '2026-01-27 00:00:00', 'Khách hàng huỷ tour', NULL, NULL, NULL, 60, 0),
(2, 2422500, '2026-01-27 00:00:00', 'Bận việc gia đình', NULL, NULL, NULL, 61, 0),
(5, 0, '2026-07-15 15:40:50', 'Khách hàng huỷ: Thay đổi kế hoạch', NULL, NULL, NULL, 97, 0),
(12, 4500, '2026-07-16 14:48:50', 'Khách hàng huỷ: Thay đổi kế hoạch', 'Vietcombank', '1051409249', 'TRAN HOAI PHUC', 101, 50),
(13, 4500, '2026-07-16 15:38:01', 'Khách hàng huỷ: Bận việc nhà', 'Vietcombank', '1051409249', 'TRAN HOAI PHUC', 102, 50),
(14, 0, '2026-08-01 15:17:38', 'Khách hàng huỷ: Bận việc', 'Vietcombank', '1051409249', 'TRAN HOAI PHUC', 111, 0),
(15, 6300, '2026-08-03 15:44:49', 'Khách hàng huỷ: Bận viẹc', 'Vietcombank', '1051409249', 'TRAN HOAI PHUC', 112, 70),
(16, 6300, '2026-08-06 15:19:21', 'Khách hàng huỷ: Ban viec', 'Vietcombank', '1051409249', 'TRAN HOAI PHUC', 114, 70);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE IF NOT EXISTS `khachhang` (
  `MaKH` int NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(150) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `SoDienThoai` varchar(20) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `GioiTinh` varchar(10) DEFAULT NULL,
  `MaTK` int DEFAULT NULL,
  PRIMARY KEY (`MaKH`),
  UNIQUE KEY `MaTK` (`MaTK`),
  UNIQUE KEY `uq_kh_email` (`Email`),
  UNIQUE KEY `uq_kh_sdt` (`SoDienThoai`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MaKH`, `HoTen`, `Email`, `SoDienThoai`, `DiaChi`, `NgaySinh`, `GioiTinh`, `MaTK`) VALUES
(11, 'Phúc Trần Hoài', 'tranhoaiphuc1810@gmail.com', '0234567890', '320 Hong Bang', '2004-10-06', 'Nam', 11),
(15, 'Trần Phúc', 'abc@gmail.com', '0832520843', '32 Cao Lo', '2025-12-02', 'Nam', 15),
(16, 'Hoai Phuc', 'trphuc1810@gmail.com', '0123456789', '320 Hong Bang', '2025-12-09', 'Nam', 16),
(18, 'phuc tran', 'dh52201255@gmail.com', NULL, '14 Hong Bang', '2025-11-06', 'Nam', 18),
(19, 'Phương Duong', 'phuong123@gmail.com', NULL, '21 cao lo', '2026-01-05', 'Nữ', 21),
(48, 'tran van a', NULL, '1234567899', '32 Cao Lo', '2026-06-03', 'Nam', 101),
(49, 'loan nguyen', NULL, '0812180972', '14 Hong Bang', '2026-06-10', 'Nữ', 102),
(50, 'thach tran', NULL, '0918430997', '14 Hong Bang', '2026-06-04', 'Nam', 103),
(66, 'phuong', NULL, NULL, NULL, NULL, NULL, 22),
(67, 'Hoai Anh', 'hoaianh1912@gmail.com', NULL, '14 Hong Bang', '2026-07-03', 'Nữ', 124);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lichsuxemtin`
--

DROP TABLE IF EXISTS `lichsuxemtin`;
CREATE TABLE IF NOT EXISTS `lichsuxemtin` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `MaTin` int UNSIGNED NOT NULL,
  `IP` varchar(45) NOT NULL,
  `NgayXem` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MaTin` (`MaTin`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `lichsuxemtin`
--

INSERT INTO `lichsuxemtin` (`id`, `MaTin`, `IP`, `NgayXem`) VALUES
(1, 10, '127.0.0.1', '2026-08-02 22:27:24'),
(2, 5, '127.0.0.1', '2026-08-02 22:27:44'),
(3, 4, '127.0.0.1', '2026-08-02 22:32:01'),
(4, 2, '127.0.0.1', '2026-08-02 22:32:19'),
(5, 4, '127.0.0.1', '2026-08-02 22:33:15'),
(6, 2, '127.0.0.1', '2026-08-02 22:33:22'),
(7, 1, '127.0.0.1', '2026-08-02 22:33:28'),
(8, 3, '127.0.0.1', '2026-08-02 22:33:42'),
(9, 1, '127.0.0.1', '2026-08-02 22:33:46'),
(10, 6, '127.0.0.1', '2026-08-02 22:34:10'),
(11, 4, '127.0.0.1', '2026-08-02 22:41:34'),
(12, 11, '127.0.0.1', '2026-08-02 22:47:08'),
(13, 4, '127.0.0.1', '2026-08-02 22:47:13'),
(14, 5, '127.0.0.1', '2026-08-02 22:47:56'),
(15, 4, '127.0.0.1', '2026-08-02 22:48:03'),
(16, 11, '127.0.0.1', '2026-08-02 22:48:08'),
(17, 21, '127.0.0.1', '2026-08-03 09:06:32'),
(18, 21, '127.0.0.1', '2026-08-03 09:37:44'),
(19, 8, '127.0.0.1', '2026-08-03 09:40:09'),
(20, 8, '127.0.0.1', '2026-08-03 09:40:35'),
(21, 11, '127.0.0.1', '2026-08-03 15:38:33'),
(22, 11, '127.0.0.1', '2026-08-03 15:45:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lichtrinhtour`
--

DROP TABLE IF EXISTS `lichtrinhtour`;
CREATE TABLE IF NOT EXISTS `lichtrinhtour` (
  `MaLT` int NOT NULL AUTO_INCREMENT,
  `NgayThu` int DEFAULT NULL,
  `TieuDe` varchar(255) DEFAULT NULL,
  `NoiDung` text,
  `MaTour` int DEFAULT NULL,
  PRIMARY KEY (`MaLT`),
  KEY `MaTour` (`MaTour`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `lichtrinhtour`
--

INSERT INTO `lichtrinhtour` (`MaLT`, `NgayThu`, `TieuDe`, `NoiDung`, `MaTour`) VALUES
(4, 1, 'Ngày 1: Hà Nội – Hà Giang – Quản Bạ', 'Sáng: Khởi hành từ Hà Nội đi Hà Giang. Trưa: Ăn trưa tại TP Hà Giang. Chiều: Tham quan cổng trời Quản Bạ, Núi Đôi Cô Tiên, nghỉ đêm tại Yên Minh.', 3),
(5, 2, 'Ngày 2: Cao nguyên đá Đồng Văn – Cột cờ Lũng Cú', 'Sáng: Di chuyển đi Đồng Văn, tham quan Dinh Vua Mèo, con đường Hạnh Phúc. Chiều: Chinh phục cột cờ Lũng Cú – điểm cực Bắc Tổ quốc, tối dạo chợ đêm Đồng Văn.', 3),
(6, 3, 'Ngày 3: Đèo Mã Pí Lèng – Trở về Hà Nội', 'Sáng: Check-in hẻm Tu Sản, đèo Mã Pí Lèng, ngắm sông Nho Quế. Trưa: Ăn trưa tại Hà Giang. Chiều: Lên xe về lại Hà Nội, kết thúc hành trình.', 3),
(7, 1, 'Ngày 1: Hà Nội – Tràng An – Hang Múa', 'Sáng: Khởi hành đi Ninh Bình, tham quan khu du lịch sinh thái Tràng An bằng thuyền. Trưa: Ăn trưa đặc sản dê núi. Chiều: Leo núi Hang Múa ngắm toàn cảnh Tam Cốc, chiều muộn về lại Hà Nội.', 4),
(8, 1, 'Ngày 1: Hà Nội – Hạ Long – Du thuyền', 'Sáng: Khởi hành đi Hạ Long, lên du thuyền, nhận phòng. Trưa: Thưởng thức bữa trưa hải sản trên tàu. Chiều: Tham quan hang Sửng Sốt/Luồn kayak, tắm biển. Tối: Ăn tối trên tàu, câu mực đêm.', 5),
(9, 2, 'Ngày 2: Vịnh Hạ Long – Hà Nội', 'Sáng: Đón bình minh trên boong tàu, tham gia tập Thái Cực Quyền/khởi động buổi sáng. Tham quan thêm một số điểm trong vịnh. Trưa: Trả phòng, dùng bữa trên tàu, xe đưa đoàn về lại Hà Nội.', 5),
(10, 1, 'Ngày 1: Hà Nội – Mộc Châu – Đồi chè', 'Sáng: Xuất phát đi Mộc Châu, ăn trưa tại thị trấn. Chiều: Tham quan đồi chè, vườn mận/vườn hoa theo mùa, check-in thung lũng mận Nà Ka hoặc đồi chè trái tim. Tối: Giao lưu văn nghệ, đốt lửa trại.', 6),
(11, 2, 'Ngày 2: Thác Dải Yếm – Happy Land – Hà Nội', 'Sáng: Tham quan thác Dải Yếm, cầu kính, khu du lịch Happy Land. Trưa: Ăn trưa tại nhà hàng. Chiều: Lên xe về Hà Nội, kết thúc tour.', 6),
(12, 1, 'Ngày 1: Hà Nội – Lạng Sơn – Chợ Đông Kinh', 'Sáng: Khởi hành đi Lạng Sơn, thăm động Tam Thanh, Nhị Thanh. Trưa: Ăn trưa tại Lạng Sơn. Chiều: Tham quan chợ Đông Kinh/mua sắm cửa khẩu Tân Thanh (nếu có), chiều muộn về Hà Nội.', 7),
(13, 1, 'Ngày 1: Hà Nội – Yên Tử – Hành hương', 'Sáng: Khởi hành đi Yên Tử, đi cáp treo lên chùa Hoa Yên, tham quan chùa Đồng. Trưa: Ăn trưa tại nhà hàng chân núi. Chiều: Tự do lễ Phật, chụp hình, sau đó lên xe về Hà Nội.', 8),
(14, 1, 'Ngày 1: Hà Nội – Thung lũng Mai Châu', 'Sáng: Xuất phát đi Mai Châu, dừng chân đèo Thung Khe chụp ảnh. Trưa: Ăn trưa tại bản Lác. Chiều: Đạp xe tham quan bản, trải nghiệm cuộc sống người Thái. Tối: Nghỉ nhà sàn, giao lưu văn nghệ.', 9),
(15, 2, 'Ngày 2: Mai Châu – Mua sắm đặc sản – Hà Nội', 'Sáng: Tự do dạo chợ bản, mua đồ dệt thổ cẩm và đặc sản. Trưa: Ăn trưa tại bản. Chiều: Lên xe về Hà Nội, kết thúc chương trình.', 9),
(16, 1, 'Ngày 1: Hà Nội – Cao Bằng – Thác Bản Giốc', 'Sáng: Khởi hành đi Cao Bằng. Trưa: Dùng bữa tại Bắc Kạn/Cao Bằng. Chiều: Di chuyển đến thác Bản Giốc, nhận phòng, tự do tham quan. Tối: Nghỉ đêm tại khách sạn gần thác.', 10),
(17, 2, 'Ngày 2: Thác Bản Giốc – Động Ngườm Ngao – Hồ Thang Hen', 'Sáng: Tham quan thác Bản Giốc bằng thuyền, check-in cột mốc biên giới. Chiều: Khám phá động Ngườm Ngao, hồ Thang Hen. Tối: Về TP Cao Bằng nghỉ đêm.', 10),
(18, 3, 'Ngày 3: Cao Bằng – Hà Nội', 'Sáng: Tham quan, mua đặc sản. Trưa: Ăn trưa tại Cao Bằng. Chiều: Khởi hành về Hà Nội, kết thúc tour.', 10),
(20, 1, 'Ngày 1: Đà Nẵng – Bà Nà Hills – Cầu Vàng', 'Sáng: Đón khách, di chuyển lên Bà Nà Hills, tham quan Cầu Vàng, vườn hoa Le Jardin. Trưa: Buffet tại Bà Nà. Chiều: Vui chơi Fantasy Park, quay về Đà Nẵng, tắm biển Mỹ Khê. Tối: Tự do khám phá Đà Nẵng.', 12),
(21, 2, 'Ngày 2: Ngũ Hành Sơn – Phố cổ Hội An', 'Sáng: Tham quan Ngũ Hành Sơn, làng đá Non Nước. Chiều: Di chuyển đến Hội An, dạo phố đèn lồng, chụp ảnh, thưởng thức ẩm thực địa phương. Tối: Trở lại Đà Nẵng/tiễn sân bay.', 12),
(22, 1, 'Ngày 1: Đà Lạt – Hồ Xuân Hương – Dinh Bảo Đại', 'Sáng: Đến Đà Lạt, nhận phòng. Chiều: Tham quan hồ Xuân Hương, Dinh Bảo Đại, chợ Đà Lạt. Tối: Tự do khám phá ẩm thực đêm.', 13),
(23, 2, 'Ngày 2: Thác Datanla – Đồi chè – Que Garden', 'Sáng: Tham quan thác Datanla, trải nghiệm máng trượt. Chiều: Check-in đồi chè Cầu Đất/Que Garden, vườn hoa. Tối: Giao lưu văn nghệ/BBQ (nếu có).', 13),
(24, 3, 'Ngày 3: Nông trại – Mua sắm – Trả khách', 'Sáng: Tham quan nông trại rau/hoa, mua đặc sản Đà Lạt. Trưa: Ăn trưa tại nhà hàng. Chiều: Tiễn khách ra sân bay/bến xe.', 13),
(25, 1, 'Ngày 1: Quy Nhơn – Kỳ Co – Eo Gió', 'Sáng: Đón khách tại Quy Nhơn, đi cano ra Kỳ Co tắm biển. Trưa: Ăn trưa hải sản. Chiều: Tham quan Eo Gió, Tịnh xá Ngọc Hòa. Tối: Tự do dạo biển Quy Nhơn.', 14),
(26, 2, 'Ngày 2: Tháp Đôi – Khu du lịch Hầm Hô/Trung Lương', 'Sáng: Tham quan Tháp Đôi, tìm hiểu văn hóa Chăm. Chiều: Tham quan khu du lịch Hầm Hô hoặc biển Trung Lương. Tối: Nghỉ đêm tại Quy Nhơn.', 14),
(27, 3, 'Ngày 3: Mua sắm đặc sản – Tiễn khách', 'Sáng: Mua đặc sản nem, bánh ít lá gai. Trưa: Ăn trưa tại nhà hàng. Chiều: Tiễn khách ra sân bay/ga, kết thúc tour.', 14),
(28, 1, 'Ngày 1: Động Phong Nha – Sông Son', 'Sáng: Khởi hành đi Phong Nha – Kẻ Bàng, lên thuyền trên sông Son vào động Phong Nha. Trưa: Ăn trưa tại nhà hàng. Chiều: Tham quan thêm một số điểm trong vườn quốc gia, tối nghỉ tại Đồng Hới.', 15),
(29, 2, 'Ngày 2: Động Thiên Đường – Trở về', 'Sáng: Tham quan động Thiên Đường với hệ thống măng nhũ kỳ ảo. Trưa: Ăn trưa. Chiều: Khởi hành về điểm xuất phát/tiễn khách tại sân bay, kết thúc tour.', 15),
(30, 1, 'Ngày 1: Nha Trang – City tour – Tháp Bà', 'Sáng: Đón khách, nhận phòng. Chiều: Tham quan Tháp Bà Ponagar, nhà thờ Núi, chợ Đầm. Tối: Tự do dạo biển Trần Phú.', 16),
(31, 2, 'Ngày 2: Tour 3 đảo/ VinWonders', 'Sáng: Lên tàu tham quan các đảo, tắm biển, lặn ngắm san hô (hoặc vui chơi tại VinWonders). Trưa: Ăn trưa trên đảo. Chiều: Tiếp tục tắm biển, tối về lại khách sạn.', 16),
(32, 3, 'Ngày 3: Tắm bùn khoáng – Mua sắm – Tiễn khách', 'Sáng: Tắm bùn khoáng nóng, thư giãn. Trưa: Ăn trưa tại nhà hàng. Chiều: Mua sắm đặc sản, tiễn khách ra sân bay/ga.', 16),
(33, 1, 'Ngày 1: Buôn Ma Thuột – Buôn Đôn', 'Sáng: Đến Buôn Ma Thuột, ăn sáng – nhận phòng. Chiều: Tham quan buôn Đôn, cầu treo, tìm hiểu văn hóa Êđê, cưỡi voi (nếu còn dịch vụ). Tối: Thưởng thức cà phê Ban Mê.', 17),
(34, 2, 'Ngày 2: Thác Dray Nur – Mua đặc sản', 'Sáng: Tham quan thác Dray Nur/Dray Sáp hùng vĩ. Trưa: Ăn trưa tại nhà hàng. Chiều: Mua đặc sản cà phê, tiêu, ca cao rồi tiễn khách.', 17),
(35, 1, 'Ngày 1: Nha Trang – Đảo Bình Ba', 'Sáng: Đi cano từ Nha Trang/Cam Ranh ra đảo Bình Ba, tắm biển, lặn ngắm san hô. Trưa: Ăn trưa với hải sản tươi sống. Chiều: Tham quan một số bãi biển, lô cốt cũ, chiều muộn quay về đất liền.', 18),
(36, 1, 'Ngày 1: Sa Kỳ – Đảo Lý Sơn – Tham quan đảo Lớn', 'Sáng: Đón khách tại cảng Sa Kỳ, làm thủ tục lên tàu cao tốc đi Lý Sơn. Trưa: Nhận phòng khách sạn, ăn trưa với hải sản địa phương. Chiều: Tham quan cổng Tò Vò, chùa Hang, núi Thới Lới, cột cờ Tổ quốc. Tối: Tự do dạo biển, thưởng thức hải sản nướng.', 19),
(37, 2, 'Ngày 2: Đảo Bé – Mua đặc sản – Trở về đất liền', 'Sáng: Đi cano sang Đảo Bé, tắm biển, chụp ảnh tại bãi biển hoang sơ, lặn ngắm san hô. Trưa: Ăn trưa trên đảo hoặc tại đảo Lớn. Chiều: Mua hành, tỏi Lý Sơn và hải sản khô làm quà, sau đó lên tàu về lại cảng Sa Kỳ, kết thúc chương trình.', 19),
(38, 1, 'Ngày 1: Trekking Hang Én', 'Sáng: Họp đoàn, hướng dẫn an toàn, khởi hành trekking vào vùng lõi Phong Nha – Kẻ Bàng. Chiều: Đến cửa hang, tham quan và chụp ảnh, nghỉ ngơi. Tối: Ăn tối picnic, sau đó quay ra điểm đón và kết thúc hành trình.', 20),
(39, 1, 'Ngày 1: Cần Thơ – Chợ nổi Cái Răng – Bến Ninh Kiều', 'Sáng: Đón khách tại trung tâm Cần Thơ, lên thuyền tham quan chợ nổi Cái Răng, thưởng thức trái cây và các món ăn sáng trên ghe. Trưa: Ăn trưa đặc sản miền Tây. Chiều: Tham quan nhà cổ Bình Thủy, vườn trái cây. Tối: Dạo Bến Ninh Kiều, đi du thuyền trên sông Hậu, tự do khám phá ẩm thực đêm.', 21),
(40, 1, 'Ngày 1: Cần Thơ – Cà Mau – Thành phố địa đầu Tổ quốc', 'Sáng: Khởi hành đi Cà Mau, dừng chân nghỉ ngơi trên đường. Trưa: Đến thành phố Cà Mau, nhận phòng khách sạn và ăn trưa. Chiều: Tham quan tượng đài Mũi Cà Mau thu nhỏ, quảng trường, chợ trung tâm. Tối: Tự do khám phá ẩm thực Cà Mau với các món cua, tôm, ba khía.', 22),
(41, 2, 'Ngày 2: Đất Mũi – Cột mốc tọa độ quốc gia – Trở về', 'Sáng: Di chuyển xuống Đất Mũi, tham quan cột mốc tọa độ quốc gia, cột mốc KM0, mốc tọa độ GPS và hệ sinh thái rừng ngập mặn. Trưa: Ăn trưa hải sản tại nhà hàng địa phương. Chiều: Lên xe về lại điểm đón ban đầu, kết thúc chương trình.', 22),
(42, 1, 'Ngày 1: Phú Quốc – Tham quan Đông đảo', 'Sáng: Đón khách tại sân bay hoặc bến tàu, đưa về khách sạn nhận phòng. Trưa: Ăn trưa đặc sản biển. Chiều: Tham quan Suối Tranh, làng chài Hàm Ninh, cơ sở nuôi cấy ngọc trai. Tối: Tự do dạo chợ đêm Phú Quốc, thưởng thức hải sản.', 23),
(43, 2, 'Ngày 2: Nam đảo – Cáp treo Hòn Thơm – Tắm biển', 'Sáng: Tham quan cảng An Thới, lên cáp treo Hòn Thơm, tắm biển và tham gia các trò chơi trên biển. Trưa: Ăn trưa buffet tại khu vui chơi hoặc nhà hàng địa phương. Chiều: Tham quan nhà thùng nước mắm, cơ sở sản xuất rượu sim, tắm biển tại Bãi Sao. Tối: Tự do khám phá đảo hoặc tham gia câu mực đêm (chi phí tự túc).', 23),
(44, 3, 'Ngày 3: Mua sắm đặc sản – Tiễn khách', 'Sáng: Tự do tắm biển, nghỉ ngơi. Trưa: Trả phòng khách sạn, ghé mua đặc sản khô, nước mắm, rượu sim. Chiều: Đưa khách ra sân bay hoặc bến tàu, kết thúc chương trình.', 23),
(45, 1, 'Ngày 1: TP.HCM – Vũng Tàu – Tượng Chúa Ki-tô – Bãi Sau', 'Sáng: Khởi hành đi Vũng Tàu, dừng chân ăn sáng và chụp hình trên đường đi. Đến nơi, tham quan tượng Chúa Ki-tô, ngắm toàn cảnh thành phố biển. Trưa: Ăn trưa tại nhà hàng hải sản. Chiều: Tắm biển Bãi Sau, tham quan ngọn hải đăng. Tối: Tự do dạo biển, thưởng thức hải sản và cà phê phố biển.', 24),
(46, 1, 'Ngày 1: TP.HCM – Núi Bà Đen – Tòa thánh Cao Đài', 'Sáng: Khởi hành đi Tây Ninh, tham quan khu du lịch núi Bà Đen, đi cáp treo chinh phục đỉnh núi, chiêm bái chùa Bà. Trưa: Ăn trưa tại nhà hàng địa phương. Chiều: Tham quan Tòa thánh Cao Đài, tìm hiểu kiến trúc và lịch sử hình thành đạo Cao Đài. Tối: Lên xe về lại điểm đón ban đầu, kết thúc chương trình.', 25),
(47, 1, 'Ngày 1: Mỹ Tho – Bến Tre – Du thuyền sông Tiền', 'Sáng: Khởi hành đi Mỹ Tho, tham quan chùa Vĩnh Tràng, xuống thuyền trên sông Tiền, ghé cồn Thới Sơn, thưởng thức trái cây và đờn ca tài tử. Trưa: Ăn trưa với các món đặc sản miền sông nước. Chiều: Tham quan lò kẹo dừa Bến Tre, đi xuồng chèo trong rạch dừa nước, nhận phòng homestay hoặc khách sạn. Tối: Giao lưu sinh hoạt miệt vườn, câu cá, nướng cá lóc (tùy chương trình).', 26),
(48, 2, 'Ngày 2: Làng nghề – Vườn trái cây – Trở về', 'Sáng: Đạp xe tham quan làng quê, tìm hiểu cuộc sống người dân, thăm vườn trái cây, thưởng thức trái chín tại vườn. Trưa: Ăn trưa, nghỉ ngơi. Chiều: Lên xe về lại TP.HCM hoặc điểm đón ban đầu, kết thúc tour.', 26),
(49, 1, 'Ngày 1: Đồng Tháp – Làng hoa Sa Đéc – Khu du lịch sinh thái', 'Sáng: Khởi hành đi Đồng Tháp, tham quan làng hoa Sa Đéc, chụp hình với muôn loài hoa đủ sắc màu. Trưa: Ăn trưa món đặc sản Đồng Tháp như cá lóc nướng, ốc bươu, chuột đồng. Chiều: Tham quan nhà cổ Huỳnh Thủy Lê, khu du lịch sinh thái Gáo Giồng hoặc Tràm Chim (tùy mùa). Tối: Khởi hành về lại điểm đón, kết thúc chương trình.', 27),
(50, 1, 'Ngày 1: KDL Đại Nam – Vui chơi giải trí – Tham quan đền đài', 'Sáng: Khởi hành đi khu du lịch Đại Nam, tham quan khu đền đài, ngắm hồ nước và núi non nhân tạo. Trưa: Ăn trưa trong khu du lịch. Chiều: Tự do vui chơi tại khu biển nhân tạo, công viên nước hoặc khu trò chơi mạo hiểm. Chiều muộn: Lên xe về lại điểm đón ban đầu.', 28),
(51, 1, 'Ngày 1: Long An – Làng nổi Tân Lập – Rừng tràm', 'Sáng: Khởi hành đi Long An, đến khu du lịch làng nổi Tân Lập, đi xuồng trên kênh rừng tràm, check in cầu chữ X, cầu tình yêu. Trưa: Ăn trưa đặc sản địa phương. Chiều: Tiếp tục tham quan, tắm hồ bơi hoặc nghỉ ngơi, mua đặc sản khô. Chiều muộn: Khởi hành về lại TP.HCM, kết thúc chương trình.', 29),
(52, 1, 'Ngày 1: Cần Thơ – Sóc Trăng – Chùa Dơi – Chùa Đất Sét', 'Sáng: Khởi hành đi Sóc Trăng, ghé tham quan chùa Dơi với đàn dơi quạ trú ngụ, chùa Đất Sét nổi tiếng với hàng ngàn tượng đất sét. Trưa: Ăn trưa tại nhà hàng địa phương. Chiều: Tham quan chợ Sóc Trăng, mua bánh pía và lạp xưởng. Nhận phòng khách sạn, nghỉ ngơi. Tối: Tự do dạo phố, thưởng thức ẩm thực Khmer.', 30),
(53, 2, 'Ngày 2: Khu du lịch sinh thái – Trở về', 'Sáng: Tham quan một khu du lịch sinh thái hoặc làng nghề địa phương. Trưa: Ăn trưa tại nhà hàng. Chiều: Lên xe về lại điểm đón ban đầu, kết thúc tour.', 30),
(54, 1, 'Ngày 1: Hà Nội – Khu nghỉ dưỡng ngoại thành – Team building', 'Sáng: Đón đoàn tại nội thành Hà Nội, di chuyển đến khu nghỉ dưỡng ngoại thành (Sóc Sơn, Ba Vì hoặc tương đương). Trưa: Nhận phòng, ăn trưa tại resort. Chiều: Tổ chức chương trình team building ngoài trời với các trò chơi gắn kết tập thể. Tối: Gala dinner, sân khấu giao lưu, trao thưởng cho các đội.', 31),
(55, 2, 'Ngày 2: Hội thảo nội bộ – Kết thúc chương trình', 'Sáng: Tổ chức buổi họp/ hội thảo nội bộ tại phòng họp của resort. Trưa: Ăn trưa, nghỉ ngơi. Chiều: Tự do sử dụng dịch vụ của khu nghỉ dưỡng (bể bơi, spa, chụp ảnh). Sau đó trả phòng, xe đưa đoàn về lại Hà Nội, kết thúc chương trình team building.', 31),
(56, 1, 'Ngày 1: Hà Nội – Lào Cai – Sapa – Nhận phòng', 'Sáng: Đón đoàn tại Hà Nội, khởi hành đi Sapa theo đường cao tốc. Trưa: Đến Sapa, nhận phòng khách sạn, ăn trưa. Chiều: Tham quan trung tâm thị trấn, nhà thờ đá, quảng trường. Tối: Ăn tối và tự do dạo phố, thưởng thức đồ nướng Sapa.', 32),
(57, 2, 'Ngày 2: Hội thảo – Team building nhẹ – Bản Cát Cát', 'Sáng: Tổ chức chương trình hội thảo, training nội bộ tại phòng họp khách sạn. Trưa: Ăn trưa tại khách sạn. Chiều: Tham quan bản Cát Cát, giao lưu văn hóa với đồng bào H\'Mông, chụp ảnh thác nước và ruộng bậc thang. Tối: Gala dinner hoặc chương trình giao lưu văn nghệ (tùy option).', 32),
(58, 3, 'Ngày 3: Fansipan hoặc tự do mua sắm – Trở về Hà Nội', 'Sáng: Tự do dạo chợ Sapa, mua đặc sản, hoặc đăng ký đi cáp treo Fansipan (chi phí tùy chọn). Trưa: Ăn trưa, trả phòng. Chiều: Lên xe về lại Hà Nội, kết thúc chương trình hội thảo.', 32),
(59, 1, 'Ngày 1: Đà Nẵng – Nhận phòng – Biển Mỹ Khê', 'Sáng: Đón đoàn tại sân bay Đà Nẵng, đưa về khách sạn nhận phòng. Trưa: Ăn trưa tại nhà hàng. Chiều: Tắm biển Mỹ Khê, tổ chức một số trò chơi team building nhẹ trên bãi biển. Tối: Ăn tối, dạo cầu Rồng, cầu Tình Yêu.', 33),
(60, 2, 'Ngày 2: Hội thảo – Team building bãi biển', 'Sáng: Tổ chức hội thảo/ training nội bộ tại phòng họp khách sạn. Trưa: Ăn trưa. Chiều: Tổ chức chương trình team building bãi biển với các trò chơi gắn kết tinh thần đồng đội. Tối: Gala dinner, trao thưởng, bốc thăm may mắn.', 33),
(61, 3, 'Ngày 3: Ngũ Hành Sơn – Mua sắm đặc sản – Tiễn đoàn', 'Sáng: Tham quan Ngũ Hành Sơn, làng đá Non Nước. Trưa: Ăn trưa, mua sắm đặc sản miền Trung. Chiều: Đưa đoàn ra sân bay Đà Nẵng, kết thúc chương trình.', 33),
(62, 1, 'Ngày 1: Đà Nẵng – Ngũ Hành Sơn – Phố cổ Hội An', 'Sáng: Đón khách tại Đà Nẵng, tham quan Ngũ Hành Sơn và làng đá mỹ nghệ Non Nước. Trưa: Ăn trưa tại nhà hàng. Chiều: Di chuyển đến Hội An, nhận phòng khách sạn, tham quan phố cổ, chùa Cầu, hội quán người Hoa. Tối: Thả đèn hoa đăng trên sông Hoài, thưởng thức đặc sản cao lầu, mì Quảng.', 34),
(63, 2, 'Ngày 2: Hội An – Làng gốm Thanh Hà/ Làng rau Trà Quế – Trở về', 'Sáng: Tham quan làng gốm Thanh Hà hoặc làng rau Trà Quế, trải nghiệm làm gốm/ trồng rau cùng người dân. Trưa: Ăn trưa tại nhà hàng địa phương. Chiều: Mua sắm quà lưu niệm, sau đó khởi hành về lại Đà Nẵng hoặc điểm đón ban đầu, kết thúc tour.', 34),
(64, 1, 'Ngày 1: Nha Trang – Nhận phòng – Biển Trần Phú', 'Sáng: Đón đoàn tại sân bay Cam Ranh hoặc ga Nha Trang, đưa về khách sạn nhận phòng. Trưa: Ăn trưa tại nhà hàng. Chiều: Tắm biển Trần Phú, tham quan một số điểm gần trung tâm. Tối: Ăn tối, tự do dạo biển.', 35),
(65, 2, 'Ngày 2: Hội nghị – Team building biển', 'Sáng: Tổ chức chương trình hội nghị, hội thảo tại phòng ballroom của khách sạn. Trưa: Ăn trưa buffet hoặc set menu. Chiều: Tổ chức chương trình team building trên bãi biển riêng của khách sạn hoặc khu du lịch. Tối: Gala dinner, giao lưu văn nghệ, trao giải.', 35),
(66, 3, 'Ngày 3: Vịnh Nha Trang hoặc VinWonders – Tiễn đoàn', 'Sáng: Lựa chọn 1 trong 2 chương trình: tham quan vịnh Nha Trang, tắm biển và lặn ngắm san hô; hoặc vui chơi tại VinWonders Nha Trang (chi phí tùy chọn). Trưa: Ăn trưa tại nhà hàng. Chiều: Về lại khách sạn, trả phòng, xe đưa đoàn ra sân bay/ ga, kết thúc chương trình hội nghị.', 35),
(67, 1, 'Ngày 1: Cần Thơ – Nhận phòng – Team building bãi cỏ/ hồ bơi', 'Sáng: Đón đoàn tại trung tâm Cần Thơ, di chuyển đến khu resort/ khách sạn ngoại ô có không gian sân vườn. Nhận phòng, nghỉ ngơi. Trưa: Ăn trưa tại nhà hàng resort. Chiều: Tổ chức chương trình team building ngoài trời với các trò chơi gắn kết đồng đội trên bãi cỏ hoặc khu vực hồ bơi. Tối: Gala dinner, giao lưu văn nghệ, trao thưởng cho các đội chơi.', 36),
(68, 2, 'Ngày 2: Tham quan Cần Thơ – Chợ nổi Cái Răng – Kết thúc chương trình', 'Sáng: Trả phòng sơ bộ, xuống bến Ninh Kiều lên thuyền tham quan chợ nổi Cái Răng, thưởng thức trái cây và món ăn sáng trên ghe. Trưa: Ăn trưa đặc sản miền Tây. Chiều: Mua sắm đặc sản, sau đó xe đưa đoàn về lại điểm đón ban đầu, kết thúc chương trình team building Cần Thơ.', 36),
(69, 1, 'Ngày 1: TP.HCM – Mỹ Tho – Bến Tre', 'Sáng: Khởi hành từ TP.HCM đi Mỹ Tho, tham quan chùa Vĩnh Tràng, sau đó xuống thuyền trên sông Tiền, ghé cồn Thới Sơn, thưởng thức trái cây, mật ong và đờn ca tài tử. Trưa: Ăn trưa với các món đặc sản miền Tây. Chiều: Di chuyển qua Bến Tre, tham quan lò kẹo dừa, đi xuồng chèo trong rạch dừa nước. Tối: Nhận phòng homestay/ khách sạn, giao lưu sinh hoạt miệt vườn.', 37),
(70, 2, 'Ngày 2: Cần Thơ – Bến Ninh Kiều – Chợ nổi Cái Răng', 'Sáng: Khởi hành đi Cần Thơ, đến nơi nhận phòng khách sạn. Trưa: Ăn trưa tại nhà hàng địa phương. Chiều: Tham quan nhà cổ Bình Thủy, vườn trái cây, dạo Bến Ninh Kiều. Tối: Du thuyền trên sông Hậu, nghe nhạc, thưởng thức ẩm thực miền Tây.', 37),
(71, 3, 'Ngày 3: Chợ nổi Cái Răng – Trở về TP.HCM', 'Sáng: Lên thuyền đi chợ nổi Cái Răng, khám phá đời sống mua bán trên sông, thưởng thức bún riêu, hủ tiếu trên ghe. Trưa: Ăn trưa, nghỉ ngơi. Chiều: Lên xe khởi hành về lại TP.HCM, ghé mua đặc sản bánh pía, nem, khô cá. Đến TP.HCM, kết thúc chương trình.', 37),
(72, 1, 'Ngày 1: TP.HCM – Vũng Tàu – Hội thảo – Tự do tắm biển', 'Sáng: Đón đoàn tại TP.HCM, khởi hành đi Vũng Tàu. Đến nơi, nhận phòng khách sạn, chuẩn bị cho chương trình hội thảo. Trưa: Ăn trưa tại nhà hàng khách sạn. Chiều: Tổ chức hội thảo/ training nội bộ tại phòng họp, sau đó tự do tắm biển Bãi Sau, tham quan hải đăng Vũng Tàu (nếu thời gian cho phép). Tối: Ăn tối, tự do dạo biển, thưởng thức hải sản.', 38),
(73, 2, 'Ngày 2: Tổng kết hội thảo – Tham quan tượng Chúa Ki-tô – Trở về', 'Sáng: Tiếp tục chương trình hội thảo, tổng kết – trao thưởng cho các cá nhân/ tập thể xuất sắc. Trưa: Ăn trưa tại nhà hàng. Chiều: Tham quan tượng Chúa Ki-tô hoặc mua sắm đặc sản Vũng Tàu (bánh bông lan trứng muối, hải sản khô). Sau đó khởi hành về TP.HCM, kết thúc chương trình.', 38),
(78, 1, 'Ngày 1: TP.HCM – Nha Trang', 'Sáng: Khởi hành từ TP.HCM đi Nha Trang theo cung đường ven biển, dừng chân chụp ảnh trên đường. Trưa: Ăn trưa tại Phan Thiết/ Phan Rang. Chiều: Đến Nha Trang, nhận phòng khách sạn, tắm biển Trần Phú. Tối: Tự do dạo biển, thưởng thức hải sản.', 40),
(79, 2, 'Ngày 2: Nha Trang – Tham quan vịnh/ VinWonders – Đà Nẵng', 'Sáng: Lựa chọn chương trình tham quan vịnh Nha Trang hoặc vui chơi tại VinWonders (tùy option). Trưa: Ăn trưa tại nhà hàng. Chiều: Di chuyển ra ga/ sân bay để nối chuyến đi Đà Nẵng. Đến nơi, nhận phòng khách sạn, nghỉ ngơi. Tối: Dạo biển Mỹ Khê, ngắm cầu Rồng.', 40),
(80, 3, 'Ngày 3: Đà Nẵng – Ngũ Hành Sơn – Hội An', 'Sáng: Tham quan Ngũ Hành Sơn, làng đá Non Nước. Trưa: Ăn trưa tại Đà Nẵng. Chiều: Di chuyển đến phố cổ Hội An, tham quan chùa Cầu, các hội quán, nhà cổ. Tối: Thả đèn hoa đăng trên sông Hoài, sau đó về lại Đà Nẵng nghỉ đêm.', 40),
(81, 4, 'Ngày 4: Đà Nẵng – Huế – Kinh thành cổ', 'Sáng: Khởi hành đi Huế, tham quan lăng tẩm (Khải Định/ Minh Mạng), chùa Thiên Mụ. Trưa: Ăn trưa với đặc sản xứ Huế. Chiều: Tham quan Đại Nội, mua sắm tại chợ Đông Ba. Tối: Nghe ca Huế trên sông Hương (tùy option), nghỉ đêm tại Huế.', 40),
(82, 5, 'Ngày 5: Huế – Tiễn khách/ Kết thúc hành trình Xuyên Việt', 'Sáng: Tự do mua sắm, café, check-in Huế. Trưa: Ăn trưa, trả phòng khách sạn. Chiều: Đưa đoàn ra sân bay/ ga Huế để bay/ tàu về lại địa phương, kết thúc chương trình du lịch Xuyên Việt 5N4Đ.', 40),
(125, 1, 'Ngày 1: Tham quan Cố đô Huế', 'Sáng: Đón khách tại Huế, tham quan Đại Nội, Ngọ Môn, Thế Miếu. Trưa: Ăn trưa đặc sản Huế. Chiều: Viếng lăng Khải Định/Tự Đức, dạo thuyền sông Hương, chiều tối trả khách.', 11),
(126, 1, 'Ngày 1: Hà Nội – Sa Pa – Bản Cát Cát', 'Sáng: Xuất phát từ Hà Nội đi Sa Pa, ăn trưa tại thị trấn. Chiều: Tham quan bản Cát Cát, tìm hiểu đời sống người H’Mông, check-in thác nước. Tối: Tự do khám phá Sa Pa về đêm.', 2),
(127, 2, 'Ngày 2: Fansipan – Trở về Hà Nội', 'Sáng: Lên cáp treo chinh phục đỉnh Fansipan, tham quan quần thể tâm linh trên đỉnh núi. Trưa: Ăn trưa tại nhà hàng. Chiều: Lên xe về lại Hà Nội, kết thúc chương trình.', 2),
(136, 1, 'Ngày 1: Khám phá Vịnh Vĩnh Hy - Hang Rái - Vườn Nho Thái An', 'Sáng: Xe đón đoàn di chuyển đến Vịnh Vĩnh Hy. Quý khách lên tàu đáy kính ngắm rạn san hô đa sắc màu và tự do tắm biển tại Bãi Cóc.\nTrưa: Thưởng thức bữa trưa hải sản tươi sống ngay trên bè nổi. Sau đó về khách sạn nhận phòng và nghỉ ngơi.\nChiều: Khởi hành tham quan Hang Rái - tuyệt tác thiên nhiên với rạn san hô cổ hóa thạch và hiện tượng \"thác nước trên biển\". Tiếp tục di chuyển đến Vườn nho Thái An, tự tay hái nho và thưởng thức mật nho miễn phí.\nTối: Dùng bữa tối tại nhà hàng. Quý khách tự do khám phá Vĩnh Hy về đêm hoặc thưởng thức hải sản ven biển.', 42),
(137, 2, 'Ngày 2: Đón bình minh - Mua sắm đặc sản Ninh Thuận', 'Sáng: Tự do dậy sớm ngắm bình minh tuyệt đẹp trên vịnh, tận hưởng không khí trong lành và tắm biển. Dùng điểm tâm sáng tại khách sạn.\nTrưa: Làm thủ tục trả phòng. Đoàn dùng bữa trưa với các món ăn đặc trưng của địa phương.\nChiều: Xe đưa đoàn ghé trạm dừng chân mua sắm đặc sản Ninh Thuận (tỏi, táo, nho, chả cá...) về làm quà cho người thân. Lên xe khởi hành về lại điểm đón ban đầu, kết thúc chương trình tour.', 42),
(138, 1, 'Ngày 1: Hà Nội – City tour', 'Sáng: Đón khách tại điểm hẹn, thăm Lăng Bác, Chùa Một Cột, Văn Miếu. Chiều: Tham quan Hồ Hoàn Kiếm, Phố Cổ, tự do mua sắm. Tối: Trả khách về điểm hẹn.', 1),
(158, 1, 'Ngày 1: Sân bay Đà Nẵng - Phố cổ Hội An', 'Xe đón đoàn tại sân bay Đà Nẵng, di chuyển về khách sạn nhận phòng. Buổi chiều, đoàn khởi hành đi tham quan Phố cổ Hội An, dạo bước qua Chùa Cầu, hội quán Phước Kiến. Buổi tối thưởng thức đặc sản cao lầu, mì Quảng và ngắm đèn lồng lung linh trên sông Hoài.', 46),
(159, 2, 'Ngày 2: Chinh phục Bà Nà Hills - Cầu Vàng', 'Sau bữa sáng, đoàn khởi hành đi khu du lịch Bà Nà Hills. Trải nghiệm cáp treo, check-in Cầu Vàng huyền thoại và tham quan làng Pháp. Dùng buffet trưa tại nhà hàng trên đỉnh núi. Chiều xuống núi, đoàn tự do tắm biển Mỹ Khê.', 46),
(160, 3, 'Ngày 3: Bán đảo Sơn Trà - Chợ Hàn - Tiễn sân bay', 'Buổi sáng đoàn tham quan Chùa Linh Ứng trên bán đảo Sơn Trà, ngắm toàn cảnh thành phố từ trên cao. Sau đó di chuyển về Chợ Hàn mua sắm đặc sản (chả bò, hải sản khô) làm quà. Đến giờ hẹn, xe đưa đoàn ra sân bay Đà Nẵng, kết thúc lịch trình.', 46),
(164, 1, 'Ngày 1: Hà Nội - Sa Pa - Bản Cát Cát', 'Sáng khởi hành từ Hà Nội, trưa đến Sa Pa, chiều tham quan Bản Cát Cát.', 41),
(165, 2, 'Ngày 2: Fansipan - Trung tâm Sa Pa', 'Sáng đi cáp treo Fansipan, chiều tự do tham quan nhà thờ đá và chợ đêm.', 41),
(166, 3, 'Ngày 3: Sa Pa - Hà Nội', 'Sáng trả phòng, mua đặc sản, trưa lên xe về Hà Nội.', 41),
(167, 1, 'Ngày 1: Sân bay Đà Nẵng - Phố cổ Hội An', 'Xe đón đoàn tại sân bay Đà Nẵng, di chuyển về khách sạn nhận phòng. Buổi chiều, đoàn khởi hành đi tham quan Phố cổ Hội An, dạo bước qua Chùa Cầu, hội quán Phước Kiến. Buổi tối thưởng thức đặc sản cao lầu, mì Quảng và ngắm đèn lồng lung linh trên sông Hoài.', 47),
(168, 2, 'Ngày 2: Chinh phục Bà Nà Hills - Cầu Vàng', 'Sau bữa sáng, đoàn khởi hành đi khu du lịch Bà Nà Hills. Trải nghiệm cáp treo, check-in Cầu Vàng huyền thoại và tham quan làng Pháp. Dùng buffet trưa tại nhà hàng trên đỉnh núi. Chiều xuống núi, đoàn tự do tắm biển Mỹ Khê.', 47),
(169, 3, 'Ngày 3: Bán đảo Sơn Trà - Chợ Hàn - Tiễn sân bay', 'Buổi sáng đoàn tham quan Chùa Linh Ứng trên bán đảo Sơn Trà, ngắm toàn cảnh thành phố từ trên cao. Sau đó di chuyển về Chợ Hàn mua sắm đặc sản (chả bò, hải sản khô) làm quà. Đến giờ hẹn, xe đưa đoàn ra sân bay Đà Nẵng, kết thúc lịch trình.', 47),
(170, 1, 'Ngày 1: Sân bay Đà Nẵng - Phố cổ Hội An', 'Xe đón đoàn tại sân bay Đà Nẵng, di chuyển về khách sạn nhận phòng. Buổi chiều, đoàn khởi hành đi tham quan Phố cổ Hội An, dạo bước qua Chùa Cầu, hội quán Phước Kiến. Buổi tối thưởng thức đặc sản cao lầu, mì Quảng và ngắm đèn lồng lung linh trên sông Hoài.', 48),
(171, 2, 'Ngày 2: Chinh phục Bà Nà Hills - Cầu Vàng', 'Sau bữa sáng, đoàn khởi hành đi khu du lịch Bà Nà Hills. Trải nghiệm cáp treo, check-in Cầu Vàng huyền thoại và tham quan làng Pháp. Dùng buffet trưa tại nhà hàng trên đỉnh núi. Chiều xuống núi, đoàn tự do tắm biển Mỹ Khê.', 48),
(172, 3, 'Ngày 3: Bán đảo Sơn Trà - Chợ Hàn - Tiễn sân bay', 'Buổi sáng đoàn tham quan Chùa Linh Ứng trên bán đảo Sơn Trà, ngắm toàn cảnh thành phố từ trên cao. Sau đó di chuyển về Chợ Hàn mua sắm đặc sản (chả bò, hải sản khô) làm quà. Đến giờ hẹn, xe đưa đoàn ra sân bay Đà Nẵng, kết thúc lịch trình.', 48),
(173, 1, 'Ngày 1: Sân bay Đà Nẵng - Phố cổ Hội An', 'Xe đón đoàn tại sân bay Đà Nẵng, di chuyển về khách sạn nhận phòng. Buổi chiều, đoàn khởi hành đi tham quan Phố cổ Hội An, dạo bước qua Chùa Cầu, hội quán Phước Kiến. Buổi tối thưởng thức đặc sản cao lầu, mì Quảng và ngắm đèn lồng lung linh trên sông Hoài.', 49),
(174, 2, 'Ngày 2: Chinh phục Bà Nà Hills - Cầu Vàng', 'Sau bữa sáng, đoàn khởi hành đi khu du lịch Bà Nà Hills. Trải nghiệm cáp treo, check-in Cầu Vàng huyền thoại và tham quan làng Pháp. Dùng buffet trưa tại nhà hàng trên đỉnh núi. Chiều xuống núi, đoàn tự do tắm biển Mỹ Khê.', 49),
(175, 3, 'Ngày 3: Bán đảo Sơn Trà - Chợ Hàn - Tiễn sân bay', 'Buổi sáng đoàn tham quan Chùa Linh Ứng trên bán đảo Sơn Trà, ngắm toàn cảnh thành phố từ trên cao. Sau đó di chuyển về Chợ Hàn mua sắm đặc sản (chả bò, hải sản khô) làm quà. Đến giờ hẹn, xe đưa đoàn ra sân bay Đà Nẵng, kết thúc lịch trình.', 49),
(176, 1, 'Ngày 1: Sân bay Đà Nẵng - Phố cổ Hội An', 'Xe đón đoàn tại sân bay Đà Nẵng, di chuyển về khách sạn nhận phòng. Buổi chiều, đoàn khởi hành đi tham quan Phố cổ Hội An, dạo bước qua Chùa Cầu, hội quán Phước Kiến. Buổi tối thưởng thức đặc sản cao lầu, mì Quảng và ngắm đèn lồng lung linh trên sông Hoài.', 50),
(177, 2, 'Ngày 2: Chinh phục Bà Nà Hills - Cầu Vàng', 'Sau bữa sáng, đoàn khởi hành đi khu du lịch Bà Nà Hills. Trải nghiệm cáp treo, check-in Cầu Vàng huyền thoại và tham quan làng Pháp. Dùng buffet trưa tại nhà hàng trên đỉnh núi. Chiều xuống núi, đoàn tự do tắm biển Mỹ Khê.', 50),
(178, 3, 'Ngày 3: Bán đảo Sơn Trà - Chợ Hàn - Tiễn sân bay', 'Buổi sáng đoàn tham quan Chùa Linh Ứng trên bán đảo Sơn Trà, ngắm toàn cảnh thành phố từ trên cao. Sau đó di chuyển về Chợ Hàn mua sắm đặc sản (chả bò, hải sản khô) làm quà. Đến giờ hẹn, xe đưa đoàn ra sân bay Đà Nẵng, kết thúc lịch trình.', 50),
(183, 1, 'Ngày 1: Hà Nội – Sa Pa – Bản Cát Cát', 'Sáng: Xuất phát từ Hà Nội đi Sa Pa, ăn trưa tại thị trấn. Chiều: Tham quan bản Cát Cát, tìm hiểu đời sống người H’Mông, check-in thác nước. Tối: Tự do khám phá Sa Pa về đêm.', 44),
(184, 2, 'Ngày 2: Fansipan – Trở về Hà Nội', 'Sáng: Lên cáp treo chinh phục đỉnh Fansipan, tham quan quần thể tâm linh trên đỉnh núi. Trưa: Ăn trưa tại nhà hàng. Chiều: Lên xe về lại Hà Nội, kết thúc chương trình.', 44),
(201, 1, 'Ngày 1: Hà Nội – Sa Pa – Bản Cát Cát', 'Sáng: Xuất phát từ Hà Nội đi Sa Pa, ăn trưa tại thị trấn. Chiều: Tham quan bản Cát Cát, tìm hiểu đời sống người H’Mông, check-in thác nước. Tối: Tự do khám phá Sa Pa về đêm.', 45),
(202, 2, 'Ngày 2: Fansipan – Trở về Hà Nội', 'Sáng: Lên cáp treo chinh phục đỉnh Fansipan, tham quan quần thể tâm linh trên đỉnh núi. Trưa: Ăn trưa tại nhà hàng. Chiều: Lên xe về lại Hà Nội, kết thúc chương trình.', 45),
(203, 1, 'Ngày 1: Phú Quốc – Nhận phòng – Khám phá Đông đảo', 'Sáng: Đón khách tại sân bay/ bến tàu, đưa về khách sạn nhận phòng. Trưa: Ăn trưa đặc sản biển. Chiều: Tham quan Suối Tranh (theo mùa), làng chài Hàm Ninh, cơ sở nuôi cấy ngọc trai. Tối: Dạo chợ đêm Phú Quốc, thưởng thức hải sản, mua quà lưu niệm.', 39),
(204, 2, 'Ngày 2: Nam đảo – Cáp treo Hòn Thơm – Bãi Sao', 'Sáng: Di chuyển xuống cảng An Thới, trải nghiệm cáp treo Hòn Thơm, tắm biển và tham gia các trò chơi trên biển. Trưa: Ăn trưa tại khu vui chơi/ nhà hàng trên đảo. Chiều: Tham quan nhà thùng nước mắm, cơ sở sản xuất rượu sim, tắm biển tại Bãi Sao. Tối: Tự do nghỉ ngơi hoặc tham gia tour câu mực đêm (chi phí tự túc).', 39),
(205, 3, 'Ngày 3: Bắc đảo – VinWonders/ Safari (tùy chọn)', 'Sáng: Tham quan Bắc đảo: vườn tiêu, Gành Dầu, mũi Gành Dầu ngắm biển Campuchia. Trưa: Ăn trưa. Chiều: Tự do vui chơi tại VinWonders hoặc Vinpearl Safari (nếu đăng ký), hoặc tắm biển, nghỉ dưỡng tại resort. Tối: Ăn tối, sinh hoạt tự do.', 39),
(206, 4, 'Ngày 4: Tự do tắm biển – Mua sắm đặc sản – Tiễn khách', 'Sáng: Tự do tắm biển, sử dụng dịch vụ của resort. Trưa: Trả phòng khách sạn, ghé mua sắm đặc sản khô cá, nước mắm, rượu sim. Chiều: Đưa khách ra sân bay/ bến tàu, kết thúc chương trình du lịch Phú Quốc 4N3Đ.', 39),
(211, 1, 'Ngày 1: Đón đoàn - Sơn Trà - Phố cổ Hội An', 'Xe và HDV đón đoàn tại điểm hẹn/Sân bay Đà Nẵng. Khởi hành tham quan Chùa Linh Ứng Bán đảo Sơn Trà. Chiều di chuyển vào Phố cổ Hội An tham quan Chùa Cầu, nhà cổ, hội quán. Tối thưởng thức ẩm thực Hội An và tự do tản bộ ngắm phố đèn lồng. Nghỉ đêm tại Đà Nẵng.', 51),
(212, 2, 'Ngày 2: Team Building bãi biển Mỹ Khê - Gala Dinner', 'Sáng: Sáng tự do tắm biển. 15:00 Tập trung tại bãi biển Mỹ Khê tham gia Chương trình Team Building Doanh Nghiệp hoành tráng với các trò chơi gắn kết đồng đội. Tối: Tham dự Đêm Gala Dinner đẳng cấp tại Nhà hàng/Resort với sân khấu, âm thanh, ánh sáng, MC chuyên nghiệp và các hoạt động vinh danh, giao lưu văn nghệ. Nghỉ đêm tại Đà Nẵng.', 51),
(213, 3, 'Ngày 3: Khám phá Bà Nà Hills - Cầu Vàng - Di chuyển Cố Đô Huế', 'Sáng: Khởi hành đi KDL Bà Nà Hills, trải nghiệm cáp treo đạt nhiều kỷ lục thế giới. Check-in Cầu Vàng, Làng Pháp, Quảng trường Eclipse, chơi game tại Fantasy Park. Dùng bữa trưa buffet tại Bà Nà. Chiều: Bắt đầu di chuyển xuyên hầm Hải Vân ra Cố Đô Huế. Tối: Thưởng thức ca Huế trên sông Hương và thả hoa đăng. Nghỉ đêm tại Huế.', 51),
(214, 4, 'Ngày 4: Đại Nội Huế - Chùa Thiên Mụ - Mua sắm - Tiễn đoàn', 'Sáng: Tham quan Đại Nội Huế (Hoàng Thành & Cấm Thành) nghe giới thiệu về lịch sử triều Nguyễn, tiếp tục ghé viếng Chùa Thiên Mụ cổ kính. Trưa: Dùng cơm tối/trưa với các món đặc sản xứ Huế (Bánh bèo, nậm, lọc, bún bò). Dừng chân mua sắm đặc sản Mè xửng, Tôm chua, Trà Cung Đình. Xe đưa đoàn ra Sân bay/Điểm đón ban đầu, kết thúc chương trình.', 51);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
CREATE TABLE IF NOT EXISTS `nhanvien` (
  `MaNV` int NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(150) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `SDT` varchar(20) DEFAULT NULL,
  `ChucVu` varchar(100) DEFAULT NULL,
  `MaTK` int DEFAULT NULL,
  PRIMARY KEY (`MaNV`),
  UNIQUE KEY `MaTK` (`MaTK`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MaNV`, `HoTen`, `Email`, `SDT`, `ChucVu`, `MaTK`) VALUES
(1, 'Nhân viên demo', 'demo@tour.com', '0900000000', 'Quản lý tour', 17),
(2, 'Phúc', NULL, NULL, NULL, 20),
(3, 'phuong', NULL, NULL, NULL, 22),
(44, 'Luong Thang', 'luongthang1301@gmail.com', '0893456712', 'Quản lý tour', 122),
(45, 'Bảo Ngọc', 'baongoc001@gmail.com', '0234712893', 'Quản lý tour', 123),
(46, 'Hoai Anh', 'hoaianh1912@gmail.com', NULL, NULL, 124);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('03535d2f-c91a-4a2e-8f65-51df7137b316', 'App\\Notifications\\RefundRequestNotification', 'App\\Models\\TaiKhoan', 17, '{\"title\":\"Y\\u00eau c\\u1ea7u ho\\u00e0n ti\\u1ec1n\",\"message\":\"Kh\\u00e1ch h\\u00e0ng v\\u1eeba y\\u00eau c\\u1ea7u hu\\u1ef7 v\\u00e0 ho\\u00e0n ti\\u1ec1n cho \\u0111\\u01a1n \\u0111\\u1eb7t tour #112\",\"link\":\"\\/staff\\/orders\\/112\",\"type\":\"refund_request\"}', NULL, '2026-08-03 08:43:34', '2026-08-03 08:43:34'),
('03ed5ea7-7e50-4364-a9a0-6b1ad1bc4b00', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 122, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty ABC Company\",\"link\":\"\\/staff\\/business-requests\\/24\",\"type\":\"business_request\"}', NULL, '2026-08-03 08:46:27', '2026-08-03 08:46:27'),
('061405d8-c8d8-4498-8d84-3031360d4a17', 'App\\Notifications\\RefundRequestNotification', 'App\\Models\\TaiKhoan', 17, '{\"title\":\"Y\\u00eau c\\u1ea7u ho\\u00e0n ti\\u1ec1n\",\"message\":\"Kh\\u00e1ch h\\u00e0ng v\\u1eeba y\\u00eau c\\u1ea7u hu\\u1ef7 v\\u00e0 ho\\u00e0n ti\\u1ec1n cho \\u0111\\u01a1n \\u0111\\u1eb7t tour #114\",\"link\":\"\\/staff\\/orders\\/114\",\"type\":\"refund_request\"}', NULL, '2026-08-06 08:18:21', '2026-08-06 08:18:21'),
('08552ee9-19b3-4677-bdfb-c27ef42cf0c1', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 123, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/27\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:36:22', '2026-08-03 09:36:22'),
('10edc2b4-8043-47fb-b3be-bf22d3f4e037', 'App\\Notifications\\RefundRequestNotification', 'App\\Models\\TaiKhoan', 19, '{\"title\":\"Y\\u00eau c\\u1ea7u ho\\u00e0n ti\\u1ec1n\",\"message\":\"Kh\\u00e1ch h\\u00e0ng v\\u1eeba y\\u00eau c\\u1ea7u hu\\u1ef7 v\\u00e0 ho\\u00e0n ti\\u1ec1n cho \\u0111\\u01a1n \\u0111\\u1eb7t tour #114\",\"link\":\"\\/staff\\/orders\\/114\",\"type\":\"refund_request\"}', NULL, '2026-08-06 08:18:21', '2026-08-06 08:18:21'),
('126de80c-02a3-40eb-8912-d26da27aecbd', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 17, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty NPT\",\"link\":\"\\/staff\\/business-requests\\/25\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:23:03', '2026-08-03 09:23:03'),
('12717b40-5940-4ea9-ae7a-4bb4f493ddb1', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 17, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty ABC Company\",\"link\":\"\\/staff\\/business-requests\\/22\",\"type\":\"business_request\"}', '2026-08-01 08:10:20', '2026-08-01 08:10:00', '2026-08-01 08:10:20'),
('15e10603-8b81-42d7-a6ef-1848363c0446', 'App\\Notifications\\RefundRequestNotification', 'App\\Models\\TaiKhoan', 122, '{\"title\":\"Y\\u00eau c\\u1ea7u ho\\u00e0n ti\\u1ec1n\",\"message\":\"Kh\\u00e1ch h\\u00e0ng v\\u1eeba y\\u00eau c\\u1ea7u hu\\u1ef7 v\\u00e0 ho\\u00e0n ti\\u1ec1n cho \\u0111\\u01a1n \\u0111\\u1eb7t tour #114\",\"link\":\"\\/staff\\/orders\\/114\",\"type\":\"refund_request\"}', NULL, '2026-08-06 08:18:21', '2026-08-06 08:18:21'),
('1c504452-8489-4835-a1a1-65675339e453', 'App\\Notifications\\RefundRequestNotification', 'App\\Models\\TaiKhoan', 20, '{\"title\":\"Y\\u00eau c\\u1ea7u ho\\u00e0n ti\\u1ec1n\",\"message\":\"Kh\\u00e1ch h\\u00e0ng v\\u1eeba y\\u00eau c\\u1ea7u hu\\u1ef7 v\\u00e0 ho\\u00e0n ti\\u1ec1n cho \\u0111\\u01a1n \\u0111\\u1eb7t tour #114\",\"link\":\"\\/staff\\/orders\\/114\",\"type\":\"refund_request\"}', '2026-08-06 08:18:47', '2026-08-06 08:18:21', '2026-08-06 08:18:47'),
('22939c32-f7c0-4126-a8d5-491908ce6e77', 'App\\Notifications\\RefundRequestNotification', 'App\\Models\\TaiKhoan', 123, '{\"title\":\"Y\\u00eau c\\u1ea7u ho\\u00e0n ti\\u1ec1n\",\"message\":\"Kh\\u00e1ch h\\u00e0ng v\\u1eeba y\\u00eau c\\u1ea7u hu\\u1ef7 v\\u00e0 ho\\u00e0n ti\\u1ec1n cho \\u0111\\u01a1n \\u0111\\u1eb7t tour #111\",\"link\":\"\\/staff\\/orders\\/111\",\"type\":\"refund_request\"}', NULL, '2026-08-01 08:17:38', '2026-08-01 08:17:38'),
('24b862f5-c2ff-4add-a950-aa8bc95fecfb', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 122, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/27\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:36:22', '2026-08-03 09:36:22'),
('27631c57-a7c0-43d2-9571-b946ff5d4e8f', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 17, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty ABC Company\",\"link\":\"\\/staff\\/business-requests\\/24\",\"type\":\"business_request\"}', NULL, '2026-08-03 08:46:27', '2026-08-03 08:46:27'),
('27da024f-7446-4c6c-9af5-a86e53163464', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 122, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/23\",\"type\":\"business_request\"}', NULL, '2026-08-02 07:22:24', '2026-08-02 07:22:24'),
('2b3fbd48-4d51-41ee-9318-6f16338220da', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 17, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/26\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:29:33', '2026-08-03 09:29:33'),
('2ccbbe4a-b06b-4eba-8bf3-4d097418aac1', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 123, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty ABC Company\",\"link\":\"\\/staff\\/business-requests\\/24\",\"type\":\"business_request\"}', NULL, '2026-08-03 08:46:27', '2026-08-03 08:46:27'),
('2d982b38-0876-45ce-9e25-10eec2b35c41', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 122, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty STU\",\"link\":\"\\/staff\\/business-requests\\/30\",\"type\":\"business_request\"}', NULL, '2026-08-08 07:47:11', '2026-08-08 07:47:11'),
('3758537f-2e40-41b9-8f1b-5ce19b48798d', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 20, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/23\",\"type\":\"business_request\"}', NULL, '2026-08-02 07:22:24', '2026-08-02 07:22:24'),
('3a3bb9f8-9f68-41ac-980e-a050c3b1b869', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 122, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty THA\",\"link\":\"\\/staff\\/business-requests\\/28\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:44:44', '2026-08-03 09:44:44'),
('43998849-8d2b-40be-a544-ffa0b357cf25', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 122, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/29\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:52:04', '2026-08-03 09:52:04'),
('451ca1f2-28c3-4772-b42c-c27be575bf96', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 123, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty STU\",\"link\":\"\\/staff\\/business-requests\\/30\",\"type\":\"business_request\"}', NULL, '2026-08-08 07:47:11', '2026-08-08 07:47:11'),
('476cd911-9df5-49d5-b656-cadbe6262a25', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 20, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty NPT\",\"link\":\"\\/staff\\/business-requests\\/\",\"type\":\"business_request\"}', NULL, '2026-08-01 07:56:48', '2026-08-01 07:56:48'),
('49e2446e-463e-445e-849a-c381288391ea', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 17, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty THA\",\"link\":\"\\/staff\\/business-requests\\/28\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:44:44', '2026-08-03 09:44:44'),
('4a544411-7047-412d-a6a3-d31fd451a31f', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 20, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty THA\",\"link\":\"\\/staff\\/business-requests\\/28\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:44:44', '2026-08-03 09:44:44'),
('4af82ed8-513f-4d3d-af63-419c017b2243', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 20, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/29\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:52:04', '2026-08-03 09:52:04'),
('4b997ff2-3787-4326-82b5-a86a7e369334', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 123, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/26\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:29:33', '2026-08-03 09:29:33'),
('4e83ac82-4a42-4937-834b-5bd6ce1bc758', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 19, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty NPT\",\"link\":\"\\/staff\\/business-requests\\/\",\"type\":\"business_request\"}', NULL, '2026-08-01 07:56:48', '2026-08-01 07:56:48'),
('561b5555-0318-471f-8767-b94b04ad30df', 'App\\Notifications\\RefundRequestNotification', 'App\\Models\\TaiKhoan', 122, '{\"title\":\"Y\\u00eau c\\u1ea7u ho\\u00e0n ti\\u1ec1n\",\"message\":\"Kh\\u00e1ch h\\u00e0ng v\\u1eeba y\\u00eau c\\u1ea7u hu\\u1ef7 v\\u00e0 ho\\u00e0n ti\\u1ec1n cho \\u0111\\u01a1n \\u0111\\u1eb7t tour #112\",\"link\":\"\\/staff\\/orders\\/112\",\"type\":\"refund_request\"}', NULL, '2026-08-03 08:43:34', '2026-08-03 08:43:34'),
('56ce7fc1-eb32-4e32-b34e-8f09c7b3f18f', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 19, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/29\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:52:04', '2026-08-03 09:52:04'),
('58d28a8d-0ed8-477e-a333-7e294a5f7dfe', 'App\\Notifications\\RefundRequestNotification', 'App\\Models\\TaiKhoan', 123, '{\"title\":\"Y\\u00eau c\\u1ea7u ho\\u00e0n ti\\u1ec1n\",\"message\":\"Kh\\u00e1ch h\\u00e0ng v\\u1eeba y\\u00eau c\\u1ea7u hu\\u1ef7 v\\u00e0 ho\\u00e0n ti\\u1ec1n cho \\u0111\\u01a1n \\u0111\\u1eb7t tour #112\",\"link\":\"\\/staff\\/orders\\/112\",\"type\":\"refund_request\"}', NULL, '2026-08-03 08:43:34', '2026-08-03 08:43:34'),
('59f25aba-9856-4f63-a78e-172b023496b1', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 19, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty ABC Company\",\"link\":\"\\/staff\\/business-requests\\/22\",\"type\":\"business_request\"}', NULL, '2026-08-01 08:10:00', '2026-08-01 08:10:00'),
('5e62705b-5e07-4bcb-9f54-e90aa0eb4495', 'App\\Notifications\\RefundRequestNotification', 'App\\Models\\TaiKhoan', 19, '{\"title\":\"Y\\u00eau c\\u1ea7u ho\\u00e0n ti\\u1ec1n\",\"message\":\"Kh\\u00e1ch h\\u00e0ng v\\u1eeba y\\u00eau c\\u1ea7u hu\\u1ef7 v\\u00e0 ho\\u00e0n ti\\u1ec1n cho \\u0111\\u01a1n \\u0111\\u1eb7t tour #112\",\"link\":\"\\/staff\\/orders\\/112\",\"type\":\"refund_request\"}', NULL, '2026-08-03 08:43:34', '2026-08-03 08:43:34'),
('5ea88aeb-5219-4c6a-8435-7235bd4a8e2e', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 123, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty NPT\",\"link\":\"\\/staff\\/business-requests\\/25\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:23:03', '2026-08-03 09:23:03'),
('69929083-6ce8-4cd6-a671-e72761aee1a5', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 122, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty NPT\",\"link\":\"\\/staff\\/business-requests\\/25\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:23:03', '2026-08-03 09:23:03'),
('79b49bf4-894d-42e0-9d41-8e5dd04db555', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 20, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty ABC Company\",\"link\":\"\\/staff\\/business-requests\\/22\",\"type\":\"business_request\"}', NULL, '2026-08-01 08:10:00', '2026-08-01 08:10:00'),
('7c21fb45-36c2-4863-9c51-eab205c57235', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 17, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/23\",\"type\":\"business_request\"}', NULL, '2026-08-02 07:22:24', '2026-08-02 07:22:24'),
('820400c5-d723-4563-9c58-29b5912ab823', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 19, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty ABC Company\",\"link\":\"\\/staff\\/business-requests\\/24\",\"type\":\"business_request\"}', NULL, '2026-08-03 08:46:27', '2026-08-03 08:46:27'),
('865a4a4f-2acb-49b1-8306-169897435df0', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 19, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty NPT\",\"link\":\"\\/staff\\/business-requests\\/25\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:23:03', '2026-08-03 09:23:03'),
('872ec666-870e-48fc-b24a-d66a322747ae', 'App\\Notifications\\RefundRequestNotification', 'App\\Models\\TaiKhoan', 20, '{\"title\":\"Y\\u00eau c\\u1ea7u ho\\u00e0n ti\\u1ec1n\",\"message\":\"Kh\\u00e1ch h\\u00e0ng v\\u1eeba y\\u00eau c\\u1ea7u hu\\u1ef7 v\\u00e0 ho\\u00e0n ti\\u1ec1n cho \\u0111\\u01a1n \\u0111\\u1eb7t tour #111\",\"link\":\"\\/staff\\/orders\\/111\",\"type\":\"refund_request\"}', NULL, '2026-08-01 08:17:38', '2026-08-01 08:17:38'),
('8737f6a7-ce99-4a1a-bf73-8d076b832109', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 17, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/27\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:36:22', '2026-08-03 09:36:22'),
('8abf3cea-c16b-42c1-ab25-cb8e315a579f', 'App\\Notifications\\RefundRequestNotification', 'App\\Models\\TaiKhoan', 123, '{\"title\":\"Y\\u00eau c\\u1ea7u ho\\u00e0n ti\\u1ec1n\",\"message\":\"Kh\\u00e1ch h\\u00e0ng v\\u1eeba y\\u00eau c\\u1ea7u hu\\u1ef7 v\\u00e0 ho\\u00e0n ti\\u1ec1n cho \\u0111\\u01a1n \\u0111\\u1eb7t tour #114\",\"link\":\"\\/staff\\/orders\\/114\",\"type\":\"refund_request\"}', NULL, '2026-08-06 08:18:21', '2026-08-06 08:18:21'),
('9709369a-3097-4511-87f3-0671e57bb457', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 123, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/29\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:52:04', '2026-08-03 09:52:04'),
('9a66694b-9049-422c-b03d-dc78c171d939', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 19, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty THA\",\"link\":\"\\/staff\\/business-requests\\/28\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:44:44', '2026-08-03 09:44:44'),
('9c7e30a7-bd22-4b84-b9a0-07a0a243e4a1', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 123, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty ABC Company\",\"link\":\"\\/staff\\/business-requests\\/22\",\"type\":\"business_request\"}', NULL, '2026-08-01 08:10:00', '2026-08-01 08:10:00'),
('9d5e1c82-5122-43f9-83b7-48927aa14161', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 17, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/29\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:52:04', '2026-08-03 09:52:04'),
('9e53f450-fa44-4882-a51f-c051d2381610', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 19, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/23\",\"type\":\"business_request\"}', NULL, '2026-08-02 07:22:24', '2026-08-02 07:22:24'),
('a142c49f-625a-4fbc-91ca-7e64432aa615', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 20, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/27\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:36:22', '2026-08-03 09:36:22'),
('a397abf0-5176-4f07-aefa-a89e3b46340a', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 17, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty NPT\",\"link\":\"\\/staff\\/business-requests\\/\",\"type\":\"business_request\"}', '2026-08-01 08:04:05', '2026-08-01 07:56:48', '2026-08-01 08:04:05'),
('a46d6450-72a4-4329-b527-a19a5dadd7ed', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 122, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/26\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:29:33', '2026-08-03 09:29:33'),
('aaea7963-b9af-4e4b-84d6-a8d68f53af56', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 17, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty STU\",\"link\":\"\\/staff\\/business-requests\\/30\",\"type\":\"business_request\"}', NULL, '2026-08-08 07:47:11', '2026-08-08 07:47:11'),
('ab7ad3e2-f5f7-47d2-9af5-e31fb5438ac8', 'App\\Notifications\\RefundRequestNotification', 'App\\Models\\TaiKhoan', 20, '{\"title\":\"Y\\u00eau c\\u1ea7u ho\\u00e0n ti\\u1ec1n\",\"message\":\"Kh\\u00e1ch h\\u00e0ng v\\u1eeba y\\u00eau c\\u1ea7u hu\\u1ef7 v\\u00e0 ho\\u00e0n ti\\u1ec1n cho \\u0111\\u01a1n \\u0111\\u1eb7t tour #112\",\"link\":\"\\/staff\\/orders\\/112\",\"type\":\"refund_request\"}', '2026-08-03 08:44:00', '2026-08-03 08:43:34', '2026-08-03 08:44:00'),
('adfc1a30-44d5-48df-85f1-ae769041f59a', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 20, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty NPT\",\"link\":\"\\/staff\\/business-requests\\/25\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:23:03', '2026-08-03 09:23:03'),
('b1089123-4059-4a67-9fa9-8f2b3a4cbcb7', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 123, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/23\",\"type\":\"business_request\"}', NULL, '2026-08-02 07:22:24', '2026-08-02 07:22:24'),
('b40a6532-0999-4c3b-877a-b250f559fc3f', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 20, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty STU\",\"link\":\"\\/staff\\/business-requests\\/30\",\"type\":\"business_request\"}', NULL, '2026-08-08 07:47:11', '2026-08-08 07:47:11'),
('b4c887ca-6bf5-4513-92bb-a29627eaec16', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 123, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty NPT\",\"link\":\"\\/staff\\/business-requests\\/\",\"type\":\"business_request\"}', NULL, '2026-08-01 07:56:48', '2026-08-01 07:56:48'),
('bdd387d5-dd4e-4f99-a45c-154b0a334afd', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 20, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/26\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:29:33', '2026-08-03 09:29:33'),
('c72b02ed-99e7-4941-be7f-90279fb70ab4', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 20, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty ABC Company\",\"link\":\"\\/staff\\/business-requests\\/24\",\"type\":\"business_request\"}', '2026-08-03 08:46:42', '2026-08-03 08:46:27', '2026-08-03 08:46:42'),
('d1e53cb2-29a4-4647-be84-ff8e81e9fee5', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 19, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty STU\",\"link\":\"\\/staff\\/business-requests\\/30\",\"type\":\"business_request\"}', NULL, '2026-08-08 07:47:11', '2026-08-08 07:47:11'),
('d28df286-e869-4191-99c3-4e404ab23c6c', 'App\\Notifications\\RefundRequestNotification', 'App\\Models\\TaiKhoan', 17, '{\"title\":\"Y\\u00eau c\\u1ea7u ho\\u00e0n ti\\u1ec1n\",\"message\":\"Kh\\u00e1ch h\\u00e0ng v\\u1eeba y\\u00eau c\\u1ea7u hu\\u1ef7 v\\u00e0 ho\\u00e0n ti\\u1ec1n cho \\u0111\\u01a1n \\u0111\\u1eb7t tour #111\",\"link\":\"\\/staff\\/orders\\/111\",\"type\":\"refund_request\"}', '2026-08-01 08:17:52', '2026-08-01 08:17:38', '2026-08-01 08:17:52'),
('d40e2fe0-522a-43e8-b264-8823f9b6a929', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 19, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/27\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:36:22', '2026-08-03 09:36:22'),
('d62a7f5d-8142-4d24-a503-3c9345ce7771', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 19, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty LVT\",\"link\":\"\\/staff\\/business-requests\\/26\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:29:33', '2026-08-03 09:29:33'),
('d6be1967-0c78-4074-9f12-8f3d3d433639', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 123, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty THA\",\"link\":\"\\/staff\\/business-requests\\/28\",\"type\":\"business_request\"}', NULL, '2026-08-03 09:44:44', '2026-08-03 09:44:44'),
('d8d96a53-02b2-4e58-8f9c-7fbb257d4d6c', 'App\\Notifications\\RefundRequestNotification', 'App\\Models\\TaiKhoan', 19, '{\"title\":\"Y\\u00eau c\\u1ea7u ho\\u00e0n ti\\u1ec1n\",\"message\":\"Kh\\u00e1ch h\\u00e0ng v\\u1eeba y\\u00eau c\\u1ea7u hu\\u1ef7 v\\u00e0 ho\\u00e0n ti\\u1ec1n cho \\u0111\\u01a1n \\u0111\\u1eb7t tour #111\",\"link\":\"\\/staff\\/orders\\/111\",\"type\":\"refund_request\"}', NULL, '2026-08-01 08:17:38', '2026-08-01 08:17:38'),
('e7d1004b-ee20-47ce-afe8-30bef0620bdc', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 122, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty NPT\",\"link\":\"\\/staff\\/business-requests\\/\",\"type\":\"business_request\"}', NULL, '2026-08-01 07:56:48', '2026-08-01 07:56:48'),
('ebe71358-0f8f-4670-9c08-16b39aa7681c', 'App\\Notifications\\BusinessRequestNotification', 'App\\Models\\TaiKhoan', 122, '{\"title\":\"Y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi\",\"message\":\"C\\u00f3 \\u0111\\u01a1n y\\u00eau c\\u1ea7u doanh nghi\\u1ec7p m\\u1edbi t\\u1eeb c\\u00f4ng ty ABC Company\",\"link\":\"\\/staff\\/business-requests\\/22\",\"type\":\"business_request\"}', NULL, '2026-08-01 08:10:00', '2026-08-01 08:10:00'),
('fdbd08bf-5327-48e5-b884-b7e47632bce5', 'App\\Notifications\\RefundRequestNotification', 'App\\Models\\TaiKhoan', 122, '{\"title\":\"Y\\u00eau c\\u1ea7u ho\\u00e0n ti\\u1ec1n\",\"message\":\"Kh\\u00e1ch h\\u00e0ng v\\u1eeba y\\u00eau c\\u1ea7u hu\\u1ef7 v\\u00e0 ho\\u00e0n ti\\u1ec1n cho \\u0111\\u01a1n \\u0111\\u1eb7t tour #111\",\"link\":\"\\/staff\\/orders\\/111\",\"type\":\"refund_request\"}', NULL, '2026-08-01 08:17:38', '2026-08-01 08:17:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_otp`
--

DROP TABLE IF EXISTS `password_reset_otp`;
CREATE TABLE IF NOT EXISTS `password_reset_otp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `MaTK` int NOT NULL,
  `channel` enum('email','sms') NOT NULL,
  `destination` varchar(255) NOT NULL,
  `otp_hash` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `attempts` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `used_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `MaTK` (`MaTK`),
  KEY `destination` (`destination`(250)),
  KEY `expires_at` (`expires_at`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `password_reset_otp`
--

INSERT INTO `password_reset_otp` (`id`, `MaTK`, `channel`, `destination`, `otp_hash`, `expires_at`, `attempts`, `created_at`, `used_at`) VALUES
(1, 12, 'email', 'trphuc1@gmail.com', '$2y$10$XA.aJxk/yzFjo2kwB8FCn.woZ.jlIbUf9h4KGND0HmegENyWt5FLC', '2025-12-13 11:21:16', 0, '2025-12-13 18:16:16', NULL),
(2, 12, 'email', 'trphuc1@gmail.com', '$2y$10$fl9mmz8Lw3WE5TDbKlL/q.BfjMKIF7IAVGhsD4SAyBJQVLlPKPgTq', '2025-12-13 11:21:18', 0, '2025-12-13 18:16:18', NULL),
(3, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$jqPDMJEQXusQtLoC3xb4YOPKxmA3YeLAN.EBq0sAQGseARF32y9Ey', '2025-12-13 11:25:58', 0, '2025-12-13 18:20:58', NULL),
(4, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$DN5LFRaWgA0NdmNXb0jrpuicYHDeYg.2qKvF7cTqw4Ke75laDOJ4u', '2025-12-13 11:37:27', 0, '2025-12-13 18:32:27', NULL),
(5, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$vUzs8P8JjieLONValnttLuxKciizVU/leaLM3xN6V/n8Ddob1OQJG', '2025-12-13 11:40:34', 0, '2025-12-13 18:35:34', NULL),
(6, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$gVyIZJF3IJ3CZdVd2i9RheR4FBMcT9AOS9y39KKg/xUtA1MFU2bcy', '2025-12-13 12:01:30', 0, '2025-12-13 18:56:30', NULL),
(7, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$8jL9tEKKdCi5JaUFcZnQ3uz2f2GSrGkQQgcTQUt5Hrp/NKE4.pnIO', '2025-12-13 12:29:48', 0, '2025-12-13 19:24:49', NULL),
(8, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$dP.GhcS6rU3woutW2GRtPutipoSrTrl9WFmeP2Zv7CBXI.IeSpm6i', '2025-12-13 12:38:35', 0, '2025-12-13 19:33:35', NULL),
(9, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$cZkHWWJZ4GxKsI34z6CGqupbQHl5sFnMkShTqtJaFsz7qC79nX3LK', '2025-12-13 13:17:36', 0, '2025-12-13 20:12:36', NULL),
(10, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$nPD20Nmt4vw9EQOSSNMr6OxJ.0q4UWX1/kuWQElUEAdGFrVjxx53W', '2025-12-13 13:19:17', 0, '2025-12-13 20:14:17', NULL),
(11, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$6thDRYl.0B5pOXrkNzTgjefMdaVhPzeCInProhQgNlUElqMdqajr6', '2025-12-13 13:30:46', 1, '2025-12-13 20:25:46', '2025-12-13 13:26:44'),
(12, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$k3Epw4AM/M3UZcrJEV9dpOIReDSGa8HXjV06I3tH98ecG60mODYWq', '2025-12-13 13:32:26', 0, '2025-12-13 20:27:26', NULL),
(13, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$tseD/oi5N0KI3CTmqrRazuk4ARd2hWT0t7kKumTyk5fB5kusGcwGO', '2025-12-13 13:32:54', 0, '2025-12-13 20:27:54', '2025-12-13 13:28:30'),
(14, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$WMy8pBRIFQejrU8yOvNqROV.5HCNWzq3ppyKPHDyiEzu4MZGeU/sS', '2025-12-13 13:40:58', 0, '2025-12-13 20:35:58', '2025-12-13 13:36:24'),
(15, 13, 'sms', '0832520843', '$2y$10$8PL.uLdWgyU3Rhs1WFSGJegrzerQ/5/BT.CMeZhW6S0WutniqznbK', '2025-12-13 13:46:07', 0, '2025-12-13 20:41:07', NULL),
(16, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$LztmqmV986Pitad0JgzVyOzQgOx.mdQVMzx2iMKzcfM7sEPfxN2Uu', '2025-12-13 14:43:48', 0, '2025-12-13 21:38:48', NULL),
(17, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$Uo.KvX24.suTPnqjFh6qIOgebKwlHSl2R.4y.ADMiCZmA4YbDJrcO', '2025-12-13 14:44:22', 1, '2025-12-13 21:39:22', NULL),
(18, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$PLmCgTvW69.uDrrh42pVSO1K75KPUh.8hvX2x3DEbMIFmoVAHH9S.', '2025-12-13 14:58:25', 0, '2025-12-13 21:53:25', NULL),
(19, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$OHI.3vByEOyy7fLMqX5Z9.38Kv9mgFJ7HbLEwiNjV82AJ/pV5N3Xy', '2025-12-13 15:02:44', 0, '2025-12-13 21:57:44', NULL),
(20, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$BASHZfh3mYRl07K8Yp3KTeU3VS5plLYhsxThxw.XllXhr6p2Mnqwe', '2025-12-13 15:05:25', 0, '2025-12-13 22:00:25', NULL),
(21, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$1N1jCMKDzYMKf1hvvWL1IOkIS9XwIwbWD0bfrFhGp6U3mboXNFjd.', '2025-12-13 15:05:49', 3, '2025-12-13 22:00:49', NULL),
(22, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$ZzJdV1M7rtVfW.13NMO.o.stfeK3upuTNwDaXOPSq9LCM7hpIOBDW', '2025-12-13 15:08:11', 0, '2025-12-13 22:03:11', NULL),
(23, 13, 'email', 'trphuc1810@gmail.com', '$2y$10$oX/bY.rWPvGb5z5EQoV8JOIha3LXjCc/rPI67VrvujNtfVowYKyv.', '2025-12-13 15:09:01', 1, '2025-12-13 22:04:01', NULL),
(24, 15, 'sms', '0832520843', '$2y$10$Y5bnJpkogig2d5l/HN1MwOq.ZWkYvFT8SpeaD0XETrxC6m7IWo5o.', '2025-12-13 16:39:33', 0, '2025-12-13 23:34:33', '2025-12-13 16:35:14'),
(25, 16, 'email', 'trphuc1810@gmail.com', '$2y$10$XMSSrw3YgWAeskkKjV4VIOHgV2moTZ9Eg4RhZGQ0tmaYPX/qQhIQW', '2025-12-14 05:11:23', 0, '2025-12-14 12:06:23', '2025-12-14 05:06:57'),
(26, 15, 'sms', '0832520843', '$2y$10$kFZhfj0gWbP43lhQnm93qOE21HwbmqfbiyX8qg.eRcH0HrHC1cYf2', '2025-12-14 18:44:36', 0, '2025-12-15 01:39:36', '2025-12-14 18:40:13'),
(27, 16, 'email', 'trphuc1810@gmail.com', '$2y$10$t.yGypvGTr69qTcadY1op.mKqCG8Pm8ibfABp9eUV6jIgR1W0zZqK', '2025-12-15 21:13:35', 0, '2025-12-16 04:08:35', NULL),
(28, 16, 'email', 'trphuc1810@gmail.com', '$2y$10$yF9k6ngHNkASmSUq24eYbODbaaJR5l1s8O6fvlHagvOt6xtcNI5Tm', '2025-12-16 09:05:58', 0, '2025-12-16 16:00:58', NULL),
(29, 16, 'email', 'trphuc1810@gmail.com', '$2y$10$QeQ6T55MpIdiL3O8alfF9exXko9wIF6afNYWt4EtbW4dk/m4yfsui', '2025-12-17 01:56:54', 0, '2025-12-17 08:51:54', NULL),
(30, 16, 'email', 'trphuc1810@gmail.com', '$2y$10$IMLWmdzzQXeUIuFGvHtvB.pWYad7PkXsc7g6s5NUQtxT8nzMyZ4RG', '2025-12-20 14:21:37', 0, '2025-12-20 14:16:37', '2025-12-20 14:19:39'),
(31, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$lkLTAx44aOArOVeJs2Ps4OaZtu8ZktCdFz372g15HB2FAmnjX2R2C', '2026-06-26 09:56:59', 0, '2026-06-26 09:51:59', NULL),
(32, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$ZhzqYSON9XYhgMCzTYhx/u75uvp4upY4rEkl.CCP4.qJcJZ2e85ky', '2026-06-26 09:58:13', 0, '2026-06-26 09:53:13', NULL),
(33, 16, 'email', 'trphuc1810@gmail.com', '$2y$10$Nfhl8pJ1fmYe09i0Va7qPeJKC.9ZvhI8zMhjI4Z/XOnKAlWbDqv56', '2026-06-26 10:02:02', 0, '2026-06-26 09:57:02', NULL),
(34, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$TEdFxTBbf.xbo0iiBwQLveXCaXirYiOwb/4J5yMRl0sDnMNTXLHzu', '2026-06-26 10:03:08', 0, '2026-06-26 09:58:08', NULL),
(35, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$b4LadwsAOacKBeBvpM7aAO64Mor3/L2lTG1SDsH5dAyWkwLL4ksVS', '2026-06-26 10:41:25', 0, '2026-06-26 10:36:25', NULL),
(36, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$EF68DDigui4pdYvSUySBHeLQX25q9mLHoIpG9/D36lyI3/wivCUSe', '2026-06-26 10:48:41', 0, '2026-06-26 10:43:41', NULL),
(37, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$8OXBgaD4rQ4QAPzmJV26v.2LRaBUYAXLEbxdoO6tNVBx5UhY86bfW', '2026-06-26 10:58:18', 1, '2026-06-26 10:53:18', NULL),
(38, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$hd89yINZC6uYYsSulhpMIuqa7KYpbZQdm.ZlGuYoFaXz3l2tpz49S', '2026-06-26 11:04:35', 1, '2026-06-26 10:59:35', NULL),
(39, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$q8SG0tYNewBviSFHjURCI.5tN1YpoXZALomm2Ii2j60TY1dLGxJmm', '2026-06-26 11:06:45', 1, '2026-06-26 11:01:45', NULL),
(40, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$gYSKdKjtglBNYIJO8S2l2uymUIgQ7RlCQV.j/mIPRTvPldIL.c8e2', '2026-06-26 11:08:57', 1, '2026-06-26 11:03:57', '2026-06-26 11:04:50'),
(41, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$J1ntho7rZE4X.oKIlRuu..qSJ4bOnAtqziv.I5sXbKwCZ.8V2FoNO', '2026-06-26 11:12:09', 0, '2026-06-26 11:07:09', '2026-06-26 11:07:51'),
(42, 15, 'sms', '0832520843', '$2y$12$PMXtSEYXmiGr1sLGPLv8i.a8EhC.sQMms0UKRa9.5esanQsINk5TK', '2026-06-26 15:06:29', 0, '2026-06-26 15:01:29', NULL),
(43, 15, 'sms', '0832520843', '$2y$12$2A12JBjG.YWsPIu8P75eS.qSHHNeRm521sRw8E20g8t/cu3Q2FvJa', '2026-06-26 15:31:26', 0, '2026-06-26 15:26:26', NULL),
(44, 102, 'sms', '0812180972', '$2y$12$m7glYqci8h3VujGkxqJhHOs572.hZCX01DeQJxZJStcwQ0uSPpaG.', '2026-06-26 15:33:22', 0, '2026-06-26 15:28:22', NULL),
(45, 102, 'sms', '0812180972', '$2y$12$puud4IBH/4gyBukBagyT7u/kEkwAvI97ZPiS0W.I24IKq0fYcuxhC', '2026-06-26 15:34:20', 0, '2026-06-26 15:29:20', NULL),
(46, 102, 'sms', '0812180972', '$2y$12$BnjzBskqucN3QWS5.BebhueswHPKCRmAitrnIGIYbrMaXhnmUUxAG', '2026-06-26 15:40:27', 0, '2026-06-26 15:35:27', NULL),
(47, 102, 'sms', '0812180972', '$2y$12$g4TH9Kko8sTB4xFCthobX.FwwP4qdNs7kEST.jzWvkyoWCvadJxZq', '2026-06-26 15:51:08', 0, '2026-06-26 15:46:08', NULL),
(48, 102, 'sms', '0812180972', '$2y$12$6Mw2B5Ug03u/cCX/0zZ9ou3Gg2Fn7kp.Vxw8Kr4Gx/t1mZlpfG21e', '2026-06-26 16:01:31', 0, '2026-06-26 15:56:31', '2026-06-26 15:57:18'),
(49, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$bN4IG94/Ccd3luHmUO79NekDj1g3LKM9.PfmbgZVwnCbqYmkBcUDi', '2026-06-26 16:02:56', 0, '2026-06-26 15:57:56', NULL),
(50, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$XN0L..oMDLGHJbcTW6lice8BOLlHJsvyhzT4ftvstXgPYdUkT12HK', '2026-06-26 16:03:22', 0, '2026-06-26 15:58:22', NULL),
(51, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$5an9u4qjwIOOmydnRHi0Buy607Q7Htj5ec4kizmxfC6IAWTYe2QLm', '2026-06-26 16:03:27', 0, '2026-06-26 15:58:27', NULL),
(52, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$Ob/0p8MA/OUvHfruKOL/u.SRZu.4yXxUl3xGThOvTQSGqRp5VHeOS', '2026-06-26 16:03:32', 0, '2026-06-26 15:58:32', NULL),
(53, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$fhdoSy4v98qv.X07fMe1i.WfrXm5J10066qSXCQH9yo8RWUVI2QNy', '2026-06-26 16:03:37', 0, '2026-06-26 15:58:37', NULL),
(54, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$i8MWgXAulzZIE4e2iWjDLe9ju7pABE62uw2gBpCcL4yViQ.rYQw1m', '2026-06-26 16:03:41', 0, '2026-06-26 15:58:41', NULL),
(55, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$nEWkxAFCM0xZlLDOY.4LUOFrkGMS7zkgslekq6R5li0MxZRSxrstS', '2026-06-26 16:03:46', 0, '2026-06-26 15:58:46', NULL),
(56, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$AhlVL8wlXg2hWR5rmCsW1Oulqz4cNh9t0yGs/DcXdjmr/WDT8IwW.', '2026-06-26 16:04:14', 0, '2026-06-26 15:59:14', NULL),
(57, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$azTbUE6rQmyzsCD67s/QO.EWMaORMgOmvuyQjQH5OsIrXVBJUPPb6', '2026-06-26 16:04:19', 0, '2026-06-26 15:59:19', NULL),
(58, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$mb3SDPZJJXUEqEFpIreqn.Skj5zBsO2YjcVTJf7gKSUAc9mYpzPLm', '2026-06-26 16:04:23', 0, '2026-06-26 15:59:23', NULL),
(59, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$khi1UxHKqu/Z3K6mPouD/uZDKeMb67EDVmMbFtL5Jqt6E/FHnEEje', '2026-06-26 16:06:17', 0, '2026-06-26 16:01:17', NULL),
(60, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$rmy.H3/5lU40fqU3PAYVdOT1rf0SimihJTiQ0sIipHBIofd3zAX12', '2026-06-26 16:11:51', 0, '2026-06-26 16:06:51', NULL),
(61, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$zdZ4GoQlaGIXlk6wvXv6BOLD6gd/9us.PPO/lqHaUM4fM8/eKogVq', '2026-06-26 16:13:17', 0, '2026-06-26 16:08:17', NULL),
(62, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$TclJ8F3CZk/Z0ECSHD1U7.jDSwg1qzR9JtzzXOVLhkoqUd/xljhcK', '2026-06-26 16:13:43', 0, '2026-06-26 16:08:43', NULL),
(63, 124, 'email', 'hoaianh1912@gmail.com', '$2y$12$2dTDoBzG67gtGZlaGPoECelzLGvEYXXN15rP4xBVyUhYZvliOIyJO', '2026-07-23 10:23:51', 0, '2026-07-23 10:18:51', NULL),
(64, 16, 'email', 'trphuc1810@gmail.com', '$2y$12$jMqnGq.x0zNhqCNmWc.rfejCwheGujxDG4HIFoiaM4aQ.3l/QHswC', '2026-07-23 10:31:38', 0, '2026-07-23 10:26:38', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\TaiKhoan', 101, 'customer-api-token', '429b54bc9dfaec81724ef6bed113cf7ce6f3be3e8c9edb93bf5b28c206f74eb2', '[\"*\"]', NULL, NULL, '2026-06-10 09:26:09', '2026-06-10 09:26:09'),
(10, 'App\\Models\\TaiKhoan', 11, 'google-api-token', 'fa9bd75fc2fed96a49fde2439f6399e78281493c5a1c34cc4d4957f220898b39', '[\"*\"]', '2026-06-22 07:16:41', NULL, '2026-06-22 06:51:11', '2026-06-22 07:16:41'),
(13, 'App\\Models\\TaiKhoan', 11, 'google-api-token', '96eed50dbeb5a4816dc752d266588452dd1f490a9dd4db25152b2a33b2107616', '[\"*\"]', '2026-06-22 09:18:56', NULL, '2026-06-22 08:32:16', '2026-06-22 09:18:56'),
(50, 'App\\Models\\TaiKhoan', 11, 'google-api-token', 'e6c2a84f11fa73eb687483c44db9718392bfd1c16098384216e34d70f50c9a68', '[\"*\"]', '2026-07-06 14:01:40', NULL, '2026-07-06 13:43:03', '2026-07-06 14:01:40'),
(48, 'App\\Models\\TaiKhoan', 11, 'google-api-token', '6516079ef48bd4ecc73f726dd1112fe6e37407f407d4e9caa2019746e96fa53c', '[\"*\"]', '2026-07-06 08:34:56', NULL, '2026-07-06 07:56:26', '2026-07-06 08:34:56'),
(55, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', 'c89163840c0a5379636608f23e3bacc2f9a5fd8c4e88a83da25b04d036534860', '[\"*\"]', '2026-07-07 14:17:19', NULL, '2026-07-07 08:05:30', '2026-07-07 14:17:19'),
(58, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', '3511715443975bb9dcc00ecd9e48114096734821640d26c664953d0bdd24c4f2', '[\"*\"]', '2026-07-08 05:45:16', NULL, '2026-07-07 15:18:05', '2026-07-08 05:45:16'),
(60, 'App\\Models\\TaiKhoan', 17, 'staff-api-token', 'caf50cc6537b20149788b90e823fa8593c8df703ba295b314ab3dd7d43e9a96a', '[\"*\"]', '2026-07-18 06:25:18', NULL, '2026-07-08 06:14:36', '2026-07-18 06:25:18'),
(61, 'App\\Models\\TaiKhoan', 17, 'staff-api-token', '351c2cd990dc51689cd692bc24a69e61ac77a92f1f5ae8cee8af667031e5dc39', '[\"*\"]', '2026-07-10 07:11:24', NULL, '2026-07-08 06:49:42', '2026-07-10 07:11:24'),
(62, 'App\\Models\\TaiKhoan', 17, 'staff-api-token', 'ad6a480c4f7212735fb8d2b9de5fea042471565f87409df94945dd0587889008', '[\"*\"]', '2026-07-11 02:59:39', NULL, '2026-07-10 07:11:32', '2026-07-11 02:59:39'),
(68, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', '2d1df0f082a84ef48b5b59d360a3bf200316a6cdaf5bcfef969e119fcf1d79eb', '[\"*\"]', '2026-07-12 01:11:08', NULL, '2026-07-11 08:06:40', '2026-07-12 01:11:08'),
(69, 'App\\Models\\TaiKhoan', 17, 'staff-api-token', '1fea5a40d2915db3e44fbf21f286faef3ba99f28636d02aed538131e30856676', '[\"*\"]', '2026-07-12 12:05:46', NULL, '2026-07-12 01:11:13', '2026-07-12 12:05:46'),
(73, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', 'a52a3ccc8c5f970e5689421dfd3344604c522a594820656f28272c19fdb38144', '[\"*\"]', '2026-07-12 12:45:09', NULL, '2026-07-12 12:45:08', '2026-07-12 12:45:09'),
(75, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', 'daf312ee885a7f722f81be84867c55adc5736b61dacf8c4642859c7fe71beb7f', '[\"*\"]', '2026-07-13 06:20:38', NULL, '2026-07-12 13:33:11', '2026-07-13 06:20:38'),
(76, 'App\\Models\\TaiKhoan', 17, 'staff-api-token', 'edd444dfa0c3493d1472db398204fe4ca9242dfe6f0a2a6bb5cbc8f7151df527', '[\"*\"]', '2026-07-13 06:22:10', NULL, '2026-07-13 06:20:48', '2026-07-13 06:22:10'),
(77, 'App\\Models\\TaiKhoan', 17, 'staff-api-token', '4987a450c51bd641c96540c4543939d723fee306087d264d54589e7c9e5c60f7', '[\"*\"]', '2026-07-13 13:48:39', NULL, '2026-07-13 06:22:16', '2026-07-13 13:48:39'),
(78, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', '22a264068af070f8d612a8d4ff9d5da527ab66c9696d701e8bd1a79cfeb32e9f', '[\"*\"]', '2026-07-14 06:14:50', NULL, '2026-07-13 13:48:46', '2026-07-14 06:14:50'),
(79, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', 'c86b40bf13e40d8028cbd4fad32761e47924b856662447426e15065b38d3ad8b', '[\"*\"]', '2026-07-15 06:28:36', NULL, '2026-07-14 06:14:58', '2026-07-15 06:28:36'),
(80, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', '1fdc790618dd7405e4aa306d53c625fd75c6c950e7e54a4681331bdc73694377', '[\"*\"]', '2026-07-15 07:20:39', NULL, '2026-07-15 06:28:47', '2026-07-15 07:20:39'),
(81, 'App\\Models\\TaiKhoan', 11, 'google-api-token', '078a6ea228c4f74363b519084ff82b7ffc1f586f7bebcfb21ee86d469e1196be', '[\"*\"]', '2026-07-16 06:35:10', NULL, '2026-07-15 07:36:47', '2026-07-16 06:35:10'),
(83, 'App\\Models\\TaiKhoan', 11, 'google-api-token', 'dce0c1d5b54166a363ea2f5077637670cc3bf447cdd2d6bfa1b38bbda4b6ee21', '[\"*\"]', '2026-07-16 07:04:36', NULL, '2026-07-16 06:36:58', '2026-07-16 07:04:36'),
(85, 'App\\Models\\TaiKhoan', 11, 'google-api-token', '1607d79eb9096fd5caf0bf8544e7e996d6250b01ab940344e80ad34b6f8900c7', '[\"*\"]', '2026-07-16 08:36:09', NULL, '2026-07-16 08:22:49', '2026-07-16 08:36:09'),
(87, 'App\\Models\\TaiKhoan', 11, 'google-api-token', 'c8fe2f704b58a9ef113f3813733e1c476be8b444340ee8fbfa504fcff2be6279', '[\"*\"]', '2026-07-16 08:37:22', NULL, '2026-07-16 08:36:40', '2026-07-16 08:37:22'),
(88, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', 'b25b8fb0d569369d1dea2daedafb847a36afc42832b70cdc720cc3fa55cb7af0', '[\"*\"]', '2026-07-16 13:44:43', NULL, '2026-07-16 08:37:28', '2026-07-16 13:44:43'),
(89, 'App\\Models\\TaiKhoan', 17, 'staff-api-token', 'd0261553ee91920f050549c2a2628e72767effd5b2f93822a41f2d044741fdad', '[\"*\"]', '2026-07-17 06:58:19', NULL, '2026-07-16 13:44:50', '2026-07-17 06:58:19'),
(90, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', '6825d8303faa5b569a2ff4cd233aa10a965124fa624f0df9557caf82f9fbf214', '[\"*\"]', '2026-07-17 08:33:15', NULL, '2026-07-17 06:58:24', '2026-07-17 08:33:15'),
(93, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', '7d843ef88b890569d066301d5022cfeab7f6615138bb3947cad22f5d4e44395d', '[\"*\"]', '2026-07-17 14:07:40', NULL, '2026-07-17 08:48:18', '2026-07-17 14:07:40'),
(95, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', 'e99821aef2c44347a91eb5ab43fd82adf097b119ccd7369c7c2559de59745c14', '[\"*\"]', '2026-07-18 06:10:29', NULL, '2026-07-17 14:56:51', '2026-07-18 06:10:29'),
(97, 'App\\Models\\TaiKhoan', 19, 'staff-api-token', '9bd337f9eccb0863f4bea974d3572e2887efed964f2d0e5554b7c999301cd9da', '[\"*\"]', '2026-07-19 06:56:18', NULL, '2026-07-18 14:16:37', '2026-07-19 06:56:18'),
(98, 'App\\Models\\TaiKhoan', 19, 'staff-api-token', 'bc91e76f59667a75fcc3a2edd364ad643c47f5fd9aba8ec86345152eb808da66', '[\"*\"]', '2026-07-19 06:45:42', NULL, '2026-07-19 06:45:10', '2026-07-19 06:45:42'),
(99, 'App\\Models\\TaiKhoan', 19, 'staff-api-token', '8b3943e0e5690426e264f1a38e7a5c32ac367358680951bfff7071efb116c88b', '[\"*\"]', '2026-07-19 06:50:34', NULL, '2026-07-19 06:46:14', '2026-07-19 06:50:34'),
(103, 'App\\Models\\TaiKhoan', 19, 'staff-api-token', 'a289c31ecb4b03637ed43b9033a4b77b2d8021ff4b2317b8f0987b26093e811c', '[\"*\"]', '2026-07-19 08:16:30', NULL, '2026-07-19 07:19:02', '2026-07-19 08:16:30'),
(104, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', 'a9a1f21bd45304f36b63ed631774d9065563711173b696f4f4b3841afbe93fea', '[\"*\"]', '2026-07-19 08:39:23', NULL, '2026-07-19 08:16:38', '2026-07-19 08:39:23'),
(106, 'App\\Models\\TaiKhoan', 11, 'google-api-token', '2d87a5dfb0887e1fb841e30db0eb4f389b019881d1e465e4d938717a203f448b', '[\"*\"]', '2026-07-19 14:07:41', NULL, '2026-07-19 13:48:28', '2026-07-19 14:07:41'),
(108, 'App\\Models\\TaiKhoan', 11, 'google-api-token', 'e22a5f572dbcb8bf64fc7de374249bdf2c9d5dc24783fa92e5999159663f33f3', '[\"*\"]', '2026-07-19 14:47:37', NULL, '2026-07-19 14:33:56', '2026-07-19 14:47:37'),
(109, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', '4787b0b15c8a7e46828b40cd90ec8db124235e3a7f0b58cd09de97e810ba63fe', '[\"*\"]', '2026-07-19 16:04:43', NULL, '2026-07-19 14:47:43', '2026-07-19 16:04:43'),
(113, 'App\\Models\\TaiKhoan', 11, 'google-api-token', '1b82b5f243793ade0c0686bed84413c94e83069ae97d63ad63013846fdd48894', '[\"*\"]', '2026-07-19 17:52:59', NULL, '2026-07-19 17:52:51', '2026-07-19 17:52:59'),
(114, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', '9a9e8bb8ab1aca40f751286212a8b81c48379e0f4df7252d9578a843b6ea0d7e', '[\"*\"]', '2026-07-19 18:10:18', NULL, '2026-07-19 18:04:59', '2026-07-19 18:10:18'),
(120, 'App\\Models\\TaiKhoan', 11, 'google-api-token', '26fe241817988b19221743b4b28c24851e6982e159b71472a1c0df40c60e6199', '[\"*\"]', '2026-07-23 08:08:55', NULL, '2026-07-23 07:35:11', '2026-07-23 08:08:55'),
(119, 'App\\Models\\TaiKhoan', 19, 'staff-api-token', '06bc0970eca9b006c8b29971f16ddd7a13b8c1f3db92d102eda1584f9ddc5f66', '[\"*\"]', '2026-07-23 07:35:05', NULL, '2026-07-23 07:12:37', '2026-07-23 07:35:05'),
(122, 'App\\Models\\TaiKhoan', 11, 'google-api-token', '8db3139bb21c5d7ddd9cb31b8aeb3e9eb460dd4879a0097fcdfb59b8b7a3c0f1', '[\"*\"]', '2026-07-23 08:14:05', NULL, '2026-07-23 08:10:05', '2026-07-23 08:14:05'),
(124, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', '5a5b82f10e0c30beaab837a879b0a4107f4037d21d94b081752e70b506acc61d', '[\"*\"]', '2026-07-24 02:31:10', NULL, '2026-07-23 08:25:08', '2026-07-24 02:31:10'),
(126, 'App\\Models\\TaiKhoan', 11, 'google-api-token', 'da7bc05f18b0706b76081653fe4c4fbdd0fcf2d5f556487e0ee8266a2ae1ad5b', '[\"*\"]', '2026-07-29 13:19:41', NULL, '2026-07-26 02:16:52', '2026-07-29 13:19:41'),
(127, 'App\\Models\\TaiKhoan', 17, 'staff-api-token', '539895120583c7a64708e861c9d79addf238b6ae4fd85873883a9c93ffb96093', '[\"*\"]', '2026-07-31 02:20:39', NULL, '2026-07-29 13:19:50', '2026-07-31 02:20:39'),
(128, 'App\\Models\\TaiKhoan', 11, 'google-api-token', 'f476140a43e75f374a2e6cbd134f1b7ecae95d9e5c112e50cb21dbc4f74d6c68', '[\"*\"]', '2026-08-01 07:20:19', NULL, '2026-07-31 02:20:42', '2026-08-01 07:20:19'),
(129, 'App\\Models\\TaiKhoan', 17, 'staff-api-token', 'c28a169dbf91f04add38e8d608ce5461961fac93e52ed1accfb75809fbe6db7d', '[\"*\"]', '2026-08-01 07:20:38', NULL, '2026-08-01 07:20:22', '2026-08-01 07:20:38'),
(132, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', '03453ac410475442923ede09a78cf2c18b34bf006e17ea57d013b599ca012fcc', '[\"*\"]', '2026-08-02 06:41:15', NULL, '2026-08-01 08:22:46', '2026-08-02 06:41:15'),
(131, 'App\\Models\\TaiKhoan', 11, 'google-api-token', '3f283b24947b53295d347ef46dd7d612897a93444eef98c6ab4e017c37de1dd5', '[\"*\"]', '2026-08-01 14:05:47', NULL, '2026-08-01 07:55:58', '2026-08-01 14:05:47'),
(133, 'App\\Models\\TaiKhoan', 17, 'staff-api-token', 'c332369acb6fc923fbf4574fd91bdd343b7d26c39bbb9147a0bc20d89954d3a7', '[\"*\"]', '2026-08-02 15:31:39', NULL, '2026-08-02 06:24:48', '2026-08-02 15:31:39'),
(139, 'App\\Models\\TaiKhoan', 19, 'staff-api-token', 'f75192854e5c5baef3caa37ca897b1287057612da2ab5bf13f0da18a3f22c75e', '[\"*\"]', '2026-08-02 13:12:55', NULL, '2026-08-02 09:05:08', '2026-08-02 13:12:55'),
(142, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', '601584aa0e8d43e521c076787eee7dea8affe4bdf471a5b78f41871ac3d4b7dd', '[\"*\"]', '2026-08-02 16:04:07', NULL, '2026-08-02 15:31:44', '2026-08-02 16:04:07'),
(146, 'App\\Models\\TaiKhoan', 19, 'staff-api-token', '796d67019f248140022cde63e2252ff0b919e84c5dc70f33d6b34a94e8c0d50c', '[\"*\"]', '2026-08-03 06:26:02', NULL, '2026-08-03 02:59:09', '2026-08-03 06:26:02'),
(164, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', '95b39ce649786223fc6ce7fca95e74792e556ee7a3d8124ee142a9de2b94de8f', '[\"*\"]', '2026-08-06 09:15:38', NULL, '2026-08-06 08:18:37', '2026-08-06 09:15:38'),
(151, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', 'a2020a6d6a82de2001ce6abc066ce7ba118816c60affb7fc5607339aab34b131', '[\"*\"]', '2026-08-03 10:12:25', NULL, '2026-08-03 09:22:05', '2026-08-03 10:12:25'),
(152, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', '1c9cf303e44e5b896affce98a1c4adefced647a9aba3c1c9b4962e11cddcb866', '[\"*\"]', '2026-08-03 13:54:01', NULL, '2026-08-03 12:53:31', '2026-08-03 13:54:01'),
(154, 'App\\Models\\TaiKhoan', 20, 'staff-api-token', 'f6b88ce6d39b2a998005b842997c6e00931f16a0864619efc537e18c6a31bba4', '[\"*\"]', '2026-08-05 11:08:53', NULL, '2026-08-05 07:56:54', '2026-08-05 11:08:53'),
(163, 'App\\Models\\TaiKhoan', 11, 'google-api-token', '47fb388b28ac8483de6d2de3c5ea52cfc1d9eb91b93efb926d63f6a4a5d1bfb8', '[\"*\"]', '2026-08-07 07:12:53', NULL, '2026-08-06 08:15:53', '2026-08-07 07:12:53'),
(165, 'App\\Models\\TaiKhoan', 19, 'staff-api-token', '57b7c023a8fc9259eaeb3345f27c6c5a6f76dbefdc36f839c921f2cab82879ca', '[\"*\"]', '2026-08-07 07:13:00', NULL, '2026-08-07 07:12:53', '2026-08-07 07:13:00'),
(173, 'App\\Models\\TaiKhoan', 19, 'staff-api-token', 'dd719e4c4606dbf959588e7fd23d4a2df981bff89a0f5aad25d4bc8cde37ae7d', '[\"*\"]', '2026-08-08 01:35:05', NULL, '2026-08-07 14:50:39', '2026-08-08 01:35:05'),
(178, 'App\\Models\\TaiKhoan', 19, 'staff-api-token', 'c60edc1e25fb5af43f88a3afffca2965347ceaafe719d921a0526b136bbe2359', '[\"*\"]', '2026-08-09 01:16:53', NULL, '2026-08-08 08:00:54', '2026-08-09 01:16:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
CREATE TABLE IF NOT EXISTS `taikhoan` (
  `MaTK` int NOT NULL AUTO_INCREMENT,
  `TenDangNhap` varchar(100) NOT NULL,
  `MatKhau` varchar(255) NOT NULL,
  `VaiTro` varchar(50) DEFAULT NULL,
  `TrangThai` varchar(50) DEFAULT NULL,
  `Provider` enum('local','google') NOT NULL DEFAULT 'local',
  `GoogleSub` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`MaTK`),
  UNIQUE KEY `uq_google_sub` (`GoogleSub`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`MaTK`, `TenDangNhap`, `MatKhau`, `VaiTro`, `TrangThai`, `Provider`, `GoogleSub`) VALUES
(11, 'tranhoaiphuc1810@gmail.com', '$2y$10$Q74ZyrVEMES85kePPbd9MuNt0b9DkqkWigS1/zYdwa.kPywIgsD/y', 'KH', 'Hoạt động', 'google', '115155636654796467236'),
(15, '0832520843', '$2y$10$pJp9rTrq8uFzQxpIawnlh.wu.xASocdcFPzmsJpaukC7qIUbSCcHm', 'KH', 'Hoạt động', 'local', NULL),
(16, 'trphuc1810@gmail.com', '$2y$12$xMlAXWUQ4r9/KD1/w9DvXONZ.rJkNU/a23fva/UgcFlTO2kRs7tTm', 'KH', 'Hoạt động', 'local', NULL),
(17, 'nhanvien01', '$2y$10$y7Kue2y0lbXVKoddwk6YkuRNxYok3q0wxCcbgwSQkNz2Dy9WUe.UC', 'NV', 'Khóa', 'local', NULL),
(18, 'dh52201255@gmail.com', '$2y$10$WkNFnSqrYTbmR7gURVkf0OWL2gLVob.5ebG664jiUua9s86s/pKw2', 'KH', 'Hoạt động', 'local', NULL),
(19, 'admin', '$2y$10$wkctkfrNjefYOMp4kX0ysOMAbZxRKkHWhvbc6H4ErEM9XSOJJeZ.S', 'AD', 'Hoạt động', 'local', NULL),
(20, 'nhanvien02', '$2y$12$pR2Lfj6xAov6yEub4iD/tOyUqjoLYET0BmjhsksTT3RsNJlF9.FRu', 'NV', 'Hoạt động', 'local', NULL),
(21, 'phuong123@gmail.com', '$2y$10$HX8chX6f1gK9CnMeC5LSmOHfwZ960tj9NvUtqdhFxqeefeWPOl/Hy', 'KH', 'Hoạt động', 'local', NULL),
(22, 'phuong', '$2y$10$KkgO4H7OROV20f0FXfoOpOYFbps7jxPPKTDHivQGCdnrVpoYxDOXK', 'KH', 'Hoạt động', 'local', NULL),
(101, '1234567899', '$2y$10$5NOHGkv5bnm3qI1mG3A5V.NcBG1DuITsAk/4uq7I/7tFdLW6f9p5G', 'KH', 'Hoạt động', 'local', NULL),
(102, '0812180972', '$2y$12$YWcfXdOUF4gmTCi0Nuc54uKWjYZVuRh.YCueeQOVjxg5GI.weeC9S', 'KH', 'Hoạt động', 'local', NULL),
(103, '0918430997', '$2y$12$vrjVzHiVjImskIYo9Sj3CeMtjC6Zjqr7m5iw7.M2plNDJE4CLfmBy', 'KH', 'Hoạt động', 'local', NULL),
(122, 'nhanvien03', '$2y$12$qLqc1pklJkREzDNlbwnKuuf3KAYpPQJRc5L.JsbpM.wECBTIt575.', 'NV', 'Hoạt động', 'local', NULL),
(123, 'nhanvien04', '$2y$12$3gQlKBGzraR07sSPFZ6z4uvvhLNYMPV9Hbv4ieEIRyPrr9UsaEngS', 'NV', 'Hoạt động', 'local', NULL),
(124, 'hoaianh1912@gmail.com', '$2y$12$5l9rw474TlXNBjeDs5OLoOP8xzHdReckQEkwYCYNznaIs/lOEtgye', 'KH', 'Hoạt động', 'local', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thanhtoan`
--

DROP TABLE IF EXISTS `thanhtoan`;
CREATE TABLE IF NOT EXISTS `thanhtoan` (
  `MaTT` int NOT NULL AUTO_INCREMENT,
  `NgayTT` date DEFAULT NULL,
  `SoTien` decimal(15,2) DEFAULT NULL,
  `PhuongThuc` varchar(100) DEFAULT NULL,
  `TrangThaiTT` varchar(50) DEFAULT NULL,
  `MaDon` int DEFAULT NULL,
  PRIMARY KEY (`MaTT`),
  KEY `MaDon` (`MaDon`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `thanhtoan`
--

INSERT INTO `thanhtoan` (`MaTT`, `NgayTT`, `SoTien`, `PhuongThuc`, `TrangThaiTT`, `MaDon`) VALUES
(1, '2025-12-14', 7000.00, 'Chuyển khoản', 'Thành công', 11),
(2, '2025-12-14', 7000.00, 'Chuyển khoản', 'Thành công', 12),
(3, '2025-12-15', 7000.00, 'Chuyển khoản', 'Thành công', 14),
(4, '2025-12-15', 7000.00, 'Chuyển khoản', 'Thành công', 15),
(5, '2025-12-15', 6300.00, 'Chuyển khoản', 'Thành công', 17),
(6, '2025-12-15', 7000.00, 'Chuyển khoản', 'Thành công', 18),
(7, '2025-12-15', 7000.00, 'Chuyển khoản', 'Thành công', 19),
(8, '2025-12-15', 7000.00, 'Chuyển khoản', 'Thành công', 20),
(9, '2025-12-15', 7000.00, 'Chuyển khoản', 'Thành công', 21),
(10, '2025-12-15', 7000.00, 'Chuyển khoản', 'Thành công', 23),
(11, '2025-12-15', 7000.00, 'Chuyển khoản', 'Thành công', 27),
(12, '2025-12-16', 7000.00, 'Chuyển khoản', 'Thành công', 39),
(13, '2025-12-16', 7000.00, 'Chuyển khoản', 'Thành công', 40),
(14, '2025-12-16', 7000.00, 'Chuyển khoản', 'Thành công', 41),
(15, '2025-12-23', 7000.00, 'Chuyển khoản', 'Thành công', 52),
(16, '2025-12-23', 16800.00, 'Chuyển khoản', 'Thành công', 54),
(23, '2026-07-03', 9000.00, 'Chuyển khoản', 'Thành công', 91),
(24, '2026-07-03', 9000.00, 'Chuyển khoản', 'Thành công', 90),
(25, '2026-07-03', 9000.00, 'Chuyển khoản', 'Thành công', 92),
(26, '2026-07-06', 9000.00, 'Chuyển khoản', 'Thành công', 93),
(27, '2026-07-06', 9000.00, 'Chuyển khoản', 'Thành công', 89),
(28, '2026-07-15', 9000.00, 'Chuyển khoản', 'Thành công', 96),
(29, '2026-07-15', 9000.00, 'Chuyển khoản', 'Thành công', 97),
(30, '2026-07-15', 9000.00, 'Chuyển khoản', 'Thành công', 98),
(31, '2026-07-16', 9000.00, 'Chuyển khoản', 'Thành công', 101),
(32, '2026-07-16', 9000.00, 'Chuyển khoản', 'Thành công', 102),
(33, '2026-07-26', 9000.00, 'Chuyển khoản', 'Thành công', 106),
(34, '2026-07-31', 9000.00, 'Chuyển khoản', 'Thành công', 111),
(35, '2026-08-03', 9000.00, 'Chuyển khoản', 'Thành công', 112),
(36, '2026-08-06', 9000.00, 'Chuyển khoản', 'Thành công', 114);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tintuc`
--

DROP TABLE IF EXISTS `tintuc`;
CREATE TABLE IF NOT EXISTS `tintuc` (
  `MaTin` int NOT NULL AUTO_INCREMENT,
  `TieuDe` varchar(255) DEFAULT NULL,
  `MoTa` text,
  `NoiDung` longtext,
  `LoaiTin` enum('tintuc','kinhnghiem') NOT NULL,
  `AnhDaiDien` varchar(255) DEFAULT NULL,
  `NgayDang` date DEFAULT NULL,
  `TrangThai` varchar(50) DEFAULT NULL,
  `MaNV` int DEFAULT NULL,
  `LuotXem` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MaTin`),
  KEY `MaNV` (`MaNV`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `tintuc`
--

INSERT INTO `tintuc` (`MaTin`, `TieuDe`, `MoTa`, `NoiDung`, `LoaiTin`, `AnhDaiDien`, `NgayDang`, `TrangThai`, `MaNV`, `LuotXem`) VALUES
(1, 'Du lịch Hà Giang mùa hoa tam giác mạch', 'Hà Giang rực rỡ mùa hoa tam giác mạch, thu hút hàng nghìn du khách mỗi năm.', 'Hà Giang là một trong những điểm đến nổi bật nhất mùa thu – đông với những cánh đồng hoa tam giác mạch trải dài. Đây là thời điểm thích hợp nhất để khám phá Đồng Văn, Lũng Cú, Mã Pì Lèng...', 'tintuc', 'img/tin_hagiang.jpg', '2025-02-01', 'Hiển thị', 1, 3),
(2, 'Cần Thơ khai trương bến Ninh Kiều mới', 'Bến Ninh Kiều được nâng cấp, mở rộng nhiều hạng mục phục vụ du khách.', 'Sau quá trình tu sửa, bến Ninh Kiều mới đã chính thức đưa vào hoạt động. Không gian xanh, hệ thống chiếu sáng và bến thuyền được cải thiện đáng kể...', 'tintuc', 'img/tin_cantho.jpg', '2025-02-05', 'Hiển thị', 1, 2),
(3, 'Phú Quốc lọt top 10 đảo đẹp nhất châu Á', 'Tạp chí du lịch Travel+Leisure bình chọn Phú Quốc nằm trong top 10 đảo đẹp nhất châu Á.', 'Với cảnh biển trong xanh, hệ sinh thái phong phú, nhiều khu nghỉ dưỡng cao cấp, Phú Quốc tiếp tục trở thành điểm sáng của du lịch Việt Nam...', 'tintuc', 'img/tin_phuquoc.jpg', '2025-02-10', 'Hiển thị', 1, 1),
(4, 'Vé máy bay giảm mạnh mùa tháng 5', 'Giá vé máy bay đến các điểm du lịch giảm từ 20–40% trong tháng 5.', 'Theo thống kê từ các hãng bay, tháng 5 là thời điểm vàng để du khách săn vé rẻ. Các tuyến bay đến Đà Nẵng, Nha Trang, Phú Quốc đều có mức giảm sâu...', 'tintuc', 'img/tin_vemaybay.jpg', '2025-02-12', 'Hiển thị', 1, 11),
(5, 'Khám phá tuyến cáp treo Fansipan mùa lễ hội', 'Tuyến cáp treo Fansipan tăng cường hoạt động phục vụ khách du lịch dịp lễ hội.', 'Dịp đầu năm, lượng khách đến Sa Pa tăng mạnh. Tuyến cáp treo Fansipan hoạt động liên tục nhằm đáp ứng nhu cầu tham quan đỉnh núi được mệnh danh là “Nóc nhà Đông Dương”...', 'tintuc', 'img/tin_fansipan.jpg', '2025-02-15', 'Hiển thị', 1, 6),
(6, 'Kinh nghiệm đi Hà Giang tự túc 3N2Đ', 'Gợi ý lịch trình, chi phí và lưu ý khi du lịch Hà Giang tự túc.', 'Nếu bạn lần đầu đến Hà Giang, nên xuất phát từ Hà Nội ban đêm để tiết kiệm thời gian. Các địa điểm không thể bỏ qua: Quản Bạ, Yên Minh, Đồng Văn, Mã Pì Lèng...', 'kinhnghiem', 'img/kn_hagiang.jpg', '2025-02-03', 'Hiển thị', 1, 1),
(7, 'Bí quyết săn vé máy bay giá rẻ', 'Những mẹo đơn giản giúp bạn săn vé máy bay rẻ hơn từ 30–50%.', 'Thời gian săn vé tốt nhất là sau 0h – 2h sáng thứ Ba và thứ Năm. Luôn bật chế độ ẩn danh khi tìm vé để tránh bị tăng giá...', 'kinhnghiem', 'img/kn_sanve.jpg', '2025-02-07', 'Hiển thị', 1, 0),
(8, 'Kinh nghiệm đi Phú Quốc cho gia đình có trẻ nhỏ', 'Các lưu ý khi đưa trẻ nhỏ du lịch Phú Quốc an toàn và tiết kiệm.', 'Bạn nên chọn resort gần biển và hạn chế di chuyển xa. Các điểm phù hợp gồm: VinWonders, Safari, Bãi Sao, chợ đêm Phú Quốc...', 'kinhnghiem', 'img/kn_phuquoc.jpg', '2025-02-11', 'Hiển thị', 1, 2),
(9, 'Ăn gì ở Đà Lạt khi lần đầu đến?', 'Tổng hợp quán ăn ngon – rẻ giúp bạn không lo chặt chém tại Đà Lạt.', 'Một số món nhất định phải thử: bánh căn, bánh tráng nướng, lẩu gà lá é, sữa đậu nành đêm. Địa chỉ chi tiết được tổng hợp trong bài viết...', 'kinhnghiem', 'img/kn_dalat.jpg', '2025-02-14', 'Hiển thị', 1, 1),
(10, 'Lưu ý khi đi tour miền Tây mùa nước nổi', 'Mẹo chuẩn bị đồ và chọn lịch trình phù hợp để trải nghiệm mùa nước nổi trọn vẹn.', 'Nên mang áo mưa mỏng, giày dễ khô và chống muỗi. Đặc biệt, hãy chọn tour có chợ nổi, rừng tràm và thưởng thức cá linh – bông điên điển...', 'kinhnghiem', 'img/kn_mientay.jpg', '2025-02-18', 'Hiển thị', 1, 3),
(11, 'Khai mạc lễ hội pháo hoa quốc tế Đà Nẵng 2026', 'Lễ hội pháo hoa năm nay quy tụ 8 đội thi đến từ các cường quốc pháo hoa trên thế giới, hứa hẹn mang lại những màn trình diễn mãn nhãn bên sông Hàn.', 'Tối nay, lễ hội pháo hoa quốc tế Đà Nẵng (DIFF 2026) chính thức khai mạc với chủ đề \"Thế giới không khoảng cách\". Hàng vạn du khách đã đổ về hai bên bờ sông Hàn để chiêm ngưỡng. Năm nay, đội chủ nhà Việt Nam sẽ mở màn bằng màn trình diễn kết hợp giữa âm nhạc truyền thống và kỹ thuật ánh sáng hiện đại. Giá vé khán đài dao động từ 800.000đ đến 3.000.000đ tùy vị trí. Du khách nên đặt vé sớm để có vị trí ngắm đẹp nhất.', 'tintuc', 'img/tin_11_1765997536.jpg', '2025-12-17', 'Hiển thị', 2, 50),
(12, 'Cầm 2 triệu đi sập Phú Quý 3 ngày 2 đêm - Review siêu chi tiết', 'Lịch trình chi tiết ăn gì, ở đâu, check-in góc nào đẹp nhất tại \"Tiểu Bali\" của Việt Nam. Đọc ngay để không bỡ ngỡ!', '1. Di chuyển:\r\nXe khách Sài Gòn - Phan Thiết: 180k/vé (Phương Trang).\r\nTàu cao tốc ra đảo: 350k/vé khứ hồi (Superdong). Nên đặt trước 2 tuần vì rất nhanh hết vé.\r\n2. Ở đâu? \r\nMình ở Homestay Cô Sang, giá 300k/đêm. Cô chủ cực nhiệt tình, hỗ trợ thuê xe máy chỉ 100k/ngày.\r\n3. Lịch trình ăn chơi:\r\nNgày 1: Check-in Dốc Phượt, Vịnh Triều Dương. Chiều ngắm hoàng hôn ở Bờ Kè. Tối ăn bò nóng (đặc sản phải thử).\r\nNgày 2: Lặn ngắm san hô Hòn Tranh (250k/người). Chiều đi Phong Điện khổng lồ chụp ảnh sống ảo.\r\nNgày 3: Thăm Mộ Thầy, ăn sáng bánh căn rồi lên tàu về đất liền.\r\nTổng kết: Đảo còn hoang sơ, người dân thân thiện. 10 điểm không có nhưng!', 'kinhnghiem', 'img/tin_12_1766218627.jpeg', '2025-12-17', 'Ẩn', NULL, 12),
(21, 'Trọn bộ kinh nghiệm khám phá Vịnh Vĩnh Hy - Viên ngọc thô của Ninh Thuận', 'Vịnh Vĩnh Hy được mệnh danh là một trong bốn vịnh biển hoang sơ và đẹp nhất Việt Nam. Nếu bạn đang lên kế hoạch cho một chuyến đi thư giãn, hòa mình vào thiên nhiên, bài viết này sẽ cung cấp những kinh nghiệm di chuyển, ăn uống và vui chơi chi tiết nhất giúp bạn có một hành trình trọn vẹn.', '<p>Nằm cách trung tâm thành phố Phan Rang - Tháp Chàm khoảng 40km, Vịnh Vĩnh Hy mang vẻ đẹp êm đềm, được bao bọc bởi những dãy núi đá vôi bạt ngàn và mặt biển xanh trong vắt. Dưới đây là những kinh nghiệm bạn không nên bỏ túi khi đến với vùng đất này:</p><p><strong>1. Thời điểm lý tưởng nhất để đến Vĩnh Hy</strong></p><p>Vĩnh Hy đẹp nhất là vào khoảng tháng 2 đến tháng 10 hàng năm. Lúc này thời tiết nắng ráo, biển động ít, nước biển trong xanh vô cùng lý tưởng cho các hoạt động tắm biển và ngắm san hô.</p><figure class=\"image\"><img style=\"aspect-ratio:1500/1007;\" src=\"http://127.0.0.1:8000/storage/editor/editor_20260713_215505_avgGjxsa.jpg\" width=\"1500\" height=\"1007\"></figure><p><strong>2. Những trải nghiệm không thể bỏ lỡ</strong></p><p><strong>Ngắm rạn san hô bằng tàu đáy kính:</strong> Đây là \"đặc sản\" của Vĩnh Hy. Bạn sẽ được ngồi trên tàu, nhìn xuyên qua lớp kính dưới đáy để chiêm ngưỡng thảm san hô rực rỡ sắc màu cùng những đàn cá bơi lội tung tăng.</p><figure class=\"image\"><img style=\"aspect-ratio:800/533;\" src=\"http://127.0.0.1:8000/storage/editor/editor_20260713_212532_2VGLOyne.jpg\" width=\"800\" height=\"533\"></figure><p><strong>Check-in Hang Rái:</strong> Nơi đây được ví như \"sao Hỏa trên Trái Đất\" với bề mặt đá san hô cổ hóa thạch lồi lõm độc đáo. Đặc biệt, khi sóng vỗ vào thềm đá sẽ tạo nên hiện tượng thác nước trên biển tuyệt đẹp.</p><figure class=\"image\"><img style=\"aspect-ratio:800/500;\" src=\"http://127.0.0.1:8000/storage/editor/editor_20260713_212654_EN0OK3Ov.jpg\" width=\"800\" height=\"500\"></figure><p><strong>Hái nho tại Vườn nho Thái An:</strong> Được mệnh danh là \"thủ phủ\" nho của Ninh Thuận. Bạn có thể tự do tham quan, tự tay cắt những chùm nho chín mọng và thưởng thức mật nho miễn phí.</p><figure class=\"image\"><img style=\"aspect-ratio:840/532;\" src=\"http://127.0.0.1:8000/storage/editor/editor_20260713_212743_iN0xU7Pl.jpg\" width=\"840\" height=\"532\"></figure><p><strong>3. Thưởng thức ẩm thực miền biển</strong> Đến Vĩnh Hy, chắc chắn bạn phải thưởng thức hải sản tươi sống ngay trên các bè nổi. Tôm hùm, nhum biển, ốc mặt trăng và mực lá tươi rói được chế biến đơn giản như nướng mỡ hành hay hấp sả cũng đủ làm say lòng bất kỳ thực khách nào.</p><figure class=\"image\"><img style=\"aspect-ratio:612/408;\" src=\"http://127.0.0.1:8000/storage/editor/editor_20260713_213150_HtvocIhA.jpg\" width=\"612\" height=\"408\"></figure><p><strong>4. Một số lưu ý nhỏ</strong></p><p>Trang bị đầy đủ kem chống nắng, mũ rộng vành và áo khoác vì nắng Ninh Thuận khá gắt.</p><p>Nếu dễ bị say sóng, hãy uống thuốc trước khi lên tàu đáy kính khoảng 30 phút.</p><p>Giữ gìn vệ sinh chung, không vứt rác bừa bãi xuống vịnh để bảo vệ cảnh quan thiên nhiên.</p>', 'kinhnghiem', 'news/news_21_1783953265.jpg', '2026-07-13', 'Hiển thị', 2, 56);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tour`
--

DROP TABLE IF EXISTS `tour`;
CREATE TABLE IF NOT EXISTS `tour` (
  `MaTour` int NOT NULL AUTO_INCREMENT,
  `IDTourGoc` int DEFAULT NULL,
  `TenTour` varchar(255) DEFAULT NULL,
  `DiaDiem` varchar(255) DEFAULT NULL,
  `GiaGoc` decimal(15,2) DEFAULT NULL,
  `GiaGiam` decimal(15,2) DEFAULT NULL,
  `ThoiLuong` varchar(50) DEFAULT NULL,
  `NgayKhoiHanh` date DEFAULT NULL,
  `NgayKetThuc` date DEFAULT NULL,
  `SoCho` int DEFAULT NULL,
  `SoChoDaDat` int DEFAULT NULL,
  `Mien` varchar(100) DEFAULT NULL,
  `LoaiTour` varchar(100) DEFAULT NULL,
  `TinhChatTour` enum('Theo đợt','Định kỳ') NOT NULL DEFAULT 'Theo đợt',
  `LichTrinhTuan` varchar(50) DEFAULT NULL COMMENT 'Chuỗi ngày lặp trong tuần (Ví dụ: 0=CN, 1=T2... 6=T7)',
  `PhanTramGiam` float DEFAULT NULL,
  `TrangThai` varchar(50) DEFAULT NULL,
  `MaNV` int DEFAULT NULL,
  PRIMARY KEY (`MaTour`),
  KEY `MaNV` (`MaNV`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `tour`
--

INSERT INTO `tour` (`MaTour`, `IDTourGoc`, `TenTour`, `DiaDiem`, `GiaGoc`, `GiaGiam`, `ThoiLuong`, `NgayKhoiHanh`, `NgayKetThuc`, `SoCho`, `SoChoDaDat`, `Mien`, `LoaiTour`, `TinhChatTour`, `LichTrinhTuan`, `PhanTramGiam`, `TrangThai`, `MaNV`) VALUES
(1, NULL, 'Tour Hà Nội 1N', 'Hà Nội', 10000.00, 9000.00, '1N', '2026-11-20', '2026-11-20', 40, 0, 'Bắc', 'Cá nhân', 'Theo đợt', NULL, 10, 'Hoạt động', 1),
(2, NULL, 'Tour Sapa 2N1Đ', 'Sa Pa', 2850000.00, 2422500.00, '2N1Đ', '2026-11-14', '2026-11-15', 30, 25, 'Bắc', 'Cá nhân', 'Theo đợt', NULL, 15, 'Ngừng hoạt động', 1),
(3, NULL, 'Tour Hà Giang 3N2Đ', 'Hà Giang', 3650000.00, 2920000.00, '3N2Đ', '2026-11-22', '2026-11-24', 30, 0, 'Bắc', 'Cá nhân', 'Theo đợt', NULL, 20, 'Hoạt động', 1),
(4, NULL, 'Tour Ninh Bình 1N', 'Ninh Bình', 950000.00, 760000.00, '1N', '2026-11-22', '2026-11-22', 45, 0, 'Bắc', 'Cá nhân', 'Theo đợt', NULL, 20, 'Hoạt động', 1),
(5, NULL, 'Tour Hạ Long 2N1Đ', 'Hạ Long', 3200000.00, 2560000.00, '2N1Đ', '2026-11-23', '2026-11-24', 50, 0, 'Bắc', 'Cá nhân', 'Theo đợt', NULL, 20, 'Hoạt động', 1),
(6, NULL, 'Tour Mộc Châu 2N1Đ', 'Mộc Châu', 1850000.00, 1665000.00, '2N1Đ', '2026-11-23', '2026-11-24', 35, 0, 'Bắc', 'Cá nhân', 'Theo đợt', NULL, 10, 'Hoạt động', 1),
(7, NULL, 'Tour Lạng Sơn 1N', 'Lạng Sơn', 780000.00, 663000.00, '1N', '2026-11-24', '2026-11-24', 40, 0, 'Bắc', 'Cá nhân', 'Theo đợt', NULL, 15, 'Hoạt động', 1),
(8, NULL, 'Tour Yên Tử 1N', 'Yên Tử', 750000.00, 675000.00, '1N', '2026-11-24', '2026-11-24', 50, 0, 'Bắc', 'Cá nhân', 'Theo đợt', NULL, 10, 'Hoạt động', 1),
(9, NULL, 'Tour Mai Châu 2N1Đ', 'Mai Châu', 2150000.00, 1720000.00, '2N1Đ', '2026-11-25', '2026-11-26', 30, 0, 'Bắc', 'Cá nhân', 'Theo đợt', NULL, 20, 'Hoạt động', 1),
(10, NULL, 'Tour Cao Bằng 3N2Đ', 'Cao Bằng', 3950000.00, 3160000.00, '3N2Đ', '2026-11-25', '2026-11-27', 35, 0, 'Bắc', 'Cá nhân', 'Theo đợt', NULL, 20, 'Hoạt động', 1),
(11, NULL, 'Tour Huế 1N', 'Huế', 7000.00, 6300.00, '1N', '2026-11-26', '2026-11-26', 40, 1, 'Trung', 'Cá nhân', 'Theo đợt', NULL, 10, 'Hoạt động', 1),
(12, NULL, 'Tour Đà Nẵng – Hội An 2N1Đ', 'Đà Nẵng', 2850000.00, 2280000.00, '2N1Đ', '2026-11-26', '2026-11-27', 40, 0, 'Trung', 'Cá nhân', 'Theo đợt', NULL, 20, 'Hoạt động', 1),
(13, NULL, 'Tour Đà Lạt 3N2Đ', 'Đà Lạt', 3200000.00, 2720000.00, '3N2Đ', '2026-11-27', '2026-11-29', 40, 0, 'Trung', 'Cá nhân', 'Theo đợt', NULL, 15, 'Hoạt động', 1),
(14, NULL, 'Tour Quy Nhơn 3N2Đ', 'Quy Nhơn', 3500000.00, 2800000.00, '3N2Đ', '2026-11-27', '2026-11-29', 50, 0, 'Trung', 'Cá nhân', 'Theo đợt', NULL, 20, 'Hoạt động', 1),
(15, NULL, 'Tour Phong Nha 2N1Đ', 'Phong Nha', 2500000.00, 2250000.00, '2N1Đ', '2026-11-21', '2026-11-22', 35, 0, 'Trung', 'Cá nhân', 'Theo đợt', NULL, 10, 'Hoạt động', 1),
(16, NULL, 'Tour Nha Trang 3N2Đ', 'Nha Trang', 3900000.00, 3315000.00, '3N2Đ', '2026-11-21', '2026-11-23', 40, 0, 'Trung', 'Cá nhân', 'Theo đợt', NULL, 15, 'Hoạt động', 1),
(17, NULL, 'Tour Buôn Ma Thuột 2N1Đ', 'Buôn Ma Thuột', 2100000.00, 1785000.00, '2N1Đ', '2026-11-22', '2026-11-23', 30, 0, 'Trung', 'Cá nhân', 'Theo đợt', NULL, 15, 'Hoạt động', 1),
(18, NULL, 'Tour Bình Ba 1N', 'Bình Ba', 850000.00, 680000.00, '1N', '2026-11-22', '2026-11-22', 50, 0, 'Trung', 'Cá nhân', 'Theo đợt', NULL, 20, 'Hoạt động', 1),
(19, NULL, 'Tour Lý Sơn 2N1Đ', 'Lý Sơn', 2300000.00, 1955000.00, '2N1Đ', '2026-11-23', '2026-11-24', 40, 0, 'Trung', 'Cá nhân', 'Theo đợt', NULL, 15, 'Hoạt động', 1),
(20, NULL, 'Tour Hang Én 1N', 'Hang Én', 1200000.00, 1020000.00, '1N', '2026-11-23', '2026-11-23', 30, 0, 'Trung', 'Cá nhân', 'Theo đợt', NULL, 15, 'Hoạt động', 1),
(21, NULL, 'Tour Cần Thơ 1N', 'Cần Thơ', 750000.00, 675000.00, '1N', '2026-11-24', '2026-11-24', 40, 0, 'Nam', 'Cá nhân', 'Theo đợt', NULL, 10, 'Hoạt động', 1),
(22, NULL, 'Tour Cà Mau 2N1Đ', 'Cà Mau', 1850000.00, 1480000.00, '2N1Đ', '2026-11-24', '2026-11-25', 35, 0, 'Nam', 'Cá nhân', 'Theo đợt', NULL, 20, 'Hoạt động', 1),
(23, NULL, 'Tour Phú Quốc 3N2Đ', 'Phú Quốc', 3650000.00, 3102500.00, '3N2Đ', '2026-11-25', '2026-11-27', 40, 0, 'Nam', 'Cá nhân', 'Theo đợt', NULL, 15, 'Hoạt động', 1),
(24, NULL, 'Tour Vũng Tàu 1N', 'Vũng Tàu', 850000.00, 680000.00, '1N', '2026-11-25', '2026-11-25', 40, 0, 'Nam', 'Cá nhân', 'Theo đợt', NULL, 20, 'Hoạt động', 1),
(25, NULL, 'Tour Tây Ninh 1N', 'Tây Ninh', 650000.00, 552500.00, '1N', '2026-11-26', '2026-11-26', 50, 0, 'Nam', 'Cá nhân', 'Theo đợt', NULL, 15, 'Hoạt động', 1),
(26, NULL, 'Tour Bến Tre 2N1Đ', 'Bến Tre', 1450000.00, 1160000.00, '2N1Đ', '2026-11-26', '2026-11-27', 30, 0, 'Nam', 'Cá nhân', 'Theo đợt', NULL, 20, 'Hoạt động', 1),
(27, NULL, 'Tour Đồng Tháp 1N – Sa Đéc', 'Đồng Tháp', 850000.00, 722500.00, '1N', '2026-11-27', '2026-11-27', 35, 0, 'Nam', 'Cá nhân', 'Theo đợt', NULL, 15, 'Hoạt động', 1),
(28, NULL, 'Tour Đại Nam 1N', 'Đại Nam', 600000.00, 540000.00, '1N', '2026-11-27', '2026-11-27', 40, 0, 'Nam', 'Cá nhân', 'Theo đợt', NULL, 10, 'Hoạt động', 1),
(29, NULL, 'Tour Long An 1N', 'Long An', 750000.00, 600000.00, '1N', '2026-11-21', '2026-11-21', 30, 0, 'Nam', 'Cá nhân', 'Theo đợt', NULL, 20, 'Hoạt động', 1),
(30, NULL, 'Tour Sóc Trăng 2N1Đ', 'Sóc Trăng', 1650000.00, 1402500.00, '2N1Đ', '2026-11-21', '2026-11-22', 40, 0, 'Nam', 'Cá nhân', 'Theo đợt', NULL, 15, 'Hoạt động', 1),
(31, NULL, 'Team Building Hà Nội 2N1Đ', 'Hà Nội', 3500000.00, 2975000.00, '2N1Đ', NULL, NULL, 0, 0, 'Bắc', 'Doanh nghiệp', 'Theo đợt', NULL, 15, 'Hết chỗ', 1),
(32, NULL, 'Hội Thảo Sapa 3N2Đ', 'Sa Pa', 4850000.00, 3880000.00, '3N2Đ', NULL, NULL, 0, 0, 'Bắc', 'Doanh nghiệp', 'Theo đợt', NULL, 20, 'Ngừng hoạt động', 1),
(33, NULL, 'Teambuilding Đà Nẵng 3N2Đ', 'Đà Nẵng', 5200000.00, 4420000.00, '3N2Đ', NULL, NULL, 0, 0, 'Trung', 'Doanh nghiệp', 'Theo đợt', NULL, 15, 'Hoạt động', 1),
(34, NULL, 'Kết hợp Hội An 2N1Đ', 'Hội An', 3100000.00, 2480000.00, '2N1Đ', NULL, NULL, 0, 0, 'Trung', 'Doanh nghiệp', 'Theo đợt', NULL, 20, 'Hoạt động', 1),
(35, NULL, 'Hội Nghị Nha Trang 3N2Đ', 'Nha Trang', 5900000.00, 4720000.00, '3N2Đ', NULL, NULL, 0, 0, 'Trung', 'Doanh nghiệp', 'Theo đợt', NULL, 20, 'Hoạt động', 1),
(36, NULL, 'Team Building Cần Thơ 2N1Đ', 'Cần Thơ', 2650000.00, 2120000.00, '2N1Đ', NULL, NULL, 0, 0, 'Nam', 'Doanh nghiệp', 'Theo đợt', NULL, 20, 'Hoạt động', 1),
(37, NULL, 'Du Lịch Miền Tây 3N2Đ', 'Miền Tây', 3100000.00, 2635000.00, '3N2Đ', NULL, NULL, 0, 0, 'Nam', 'Doanh nghiệp', 'Theo đợt', NULL, 15, 'Hoạt động', 1),
(38, NULL, 'Hội Thảo Vũng Tàu 2N1Đ', 'Vũng Tàu', 2800000.00, 2240000.00, '2N1Đ', NULL, NULL, 0, 0, 'Nam', 'Doanh nghiệp', 'Theo đợt', NULL, 20, 'Hoạt động', 1),
(39, NULL, 'Đảo Phú Quốc 4N3Đ', 'Phú Quốc', 6900000.00, 5520000.00, '4N3Đ', NULL, NULL, 0, 0, 'Nam', 'Doanh nghiệp', 'Theo đợt', '', 20, 'Hoạt động', 1),
(40, NULL, 'Chương Trình Du Lịch Xuyên Việt 5N4Đ', 'Xuyên Việt', 8900000.00, 7570000.00, '5N4Đ', NULL, NULL, 0, 0, 'Nam', 'Doanh nghiệp', 'Theo đợt', NULL, 15, 'Hoạt động', 1),
(41, NULL, 'Tour Hà Nội – Sapa 3N2Đ', 'Sa Pa', 2000000.00, 1800000.00, '3N2Đ', '2026-11-22', '2026-11-24', 30, 0, 'Bắc', 'Cá nhân', 'Theo đợt', '', 10, 'Hoạt động', NULL),
(42, NULL, 'Tour Vĩnh Hy', 'Khánh Hoà', 2000000.00, 1600000.00, '2N1Đ', '2026-11-22', '2026-11-23', 20, 0, 'Nam', 'Cá nhân', 'Theo đợt', NULL, 20, 'Ngừng hoạt động', NULL),
(44, NULL, 'Tour Sapa 2N1Đ', 'Sa Pa', 2850000.00, 2422500.00, '2N1Đ', '2026-11-12', '2026-11-13', 30, 0, 'Bắc', 'Cá nhân', 'Theo đợt', '', 15, 'Ngừng hoạt động', NULL),
(45, NULL, 'Tour Sapa 2N1Đ', 'Sa Pa', 2850000.00, 2422500.00, '2N1Đ', '2026-11-21', '2026-11-22', 30, 0, 'Bắc', 'Cá nhân', 'Theo đợt', '', 15, 'Hoạt động', NULL),
(46, NULL, 'Tour Khám Phá Di Sản: Đà Nẵng - Hội An - Bà Nà Hills', 'Đà Nẵng, Quảng Nam', 4500000.00, 4050000.00, '3N2Đ', NULL, NULL, 30, 0, 'Trung', 'Cá nhân', 'Định kỳ', '2', 10, 'Hoạt động', NULL),
(47, 46, 'Tour Khám Phá Di Sản: Đà Nẵng - Hội An - Bà Nà Hills', 'Đà Nẵng, Quảng Nam', 4500000.00, 4050000.00, '3N2Đ', '2026-11-11', '2026-11-13', 30, 0, 'Trung', 'Cá nhân', 'Theo đợt', '', 10, 'Hoạt động', NULL),
(48, 46, 'Tour Khám Phá Di Sản: Đà Nẵng - Hội An - Bà Nà Hills', 'Đà Nẵng, Quảng Nam', 4500000.00, 4050000.00, '3N2Đ', '2026-11-18', '2026-11-20', 30, 0, 'Trung', 'Cá nhân', 'Theo đợt', '', 10, 'Hoạt động', NULL),
(49, 46, 'Tour Khám Phá Di Sản: Đà Nẵng - Hội An - Bà Nà Hills', 'Đà Nẵng, Quảng Nam', 4500000.00, 4050000.00, '3N2Đ', '2026-11-25', '2026-11-27', 30, 0, 'Trung', 'Cá nhân', 'Theo đợt', '', 10, 'Hoạt động', NULL),
(50, 46, 'Tour Khám Phá Di Sản: Đà Nẵng - Hội An - Bà Nà Hills', 'Đà Nẵng, Quảng Nam', 4500000.00, 4050000.00, '3N2Đ', '2026-11-01', '2026-11-03', 30, 0, 'Trung', 'Cá nhân', 'Theo đợt', '', 10, 'Hoạt động', NULL),
(51, NULL, 'Tour Team Building & Gala Dinner Doanh Nghiệp: Đà Nẵng - Hội An - Bà Nà Hills - Cố Đô Huế', 'Đà Nẵng - Hội An - Huế', 5800000.00, 4930000.00, '4N3Đ', NULL, NULL, 0, 0, 'Trung', 'Doanh nghiệp', 'Theo đợt', '', 15, 'Hoạt động', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tour_khuyenmai`
--

DROP TABLE IF EXISTS `tour_khuyenmai`;
CREATE TABLE IF NOT EXISTS `tour_khuyenmai` (
  `MaTour` int NOT NULL,
  `MaCTKM` int NOT NULL,
  `PhanTramGiamKM` float DEFAULT NULL,
  PRIMARY KEY (`MaTour`,`MaCTKM`),
  KEY `MaCTKM` (`MaCTKM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `tour_khuyenmai`
--

INSERT INTO `tour_khuyenmai` (`MaTour`, `MaCTKM`, `PhanTramGiamKM`) VALUES
(1, 1, 30),
(1, 3, 10),
(1, 4, 60),
(1, 5, 70),
(2, 2, 30),
(3, 1, 30),
(5, 1, 30),
(7, 2, 30),
(9, 2, 30),
(12, 1, 30),
(15, 1, 30),
(15, 3, 10),
(23, 3, 15),
(23, 26, 15),
(24, 26, 15),
(28, 27, 25),
(41, 6, 50),
(41, 26, 15),
(42, 26, 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `yeucaudoanhnghiep`
--

DROP TABLE IF EXISTS `yeucaudoanhnghiep`;
CREATE TABLE IF NOT EXISTS `yeucaudoanhnghiep` (
  `MaYC` int NOT NULL AUTO_INCREMENT,
  `TenCongTy` varchar(255) DEFAULT NULL,
  `NguoiLienHe` varchar(150) DEFAULT NULL,
  `SDT` varchar(20) DEFAULT NULL,
  `SoNguoi` int DEFAULT NULL,
  `DiaDiem` varchar(255) DEFAULT NULL,
  `ThoiGianKhoiHanh` date DEFAULT NULL,
  `NgayKetThuc` date DEFAULT NULL,
  `GiaTriHopDong` decimal(15,2) DEFAULT NULL,
  `NgayThanhToan` date DEFAULT NULL,
  `TrangThai` varchar(50) DEFAULT NULL,
  `MaKH` int DEFAULT NULL,
  `MaNV` int DEFAULT NULL,
  `MaTour` int DEFAULT NULL,
  `NgayGui` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MaYC`),
  KEY `MaKH` (`MaKH`),
  KEY `MaNV` (`MaNV`),
  KEY `MaTour` (`MaTour`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `yeucaudoanhnghiep`
--

INSERT INTO `yeucaudoanhnghiep` (`MaYC`, `TenCongTy`, `NguoiLienHe`, `SDT`, `SoNguoi`, `DiaDiem`, `ThoiGianKhoiHanh`, `NgayKetThuc`, `GiaTriHopDong`, `NgayThanhToan`, `TrangThai`, `MaKH`, `MaNV`, `MaTour`, `NgayGui`) VALUES
(1, 'ABC Company', 'Phúc Trần Hoài', '0832520843', 22, NULL, '2025-12-18', NULL, NULL, NULL, 'Chờ xử lý', 11, NULL, 40, '2026-07-17 07:24:29'),
(2, 'ABC Company', 'Phúc Trần Hoài', '0832520843', 22, NULL, '2025-12-19', NULL, NULL, NULL, 'Chờ xử lý', 11, NULL, 38, '2026-07-17 07:24:29'),
(3, 'ABC Company', 'Phúc Trần Hoài', '0832520843', 20, NULL, '2025-12-16', NULL, NULL, NULL, 'Chờ xử lý', 11, NULL, 37, '2026-07-17 07:24:29'),
(4, 'ABC Company', 'Phúc Trần Hoài', '0832520843', 20, NULL, '2025-12-17', NULL, NULL, NULL, 'Chờ xử lý', 11, NULL, 39, '2026-07-17 07:24:29'),
(5, 'ABC Company', 'Phúc Trần Hoài', '0832520843', 22, NULL, '2025-12-19', NULL, NULL, NULL, 'Chờ xử lý', 11, NULL, 40, '2026-07-17 07:24:29'),
(6, 'ABC Company', 'Phúc Trần Hoài', '0832520843', 20, NULL, '2025-12-19', NULL, NULL, NULL, 'Đã liên hệ', 11, 44, 38, '2026-07-17 07:24:29'),
(7, 'ABC Company', 'Trần Phúc', '0832520843', 100, NULL, '2025-12-19', NULL, NULL, NULL, 'Chờ xử lý', 15, NULL, 31, '2026-07-17 07:24:29'),
(8, 'LVT', 'Phúc Trần Hoài', '0832520843', 20, NULL, '2025-12-25', NULL, 151400000.00, '2025-12-17', 'Đã hoàn tất', 11, 1, 40, '2026-07-17 07:24:29'),
(9, 'LBN', 'Phúc Trần Hoài', '0832520843', 20, NULL, '2025-12-30', NULL, NULL, NULL, 'Chờ xử lý', 11, NULL, 35, '2026-07-17 07:24:29'),
(10, 'NPT', 'Phúc Trần Hoài', '0832520843', 20, NULL, '2025-12-29', NULL, NULL, NULL, 'Chờ xử lý', 11, NULL, 35, '2026-07-17 07:24:29'),
(11, 'THP', 'Phúc Trần Hoài', '0832520843', 20, NULL, '2025-12-24', NULL, NULL, NULL, 'Đã liên hệ', 11, 2, 37, '2026-07-17 07:24:29'),
(12, 'ABC Company', 'Phúc Trần Hoài', '0832520843', 22, NULL, '2025-12-30', NULL, 151400000.00, '2026-01-06', 'Đã liên hệ', 11, 45, 40, '2026-07-17 07:24:29'),
(13, 'THP', 'Phúc Trần Hoài', '0832520843', 25, NULL, '2026-01-09', NULL, NULL, NULL, 'Chờ xử lý', 11, NULL, 40, '2026-07-17 07:24:29'),
(14, 'THA', 'Phúc Trần Hoài', '0832520843', 20, NULL, '2026-07-07', NULL, NULL, NULL, 'Chờ xử lý', 11, NULL, 32, '2026-07-17 07:24:29'),
(15, 'THA', 'Trần Phúc', '0832520843', 20, NULL, '2026-07-10', NULL, NULL, NULL, 'Chờ xử lý', 15, NULL, 40, '2026-07-17 07:24:29'),
(16, 'THA', 'Phúc Trần Hoài', '0832520843', 25, NULL, '2026-06-30', NULL, NULL, NULL, 'Hủy tour', 11, 2, 32, '2026-07-17 07:24:29'),
(17, 'LBN', 'Phúc Trần Hoài', '0322221551', 29, NULL, '2026-07-03', NULL, NULL, NULL, 'Đã liên hệ', 11, 44, 32, '2026-07-17 07:24:29'),
(18, 'ABC Company', 'Phúc Trần Hoài', '0832520843', 20, NULL, '2026-07-15', NULL, NULL, NULL, 'Đã liên hệ', 11, 46, 32, '2026-07-17 07:24:29'),
(19, 'THA', 'Phúc Trần Hoài', '0322221551', 20, NULL, '2026-07-30', '2026-08-01', NULL, NULL, 'Chờ xử lý', 11, NULL, 32, '2026-07-19 16:20:30'),
(20, 'NPT', 'Phúc Trần Hoài', '0322221551', 20, NULL, '2026-08-12', '2026-08-16', NULL, NULL, 'Chờ xử lý', 11, NULL, 40, '2026-07-19 16:22:22'),
(21, 'NPT', 'Phúc Trần Hoài', '0234567890', 20, NULL, '2026-08-12', '2026-08-13', NULL, NULL, 'Chờ xử lý', 11, NULL, 34, '2026-08-01 07:56:47'),
(22, 'ABC Company', 'Phúc Trần Hoài', '0234567890', 20, NULL, '2026-08-27', '2026-08-29', 77600000.00, '2026-08-01', 'Đã thanh toán', 11, 2, 32, '2026-08-01 08:10:00'),
(23, 'LVT', 'Phúc Trần Hoài', '0234567890', 20, NULL, '2026-08-19', '2026-08-20', NULL, NULL, 'Chờ xử lý', 11, NULL, 31, '2026-08-02 07:22:23'),
(24, 'ABC Company', 'Phúc Trần Hoài', '0234567890', 20, NULL, '2026-08-20', '2026-08-22', 20000.00, '2026-08-03', 'Đã thanh toán', 11, 2, 32, '2026-08-03 08:46:27'),
(25, 'NPT', 'Phúc Trần Hoài', '0234567890', 20, NULL, '2026-08-21', '2026-08-22', NULL, NULL, 'Đã liên hệ', 11, 2, 31, '2026-08-03 09:23:03'),
(26, 'LVT', 'Phúc Trần Hoài', '0234567890', 20, NULL, '2026-08-21', '2026-08-22', NULL, NULL, 'Đã liên hệ', 11, 2, 34, '2026-08-03 09:29:33'),
(27, 'LVT', 'Phúc Trần Hoài', '0234567890', 20, NULL, '2026-08-21', '2026-08-23', NULL, NULL, 'Chờ xử lý', 11, NULL, 35, '2026-08-03 09:36:22'),
(28, 'THA', 'Phúc Trần Hoài', '0234567890', 20, NULL, '2026-08-22', '2026-08-24', NULL, NULL, 'Đã liên hệ', 11, 2, 33, '2026-08-03 09:44:44'),
(29, 'LVT', 'Phúc Trần Hoài', '0234567890', 20, NULL, '2026-08-24', '2026-08-26', NULL, NULL, 'Đã liên hệ', 11, 2, 35, '2026-08-03 09:52:04'),
(30, 'STU', 'Phúc Trần Hoài', '0234567890', 20, NULL, '2026-09-04', '2026-09-07', NULL, NULL, 'Chờ xử lý', 11, NULL, 51, '2026-08-08 07:47:11');

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`MaTK`) REFERENCES `taikhoan` (`MaTK`);

--
-- Các ràng buộc cho bảng `chinhanh`
--
ALTER TABLE `chinhanh`
  ADD CONSTRAINT `chinhanh_ibfk_1` FOREIGN KEY (`MaCTY`) REFERENCES `congty` (`MaCTY`);

--
-- Các ràng buộc cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD CONSTRAINT `fk_danhgia_khachhang` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_danhgia_tour` FOREIGN KEY (`MaTour`) REFERENCES `tour` (`MaTour`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `dondattour`
--
ALTER TABLE `dondattour`
  ADD CONSTRAINT `dondattour_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`),
  ADD CONSTRAINT `dondattour_ibfk_2` FOREIGN KEY (`MaTour`) REFERENCES `tour` (`MaTour`),
  ADD CONSTRAINT `dondattour_ibfk_3` FOREIGN KEY (`MaCTKM`) REFERENCES `chuongtrinhkhuyenmai` (`MaCTKM`);

--
-- Các ràng buộc cho bảng `hinhanhtour`
--
ALTER TABLE `hinhanhtour`
  ADD CONSTRAINT `hinhanhtour_ibfk_1` FOREIGN KEY (`MaTour`) REFERENCES `tour` (`MaTour`);

--
-- Các ràng buộc cho bảng `hoantien`
--
ALTER TABLE `hoantien`
  ADD CONSTRAINT `fk_hoantien_dondattour` FOREIGN KEY (`MaDon`) REFERENCES `dondattour` (`MaDon`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD CONSTRAINT `khachhang_ibfk_1` FOREIGN KEY (`MaTK`) REFERENCES `taikhoan` (`MaTK`);

--
-- Các ràng buộc cho bảng `lichtrinhtour`
--
ALTER TABLE `lichtrinhtour`
  ADD CONSTRAINT `lichtrinhtour_ibfk_1` FOREIGN KEY (`MaTour`) REFERENCES `tour` (`MaTour`);

--
-- Các ràng buộc cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`MaTK`) REFERENCES `taikhoan` (`MaTK`);

--
-- Các ràng buộc cho bảng `thanhtoan`
--
ALTER TABLE `thanhtoan`
  ADD CONSTRAINT `thanhtoan_ibfk_1` FOREIGN KEY (`MaDon`) REFERENCES `dondattour` (`MaDon`);

--
-- Các ràng buộc cho bảng `tintuc`
--
ALTER TABLE `tintuc`
  ADD CONSTRAINT `tintuc_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`);

--
-- Các ràng buộc cho bảng `tour`
--
ALTER TABLE `tour`
  ADD CONSTRAINT `tour_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`);

--
-- Các ràng buộc cho bảng `tour_khuyenmai`
--
ALTER TABLE `tour_khuyenmai`
  ADD CONSTRAINT `tour_khuyenmai_ibfk_1` FOREIGN KEY (`MaTour`) REFERENCES `tour` (`MaTour`),
  ADD CONSTRAINT `tour_khuyenmai_ibfk_2` FOREIGN KEY (`MaCTKM`) REFERENCES `chuongtrinhkhuyenmai` (`MaCTKM`);

--
-- Các ràng buộc cho bảng `yeucaudoanhnghiep`
--
ALTER TABLE `yeucaudoanhnghiep`
  ADD CONSTRAINT `yeucaudoanhnghiep_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`),
  ADD CONSTRAINT `yeucaudoanhnghiep_ibfk_2` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`),
  ADD CONSTRAINT `yeucaudoanhnghiep_ibfk_3` FOREIGN KEY (`MaTour`) REFERENCES `tour` (`MaTour`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
