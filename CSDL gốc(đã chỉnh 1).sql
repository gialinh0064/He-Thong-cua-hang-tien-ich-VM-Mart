
USE master
GO

CREATE DATABASE A
GO

--DROP DATABASE A
--GO

USE A
GO
----CREATE TABLE NHA CUNG CAP----

CREATE TABLE [dbo].[NCC]
(
	[MaNCC] [nvarchar](10) NOT NULL, 
	[TenNCC] [nvarchar](50)  NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nvarchar](10) NULL,
	[Fax] [nvarchar](50)  NULL,
    CONSTRAINT [PK_NCC] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO NCC([MaNCC],[TenNCC],[DiaChi],[SDT],[Fax])
    VALUES ('NCC1',N'Bia Bến thành',N'34 HCM',10000,2)
INSERT INTO NCC([MaNCC],[TenNCC],[DiaChi],[SDT],[Fax])
    VALUES ('NCC2',N'Vinamilk',N'160 Q.Thủ Đức,HCM',11000,32)
INSERT INTO NCC([MaNCC],[TenNCC],[DiaChi],[SDT],[Fax])
    VALUES ('NCC3',N'ChiBiCo',N'161B Q.Thủ Đức,HCM',13000,32)
INSERT INTO NCC([MaNCC],[TenNCC],[DiaChi],[SDT],[Fax])
    VALUES ('NCC4',N'Unilever',N'161B Q.Hòan Kiếm,HaNoi',14000,32)
INSERT INTO NCC([MaNCC],[TenNCC],[DiaChi],[SDT],[Fax])
    VALUES ('NCC5',N'Pepsi',N'150B Q.Hòan Kiếm,HaNoi',15000,32)
INSERT INTO NCC([MaNCC],[TenNCC],[DiaChi],[SDT],[Fax])
    VALUES ('NCC6',N'Simply',N'530A Q.Hòan Kiếm,HaNoi',16000,32)    
    GO
    
    select*
    from NCC
    go
    
----------------Create table Nhanvien---------------

