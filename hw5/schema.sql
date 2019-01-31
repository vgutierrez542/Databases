----------------------------------------------
--Relational schema for   POKEMON GO 
----------------------------------------------


----------------------------------------------
.echo on
----------------------------------------------

drop table if exists Pokemon;
drop table if exists Trainer;
drop table if exists Captured;
drop table if exists Battle;
drop table if exists TrainerBag;
----------------------------------------------

create table Pokemon(
 PokemonID number(6) PRIMARY KEY,
 Name char(15),
 Category char(15)
);

create table Trainer(
 TrainerID number(6) PRIMARY KEY,
 Name char(15),
 Age number(3),
 Team char(15),
 Buddy number(6),
 FOREIGN KEY (Buddy) REFERENCES Pokemon(PokemonID)
);

create table Captured(
 TrainerID number(6),
 PokemonID number(6),
 PokemonAge number(3),
 Height decimal(5,2),
 Weight decimal(5,2),
 LocationCaught char(15), 
 PRIMARY KEY(TrainerID,PokemonID),
 FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID),
 FOREIGN KEY (PokemonID) REFERENCES Pokemon(PokemonID)
);

create table Battle(
 TrainerID number(6),
 PokemonID number(6),
 NumBattlesWon number(5),
 PRIMARY KEY(TrainerID,PokemonID),
 FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID),
 FOREIGN KEY (PokemonID) REFERENCES Pokemon(PokemonID)
);

create table TrainerBag(
 TrainerID number(6) PRIMARY KEY,
 BagCapacity number(3),
 NumPokeballs number(6),
 NumMedals number(6),
 FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID)
);
----------------------------------------------
