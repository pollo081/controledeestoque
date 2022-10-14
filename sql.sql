use controledeestoque -- tabela cliente
create table cliente(
	cod_cli int primary key identity (1, 1) not null,
	nom_cli varchar (50) not null,
	cpf_cli bigint not null,
	cel_cli bigint not null
) -- tabela fornecedor
create table fornecedor(
	cod_for int primary key identity (1, 1) not null,
	nom_for varchar (50),
	fon_for bigint not null,
	ema_for varchar (50)
) -- tabela produto
create table produto(
	cod_pro int primary key identity (1, 1) not null,
	nom_pro varchar (60) not null,
	est_min_pro int not null,
	est_max_pro int not null,
	est_sal_pro int not null,
	pre_ven_pro decimal (8, 2),
	pre_cus_pro decimal (8, 2),
	uni_pro int,
	cod_for int not null
) -- tabela movimentacao
create table movimentacao(
	cod_mov int primary key identity (1, 1) not null,
	cod_cli int not null,
	dat_mov date,
	tip_mov varchar (1),
	tot_mov decimal (8, 2),
	des_mov decimal (8, 2)
) -- tabela movimentacao_item
create table movimentacao_item(
	cod_mov_ite int primary key identity (1, 1) not null,
	cod_mov int not null,
	cod_pro int not null,
	qtd_mov_ite int not null
)
alter table
	produto
alter column
	uni_pro decimal(8, 2) null --relacionando
alter table
	movimentacao
add
	constraint fk_cod_mov foreign key (cod_cli) references cliente(cod_cli)
alter table
	movimentacao_item
add
	constraint fk_cod_mov_it foreign key (cod_mov) references movimentacao (cod_mov)
alter table
	movimentacao_item
add
	constraint fk_cod_pro foreign key (cod_pro) references produto (cod_pro)
alter table
	produto
add
	constraint fk_cod_for foreign key (cod_for) references fornecedor (cod_for) -- dados cliente
insert into
	cliente
values
	('Gilberto Carlos', 69846943024, 11993145945)
insert into
	cliente
values
	(
		'Kaique Yuri Corte Real',
		87918538269,
		119952070826
	)
insert into
	cliente
values
	(
		'Camila Natália Nicole da Rosa',
		50750736461,
		17991241817
	)
insert into
	cliente
values
	(
		'Mirella Luana Fabiana Lope',
		04942438055,
		17991784938
	)
insert into
	cliente
values
	('Hugo Nelson Silva', 20938960939, 11982785858)
select
	*
from
	cliente -- dados fornecedor
insert into
	fornecedor
values
	('Logitech', 08008914173, null)
insert into
	fornecedor
values
	('redragon', 1131649109, null)
insert into
	fornecedor
values
	(
		'Samsung',
		08005550000,
		'atendimento@lojaonlinesamsung.com.br'
	)
insert into
	fornecedor
values
	('razer', 17604488997, null)
insert INTO
	fornecedor
values
	('LG', 98991788993, null) -- dados produto
insert into
	produto
values
	(
		'Mouse Gamer Logitech',
		100,
		2000,
		982,
		169.00,
		300000,
		150,
		1
	)
insert into
	produto
values
	(
		'Teclado Mecânico Gamer Redragon Kumara',
		300,
		1500,
		824,
		349.90,
		496485,
		330.99,
		2
	)
insert into
	produto
values
	(
		'Monitor Samsung LED 23.5" Widescreen Curvo',
		50,
		300,
		136,
		999,
		296997,
		989.99,
		3
	)
insert into
	produto
values
	(
		'Smart TV LED 43" Full HD Samsung',
		25,
		200,
		102,
		1799,
		320000,
		1600,
		3
	)
insert into
	produto
values
	(
		'Razer Rz.au.kr.10rt Headset Razer Kraken Kitty',
		400,
		850,
		322,
		745,
		624750,
		735,
		4
	) -- dados movimentacao
insert into
	movimentacao
values
	(1, getdate(), 's', 1, 1)
insert into
	movimentacao
values
	(2, getdate(), 'e', 15, 1)
insert into
	movimentacao
values
	(3, getdate(), 's', 1, 1)
insert into
	movimentacao
values
	(4, getdate(), 's', 1, 1)
insert into
	movimentacao
values
	(5, getdate(), 's', 1, 1) -- dados movimentacao_item
insert into
	movimentacao_item
values
	(1, 1, 1)
insert into
	movimentacao_item
values
	(2, 2, 15)
insert into
	movimentacao_item
values
	(3, 3, 1)
insert into
	movimentacao_item
values
	(4, 4, 1)
insert into
	movimentacao_item
values
	(5, 5, 1)
select
	c.nom_cli as nome,
	p.nom_pro as produto,
	f.nom_for as fornecedor,
	m.tip_mov as tipomov,
	m.dat_mov as data,
	mi.qtd_mov_ite as quantidade
from
	cliente c,
	produto p,
	fornecedor f,
	movimentacao m,
	movimentacao_item mi
where
	c.cod_cli = m.cod_cli
	and m.cod_mov = mi.cod_mov
	and p.cod_pro = mi.cod_pro
	and f.cod_for = p.cod_for
