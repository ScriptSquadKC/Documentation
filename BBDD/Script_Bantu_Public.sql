-- Crear Base de Datos
create database bantuDB;

-- Crear Esquema
create schema bantuDB;

-- Creación de Tablas

create table countries(
	country_id	serial		primary key,
	country		varchar(25)	not null,
	active		bool		not null
);
	
create table provinces(
	province_id	serial		primary key,
	country_id	int		not null,
	province	varchar(25)	not null,
	active		bool		not null
);

create table users(
	id		serial		primary key,
	first_name	varchar(20)	not null,
	last_name1	varchar(20) 	not null,
	last_name2	varchar(20) 	not null,
	country_id	int		not null,
	province_id	int		not null,
	city		varchar(35)	not null,
	postal_code	varchar(10)	not null,
	nickname	varchar(20)	null,
	photo		varchar(100)	null,
	email		varchar(75)	not null UNIQUE,
	password	varchar(75)	not null,
	creation_date	TIMESTAMP 	DEFAULT CURRENT_TIMESTAMP,
	leaving_date	TIMESTAMP 	null,
	active		bool 		not null);

create table pro_types(
	type_id		serial		primary key,
	type		varchar(20)	not null,
	active		bool		not null
);

create table pro_suscriptions(
	suscription_id	serial		primary key,
	suscription	varchar(20)	not null,
	active		bool		not null
);

create table pro_professionals(
	professional_id	serial		primary key,
	id		int		not null,
	nif		varchar(10)	not null,
	telephone	int		not null,
	type_id		int		not null,
	suscription_id	int		not null,
	description	varchar(500)	not null,
	creation_date	TIMESTAMP 	DEFAULT CURRENT_TIMESTAMP,
	leaving_date	TIMESTAMP 	null,
	active		bool		not null
);

create table ENT_GOALS(
	goal_id	serial		primary key,
	goal	varchar(50)	not null,
	active	bool		not null
);

create table ENT_ACTIVITIES(
	activity_id	serial		primary key,
	activity	varchar(50)	not null,
	goal_id		int		not null,
	photo		varchar(50)	not null,	
	active		bool		not null
);

-- Creación de Relaciones
alter table provinces   	add constraint fk_Provinces_Countries		foreign key (country_id)     references countries(country_id);
alter table users 		add constraint fk_Users_Countries 		foreign key (country_id)     references countries(country_id);
alter table users               add constraint fk_Users_Provinces               foreign key (province_id)    references provinces(province_id);
alter table pro_professionals	add constraint fk_Professional_Users 		foreign key (id) 	     references users(id);
alter table pro_professionals 	add constraint fk_Professionals_Types 		foreign key (type_id) 	     references pro_types(type_id);
alter table pro_professionals 	add constraint fk_Professionals_Suscriptions 	foreign key (suscription_id) references pro_suscriptions(suscription_id);
alter table ent_activities      add constraint fk_Goals_Activities 	        foreign key (goal_id)        references ent_goals(goal_id);


-- Inserción de Datos
insert into countries (country,active) values ('ESPAÑA',TRUE);
insert into countries (country,active) values ('FRANCIA',TRUE);
insert into countries (country,active) values ('PORTUGAL',TRUE);
insert into countries (country,active) values ('ALEMANIA',TRUE);
insert into countries (country,active) values ('BÉGICA',TRUE);
insert into countries (country,active) values ('BULGARIA',TRUE);
insert into countries (country,active) values ('DINAMARCA',TRUE);
insert into countries (country,active) values ('IRLANDA',TRUE);
insert into countries (country,active) values ('GRECIA',TRUE);
insert into countries (country,active) values ('ITALIA',TRUE);
insert into countries (country,active) values ('AUSTRIA',TRUE);
insert into countries (country,active) values ('POLONIA',TRUE);
insert into countries (country,active) values ('RUMANIA',TRUE);
insert into countries (country,active) values ('ESLOVENIA',TRUE);
insert into countries (country,active) values ('FINLANDIA',TRUE);
insert into countries (country,active) values ('SUECIA',TRUE);

