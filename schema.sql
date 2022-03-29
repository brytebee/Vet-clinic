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

CREATE TABLE specializations (
	vets_id                INT NOT NULL,
  species_id             INT NOT NULL,
  FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	PRIMARY KEY (vets_id, species_id)
);

CREATE TABLE visits (
	animals_id             INT NOT NULL,
	vets_id                INT NOT NULL,
  date_of_visit          DATE NOT NULL,
	FOREIGN KEY (animals_id) REFERENCES animals (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	PRIMARY KEY (animals_id, vets_id)
);

-- Visits table primary key issues, drop the table
DROP TABLE visits;

CREATE TABLE visits (
  id                     SERIAL PRIMARY KEY,
	animals_id             INT NOT NULL,
	vets_id                INT NOT NULL,
  date_of_visit          DATE NOT NULL,
	FOREIGN KEY (animals_id) REFERENCES animals (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX visits_animals_id ON visits(animal_id);