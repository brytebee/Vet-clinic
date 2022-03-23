CREATE TABLE owners (
  id              SERIAL PRIMARY KEY,
  full_name       VARCHAR(40) NOT NULL,
  age             INT NOT NULL
);

CREATE TABLE species (
  id              SERIAL PRIMARY KEY,
  species      VARCHAR(20) NOT NULL
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);