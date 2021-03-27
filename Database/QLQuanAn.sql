CREATE DATABASE QLQuanAn
USE QLQuanAn
--Tạo bảng Nhân viên
IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE NAME = 'NHANVIEN')
DROP TABLE NHANVIEN
GO
CREATE TABLE NHANVIEN
(
	MaNhanVien varchar (5) PRIMARY KEY,
	Ho nvarchar (30) NULL,
	Ten nvarchar (10) NULL,
	GioiTinh nvarchar (5) NULL,
	NgaySinh datetime NULL,
	DiaChi nvarchar (80) NULL,
	DienThoai nvarchar (15) NULL,
)
GO
--Bảng Tài Khoản
CREATE TABLE TAIKHOAN
(
	TenTaiKhoan varchar (30) PRIMARY KEY,
	MatKhau varchar (30) NULL,
	MaNhanVien varchar (5) NOT NULL,
	CONSTRAINT FK_TAIKHOAN_MaNhanVien FOREIGN KEY (MaNhanVien) REFERENCES NHANVIEN(MaNhanVien),
)
--Bảng Nhóm Quyền
CREATE TABLE NHOMQUYEN
(
	MaQuyen varchar (5) PRIMARY KEY,
	TenQuyen nvarchar (50) NULL,
)
--Bảng Mối quan hệ giữa 2 bảng tài khoản và nhóm quyền
CREATE TABLE TAIKHOAN_NHOMQUYEN
(
	MaTKNQ int Identity(1,1) PRIMARY KEY,
	TenTaiKhoan varchar (30) NOT NULL,
	MaQuyen varchar (5) NOT NULL,
	CONSTRAINT FK_TAIKHOAN_NHOMQUYEN_TenTaiKhoan FOREIGN KEY (TenTaiKhoan) REFERENCES TAIKHOAN(TenTaiKhoan),
	CONSTRAINT FK_TAIKHOAN_NHOMQUYEN_MaQuyen FOREIGN KEY (MaQuyen) REFERENCES NHOMQUYEN(MaQuyen)
)
--Tạo bảng Khu Vực
IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE NAME = 'KHUVUC')
DROP TABLE KHUVUC
GO
CREATE TABLE KHUVUC
(
	MaKhuVuc varchar (5) PRIMARY KEY,
	TenKhuVuc nvarchar (15) NULL,
	MoTa nvarchar(30) NULL,
	TrangThai nvarchar(20) NULL,
)
--Tạo bảng Bàn
IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE NAME = 'BAN')
DROP TABLE BAN
GO
CREATE TABLE BAN
(
	MaBan varchar (5) PRIMARY KEY,
	MaKhuVuc varchar (5) NOT NULL,
	TenBan nvarchar (15) Null,
	MoTa nvarchar(30) NULL,
	TrangThai nvarchar(20) NULL,
	CONSTRAINT FK_BAN_MaKhuVuc FOREIGN KEY (MaKhuVuc) REFERENCES KHUVUC(MaKhuVuc),
)
--Tạo bảng Loại Thực Đơn
IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE NAME = 'LOAITHUCDON')
DROP TABLE LOAITHUCDON
GO
CREATE TABLE LOAITHUCDON
(
	MaLoai varchar (5) PRIMARY KEY,
	TenLoai nvarchar (50) NULL,
	TrangThai nvarchar(15) NULL,
)
GO
--Tạo bảng Thực Đơn
IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE NAME = 'THUCDON')
DROP TABLE THUCDON
GO
CREATE TABLE THUCDON
(
	MaThucDon varchar (5) PRIMARY KEY,
	MaLoai varchar (5) not null,
	TenThucDon nvarchar (50) Null,
	DonViTinh nvarchar (10) NULL,
	SoLuongTon int NULL,
	DonGia float (2) NULL,
	TrangThai nvarchar(15) NULL,
	CONSTRAINT FK_THUCDON_MaLoai FOREIGN KEY (MaLoai) REFERENCES LOAITHUCDON(MaLoai),
)
GO
--Tạo bảng Gọi Món
IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE NAME = 'GOIMON')
DROP TABLE GOIMON
GO
CREATE TABLE GOIMON
(
	MaGoiMon int Identity(1,1) PRIMARY KEY,
	MaBan varchar (5) not null,
	MaThucDon varchar (5) not null,
	MaNhanVien varchar (5) not null,
	SoLuong int NULL,
	ThoiGian datetime NULL,
	ThanhTien float NULL,
	CONSTRAINT FK_GOIMON_MaBan FOREIGN KEY (MaBan) REFERENCES BAN(MaBan),
	CONSTRAINT FK_GOIMON_MaThucDon FOREIGN KEY (MaThucDon) REFERENCES THUCDON(MaThucDon),
	CONSTRAINT FK_GOIMON_MaNhanVien FOREIGN KEY (MaNhanVien) REFERENCES NHANVIEN(MaNhanVien),
)
GO