CREATE TABLE [dbo].[Nhanvien](
	[MaNV] [nvarchar] (10) NOT NULL,
	[HoNV] [nvarchar](50) NULL,
	[Ten] [nvarchar](50) NULL,
	[Diachi] [nvarchar](50) NULL,
	[Dienthoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Nhanvien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT INTO Nhanvien ([MaNV],[HoNV],[Ten],[Diachi],[Dienthoai])
    VALUES ('NV01',N'Nguy?n Văn',N'An',N'Hà Tiên',N'1064425301')
INSERT INTO Nhanvien ([MaNV],[HoNV],[Ten],[Diachi],[Dienthoai])
    VALUES ('NV02',N'lê Văn',N'Hằng',N'Kiên Giang',N'1064435201')
INSERT INTO Nhanvien ([MaNV],[HoNV],[Ten],[Diachi],[Dienthoai])
    VALUES ('NV03',N'Phạm Thị Nữ',N'Như',N'TP.Hồ Chí Minh',N'1064524301')
INSERT INTO Nhanvien ([MaNV],[HoNV],[Ten],[Diachi],[Dienthoai])
    VALUES ('NV04',N'Trương Văn Minh',N'Nhật',N'TP.Hồ Chí Minh',N'1064402531')
INSERT INTO Nhanvien ([MaNV],[HoNV],[Ten],[Diachi],[Dienthoai])
    VALUES ('NV05',N'Lý Văn Minh',N'Nguyệt',N'Vũng Tàu',N'1064425301')

------------CREATE TABLE LoaiHH------------------


CREATE TABLE [dbo].[LoaiHH](
	[MaLoaiHH] [int] NOT NULL,
	[TenLoaiHH] [nvarchar](255) NULL,
 CONSTRAINT [PK_LoaiHH] PRIMARY KEY CLUSTERED 
(
	[MaLoaiHH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
Go
INSERT INTO LoaiHH([MaLoaiHH],[TenLoaiHH])VALUES(1, N'Rượu')
INSERT INTO LoaiHH([MaLoaiHH],[TenLoaiHH])VALUES(2, N'Bia')
INSERT INTO LoaiHH([MaLoaiHH],[TenLoaiHH])VALUES(3, N'Nước ngọt')
INSERT INTO LoaiHH([MaLoaiHH],[TenLoaiHH])VALUES(4, N'Dầu Ăn')
INSERT INTO LoaiHH([MaLoaiHH],[TenLoaiHH])VALUES(5, N'Sữa')


--select*
--from LoaiHH
--go

-----------CREATE TABLE Hang hoa------------

CREATE TABLE [dbo].[HangHoa](
	[MaHH] [nvarchar](10) NOT NULL,
	[TenHH] [nvarchar](50) NULL,
	[Donvitinh] [nvarchar](8) NULL,
	[Dongia] [int] NULL,
	[MaLoaiHH] [int] NOT NULL,
	
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(--khoa chinh--
	[MaHH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
--=====tao khoa ngoai cho bang SanPhamBH : MaLoaiHH
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_LoaiHH] FOREIGN KEY([MaLoaiHH])/*khoa ngoai*/
REFERENCES [dbo].[LoaiHH] ([MaLoaiHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_LoaiHH]
GO 

INSERT INTO HangHoa([MaHH],[TenHH],[Donvitinh],[Dongia],[MaLoaiHH])
    VALUES ('Bb12',N'Bia Bến thành',N'Chai',18000,2)
INSERT INTO HangHoa([MaHH],[TenHH],[Donvitinh],[Dongia],[MaLoaiHH])
    VALUES ('BH01',N'Bia Heineken',N'Chai',20000,2)
INSERT INTO HangHoa([MaHH],[TenHH],[Donvitinh],[Dongia],[MaLoaiHH])
    VALUES ('BS01',N'Dầu ăn Simply',N'Chai',25000,4)
INSERT INTO HangHoa([MaHH],[TenHH],[Donvitinh],[Dongia],[MaLoaiHH])
    VALUES ('Bs14',N'Pepsi',N'Chai',15000,3)
INSERT INTO HangHoa([MaHH],[TenHH],[Donvitinh],[Dongia],[MaLoaiHH])
    VALUES ('BS15',N'Vinamilk',N'Bịt',70000,5)
go

---------Create table Phieu Nhap ------


CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [nvarchar] (10) NOT NULL,
	[NgayNhap] [datetime] NULL,
	[MaNCC] [nvarchar](10) NULL,
	--[TongGiaTri] [float] null,
	[MaNV] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--===Khoa ngoai (Phieu Nhap-NCC)==--
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NCC] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NCC] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NCC]
GO
--===Khoa ngoai (Phieu Nhap-NV)==--
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_Nhanvien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[Nhanvien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_Nhanvien]
GO

    
------CREATE TABLE CTPN------


CREATE TABLE [dbo].[CTPN](
	[MaPN] [nvarchar] (10) NOT NULL,
	[MaHH] [nvarchar](10) NOT NULL,
	[SoLuongNhap] [float] NULL,
	[DonGia] [float] NULL,	
 CONSTRAINT [PK_CTPN] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC,
	[MaHH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CTPN]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_PhieuNhap] FOREIGN KEY([MaPN])
REFERENCES [dbo].[PhieuNhap] ([MaPN])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [FK_CTPN_PhieuNhap]
GO

ALTER TABLE [dbo].[CTPN]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [FK_CTPN_HangHoa]
GO
   
--=======CREATE TABLE PHIEU XUAT======--


CREATE TABLE [dbo].[PhieuXuat](
	[MaPX] [nvarchar] (10) NOT NULL,
	[NgayXuat] [datetime] NULL,
	--[TongGiaTri] [nvarchar](50) NULL,
	[MaNV] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_PhieuXuat] PRIMARY KEY CLUSTERED 
(
	[MaPX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--===Khoa ngoai (Phieu Xuat-NV)==--
ALTER TABLE [dbo].[PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_PhieuXuat_Nhanvien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[Nhanvien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_PhieuXuat_Nhanvien]
GO

----CREATE TABLE CTPX---


CREATE TABLE [dbo].[CTPX](
	[MaPX] [nvarchar] (10) NOT NULL,
	[MaHH] [nvarchar](10) NOT NULL,
	[SoLuongXuat] [int] NULL,
	[DonGia] [float] NULL,
 CONSTRAINT [PK_CTPX] PRIMARY KEY CLUSTERED 
(
	[MaPX] ASC,
	[MaHH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CTPX]  WITH CHECK ADD  CONSTRAINT [FK_CTPX_PhieuXuat] FOREIGN KEY([MaPX])
REFERENCES [dbo].[PhieuXuat] ([MaPX])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [FK_CTPX_PhieuXuat]
GO

ALTER TABLE [dbo].[CTPX]  WITH CHECK ADD  CONSTRAINT [FK_CTPX_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [FK_CTPX_HangHoa]
GO

-----------CREATE TABLE Hoa Don------------------


CREATE TABLE [dbo].[HoaDon](
	[MaHD] [nvarchar](10) NOT NULL,
	[MaNV] [nvarchar] (10) NULL,
	[NgayLapHD] [datetime] NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Nhanvien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[Nhanvien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_Nhanvien]
go

INSERT INTO [HoaDon]([MaHD],[MaNV],[NgayLapHD])
     VALUES ('HD001','NV04','2000-02-26 00:00:00.000')
INSERT INTO [HoaDon]([MaHD],[MaNV],[NgayLapHD])
     VALUES ('HD002','NV01','2000-08-05 00:00:00.000')
INSERT INTO [HoaDon]([MaHD],[MaNV],[NgayLapHD])
     VALUES ('HD003','NV01','2000-10-21 00:00:00.000')
INSERT INTO [HoaDon]([MaHD],[MaNV],[NgayLapHD])
     VALUES ('HD004','NV02','2002-06-06 00:00:00.000')
INSERT INTO [HoaDon]([MaHD],[MaNV],[NgayLapHD])
     VALUES ('HD005','NV03','2001-08-08 00:00:00.000')
INSERT INTO [HoaDon]([MaHD],[MaNV],[NgayLapHD])
     VALUES ('HD006','NV03','2001-02-16 00:00:00.000')
go

-----------CREATE TABLE CTHD--------------

CREATE TABLE [dbo].[CTHD](
	[MaHD] [nvarchar](10) NOT NULL,
	[MaHH] [nvarchar](10) NOT NULL,
	[Soluong] [smallint] NULL,
	[Giamgia] [real] NULL,
 CONSTRAINT [PK_CTHD] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaHH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK_CTHD_HoaDon]
GO

ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK_CTHD_HangHoa]
GO

INSERT INTO [CTHD] ([MaHD] ,[MaHH],[Soluong] ,[Giamgia])
     VALUES ('HD001','Bb12',10,0)
INSERT INTO [CTHD] ([MaHD] ,[MaHH],[Soluong] ,[Giamgia])
     VALUES ('HD001','BH01',12,0.5)
INSERT INTO [CTHD] ([MaHD] ,[MaHH],[Soluong] ,[Giamgia])
     VALUES ('HD001','BS01',4,0.5)
INSERT INTO [CTHD] ([MaHD] ,[MaHH],[Soluong] ,[Giamgia])
     VALUES ('HD001','Bs14',100,0.2)
INSERT INTO [CTHD] ([MaHD] ,[MaHH],[Soluong] ,[Giamgia])
     VALUES ('HD002','BS15',4,1) 

------CREATE TABLE PHIEU KIEM KE


CREATE TABLE [dbo].[PhieuKK](
	[MaKK] [nvarchar] (10) NOT NULL,
	[NgayKK] [datetime] NULL,
	[TongGiaTri] [nvarchar](50) NULL,
	[MaNV] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_PhieuKK] PRIMARY KEY CLUSTERED 
(
	[MaKK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--===Khoa ngoai (Phieu Xuat-NV)==--
ALTER TABLE [dbo].[PhieuKK]  WITH CHECK ADD  CONSTRAINT [FK_PhieuKK_Nhanvien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[Nhanvien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

----===CREATE TABLE CTPKK==----

CREATE TABLE [dbo].[CTPKK](
	[MaKK] [nvarchar](10) NOT NULL,
	[MaHH] [nvarchar](10) NOT NULL,
	[Soluong] [smallint] NULL,
	[TinhTrang] [nvarchar](50) NULL,
 CONSTRAINT [PK_CTPKK] PRIMARY KEY CLUSTERED 
(
	[MaKK] ASC,
	[MaHH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[CTPKK]  WITH CHECK ADD  CONSTRAINT [FK_CTPKK_PhieuKK] FOREIGN KEY([MaKK])
REFERENCES [dbo].[PhieuKK] ([MaKK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CTPKK] CHECK CONSTRAINT [FK_CTPKK_PhieuKK]
GO

ALTER TABLE [dbo].[CTPKK]  WITH CHECK ADD  CONSTRAINT [FK_CTPKK_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CTPKK] CHECK CONSTRAINT [FK_CTPKK_HangHoa]
GO

