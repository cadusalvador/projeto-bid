/*============================================*/
/* Database name: bid                         */
/* DBMS name:     MySQL 8.0                   */
/* Creted on:     31/01/2024 19:09            */
/*============================================*/

USE bid;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS clube;
DROP TABLE IF EXISTS atleta;
DROP TABLE IF EXISTS contrato;
SET FOREIGN_KEYS_CHECKS=1;

/*==============================================================*/
/* Table: clube                                                 */
/*==============================================================*/
CREATE TABLE clube
(
	id INTEGER AUTO_INCREMENT NOT NULL,
	nome VARCHAR(255) NOT NULL,
	endereco VARCHAR(255) NOT NULL,
	cidade VARCHAR(100) NOT NULL,
	estado VARCHAR(5) NOT NULL,
	escudo BLOB NOT NULL,
	PRIMARY KEY (id ASC)
);

/*==============================================================*/
/* Table: atleta                                                */
/*==============================================================*/
CREATE TABLE atleta
(
	id INTEGER AUTO_INCREMENT NOT NULL,
	nome VARCHAR(255) NOT NULL,
	apelido VARCHAR(255) NOT NULL,
	dtNascimento DATE NOT NULL,
	sexo VARCHAR(50) NOT NULL,
	endereco VARCHAR(255) NOT NULL,
	cidade VARCHAR(255) NOT NULL,
	estado VARCHAR(50) NOT NULL,
	clube_id INTEGER NOT NULL,
	PRIMARY KEY (id ASC),
	CONSTRAINT fk_clube FOREIGN KEY (clube_id)
			REFERENCES clube (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE
);

/*==============================================================*/
/* Table: contrato                                              */
/*==============================================================*/
CREATE TABLE contrato
(
	id INTEGER AUTO_INCREMENT NOT NULL,
	nrContrato INTEGER NOT NULL,
	dtPublicacao DATETIME NOT NULL,
	dtInicio DATE NOT NULL,
	dtTermino DATE NOT NULL,
	clube_id INTEGER NOT NULL,
	atleta_id INTEGER NOT NULL,
	PRIMARY KEY (id ASC),
	CONSTRAINT fk_clube_atleta FOREIGN KEY (clube_id)
			REFERENCES clube (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	CONSTRAINT fk_atleta_clube FOREIGN KEY (atleta_id)
			REFERENCES atleta (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE
);

/*==============================================================*/
/* Table: usuarios                                              */
/*==============================================================*/
CREATE TABLE usuarios
(
	id INTEGER AUTO_INCREMENT NOT NULL,
	nome VARCHAR(100) NOT NULL,
	login VARCHAR(100) NOT NULL,
	senha VARCHAR(100) NOT NULL,
	ativo BOOLEAN NOT NULL,
	PRIMARY KEY (id ASC)
);

/*==============================================================*/
/* Table: permissao                                             */
/*==============================================================*/
CREATE TABLE permissao
(
	id INTEGER AUTO_INCREMENT NOT NULL,
	denominacao VARCHAR(255) NOT NULL,
	usuario_id INTEGER NOT NULL,
	PRIMARY KEY (id ASC),
	CONSTRAINT fk_usuario FOREIGN KEY (usuario_id)
		REFERENCES usuarios (id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

