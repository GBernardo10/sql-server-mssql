CREATE TABLE model.comments
(
    id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT newsequentialid(),
    content NVARCHAR(MAX),
    author NVARCHAR(250),
    fk_post UNIQUEIDENTIFIER,
    created_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fk_post) REFERENCES model.post (id)
)