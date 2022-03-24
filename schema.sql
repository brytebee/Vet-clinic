CREATE TABLE animals (
    id                  INT GENERATED ALWAYS AS IDENTITY,
    name                varchar(25),
    date_of_birth       DATE,
    escape_attempts     INT,
    neutered            BOOLEAN,
    weight_kg           DECIMAL,
    PRIMARY KEY (id)
);

-- Modify/Alter/Update Table
ALTER TABLE animals ADD COLUMN species varchar(150);

--More tables
CREATE TABLE owners (
  id              SERIAL PRIMARY KEY,
  full_name       VARCHAR(40) NOT NULL,
  age             INT NOT NULL
);

CREATE TABLE species (
  id              SERIAL PRIMARY KEY,
  species      VARCHAR(20) NOT NULL
);

-- Modify/Alter/Update animals Table
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);

-- Change the column species as wrongly entered to name
ALTER TABLE species RENAME COLUMN species TO name;

-- Visits milestone
CREATE TABLE vets (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(20) NOT NULL,
    age         INT NOT NULL,
    date_of_graduation DATE NOT NULL
);