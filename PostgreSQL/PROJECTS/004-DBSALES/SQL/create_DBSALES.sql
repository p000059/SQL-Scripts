
CREATE TABLE tb_value (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	tx_value FLOAT NOT NULL,
	vl_tax FLOAT NOT NULL,
	tt_value FLOAT NOT NULL,
	dc_value FLOAT NOT NULL,
	fn_value FLOAT NOT NULL,
	st_value BIT NOT NULL
);


CREATE TABLE tb_payment (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	co_payment BIGSERIAL NOT NULL UNIQUE,
	nm_payment VARCHAR(30) NOT NULL,
	ds_pagament VARCHAR(300) NOT NULL,
	tp_payment VARCHAR(30) NOT NULL,
	nr_payment_installment INTEGER NOT NULL,
	vl_payment FLOAT NOT NULL,
	st_payment BIT NOT NULL
);


CREATE TABLE tb_sale (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	co_sale BIGSERIAL NOT NULL UNIQUE,
	nm_sale VARCHAR(30) NOT NULL,
	ds_sale VARCHAR(300) NOT NULL,
	tp_sale VARCHAR(30) NOT NULL,
	qt_sale_product INTEGER NOT NULL,
	id_value BIGINT NOT NULL,
	st_sale BIGINT NOT NULL,
	
	FOREIGN KEY (id_value) REFERENCES tb_value (id)
);


CREATE TABLE rl_sale_person (
	id_person INTEGER NOT NULL,
	id_sale BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final CHAR(14) NOT NULL,
	
	FOREIGN KEY (id_sale) REFERENCES tb_sale (id)
);


CREATE TABLE rl_sale_user (
	id_user BIGINT NOT NULL,
	id_sale BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final CHAR NOT NULL,
	
	FOREIGN KEY (id_sale) REFERENCES tb_sale (id)
);


CREATE TABLE rl_product_sale (
	id_product BIGINT NOT NULL,
	id_sale BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final CHAR(14),
	
	FOREIGN KEY (id_sale) REFERENCES tb_sale (id)
);

CREATE TABLE rl_sale_value(
	id_sale BIGINT NOT NULL,
	id_value BIGINT NOT NULL,
	dt_initial_value CHAR(14) NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final_value CHAR(14),
	dt_final CHAR(14),

	FOREIGN KEY (id_sale) REFERENCES tb_sale (id),
	FOREIGN KEY (id_value) REFERENCES tb_value (id)
)

