
mysql  << EOF

use POC_HEALTH;


drop table IF EXISTS Wintercare;
drop table IF EXISTS Emercare;
drop table IF EXISTS Seasonalcare;
drop table IF EXISTS Denguecare;
drop table IF EXISTS Generalcare;

create table Wintercare(pid integer primary key,pname varchar(20),page integer,pgender varchar(20),pdisinfo varchar(20),phospital varchar(20),padate varchar(20),ploc varchar(20));
create table Emercare(pid integer primary key,pname varchar(20),page integer,pgender varchar(20),pdisinfo varchar(20),phospital varchar(20),padate varchar(20),ploc varchar(20));
create table Seasonalcare(pid integer primary key,pname varchar(20),page integer,pgender varchar(20),pdisinfo varchar(20),phospital varchar(20),padate varchar(20),ploc varchar(20));
create table Denguecare(pid integer primary key,pname varchar(20),page integer,pgender varchar(20),pdisinfo varchar(20),phospital varchar(20),padate varchar(20),ploc varchar(20));
create table Generalcare(pid integer primary key,pname varchar(20),page integer,pgender varchar(20),pdisinfo varchar(20),phospital varchar(20),padate varchar(20),ploc varchar(20));
EOF
