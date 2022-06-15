CREATE OR REPLACE FUNCTION fc_InsertPerson
(
	co_person CHAR(7), 
	nm_person VARCHAR(100), 
	ds_person VARCHAR(150), 
	dt_birth CHAR(8),
	st_person BIT(1),
	sex_id INTEGER
)
RETURNS BOOLEAN
AS $$
BEGIN
	INSERT INTO persons 
	VALUES($1, $2, $3, $4, $5, $6);
	RETURN TRUE;
END
$$
LANGUAGE plpgsql;
