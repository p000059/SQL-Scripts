
CREATE TABLE tb_user (
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    co_user CHAR(7) NOT NULL,
    pw_user VARCHAR(60) NOT NULL,
    st_user BIT NOT NULL
);


CREATE TABLE rl_user_document (
    id_user BIGINT NOT NULL,
    id_document BIGINT NOT NULL,
    dt_initial CHAR(14) NOT NULL,
    dt_final CHAR(14) NOT NULL,

    FOREIGN KEY (id_user) REFERENCES tb_user(id)
);


CREATE TABLE rl_user_position (
    id_user BIGINT NOT NULL,
    id_position BIGINT NOT NULL,
    dt_initial CHAR(14) NOT NULL,
    dt_final CHAR(14),

    FOREIGN KEY (id_user) REFERENCES tb_user(id)
);


CREATE TABLE rl_user_sales (
    id_user BIGINT NOT NULL,
    id_sales BIGINT NOT NULL,
    dt_initial CHAR(14) NOT NULL,
    dt_final CHAR(14),

    FOREIGN KEY (id_user) REFERENCES tb_user(id)
);


CREATE TABLE rl_user_group (
    id_user BIGINT NOT NULL,
    id_group BIGINT NOT NULL,
    dt_initial_log CHAR(14) NOT NULL,
    dt_final_log CHAR(14),
    
    FOREIGN KEY (id_user) REFERENCES tb_user(id)
);


CREATE TABLE rl_user_person (
    id_user BIGINT NOT NULL,
    id_person BIGINT NOT NULL,
    dt_initial CHAR(14) NOT NULL,
    dt_final CHAR(14),

    FOREIGN KEY (id_user) REFERENCES tb_user(id)
);

