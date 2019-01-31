--------------------------
-- Victor Gutierrez
-- 3/18/2018
-- hw5
--------------------------

.mode column
.headers on
.echo off

-------------------------------------
.print ' '
.print 'The name of Ash's buddy is '

SELECT POKEMON.Name FROM POKEMON, TRAINER
WHERE TRAINER.Name = 'Ash' AND PokemonID = Buddy;
-------------------------------------



-------------------------------------
.print ' '
.print 'Names of trainers who have not participated in a single battle: '

SELECT TRAINER.Name FROM TRAINER
EXCEPT
SELECT Name FROM TRAINER, BATTLE 
WHERE TRAINER.TrainerID = BATTLE.TrainerID 
AND NumBattlesWon != 0;
-------------------------------------



-------------------------------------
.print ' '
.print 'Catagories of Pokemon caught in Albuquerque: '

SELECT Category FROM POKEMON, CAPTURED 
WHERE LocationCaught = 'Albuquerque'
AND CAPTURED.PokemonID = POKEMON.PokemonID;
-------------------------------------



-------------------------------------
.print ' '
.print 'The ages of captured Pokemon that are younger than the youngest trainer: '

SELECT PokemonAge FROM CAPTURED 
WHERE PokemonAge < (SELECT min(Age) 
FROM TRAINER);
-------------------------------------



-------------------------------------
.print ' '
.print 'The names of Pokemon monsters not chosen as any trainer's buddy: '

SELECT POKEMON.Name FROM POKEMON
EXCEPT
SELECT POKEMON.Name FROM POKEMON, TRAINER
WHERE Buddy = PokemonID;
-------------------------------------
