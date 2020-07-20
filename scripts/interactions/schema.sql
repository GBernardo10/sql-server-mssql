CREATE TABLE model.interactions
(
    id UNIQUEIDENTIFIER PRIMARY KEY,
    interesting INT ,
    tedious INT,
    likes INT,
    fk_post UNIQUEIDENTIFIER NULL,
    fk_comments UNIQUEIDENTIFIER NULL,
    FOREIGN KEY (fk_post) REFERENCES model.post (id),
    FOREIGN KEY (fk_comments) REFERENCES model.comments (id)
)