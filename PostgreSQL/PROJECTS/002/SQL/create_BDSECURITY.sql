
CREATE TABLE tb_system (
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    co_system SERIAL NOT NULL,
    nm_system VARCHAR(30) NOT NULL,
    ds_system VARCHAR(300) NOT NULL,
    tp_system VARCHAR(30) NOT NULL,
    st_system BIT NOT NULL    
);

CREATE TABLE tb_functionality (
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    co_functionality SERIAL NOT NULL,
    nm_functionality VARCHAR(30) NOT NULL,
    ds_functionality VARCHAR(300) NOT NULL,
    st_functionality BIT NOT NULL
);

CREATE TABLE tb_profile (
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    co_profile SERIAL NOT NULL,
    nm_profile VARCHAR(30) NOT NULL,
    ds_profile VARCHAR(300) NOT NULL,
    st_profile BIT NOT NULL
);

CREATE TABLE tb_operation (
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    co_operation INTEGER NOT NULL,
    ds_operation VARCHAR(300) NOT NULL,
    sg_operation CHAR(2) NOT NULL,
    st_operation BIT NOT NULL
);

CREATE TABLE tb_group (
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    co_group SERIAL NOT NULL,
    nm_group VARCHAR(30) NOT NULL,
    ds_group VARCHAR(300) NOT NULL,
    st_group BIT NOT NULL
);

CREATE TABLE rl_system_functionality (
    id_functionality BIGINT NOT NULL,
    id_system BIGINT NOT NULL,
    dt_initial CHAR(14) NOT NULL,
    dt_final CHAR(14),

    FOREIGN KEY (id_functionality) REFERENCES tb_functionality(id),
    FOREIGN KEY (id_system) REFERENCES tb_system(id)
);

CREATE TABLE rl_profile_functionality (
    id_profile BIGINT NOT NULL,
    id_functionality BIGINT NOT NULL,
    dt_initial CHAR(14) NOT NULL,
    dt_final CHAR(14),

    FOREIGN KEY (id_profile) REFERENCES tb_profile(id),
    FOREIGN KEY (id_functionality) REFERENCES tb_functionality(id)
);

CREATE TABLE rl_user_group (
    id_system BIGINT NOT NULL,
    id_group BIGINT NOT NULL,
    dt_initial CHAR(14) NOT NULL,
    dt_final CHAR(14),

    FOREIGN KEY (id_system) REFERENCES tb_system(id),
    FOREIGN KEY (id_group) REFERENCES tb_group(id)
);

CREATE TABLE rl_group_profile (
    id_profile BIGINT NOT NULL,
    id_group BIGINT NOT NULL,
    dt_initial CHAR(14) NOT NULL,
    dt_final CHAR(14),

    FOREIGN KEY (id_profile) REFERENCES tb_profile(id),
    FOREIGN KEY (id_group) REFERENCES tb_group(id)
);

CREATE TABLE rl_functionality_operation (
    id_operation BIGINT NOT NULL,
    id_functionality BIGINT NOT NULL,
    dt_initial VARCHAR(14) NOT NULL,
    dt_final VARCHAR(14),

    FOREIGN KEY (id_operation) REFERENCES tb_operation(id),
    FOREIGN KEY (id_functionality) REFERENCES tb_functionality(id)
);

