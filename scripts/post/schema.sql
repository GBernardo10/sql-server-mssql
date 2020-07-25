DROP TABLE IF EXISTS model.post;
GO
CREATE TABLE model.post
(
    id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT newsequentialid(),
    title NVARCHAR(30) NOT NULL,
    descripton NVARCHAR(MAX),
    author NVARCHAR(10) NOT NULL,
    likes INT DEFAULT 0,
    comments INT DEFAULT 0,
    fk_profile UNIQUEIDENTIFIER NOT NULL,
    created_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fk_profile) REFERENCES model.profile (id),
)
GO