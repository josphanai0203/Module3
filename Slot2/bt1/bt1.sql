create database if not exists QuanLyVatTu;
use QuanLyVatTu;
create table PhieuXuat(
SoPX int primary key,
NgayXuat date
);
create table PhieuNhap(
SoPN int primary key,
NgayNhap date
);
create table NhaCC(
MaNCC int primary key,
TenNCC varchar(50),
DiaChi varchar(255),
SDT varchar(10)
);
create table DonDH(
SoDH int primary key,
NgayDH date,
MaNCC int,
foreign key (MaNCC) references NhaCC(MaNCC)
);
create table VatTu(
MaVTU int primary key,
TenVTU varchar(255)
);
create table ChiTietPX(
SoPX int,
MaVTU int,
DGXuat double,
SLXuat int,
primary key (SoPX,MaVTU),
foreign key (SoPX) references PhieuXuat(SoPX),
foreign key (MaVTU) references VatTu(MaVTU)
);
create table ChiTietPN(
SoPN int ,
MaVTU int,
DGXuat double,
SLXuat int,
primary key (SoPN,MaVTU),
foreign key (SoPN) references PhieuNhap(SoPN),
foreign key (MaVTU) references VatTu(MaVTU)
);
create table ChiTietDDH(
SoDH int ,
MaVTU int,
NgayDH date,
primary key (SoDH,MaVTU),
foreign key(SoDH) references DonDH(SoDH),
foreign key (MaVTU) references VatTu(MaVTU)
);
