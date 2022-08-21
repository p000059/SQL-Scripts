
CREATE TABLE tb_type_input_stock(
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    nm_type VARCHAR(40),
    status BOOLEAN NOT NULL
);

CREATE TABLE tb_input_stock(
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    co_input BIGSERIAL NOT NULL UNIQUE,
    nm_input VARCHAR(40) NOT NULL,
    ds_input VARCHAR(300) NOT NULL,
    id_type_input_stock BIGINT NOT NULL,
    nr_input_unity INTEGER NOT NULL,
    nr_input_lot INTEGER NOT NULL,
    status BOOLEAN NOT NULL,

    FOREIGN KEY(id_type_input_stock) REFERENCES tb_type_input_stock(id)
);

CREATE TABLE tb_buy (
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    co_buy BIGSERIAL NOT NULL UNIQUE,
    nm_buy VARCHAR(40) NOT NULL,
    ds_buy VARCHAR(300) NOT NULL,
    pr_buy MONEY NOT NULL,
    status BOOLEAN NOT NULL
);

CREATE TABLE tb_weight (
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    ds_weight VARCHAR(300) NOT NULL,
    vl_weight REAL NOT NULL,
    status BOOLEAN NOT NULL
);

CREATE TABLE tb_amount (
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    co_amount BIGSERIAL NOT NULL UNIQUE,
    nr_maximum_amount INTEGER NOT NULL,
    nr_minimum_amount INTEGER NOT NULL,
    qt_stock INTEGER NOT NULL,
    status BOOLEAN NOT NULL
);

CREATE TABLE tb_provider (
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    co_provider BIGSERIAL NOT NULL UNIQUE,
    id_person BIGINT NOT NULL,
    status BOOLEAN NOT NULL
);

CREATE TABLE tb_category (
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    co_category BIGSERIAL NOT NULL UNIQUE,
    nm_category VARCHAR(40) NOT NULL,
    ds_category VARCHAR(300) NOT NULL,
    status BOOLEAN NOT NULL
);

CREATE TABLE tb_product (
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    co_product BIGSERIAL NOT NULL UNIQUE,
    nm_product VARCHAR(40) NOT NULL,
    ds_product VARCHAR(300) NOT NULL,
    id_weight BIGINT NOT NULL,
    status BOOLEAN NOT NULL
);

CREATE TABLE rl_input_stock_buy(
    id_buy BIGINT NOT NULL,
    id_input_stock BIGINT NOT NULL,
    dt_initial TIMESTAMP NOT NULL,
    dt_final TIMESTAMP,

    FOREIGN KEY (id_buy) REFERENCES tb_buy (id),
    FOREIGN KEY (id_input_stock) REFERENCES tb_input_stock(id)
);

CREATE TABLE rl_product_amount (
    id_product BIGINT NOT NULL,
    id_amount BIGINT NOT NULL,
    dt_initial TIMESTAMP NOT NULL,
    dt_final TIMESTAMP,

    FOREIGN KEY (id_product) REFERENCES tb_product (id),
    FOREIGN KEY (id_amount) REFERENCES tb_amount(id)
);

CREATE TABLE rl_product_buy (
    id_product BIGINT NOT NULL,
    id_buy BIGINT NOT NULL,
   	dt_initial TIMESTAMP NOT NULL,
    dt_final TIMESTAMP,

    FOREIGN KEY (id_product) REFERENCES tb_product (id),
    FOREIGN KEY (id_buy) REFERENCES tb_buy(id)
);

CREATE TABLE rl_category_product (
    id_product BIGINT NOT NULL,
    id_category BIGINT NOT NULL,
	dt_initial TIMESTAMP NOT NULL,
    dt_final TIMESTAMP,

    FOREIGN KEY (id_product) REFERENCES tb_product (id),
    FOREIGN KEY (id_category) REFERENCES tb_category(id)
);

CREATE TABLE rl_product_provider (
    id_product BIGINT NOT NULL,
    id_provider BIGINT NOT NULL,
    dt_initial TIMESTAMP NOT NULL,
    dt_final TIMESTAMP,

    FOREIGN KEY (id_product) REFERENCES tb_product (id),
    FOREIGN KEY (id_provider) REFERENCES tb_provider(id)
);

