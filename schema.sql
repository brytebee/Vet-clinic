CREATE TABLE animals (
    id                  INT GENERATED ALWAYS AS IDENTITY,
    name                varchar(25),
    date_of_birth       DATE,
    escape_attempts     INT,
    neutered            BOOLEAN,
    weight_kg           DECIMAL,
    PRIMARY KEY (id)
);