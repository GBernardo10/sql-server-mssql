CREATE TABLE model.post
(
    id UNIQUEIDENTIFIER PRIMARY KEY,
    title NVARCHAR(30) NOT NULL,
    descripton NVARCHAR(MAX),
    author NVARCHAR(10) NOT NULL,
    likes INT,
    comments INT,
    fk_profile UNIQUEIDENTIFIER,
    created_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fk_profile) REFERENCES model.profile (id),
    FOREIGN KEY (fk_comments) REFERENCES model.comments (id)
)

