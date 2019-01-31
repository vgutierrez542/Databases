-------------------------------------------------
.mode csv
pragma foreign_keys = ON;

-------------------------------------------------
-- empty tables before populating from CSV files
--
delete from trainerbag;
delete from captured;
delete from battle;
delete from trainer;
delete from pokemon;


.import Pokemon.csv POKEMON

.import Trainer.csv TRAINER

.import Captured.csv CAPTURED

.import Battle.csv BATTLE

.import TrainerBag.csv TRAINERBAG


-------------------------------------------------