insert into provinces (country_id,province,active) values (1,'MADRID',TRUE);
insert into provinces (country_id,province,active) values (1,'LAS PALMAS',TRUE);
insert into provinces (country_id,province,active) values (1,'SANTA CRUZ DE TENERIFE',TRUE);
insert into provinces (country_id,province,active) values (1,'CIUDAD REAL',TRUE);
insert into provinces (country_id,province,active) values (1,'TOLEDO',TRUE);
insert into provinces (country_id,province,active) values (1,'CUENCA',TRUE);
insert into provinces (country_id,province,active) values (1,'ALBACETE',TRUE);
insert into provinces (country_id,province,active) values (1,'HUELVA',TRUE);
insert into provinces (country_id,province,active) values (1,'SEVILLA',TRUE);
insert into provinces (country_id,province,active) values (1,'CADIZ',TRUE);
insert into provinces (country_id,province,active) values (1,'BARCELONA',TRUE);
insert into provinces (country_id,province,active) values (1,'MALAGA',TRUE);
insert into provinces (country_id,province,active) values (1,'JAEN',TRUE);
insert into provinces (country_id,province,active) values (1,'GRANADA',TRUE);
insert into provinces (country_id,province,active) values (1,'ALMERIA',TRUE);
insert into provinces (country_id,province,active) values (1,'BARCELONA',TRUE);
insert into provinces (country_id,province,active) values (1,'LERIDA',TRUE);
insert into provinces (country_id,province,active) values (1,'TARRAGONA',TRUE);
insert into provinces (country_id,province,active) values (1,'GERONA',TRUE);
insert into provinces (country_id,province,active) values (1,'VALENCIA',TRUE);
insert into provinces (country_id,province,active) values (1,'PAIS VASCO',TRUE);

insert into pro_types (type,active) values ('ENTRENADOR',TRUE);
insert into pro_types (type,active) values ('NUTRICIONISTA',TRUE);
insert into pro_types (type,active) values ('DIETISTA',TRUE);
insert into pro_types (type,active) values ('FISIOTERAPEUTA',TRUE);

insert into pro_suscriptions (suscription,active) values ('Baltu Basic',TRUE);
insert into pro_suscriptions (suscription,active) values ('Baltu Premium',TRUE);

