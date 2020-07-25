/* PROCEDURE QUE BUSCA O ULTIMO USUARIO CADASTRADO E INSERI NA TABELA DE PERFIL */

CREATE OR ALTER PROC model.insert_profile_from_user
AS
BEGIN TRANSACTION;
BEGIN TRY
    SET NOCOUNT ON
    INSERT INTO model.profile
    (nickname, fk_username)
SELECT TOP 1
    username.[login], username.id
FROM model.username AS username
ORDER BY username.created_at DESC;
END TRY
    BEGIN CATCH
    SELECT
    ERROR_NUMBER() AS ErrorNumber  
        , ERROR_MESSAGE() AS ErrorMessage;
    IF @@TRANCOUNT > 0  
        ROLLBACK TRANSACTION;  
END CATCH
IF @@TRANCOUNT > 0  
    COMMIT TRANSACTION;  
GO


/* GATILHO QUE É ACIONADO AO SER INSERIDO UM USUARIO NA TABELA DE USUARIO */

CREATE OR ALTER TRIGGER model.update_profile_after_insert_user
ON model.username
AFTER INSERT AS BEGIN
    SET NOCOUNT ON
    EXEC model.insert_profile_from_user
END
GO