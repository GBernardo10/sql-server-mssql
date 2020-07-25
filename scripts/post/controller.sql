/* Procedure que realize um count dos likes de determinado post */


CREATE OR ALTER PROC model.update_likes_from_interactions
AS
BEGIN
    SET NOCOUNT ON
    DECLARE @likes INT;
    DECLARE @id UNIQUEIDENTIFIER;
    SET @id = (SELECT TOP 1
        interactions.fk_post
    FROM model.interactions AS  interactions
    ORDER BY created_at DESC);
    SET  @likes = (SELECT COUNT(likes)
    FROM model.interactions
    WHERE fk_post = @id
        AND likes = 1)

    UPDATE model.post SET likes = @likes WHERE post.id = @id
END
GO

/* Gatilho que é ativado quando é realizado um novo insert na tabela interactions, 
essa trigger chama a procedure acima */

CREATE OR ALTER TRIGGER model.update_likes_on_post_after_insert_likes_from_interactions
ON model.interactions
AFTER INSERT
AS IF UPDATE(likes)
BEGIN
    SET NOCOUNT ON
    EXEC model.update_likes_from_interactions
END
GO