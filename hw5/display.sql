-------------------------------------------------
-- display contents of tables
--
.mode column
.headers ON
.echo OFF

.print '          TABLE: POKEMON'
.print ' '
select * from  pokemon;
.print ' '


.print '          TABLE: TRAINER'
.print ' '
select * from  trainer;
.print ' '

.print '          TABLE: CAPTURED'
.print ' '
select * from  captured;
.print ' '


.print '          TABLE: BATTLE'
.print ' '
select * from  battle;
.print ' '


.print '          TABLE: TRAINERBAG'
.print ' '
select * from  trainerbag;
.print ' '

