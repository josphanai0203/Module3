create database `student-manager`;
create table `student-manager`.`Class`(
`id` int not null,
`name` varchar(255) null,
primary key (`id`));
create table `student-manager`.`Teacher`(
`id` int not null,
`name` varchar(255) null,
`age` int not null,
`country` varchar(45),
primary key (`id`));