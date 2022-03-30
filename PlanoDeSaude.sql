CREATE TABLE cliente(
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT cliente_pk PRIMARY KEY (id),
	nome varchar(200) NOT NULL,
	data_de_nascimento varchar(10),
	email varchar(200),
	produto_contrato_id int NOT NULL,
	CONSTRAINT produto_contrato_fk FOREIGN KEY (produto_contrato_id) REFERENCES produto_contrato(id)
)
	
CREATE TABLE dependentes(
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT dependentes_pk PRIMARY KEY (id),
	titular_id int,
	dependentes_id int,
	CONSTRAINT titular_fk FOREIGN KEY (titular_id) REFERENCES cliente(id),
	CONSTRAINT dependentes_fk FOREIGN KEY (dependentes_id) REFERENCES dependentes(id)
)

CREATE TABLE produto(
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT produto_pk PRIMARY KEY (id),
	descricao varchar(200) NOT NULL,
	codigo_ans varchar(50) NOT NULL,
	valor money NOT NULL
)

CREATE TABLE contrato(
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT contrato_pk PRIMARY KEY (id),
	data_inicio_vigencia varchar(10) NOT NULL
)

CREATE TABLE produto_contrato(
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT produto_contrato_pk PRIMARY KEY (id),
	produto_id int,
	contrato_id int,
	CONSTRAINT produto_fk FOREIGN KEY (produto_id) REFERENCES produto(id),
	CONSTRAINT contrato_fk FOREIGN KEY (contrato_id) REFERENCES contrato(id)
)