insert into users (first_name,last_name1,last_name2, country_id, province_id,city,postal_code,nickname,photo,email,password,active) values ('TestUsuario','TestApellido1','TestApellido2',1,1,'TestPoblación',09999,'TestAvatar','http://90.163.132.130:8090/bantu/user02.png','test@email.es','$2b$12$xFyrpIOgKuu1awuFNPNn8OQRkKXS9uh7au0A.3S/BUz3SwURnjR3y',TRUE);
insert into users (first_name,last_name1,last_name2, country_id, province_id,city,postal_code,nickname,photo,email,password,active) values ('JOSEP','GUARDIOLA','I SALA',1,11,'Santpedor',08240,'FilosofoPep','http://90.163.132.130:8090/bantu/user02.png','pep.guardiola@manchester.uk','$2b$12$xFyrpIOgKuu1awuFNPNn8OQRkKXS9uh7au0A.3S/BUz3SwURnjR3y',TRUE);
insert into users (first_name,last_name1,last_name2, country_id, province_id,city,postal_code,nickname,photo,email,password,active) values ('JOAN','PRADELLS','MARTINEZ',1,20,'Valencia',46001,'Cachitas','http://90.163.132.130:8090/bantu/user03.png','jpadrells@bantu.com','$2b$12$xFyrpIOgKuu1awuFNPNn8OQRkKXS9uh7au0A.3S/BUz3SwURnjR3y',TRUE);
insert into users (first_name,last_name1,last_name2, country_id, province_id,city,postal_code,nickname,photo,email,password,active) values ('DAVID','MUÑOZ','ROSILLO',1,1,'MADRID',28001,'Dabiz','http://90.163.132.130:8090/bantu/user04.png','dmunoz@bantu.com','$2b$12$xFyrpIOgKuu1awuFNPNn8OQRkKXS9uh7au0A.3S/BUz3SwURnjR3y',TRUE);
insert into users (first_name,last_name1,last_name2, country_id, province_id,city,postal_code,nickname,photo,email,password,active) values ('DAVID','DE JORGE','EZEIBARRENA',1,21,'HONDARRIBIA',20280,'RobinFood','http://90.163.132.130:8090/bantu/user05.png','jezeibarrena@bantu.com','$2b$12$xFyrpIOgKuu1awuFNPNn8OQRkKXS9uh7au0A.3S/BUz3SwURnjR3y',TRUE);
insert into users (first_name,last_name1,last_name2, country_id, province_id,city,postal_code,nickname,photo,email,password,active) values ('FRANCISCO','SUAREZ','RODRIGUEZ',1,1,'MADRID',28100,'FRANSUAREZR','http://90.163.132.130:8090/bantu/user06.png','fsuarez@bantu.com','$2b$12$xFyrpIOgKuu1awuFNPNn8OQRkKXS9uh7au0A.3S/BUz3SwURnjR3y',TRUE);
insert into users (first_name,last_name1,last_name2, country_id, province_id,city,postal_code,nickname,photo,,email,password,active) values ('DASH','KELLNER','',1,2,'Telde',35200,'PapaSwolio','http://90.163.132.130:8090/bantu/user07.png','dkellner@bantu.com','$2b$12$xFyrpIOgKuu1awuFNPNn8OQRkKXS9uh7au0A.3S/BUz3SwURnjR3y',TRUE);
insert into users (first_name,last_name1,last_name2, country_id, province_id,city,postal_code,nickname,photo,email,password,active) values ('MIKE','OHEARN','',1,9,'Dos Hermanas',41700,'donthurtme','http://90.163.132.130:8090/bantu/user08.png','moheran@bantu.com','$2b$12$xFyrpIOgKuu1awuFNPNn8OQRkKXS9uh7au0A.3S/BUz3SwURnjR3y',TRUE);
insert into users (first_name,last_name1,last_name2, country_id, province_id,city,postal_code,nickname,photo,email,password,active) values ('GLADIS','PORTUGUES','',1,1,'ALCORCON',28300,'jeanclaude','http://90.163.132.130:8090/bantu/user09.png','gportugues@bantu.com','$2b$12$xFyrpIOgKuu1awuFNPNn8OQRkKXS9uh7au0A.3S/BUz3SwURnjR3y',TRUE);
insert into users (first_name,last_name1,last_name2, country_id, province_id,city,postal_code,nickname,photo,email,password,active) values ('JUAN MANUEL','MONTILLA','MACARRON',1,1,'MOSTOLES',28350,'el_langui','http://90.163.132.130:8090/bantu/user10.png','mmontilla@bantu.com','$2b$12$xFyrpIOgKuu1awuFNPNn8OQRkKXS9uh7au0A.3S/BUz3SwURnjR3y',TRUE);
insert into users (first_name,last_name1,last_name2, country_id, province_id,city,postal_code,nickname,photo,email,password,active) values ('EVA','NASARRE','VENDRELL',1,12,'LERIDA',25001,'aerobicTve','http://90.163.132.130:8090/bantu/user11.png','enasarre@bantu.com','$2b$12$xFyrpIOgKuu1awuFNPNn8OQRkKXS9uh7au0A.3S/BUz3SwURnjR3y',TRUE);
insert into users (first_name,last_name1,last_name2, country_id, province_id,city,postal_code,nickname,photo,email,password,active) values ('JOSE','MANGANIELLO','HIERRO',1,6,'CAÑIZARES',16001,'bigdick','http://90.163.132.130:8090/bantu/user12.png','jmanganiello@bantu.com','$2b$12$xFyrpIOgKuu1awuFNPNn8OQRkKXS9uh7au0A.3S/BUz3SwURnjR3y',TRUE);

