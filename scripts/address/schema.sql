CREATE TABLE model.address
(
    id UNIQUEIDENTIFIER PRIMARY KEY,
    street_address NVARCHAR(50),
    zip_code NVARCHAR(50),
    number_street INT,
    created_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
)