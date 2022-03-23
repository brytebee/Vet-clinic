INSERT INTO vets(name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (species, vets)
VALUE ('William Tatcher', 'Pokemon'),
('Stephanie Mendez', 'Digimon', 'Pokemon'),
('Jack Harkness', 'Digimon');

INSERT INTO visits(animals, vets)
VALUES ('Agumon', 'William Tatcher', '2020-05-24'),
('Agumon', 'Stephanie Mendez', '2020-07-22'),
('Gabumon', 'Jack Harkness', 'Feb 2nd, 2021'),
('Pikachu', 'Maisy Smith', 'Jan 5th, 2020'),
('Pikachu', 'Maisy Smith', 'Mar 8th, 2020'),
('Pikachu', 'Maisy Smith', 'May 14th, 2020'),
('Devimon', 'Stephanie Mendez', 'May 4th, 2021'),
('Charmander', 'Jack Harkness', 'Feb 24th, 2021'),
('Plantmon', 'Maisy Smith', 'Dec 21st, 2019'),
('Plantmon', 'William Tatcher', 'Aug 10th, 2020'),
('Plantmon', 'Maisy Smith', 'Apr 7th, 2021'),
('Squirtle', 'Stephanie Mendez', 'Sep 29th, 2019'),
('Angemon', 'Jack Harkness', 'Oct 3rd, 2020'),
('Angemon', 'Jack Harkness', 'Nov 4th, 2020'),
('Boarmon', 'Maisy Smith', 'Jan 24th, 2019'),
('Boarmon', 'Maisy Smith', 'May 15th, 2019'),
('Boarmon', 'Maisy Smith', 'Feb 27th, 2020'),
('Boarmon', 'Maisy Smith', 'Aug 3rd, 2020'),
('Blossom', 'Stephanie Mendez', 'May 24th, 2020'),
('Blossom', 'William Tatcher', 'Jan 11th, 2021');


Write queries to answer the following:
Who was the last animal seen by William Tatcher?
How many different animals did Stephanie Mendez see?
List all vets and their specialties, including vets with no specialties.
List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
What animal has the most visits to vets?
Who was Maisy Smith's first visit?
Details for most recent visit: animal information, vet information, and date of visit.
How many visits were with a vet that did not specialize in that animal's species?
What specialty should Maisy Smith consider getting? Look for the species she gets the most.