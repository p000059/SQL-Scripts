
CREATE TABLE tb_value (
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    co_value BIGSERIAL NOT NULL UNIQUE,
    vl_cost REAL NOT NULL,
    vl_sale REAL NOT NULL,
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

CREATE TABLE rl_product_amount (
    id_product BIGINT NOT NULL,
    id_amount BIGINT NOT NULL,
    dt_initial TIMESTAMP NOT NULL,
    dt_final TIMESTAMP,

    FOREIGN KEY (id_product) REFERENCES tb_product (id),
    FOREIGN KEY (id_amount) REFERENCES tb_amount(id)
);

CREATE TABLE rl_product_value (
    id_product BIGINT NOT NULL,
    id_value BIGINT NOT NULL,
   	dt_initial TIMESTAMP NOT NULL,
    dt_final TIMESTAMP,

    FOREIGN KEY (id_product) REFERENCES tb_product (id),
    FOREIGN KEY (id_value) REFERENCES tb_value(id)
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

