DROP TABLE IF EXISTS model.profile;
GO
CREATE TABLE model.profile
(
    id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT newsequentialid(),
    nickname NVARCHAR(10) UNIQUE NOT NULL,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    mail NVARCHAR(50) UNIQUE,
    fk_address UNIQUEIDENTIFIER,
    fk_username UNIQUEIDENTIFIER,
    created_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_username 
        FOREIGN KEY(fk_username) 
        REFERENCES model.username(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_address
        FOREIGN KEY(fk_address) 
        REFERENCES model.address(id)
        ON DELETE CASCADE,
);
GO
