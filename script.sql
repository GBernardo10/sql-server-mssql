INSERT INTO model.username
    (id,[login],[password])
VALUES
    (NEWID(), 'gesuvs', '123')

SELECT TOP 1
    username.id, username.[login]
FROM model.username AS username
ORDER BY username.created_at DESC;


SELECT TOP 1
    profile.id, profile.nickname
FROM model.profile AS profile
ORDER BY profile.created_at DESC;

select *
from model.profile;

select *
from model.username;

DROP TABLE  model.profile;


DELETE FROM model.profile

DELETE FROM model.username