insert into pro_professionals (id,nif,telephone,type_id,suscription_id,description,active) values (2,'A2222222',938701234,1,1,' Actualmente dirijo al Manchester City F. C. de la Premier League de Inglaterra',TRUE);
insert into pro_professionals (id,nif,telephone,type_id,suscription_id,description,active) values (3,'A3333333',968701234,1,1,'Culturista, youtuber y streamer español',TRUE);
insert into pro_professionals (id,nif,telephone,type_id,suscription_id,description,active) values (4,'A4444444',918701234,2,2,'Cocinero español especializado en cocina de vanguardia. Su restaurante DiverXo ha recibido tres estrellas Michelin',TRUE);
insert into pro_professionals (id,nif,telephone,type_id,suscription_id,description,active) values (5,'A5555555',946701234,3,1,'Gerente de la editorial Gourmandia, autor de varios libros gastronómicos y de variados blogs.En 2008 dirigió y presentó el programa de ETB2 Cocina sin bobadas',TRUE);
insert into pro_professionals (id,nif,telephone,type_id,suscription_id,description,active) values (6,'A6666666',914545698,4,1,'Monitor de Gimnasio, enfermero y bailarín.Tengo 27 años, enfermero cacereño afincado en Madrid y Fisioterapeuta',TRUE);
insert into pro_professionals (id,nif,telephone,type_id,suscription_id,description,active) values (7,'A7777777',928252684,1,2,'I was sent here to reinstate common sense and mindfulness to people’s lives. The only way to truly pursue life-long health is to take responsibility for your own individual needs',TRUE);
insert into pro_professionals (id,nif,telephone,type_id,suscription_id,description,active) values (8,'A8888888',958252684,1,1,'Culturista, entrenador personal, actor y modelo estadounidense. He aparecido en más de 400 portadas de revistas y fui siete veces modelo de fitness del año',TRUE);
insert into pro_professionals (id,nif,telephone,type_id,suscription_id,description,active) values (9,'A9999999',915487742,1,2,'Ex culturista y actriz profesional estadounidense . Como culturista, estuve dos veces entre los 10 primeros en el concurso Ms. Olympia.Estoy casada con el actor Jean-Claude van Damme',TRUE);
insert into pro_professionals (id,nif,telephone,type_id,suscription_id,description,active) values (10,'B111111',912154556,4,2,'Además de actor y rapero, tengo el título de Fisioterapeuta de la Universidad Comillas. Actualmente soy médico rehabilitador en el Hospital Zendal.',TRUE);
insert into pro_professionals (id,nif,telephone,type_id,suscription_id,description,active) values (11,'B222222',935487962,4,1,'Ejercí de monitora de aeróbic en Televisión y animaba a los telespectadores a seguir los ejercicios practicados junto a un grupo de gimnastas. A pesar de mi falta de experiencia ante las cámaras, destaqué por mi naturalidad y me convirtí en uno de los rostros más populares de TVE',TRUE);
insert into pro_professionals (id,nif,telephone,type_id,suscription_id,description,active) values (12,'B333333',969587962,1,2,'Jugador de fútbol americano profesional y más conocido por ser actor de cine. La mayoría de mis clientes, quieren que los ponga mirando para Cuenca, así que me mudé a esta ciudad.',TRUE);

insert into ent_goals (goal,active) values ('Pérdida de Peso',TRUE);
insert into ent_goals (goal,active) values ('Ganancia Muscular',TRUE);
insert into ent_goals (goal,active) values ('Salud Cardiovascular',TRUE);
insert into ent_goals (goal,active) values ('Core',TRUE);
insert into ent_goals (goal,active) values ('Flexibilidad',TRUE);
insert into ent_goals (goal,active) values ('Resistencia',TRUE);
insert into ent_goals (goal,active) values ('Rehabilitación',TRUE);
insert into ent_goals (goal,active) values ('Salud y Bienestar General',TRUE);

insert into ent_activities (activity,goal_id,photo,active) values ('Pilates',4,'act01.png',TRUE);
insert into ent_activities (activity,goal_id,photo,active) values ('Spinning',1,'act02.png',TRUE);
insert into ent_activities (activity,goal_id,photo,active) values ('Natación',1,'act03.png',TRUE);
insert into ent_activities (activity,goal_id,photo,active) values ('Natación',3,'act03.png',TRUE);
insert into ent_activities (activity,goal_id,photo,active) values ('Natación',6,'act03.png',TRUE);
insert into ent_activities (activity,goal_id,photo,active) values ('Running',1,'act04.png',TRUE);
insert into ent_activities (activity,goal_id,photo,active) values ('Running',3,'act04.png',TRUE);
insert into ent_activities (activity,goal_id,photo,active) values ('Running',6,'act04.png',TRUE);
insert into ent_activities (activity,goal_id,photo,active) values ('Entrenamiento con Pesas',1,'act05.png',TRUE);
insert into ent_activities (activity,goal_id,photo,active) values ('Entrenamiento con Pesas',2,'act05.png',TRUE);
insert into ent_activities (activity,goal_id,photo,active) values ('Entrenamiento con Pesas',3,'act05.png',TRUE);
insert into ent_activities (activity,goal_id,photo,active) values ('Entrenamiento con Pesas',6,'act05.png',TRUE);