INSERT INTO NHANVIEN VALUES ('QL001',N'Phạm Minh',N'Vũ','Nam','01/24/1980',N'163/30 Thành Thái F.14 Q.10 TPHCM','0905646162')
INSERT INTO NHANVIEN VALUES ('NV001',N'Nguyễn Minh',N'Thành','Nam','04/05/1983',N'41/4 CALMETTE Q1 TPHCM','0908373612')
INSERT INTO NHANVIEN VALUES ('NV002',N'Nguyễn Hà My',N'My',N'Nữ','04/13/1985',N'178 NAM KỲ KHỞI NGHĨA Q4 TPHCM','0908783274')

INSERT INTO TAIKHOAN VALUES ('admin','admin','QL001')
INSERT INTO TAIKHOAN VALUES ('nguyenminhthanh','pmt123','NV001')
INSERT INTO TAIKHOAN VALUES ('nguyenhamy','nhm456','NV002')

INSERT INTO NHOMQUYEN VALUES ('QL000',N'Quản Lý')
INSERT INTO NHOMQUYEN VALUES ('QLKV0',N'Quản Lý Khu Vực')
INSERT INTO NHOMQUYEN VALUES ('QLTD0',N'Quản Lý Thực Đơn')
INSERT INTO NHOMQUYEN VALUES ('QLGM0',N'Quản Lý Gọi Món')
INSERT INTO NHOMQUYEN VALUES ('QLDT0',N'Quản Lý Doanh Thu')

INSERT INTO TAIKHOAN_NHOMQUYEN VALUES ('admin','QL000')
INSERT INTO TAIKHOAN_NHOMQUYEN VALUES ('nguyenminhthanh','QLKV0')
INSERT INTO TAIKHOAN_NHOMQUYEN VALUES ('nguyenhamy','QLTD0')
INSERT INTO TAIKHOAN_NHOMQUYEN VALUES ('nguyenhamy','QLGM0')
INSERT INTO TAIKHOAN_NHOMQUYEN VALUES ('nguyenhamy','QLDT0')

INSERT INTO KHUVUC VALUES ('KV001',N'Trong Nhà',N'Bàn trong Nhà',N'Hoạt Động')
INSERT INTO KHUVUC VALUES ('KV002',N'Tầng 2',N'Không còn bàn trống',N'Đầy')
INSERT INTO KHUVUC VALUES ('KV003',N'Tầng 3',N'Đèn bị hư',N'Đang Sửa Chữa')
INSERT INTO KHUVUC VALUES ('KV004',N'Sân Thượng',N'Bàn trên sân thượng',N'Hoạt Động')

INSERT INTO BAN VALUES ('B0001','KV001',N'Bàn 1',N'',N'Đã Có Khách')
INSERT INTO BAN VALUES ('B0002','KV001',N'Bàn 2',N'',N'Trống')
INSERT INTO BAN VALUES ('B0003','KV001',N'Bàn 3',N'',N'Trống')
INSERT INTO BAN VALUES ('B0004','KV002',N'Bàn Couple',N'Bàn Tình Nhân',N'Đã Có Khách')
INSERT INTO BAN VALUES ('B0005','KV002',N'Bàn Couple',N'Bàn Tình Nhân',N'Đã Có Khách')
INSERT INTO BAN VALUES ('B0006','KV002',N'Bàn Couple',N'Bàn Tình Nhân',N'Đã Có Khách')
INSERT INTO BAN VALUES ('B0007','KV003',N'Phòng 1',N'Phòng Tổ Chức Sự Kiện',N'Trống')
INSERT INTO BAN VALUES ('B0008','KV004',N'Bàn Vip 1',N'Bàn Cho Khách Vip',N'Đã Có Khách')
INSERT INTO BAN VALUES ('B0009','KV004',N'Bàn Vip 2',N'Bàn Cho Khách Vip',N'Trống')

