SELECT 
    ps.nm_person,
    ps.ds_person,
    ps.dt_birth,
    dc.cpf_cnpj,
    sex.ds_sex,
    tp.nm_tperson
FROM documents dc
    LEFT JOIN rl_persons_documents rl ON rl.document_id = dc.id
    LEFT JOIN persons ps ON rl.person_id = ps.id
    LEFT JOIN sex ON sex.id = ps.sex_id
    LEFT JOIN type_persons tp ON tp.id = ps.type_person_id;
    
SELECT
    ps.nm_person,
    ps.ds_person,
    ps.dt_birth,
    ad.ct_adress,
    ad.cy_adress
FROM persons ps
    LEFT JOIN rl_persons_adresses rp ON rp.person_id = ps.id
    LEFT JOIN adresses ad ON ad.id = rp.adress_id;
