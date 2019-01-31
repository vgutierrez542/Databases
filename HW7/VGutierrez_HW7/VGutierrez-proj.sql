/*
* Victor Gutierrez
* May 4, 2018
*/

-----------------------------------------------------
--Victor Gutierrez
--Relational schema Softy, Inc
-----------------------------------------------------
spool 'VGutierrez-proj'
set echo on
set serveroutput on;

DROP TABLE Task CASCADE CONSTRAINT;
DROP TABLE Language CASCADE CONSTRAINT;
DROP TABLE Programmer CASCADE CONSTRAINT;
DROP TABLE ProFinishedT CASCADE CONSTRAINT;
DROP TABLE LanPro CASCADE CONSTRAINT;
DROP TABLE FinishedTask CASCADE CONSTRAINT;
DROP TABLE LanTask CASCADE CONSTRAINT;

create table Task(
        name            char(20)        PRIMARY KEY,
        startDate       date            not null,
        targetDate      date            not null,
        comDate         date            null
);

create table Language(
        name            char(20)        PRIMARY KEY,
        comInter        char(1)         not null,
        exaSuite        char(20)        null
);

create table Programmer(
        ID              number(10)      PRIMARY KEY,
        last            char(20)        not null,
        first           char(20)        not null,
        gender          char(1)         null,
        salary          number(10,2)    null    check(salary >= 0),
        DOB             date            not null,
        title           char(20)        null,
        taskName        char(20)        null,
        superID         number(10)      not null,
        FOREIGN KEY (taskName)          REFERENCES Task(name),
        FOREIGN KEY (superID)           REFERENCES Programmer(ID)
);

create table ProFinishedT(
        programmerID    number(10),
        taskName        char(20),
        PRIMARY KEY(programmerID, taskName),
        FOREIGN KEY (programmerID) REFERENCES Programmer(ID),
        FOREIGN KEY (taskName) REFERENCES Task(name)
);

create table LanPro(
        languageName    char(20),
        programmerID    number(10),
        learnedDate     date,
        PRIMARY KEY (programmerID, languageName),
        FOREIGN KEY (programmerID) REFERENCES Programmer(ID),
        FOREIGN KEY (languageName) REFERENCES Language(name)
);

create table FinishedTask(
        taskName        char(20),
        dWorked         number(5)       not null,
        PRIMARY KEY (taskName),
        FOREIGN KEY (taskName) REFERENCES Task(name)
);

create table LanTask(
        languageName    char(20),
        taskName        char(20),
        PRIMARY KEY (taskName, languageName),
        FOREIGN KEY (languageName) REFERENCES Language(name),
        FOREIGN KEY (taskName) REFERENCES Task(name)
);

-----------------------------------------------------------------------
-- Populating the tables
-----------------------------------------------------------------------

INSERT ALL
INTO Task(name, startDate, targetDate, comDate) values('taskA', TO_DATE('09/12/2015', 'DD/MM/YYYY'), TO_DATE('03/07/2019', 'DD/MM/YYYY'), TO_DATE('05/02/2019', 'DD/MM/YYYY'))
INTO Task(name, startDate, targetDate, comDate) values('taskB', TO_DATE('09/12/2013', 'DD/MM/YYYY'), TO_DATE('03/01/2018', 'DD/MM/YYYY'), TO_DATE('05/02/2020', 'DD/MM/YYYY'))
INTO Task(name, startDate, targetDate, comDate) values('taskC', TO_DATE('09/12/2004', 'DD/MM/YYYY'), TO_DATE('03/07/2007', 'DD/MM/YYYY'), TO_DATE('05/02/2016', 'DD/MM/YYYY'))
INTO Task(name, startDate, targetDate, comDate) values('taskD', TO_DATE('09/12/2012', 'DD/MM/YYYY'), TO_DATE('03/04/2019', 'DD/MM/YYYY'), TO_DATE('05/02/2013', 'DD/MM/YYYY'))
SELECT * FROM dual;

INSERT ALL
INTO Language(name, comInter, exaSuite) values('C++', 'c', 'sdfd')
INTO Language(name, comInter, exaSuite) values('Java', 'i', 'fdsf')
INTO Language(name, comInter, exaSuite) values('C', 'c', 'sdfd')
INTO Language(name, comInter, exaSuite) values('R', 'c', 'fsdaf')
SELECT * FROM dual;

