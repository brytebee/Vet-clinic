SELECT * from animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth, name FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- First Transaction
BEGIN;
UPDATE animals SET species='unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- Second Transaction
BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

-- Hold breathe 😤 transaction
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
COMMIT;
SELECT * FROM animals;

-- Fourth Transaction: Change all negative weight to positive
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;
SAVEPOINT del_less_than_a_year;
UPDATE animals SET weight_kg = (weight_kg * -1);
ROLLBACK TO del_less_than_a_year;
SELECT * FROM animals;
UPDATE animals SET weight_kg = (weight_kg * -1) WHERE weight_kg <= -1; -- Changes - to +
COMMIT;
SELECT * FROM animals;

-- Answers
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts < 0;
SELECT ROUND(AVG(weight_kg)::numeric, 2) FROM animals; --Round to 2 decimal places
-- Prints name, species and highest escape attempts from data
SELECT name, species, escape_attempts FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
SELECT species, MIN(weight_kg) min_weight, MAX(weight_kg) max_weight FROM animals GROUP BY species;