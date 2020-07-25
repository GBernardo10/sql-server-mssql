INSERT INTO model.username
    ([login],[password])
VALUES
    ('jesus', '123')


INSERT INTO model.post
    (title, author, fk_profile)
VALUES
    ('teste', 'gesuvs', 'd5a3433e-f36b-1410-8e10-00d42744adf7')


SELECT *
FROM model.post