INSERT ALL
INTO Programmer(ID, first, last, gender, salary, DOB, title, taskName, superID) values(4324, 'Victor', 'Gutierrez', 'm', 132242, TO_DATE('15/02/1996', 'DD/MM/YYYY'), 'Programmer', 'taskB', 4324)
INTO Programmer(ID, last, first, gender, salary, DOB, title, taskName, superID) values(4624, 'Vgfd', 'Gtreez', 'm', 92242, TO_DATE('05/09/1989', 'DD/MM/YYYY'), 'Programmer', 'taskA', 4324)
INTO Programmer(ID, last, first, gender, salary, DOB, title, taskName, superID) values(6455, 'Ghdfg', 'tertr', 'f', 73242, TO_DATE('15/03/1956', 'DD/MM/YYYY'), 'Programmer', 'taskB', 4324)
INTO Programmer(ID, last, first, gender, salary, DOB, title, taskName, superID) values(2344, 'retwt', 'jgdjdgfh', 'm', 12242, TO_DATE('12/12/1976', 'DD/MM/YYYY'), 'Programmer', 'taskB', 4324)
INTO Programmer(ID, last, first, gender, salary, DOB, title, taskName, superID) values(8724, 'gdfssd', 'fsdrez', 'f', 132242, TO_DATE('02/11/1986', 'DD/MM/YYYY'), 'Programmer', 'taskA', 8724)
SELECT * FROM dual;

INSERT ALL
INTO ProFinishedT(programmerID, taskName) values(2344, 'taskD')
INTO ProFinishedT(programmerID, taskName) values(4324, 'taskD')
INTO ProFinishedT(programmerID, taskName) values(8724, 'taskC')
INTO ProFinishedT(programmerID, taskName) values(6455, 'taskC')
SELECT * FROM dual;

INSERT ALL
INTO LanPro(languageName, programmerID, learnedDate) values('C++', 4324, TO_DATE('05/02/2007', 'DD/MM/YYYY'))
INTO LanPro(languageName, programmerID, learnedDate) values('Java', 4324, TO_DATE('05/02/2010', 'DD/MM/YYYY'))
INTO LanPro(languageName, programmerID, learnedDate) values('C', 4324, TO_DATE('05/02/2012', 'DD/MM/YYYY'))
INTO LanPro(languageName, programmerID, learnedDate) values('R', 2344, TO_DATE('05/02/2013', 'DD/MM/YYYY'))
INTO LanPro(languageName, programmerID, learnedDate) values('C', 6455, TO_DATE('05/02/2014', 'DD/MM/YYYY'))
INTO LanPro(languageName, programmerID, learnedDate) values('C', 8724, TO_DATE('05/02/2011', 'DD/MM/YYYY'))
SELECT * FROM dual;

INSERT ALL
INTO FinishedTask(taskName, dWorked) values('taskC', 200)
INTO FinishedTask(taskName, dWorked) values('taskD', 100)
SELECT * FROM dual;

INSERT ALL
INTO LanTask(languageName, taskName) values('R', 'taskA')
INTO LanTask(languageName, taskName) values('C++', 'taskB')
INTO LanTask(languageName, taskName) values('Java', 'taskB')
INTO LanTask(languageName, taskName) values('C', 'taskC')
INTO LanTask(languageName, taskName) values('C', 'taskD')
INTO LanTask(languageName, taskName) values('C++', 'taskD')
SELECT * FROM dual;

-----------------------------------------------------------------------
-- Queries ->
-----------------------------------------------------------------------

--Q-1
SELECT name, comDate, trunc(months_between(T.comDate, SYSDATE)) monthsLeft
FROM Task T
WHERE current_timestamp < T.comDate
ORDER BY monthsLeft ASC;

--Q-2
SELECT ID, first, last
FROM Programmer P
WHERE taskName IN (
        SELECT T.name
        FROM TASK T
        WHERE targetDate
                BETWEEN to_date ('20180101','YYYYMMDD')
                        AND to_date ('20181231', 'YYYYMMDD')
)
ORDER BY ID ASC;

--Q-3
SELECT LP.languageName, P.first, P.last, LP.learnedDate
FROM LanPro LP, Programmer P
WHERE LP.learnedDate IN (
        SELECT DISTINCT MIN(LP2.learnedDate)
        FROM LanPro LP2
        WHERE LP2.languageName IN (
                SELECT DISTINCT languageName
                FROM LanTask LT
                WHERE taskName IN (
                        SELECT name
                        FROM Task T
                        WHERE current_timestamp < T.comDate))
        ) AND LP.programmerID = P.ID;

--Q-4
SELECT ID, first, last
FROM Programmer P
WHERE P.ID != P.superID AND EXISTS (
        SELECT * FROM LanPro LP
        WHERE P.ID = LP.programmerID AND EXISTS (
                SELECT * FROM LanPro LP2
                WHERE P.superID = LP2.programmerID
                        AND LP.languageName = LP2.languageName
        )
);

spool off;
