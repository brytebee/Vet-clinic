CREATE TABLE owners (
  id              SERIAL PRIMARY KEY,
  full_name       VARCHAR(40) NOT NULL,
  age             INT NOT NULL
);

CREATE TABLE species (
  id              SERIAL PRIMARY KEY,
  species      VARCHAR(20) NOT NULL
);