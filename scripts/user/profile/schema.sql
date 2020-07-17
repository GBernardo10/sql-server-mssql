CREATE TABLE model.profile
(
    id UNIQUEIDENTIFIER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    mail VARCHAR(50),
    street_address VARCHAR(50),
    zip_code VARCHAR(50),
    number_street int,
    fk_username UNIQUEIDENTIFIER,
    created_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(fk_username) REFERENCES model.username(id)
);
