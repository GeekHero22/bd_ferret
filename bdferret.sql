USE MASTER IF EXISTS(SELECT * FROM SYS.databases WHERE NAME = 'Ferret')
DROP DATABASE Ferret
GO

CREATE DATABASE Ferret
GO

USE Ferret
GO



create table usuario
(
id int identity not null,
--adm bit not null,
nome_usuario varchar(60) not null,
email varchar(60) not null,
photo varbinary(max) null,
photofundo varbinary(max) null,
--historico varchar(300) null,
descricao varchar(500) null,
tel varchar(20),
primary key (id),
)
create table projeto
(
 id int identity not null,
usuario_id int not null,
 photoprojeto varbinary(max) not null,
 titulo varchar(40) not null,
 quant_membros int not null,
 --etapas varchar(200) null,
 --etapas_concluidas varchar(200) null,
 descricao varchar(1000) not null,
 data_inicio smalldatetime not null,
 data_fim smalldatetime not null,
 primary key(id),
 foreign key(usuario_id) references usuario(id),
)
create table projeto_usuario
(
id int identity not null,
id_projeto int not null,
usuario_id int not null,
adm bit not null,
primary key(id),
foreign key(id_projeto) references projeto(id),
foreign key(usuario_id) references usuario(id)
)
create table postagem
(
id int identity not null,
usuario_id int  not null,
data smalldatetime not null,
curtida bit null,
conteudo varchar(240) not null,
img varchar(max) null,
descr varchar(500) null,
primary key(id),
foreign key(usuario_id) references usuario(id)
)
create table comentario
(
id int identity not null,
usuario_id int not null,
id_postagem int not null,
texto varchar(180) not null,
conteudo text null,
primary key(id),
foreign key(usuario_id) references usuario(id),
foreign key(id_postagem) references postagem(id)
)
create table back_up
(
id int identity not null,
projeto_id int not null,
link varchar(200) not null,
primary key (id),
foreign key(projeto_id) references projeto(id)
)
create table chat(
id int identity not null,
usuario_id int not null,
projeto_usuario_id int not null,
mensagem varchar(1800) not null,
data datetime,
de_usuario varchar(80),
para_usuario varchar(80),
primary key(id),
foreign key(usuario_id) references usuario(id),
foreign key(projeto_usuario_id) references projeto_usuario(id)
)
