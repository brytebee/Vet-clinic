Prints name and highest escape attempts from data
SELECT name, escape_attempts FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
SELECT species, MIN(weight_kg) min_weight, MAX(weight_kg) max_weight FROM animals GROUP BY species;
SELECT species,  ROUND(AVG(escape_attempts)::NUMERIC, 0) Esc_try FROM animals GROUP BY species; --approx to whole number