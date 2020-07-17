/* PROCEDURE QUE BUSCA O ULTIMO USUARIO CADASTRADO E INSERI NA TABELA DE PERFIL */

CREATE PROC model.insert_profile_from_user
AS
BEGIN
    SET NOCOUNT ON
    INSERT INTO model.profile
        (id)
    SELECT TOP 1
        username.id
    FROM model.username AS username
    ORDER BY username.created_at DESC;
END
GO


/* GATILHO QUE É ACIONADO AO SER INSERIDO UM USUARIO NA TABELA DE USUARIO */

CREATE TRIGGER model.update_profile_after_insert_user
ON model.username
AFTER INSERT AS BEGIN
    SET NOCOUNT ON
    EXEC model.insert_profile_from_user
END
GO