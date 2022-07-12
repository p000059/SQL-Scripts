
CREATE TABLE tb_attachment (
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    co_attachment BIGINT NOT NULL,
    nm_attachment VARCHAR(30) NOT NULL,
    ds_attachment VARCHAR(300) NOT NULL,
    tp_attachment VARCHAR(30),
    st_attachment BIT NOT NULL
);

CREATE TABLE tb_path (
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    co_path BIGINT NOT NULL,
    ds_path VARCHAR(300) NOT NULL,
    lk_path VARCHAR(300) NOT NULL,
    st_path BIT NOT NULL
);

CREATE TABLE tb_category (
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    co_category BIGINT NOT NULL,
    nm_category VARCHAR(30) NOT NULL,
    ds_category VARCHAR(300) NOT NULL,
    st_category BIT NOT NULL
);

CREATE TABLE tb_document (
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    co_document BIGINT NOT NULL,
    nm_documento VARCHAR(30) NOT NULL,
    sg_document VARCHAR(30) NOT NULL,
    ds_document VARCHAR(30) NOT NULL,
    nr_document VARCHAR(30) NOT NULL,
    tp_document VARCHAR(30),
    dt_document_emission CHAR(8) NOT NULL,
    dt_document_validity CHAR(8),
    st_documento BIT NOT NULL
);

CREATE TABLE rl_document_attachment (
    id_attachment BIGINT NOT NULL,
    id_document BIGINT NOT NULL,
    dt_initial CHAR(14) NOT NULL,
    dt_final CHAR(14),

    FOREIGN KEY (id_document) REFERENCES tb_document (id),
    FOREIGN KEY (id_attachment) REFERENCES tb_attachment (id)
);

CREATE TABLE rl_path_document (
    id_path BIGINT NOT NULL,
    id_document BIGINT NOT NULL,
    dt_initial CHAR(14) NOT NULL,
    dt_final CHAR(14),

    FOREIGN KEY (id_document) REFERENCES tb_document (id),
    FOREIGN KEY (id_path) REFERENCES tb_path (id)
);

CREATE TABLE rl_category_document (
    id_document BIGINT NOT NULL,
    id_category BIGINT NOT NULL,
    dt_initial CHAR(14) NOT NULL,
    dt_final CHAR(14),

    FOREIGN KEY (id_document) REFERENCES tb_document (id),
    FOREIGN KEY (id_category) REFERENCES tb_category (id)
);