INSERT INTO LOAITHUCDON VALUES ('LTD01',N'Cơm',N'Còn Hàng')
INSERT INTO LOAITHUCDON VALUES ('LTD02',N'Gà',N'Còn Hàng')
INSERT INTO LOAITHUCDON VALUES ('LTD03',N'Cá',N'Còn Hàng')
INSERT INTO LOAITHUCDON VALUES ('LTD04',N'Phở',N'Còn Hàng')
INSERT INTO LOAITHUCDON VALUES ('LTD05',N'Đồ Ăn Vặt',N'Còn Hàng')
INSERT INTO LOAITHUCDON VALUES ('LTD06',N'Tráng Miệng',N'Còn Hàng')
INSERT INTO LOAITHUCDON VALUES ('LTD07',N'Đồ Uống',N'Còn Hàng')
INSERT INTO LOAITHUCDON VALUES ('LTD08',N'Bia',N'Còn Hàng')
INSERT INTO LOAITHUCDON VALUES ('LTD09',N'Khác',N'Còn Hàng')

INSERT INTO THUCDON VALUES ('TD001','LTD01',N'Cơm Chiên',N'Dĩa',50,30000,N'Còn Hàng')
INSERT INTO THUCDON VALUES ('TD002','LTD01',N'Cơm Tấm',N'Dĩa',30,35000,N'Còn Hàng')
INSERT INTO THUCDON VALUES ('TD003','LTD01',N'Cơm Chay',N'Dĩa',10,20000,N'Còn Hàng')
INSERT INTO THUCDON VALUES ('TD004','LTD04',N'Phở Bò Viên',N'Tô',40,30000,N'Còn Hàng')
INSERT INTO THUCDON VALUES ('TD005','LTD02',N'Gà Chiên',N'Dĩa',15,20000,N'Còn Hàng')
INSERT INTO THUCDON VALUES ('TD006','LTD06',N'RAU CAU',N'Dĩa',60,15000,N'Còn Hàng')
INSERT INTO THUCDON VALUES ('TD007','LTD06',N'BÁNH FLAN',N'Dĩa',35,7000,N'Còn Hàng')
INSERT INTO THUCDON VALUES ('TD008','LTD06',N'TRÁI CÂY',N'Dĩa',70,20000,N'Còn Hàng')
INSERT INTO THUCDON VALUES ('TD009','LTD07',N'COCA COLA',N'Lon',60,15000,N'Còn Hàng')
INSERT INTO THUCDON VALUES ('TD010','LTD07',N'PEPSI',N'Lon',50,15000,N'Còn Hàng')
INSERT INTO THUCDON VALUES ('TD011','LTD07',N'BÒ HÚC',N'Lon',65,13000,N'Còn Hàng')
INSERT INTO THUCDON VALUES ('TD012','LTD07',N'NƯỚC SUỐI',N'Chai',8000,35,N'Còn Hàng')
INSERT INTO THUCDON VALUES ('TD013','LTD09',N'KHĂN LẠNH',N'Cái',55,5000,N'Còn Hàng')
INSERT INTO THUCDON VALUES ('TD014','LTD09',N'ĐẬU PHỘNG',N'Bịch',85,10000,N'Còn Hàng')

select * from sys.sysservers

Select * from TAIKHOAN
Select * from TAIKHOAN_NHOMQUYEN
Select * from NHOMQUYEN
select * from NHANVIEN

--Insert into NHANVIEN values ('NV000','Genshin','Impact',N'Khác','10/24/2020','PC, Android, IOS,...','0123456789')
--update NHANVIEN set MaNhanVien = '123', Ho = N'deef', Ten = N'abc', DienThoai = '0987654321', DiaChi = N'metqua', GioiTinh = N'Nam',NgaySinh = '2/27/2000' WHERE MaNhanVien = 'NV000'
--delete from TAIKHOAN where MaNhanVien = 'NV000'
--delete from TAIKHOAN_NHOMQUYEN where TenTaiKhoan = 'admin'

--update TAIKHOAN set MatKhau = 'impact' where TenTaiKhoan = 'genshin'

Select * from KHUVUC
select * from BAN
Select * from GOIMON

Select * from LOAITHUCDON
Select * from THUCDON

select * from GOIMON