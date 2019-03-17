#Part 2
#What are all the types of pokemon that a pokemon can have?
select name as TYPES
from types;

#What is the name of the pokemon with id 45?
select name as NAME
from pokemons
where pokemons.id = 45;

#How many pokemon are there?
select count(*) as Number_of_Pokemons
from pokemons;

# How many types are there?
select count(*) as TYPES
from types;

#How many pokemon have a secondary type?
select count(*) as Pokemon_with_secondary_types
from pokemons
where pokemons.secondary_type IS NOT null;


#Part3
#What is each pokemon's primary type?
select p.name as POKEMON_NAME, t.name as PRIMARY_TYPE
from pokemons as p
       JOIN types as t
            ON p.primary_type = t.id;

#What is Rufflet's secondary type?
select p.name as POKEMON_NAME, t.name as TYPE_NAME
from pokemons p
       JOIN types t ON p.secondary_type = t.id AND p.name = "Rufflet";

#What are the names of the pokemon that belong to the trainer with trainerID 303?
select p.name
from pokemon_trainer pk
       JOIN pokemons p ON pk.pokemon_id = p.id AND pk.trainerID = 303;

#How many pokemon have a secondary type Poison
select count(*)
from types t
       JOIN pokemons p ON t.id = p.secondary_type AND t.name = "Poison";


#What are all the primary types and how many pokemon have that type?
select t.name as PRIMARY_TYPES, COUNT(*) as POKEMON_COUNT
from types t
       LEFT JOIN pokemons p ON t.id = p.primary_type
group by t.name

#How many pokemon at level 100 does each trainer with at least one level 100 pokemon have? (Hint: your query should not display a trainer

select count(*)
from pokemon_trainer pk
       JOIN pokemons p ON pk.pokemon_id = p.id AND pk.pokelevel = 100
group by pk.pokelevel;


#How many pokemon only belong to one trainer and no other? The sub query gives the pokemon IDs that have only one trainer.

select count(*) as POKEMON_WITH_ONE_TRAINER
from (select pk.pokemon_id
      from pokemon_trainer pk
      group by pk.pokemon_id
      HAVING count(pk.pokemon_id) = 1
     ) as table1

#Part 4
#Pokemon Name, Trainer Name, Level, Primary Type, Secondary Type

select p.name as Pokemon_Name, tr.trainername as Trainer_Name, pk.pokelevel as Level,
       primaryType.name as Primary_Type, secondaryType.name as Secondary_Type

from pokemon_trainer pk
  JOIN pokemons p ON pk.pokemon_id = p.id
  JOIN trainers as tr ON pk.trainerID = tr.trainerID
   JOIN types as primaryType ON p.primary_type =primaryType.id
   JOIN types as secondaryType ON p.secondary_type = secondaryType.id


#Sort

