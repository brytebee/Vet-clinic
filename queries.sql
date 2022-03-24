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
SELECT species,  ROUND(AVG(escape_attempts)::NUMERIC, 0) Esc_try FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species; --approx to whole number

-- Queries for 3rd milestone
-- Animals that belong to to  Melody Pond
SELECT full_name, name FROM (SELECT name, full_name FROM animals, owners WHERE animals.owner_id = owners.id) _ WHERE full_name = 'Melody Pond';
-- List of all animals that are pokemon
SELECT Animal, Species FROM (SELECT animals.name AS Animal, species.name as Species FROM animals, species WHERE animals.species_id = species.id) _ WHERE Species = 'Pokemon';
-- List all owners and their animals, including those that don't own any animal.
SELECT name, full_name FROM animals FULL OUTER JOIN owners ON animals.owner_id = owners.id;
-- Animals per species
SELECT species, COUNT(species) FROM (SELECT animals.name AS Animal, species.name AS Species FROM animals INNER JOIN species ON animals.species_id = species.id)_ GROUP BY species;
-- Digimon owned by Jennifer Orwell
SELECT full_name, name FROM (SELECT name, full_name FROM animals, owners WHERE animals.owner_id = owners.id) _ WHERE full_name = 'Jennifer Orwell' AND name LIKE '%mon';
-- All animals owned by Dean Winchester that haven't tried to escape
SELECT full_name, name, escape_attempts FROM(SELECT full_name, name, escape_attempts FROM animals INNER JOIN owners ON animals.owner_id = owners.id) t WHERE full_name = 'Dean Winchester' AND escape_attempts < 0;
-- Who owns the most animals?
SELECT full_name, COUNT(name) FROM animals, owners WHERE animals.owner_id = owners.id GROUP BY full_name ORDER BY count DESC limit 1;

-- Queries for 4th Milestone
SELECT vets.name, date_of_visit, animals.name FROM animals JOIN visits ON visits.animals_id = animals.id JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;
SELECT species.name FROM specializations s JOIN vets ON s.vets_id = vets.id JOIN visits ON visits.vets_id = vets.id JOIN species ON s.species_id = species.id WHERE vets.name = 'Stephanie Mendez' GROUP BY species.name