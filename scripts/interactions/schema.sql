DROP TABLE IF EXISTS model.interactions;
GO
CREATE TABLE model.interactions
(
    id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT newsequentialid(),
    interesting INT CHECK(interesting BETWEEN 0 AND 5) DEFAULT 0 ,
    tedious INT CHECK(tedious BETWEEN 0 AND 5) DEFAULT 0 ,
    likes BIT DEFAULT NULL,
    fk_post UNIQUEIDENTIFIER NOT NULL,
    fk_comments UNIQUEIDENTIFIER NULL,
    fk_author NVARCHAR(10) NOT NULL,
    created_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fk_post) REFERENCES model.post (id),
    FOREIGN KEY (fk_comments) REFERENCES model.comments (id),
    FOREIGN KEY (fk_author) REFERENCES model.profile(nickname)
);
GO

INSERT INTO model.interactions
    (likes, fk_post, fk_author)
VALUES
    ('FALSE', 'eda3433e-f36b-1410-8e10-00d42744adf7', 'gesuvs');

SELECT TOP 1
    interactions.likes
FROM model.interactions AS interactions
ORDER BY created_at DESC;


SELECT *
FROM model.interactions;

-- UPDATE model.post SET likes= '1' FROM

SELECT
    COUNT(interactions.likes)
FROM model.interactions AS interactions
    INNER JOIN model.post AS post
    ON interactions.fk_post = post.id
WHERE interactions.likes = 1;

INSERT INTO model.post
    (title, author, fk_profile)
VALUES
    ('fut', 'gesuvs', 'd5a3433e-f36b-1410-8e10-00d42744adf7')

SELECT *
FROM model.post;

SELECT *
FROM model.interactions;

SELECT interactions.id AS interactions_id,
    interactions.likes AS interactions_likes,
    interactions.fk_post AS interactions_fk_post,
    post.id AS post_id
FROM model.interactions AS interactions,
    model.post AS post
WHERE interactions.fk_post = post.id

SELECT TOP 1
    interactions.id
FROM model.interactions AS  interactions
ORDER BY created_at DESC


SELECT *
FROM model.post
WHERE id = '26a4433e-f36b-1410-8e10-00d42744adf7';

SELECT *
FROM model.post
WHERE id = 'eda3433e-f36b-1410-8e10-00d42744adf7';

SELECT *
FROM model.interactions
WHERE fk_post = 'eda3433e-f36b-1410-8e10-00d42744adf7';

SELECT *
FROM model.interactions
WHERE fk_post = '26a4433e-f36b-1410-8e10-00d42744adf7';

SELECT
    COUNT(interactions.likes)
FROM model.interactions AS interactions, model.post as post
WHERE post.id = 'eda3433e-f36b-1410-8e10-00d42744adf7'
    AND interactions.likes = 1

SELECT COUNT(likes)
FROM model.interactions
WHERE fk_post = (SELECT TOP 1
        interactions.fk_post
    FROM model.interactions AS  interactions
    ORDER BY created_at DESC)
    AND likes = 1

UPDATE model.post SET likes = (SELECT
    COUNT(interactions.likes)
FROM model.interactions AS interactions
    INNER JOIN model.post AS post
    ON interactions.fk_post = post.id
WHERE interactions.likes = 1) WHERE id = 'eda3433e-f36b-1410-8e10-00d42744adf7'





EXEC model.update_likes_from_interactions



UPDATE model.post SET likes = 0 WHERE id = 'eda3433e-f36b-1410-8e10-00d42744adf7'

UPDATE model.post SET likes = 0 WHERE id = '26a4433e-f36b-1410-8e10-00d42744adf7'


SELECT *
FROM model.post
WHERE id = '26a4433e-f36b-1410-8e10-00d42744adf7';

SELECT *
FROM model.post
WHERE id = 'eda3433e-f36b-1410-8e10-00d42744adf7';

INSERT INTO model.interactions
    (likes, fk_post, fk_author)
VALUES
    ('true', 'eda3433e-f36b-1410-8e10-00d42744adf7', 'gesuvs');

INSERT INTO model.interactions
    (likes, fk_post, fk_author)
VALUES
    ('true', '26a4433e-f36b-1410-8e10-00d42744adf7', 'gesuvs');

CREATE OR ALTER TRIGGER model.teste
ON model.interactions
AFTER UPDATE
AS IF UPDATE(likes)
BEGIN
    SET NOCOUNT ON
    UPDATE model.interactions SET likes = 'true' WHERE model.interactions.id = 
    'd0a4433e-f36b-1410-8e10-00d42744adf7'
END
GO


SELECT *
FROM model.interactions