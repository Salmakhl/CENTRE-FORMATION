Enter password: ******************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 83
Server version: 8.0.19 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases ;
+--------------------+
| Database           |
+--------------------+
| bdvol              |
| centre_formation   |
| chevaux_ecurie     |
| djallabasoft       |
| hollywood          |
| information_schema |
| isgi               |
| mysql              |
| newschema          |
| performance_schema |
| sakila             |
| sys                |
| test1              |
| test2              |
| test3              |
+--------------------+
15 rows in set (0.00 sec)

mysql> ude centre_formation;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ude centre_formation' at line 1
mysql> use centre_formation;
Database changed
mysql> show tables;
+----------------------------+
| Tables_in_centre_formation |
+----------------------------+
| catalogue                  |
| etudiant                   |
| formation                  |
| inscription                |
| session                    |
| specialite                 |
+----------------------------+
6 rows in set (0.00 sec)

mysql> desc etudiant;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| numCinEtu     | varchar(10) | NO   | PRI | NULL    |       |
| nomEtu        | varchar(45) | YES  |     | NULL    |       |
| prenomEtu     | varchar(45) | YES  |     | NULL    |       |
| dateNaissance | date        | YES  |     | NULL    |       |
| adressEtu     | varchar(45) | YES  |     | NULL    |       |
| villeEtu      | varchar(45) | YES  |     | NULL    |       |
| niveauEtu     | varchar(45) | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> select count(numcinetu)
    -> from etudiant;
+------------------+
| count(numcinetu) |
+------------------+
|                7 |
+------------------+
1 row in set (0.15 sec)

mysql> select * from etudiant;
+-----------+----------------+--------------+---------------+--------------------------------------+------------+------------+
| numCinEtu | nomEtu         | prenomEtu    | dateNaissance | adressEtu                            | villeEtu   | niveauEtu  |
+-----------+----------------+--------------+---------------+--------------------------------------+------------+------------+
| AB234567  | Alami          | Ahmad        | 1986-01-01    | rue du port,13                       | tanger     | bac        |
| C0987265  | Souni          | Sanaa        | 1998-04-30    | place de peuple n 2                  | tanger     | niveau bac |
| D2356903  | Idrissi Alami  | Mohamed      | 1996-05-05    | lotisement najah rue n 12 immeuble 3 | rabat      | bac+4      |
| F0827363  | Baoudiaf       | Fatima Zohra | 1997-01-10    | immeuble iftikhar , n 13 ettakaddoum | rabat      | bac+2      |
| G5346789  | Toumi          | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                | casablanca | master     |
| J3578902  | Ben Omar       | Abd Allah    | 1990-06-25    | villa amina n12 bir rami             | kenitra    | phd        |
| Y1234987  | Ouled thami    | Ali          | 1979-12-04    | la ville haute , rue chouhada n 6    | tanger     | bachelor   |
+-----------+----------------+--------------+---------------+--------------------------------------+------------+------------+
7 rows in set (0.00 sec)

mysql> select nometu , prenometu ,
    -> year(now) - year(datenaissance)
    -> from etudiant;
ERROR 1054 (42S22): Unknown column 'now' in 'field list'
mysql> select nometu , prenometu ,
    -> year(now()) - year(datenaissance)
    -> from etudiant;
+----------------+--------------+-----------------------------------+
| nometu         | prenometu    | year(now()) - year(datenaissance) |
+----------------+--------------+-----------------------------------+
| Alami          | Ahmad        |                                38 |
| Souni          | Sanaa        |                                26 |
| Idrissi Alami  | Mohamed      |                                28 |
| Baoudiaf       | Fatima Zohra |                                27 |
| Toumi          | Aicha        |                                24 |
| Ben Omar       | Abd Allah    |                                34 |
| Ouled thami    | Ali          |                                45 |
+----------------+--------------+-----------------------------------+
7 rows in set (0.01 sec)

mysql> select * from formation;
+----------+-------------------------+-----------+----------+
| codeForm | titreform               | dureeform | prixform |
+----------+-------------------------+-----------+----------+
|       11 | Programming Java        |        12 |     3600 |
|       12 | Web developpement       |        14 |     4200 |
|       13 | Anglais technique       |        15 |     3750 |
|       14 | Communication           |        10 |     2500 |
|       15 | Base de données Oracle  |        20 |     6000 |
|       16 | Soft skills             |        12 |     3000 |
+----------+-------------------------+-----------+----------+
6 rows in set (0.00 sec)

mysql> select max(prixform)
    -> from foramtion
    -> as chere ;
ERROR 1146 (42S02): Table 'centre_formation.foramtion' doesn't exist
mysql> select max(prixform)
    -> from formation
    -> as chere ;
+---------------+
| max(prixform) |
+---------------+
|          6000 |
+---------------+
1 row in set (0.00 sec)

mysql> select min(prixform)
    -> as moins_cher
    -> from formation;
+------------+
| moins_cher |
+------------+
|       2500 |
+------------+
1 row in set (0.00 sec)

mysql> select sum(prixform)
    -> from formation;
+---------------+
| sum(prixform) |
+---------------+
|         23050 |
+---------------+
1 row in set (0.00 sec)

mysql> select * session;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'session' at line 1
mysql> select * from session;
Empty set (0.16 sec)

mysql> desc session ;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| codeSess  | int         | NO   | PRI | NULL    |       |
| nomsess   | varchar(45) | YES  |     | NULL    |       |
| datedebut | date        | YES  |     | NULL    |       |
| datefin   | varchar(45) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into session values
    -> (1101 ,'Session1101', '2022-01-02', '2022-01-14', 11),(1102 ,'Session 1102', '2022-02-03', '2022-02-15', 11),(1201 ,'Session 1201', '2022-03-04', '2022-03-18', 12),(1202 ,'Session 1202', '2022-04-05', '2022-04-19', 12),(1301 ,'Session 1301', '2022-01-06', '2022-01-21', 13),(1302 ,'Session 1302', '2022-05-07', '2022-05-22', 13),(1303 ,'Session 1303', '2022-06-08', '2022-06-23', 13),(1401 ,'Session 1401', '2022-09-01', '2022-09-11', 14),(1402 ,'Session 1402', '2022-08-08', '2022-08-18', 14),(1501 ,'Session 1501', '2022-11-11', '2022-12-01', 15),(1502 ,'Session 1502', '2022-09-12', '2022-10-02', 15),(1601 ,'Session 1601', '2022-09-13', '2022-09-25', 16),(1602 ,'Session 1602', '2022-10-14', '2022-10-26', 16),(1104 ,'Session 1104', '2022-10-15', '2022-10-27', 11),(1203 ,'Session 1203', '2022-11-16', '2022-11-30', 12)(1204 ,'Session 1204', '2022-12-17', ''2022-12-31', 12);
    '> ;;;
    '> ;
    '> ^C
mysql> insert into session values
    -> (1101 ,'Session1101', '2022-01-02', '2022-01-14', 11),(1102 ,'Session 1102', '2022-02-03', '2022-02-15', 11),(1201 ,'Session 1201', '2022-03-04', '2022-03-18', 12),(1202 ,'Session 1202', '2022-04-05', '2022-04-19', 12),(1301 ,'Session 1301', '2022-01-06', '2022-01-21', 13),(1302 ,'Session 1302', '2022-05-07', '2022-05-22', 13),(1303 ,'Session 1303', '2022-06-08', '2022-06-23', 13),(1401 ,'Session 1401', '2022-09-01', '2022-09-11', 14),(1402 ,'Session 1402', '2022-08-08', '2022-08-18', 14),(1501 ,'Session 1501', '2022-11-11', '2022-12-01', 15),(1502 ,'Session 1502', '2022-09-12', '2022-10-02', 15),(1601 ,'Session 1601', '2022-09-13', '2022-09-25', 16),(1602 ,'Session 1602', '2022-10-14', '2022-10-26', 16),(1104 ,'Session 1104', '2022-10-15', '2022-10-27', 11),(1203 ,'Session 1203', '2022-11-16', '2022-11-30', 12)(1204 ,'Session 1204', '2022-12-17', ''2022-12-31', 12);
    '>
    '>
    '>
    '> ;
    '> ^C
mysql> insert into session values
    -> (1101 ,'Session1101', '2022-01-02', '2022-01-14', 11),
    -> (1102 ,'Session 1102', '2022-02-03', '2022-02-15', 11),
    -> (1201 ,'Session 1201', '2022-03-04', '2022-03-18', 12),
    -> (1202 ,'Session 1202', '2022-04-05', '2022-04-19', 12),(1301 ,'Session 1301', '2022-01-06', '2022-01-21', 13),
    -> (1302 ,'Session 1302', '2022-05-07', '2022-05-22', 13),(1303 ,'Session 1303', '2022-06-08', '2022-06-23', 13),
    -> (1401 ,'Session 1401', '2022-09-01', '2022-09-11', 14),(1402 ,'Session 1402', '2022-08-08', '2022-08-18', 14),
    -> (1501 ,'Session 1501', '2022-11-11', '2022-12-01', 15),(1502 ,'Session 1502', '2022-09-12', '2022-10-02', 15),
    -> (1601 ,'Session 1601', '2022-09-13', '2022-09-25', 16),(1602 ,'Session 1602', '2022-10-14', '2022-10-26', 16),
    -> (1104 ,'Session 1104', '2022-10-15', '2022-10-27', 11),(1203 ,'Session 1203', '2022-11-16', '2022-11-30', 12),
    -> (1204 ,'Session 1204', '2022-12-17', ''2022-12-31', 12);
    '>
    '> ^C
mysql> insert into session values
    -> (1101 ,'Session1101', '2022-01-02', '2022-01-14', 11),
    -> (1102 ,'Session 1102', '2022-02-03', '2022-02-15', 11),
    -> (1201 ,'Session 1201', '2022-03-04', '2022-03-18', 12);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> desc session;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| codeSess  | int         | NO   | PRI | NULL    |       |
| nomsess   | varchar(45) | YES  |     | NULL    |       |
| datedebut | date        | YES  |     | NULL    |       |
| datefin   | varchar(45) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> alter table formation
    -> add column codef int ;
Query OK, 0 rows affected (0.27 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from formation ;
+----------+-------------------------+-----------+----------+-------+
| codeForm | titreform               | dureeform | prixform | codef |
+----------+-------------------------+-----------+----------+-------+
|       11 | Programming Java        |        12 |     3600 |  NULL |
|       12 | Web developpement       |        14 |     4200 |  NULL |
|       13 | Anglais technique       |        15 |     3750 |  NULL |
|       14 | Communication           |        10 |     2500 |  NULL |
|       15 | Base de données Oracle  |        20 |     6000 |  NULL |
|       16 | Soft skills             |        12 |     3000 |  NULL |
+----------+-------------------------+-----------+----------+-------+
6 rows in set (0.00 sec)

mysql> insert into session values
    -> (1101 ,'Session1101', '2022-01-02', '2022-01-14', 11),
    -> (1102 ,'Session 1102', '2022-02-03', '2022-02-15', 11),
    -> (1201 ,'Session 1201', '2022-03-04', '2022-03-18', 12),
    -> (1202 ,'Session 1202', '2022-04-05', '2022-04-19', 12),(1301 ,'Session 1301', '2022-01-06', '2022-01-21', 13),
    -> (1302 ,'Session 1302', '2022-05-07', '2022-05-22', 13),(1303 ,'Session 1303', '2022-06-08', '2022-06-23', 13);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> desc session ;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| codeSess  | int         | NO   | PRI | NULL    |       |
| nomsess   | varchar(45) | YES  |     | NULL    |       |
| datedebut | date        | YES  |     | NULL    |       |
| datefin   | varchar(45) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc formation ;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| codeForm  | int         | NO   | PRI | NULL    |       |
| titreform | varchar(45) | YES  |     | NULL    |       |
| dureeform | int         | YES  |     | NULL    |       |
| prixform  | int         | YES  |     | NULL    |       |
| codef     | int         | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> alter table formation
    -> drop codef ;
Query OK, 0 rows affected (1.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table session
    -> add column codeform int ;
Query OK, 0 rows affected (0.56 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into session values
    -> (1101 ,'Session1101', '2022-01-02', '2022-01-14', 11),
    -> (1102 ,'Session 1102', '2022-02-03', '2022-02-15', 11),
    -> (1201 ,'Session 1201', '2022-03-04', '2022-03-18', 12),
    -> (1202 ,'Session 1202', '2022-04-05', '2022-04-19', 12),(1301 ,'Session 1301', '2022-01-06', '2022-01-21', 13),
    -> (1302 ,'Session 1302', '2022-05-07', '2022-05-22', 13),(1303 ,'Session 1303', '2022-06-08', '2022-06-23', 13);
Query OK, 7 rows affected (0.12 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> insert into session values
    -> (1401 ,'Session 1401', '2022-09-01', '2022-09-11', 14),(1402 ,'Session 1402', '2022-08-08', '2022-08-18', 14),
    -> (1501 ,'Session 1501', '2022-11-11', '2022-12-01', 15),(1502 ,'Session 1502', '2022-09-12', '2022-10-02', 15),
    -> (1601 ,'Session 1601', '2022-09-13', '2022-09-25', 16),(1602 ,'Session 1602', '2022-10-14', '2022-10-26', 16),
    -> (1104 ,'Session 1104', '2022-10-15', '2022-10-27', 11),(1203 ,'Session 1203', '2022-11-16', '2022-11-30', 12),
    -> (1204 ,'Session 1204', '2022-12-17', ''2022-12-31', 12);
    '> ^C
mysql> insert into session values
    -> (1401 ,'Session 1401', '2022-09-01', '2022-09-11', 14),(1402 ,'Session 1402', '2022-08-08', '2022-08-18', 14);
Query OK, 2 rows affected (0.07 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into session values
    -> (1501 ,'Session 1501', '2022-11-11', '2022-12-01', 15),(1502 ,'Session 1502', '2022-09-12', '2022-10-02', 15),
    -> (1601 ,'Session 1601', '2022-09-13', '2022-09-25', 16),(1602 ,'Session 1602', '2022-10-14', '2022-10-26', 16);
Query OK, 4 rows affected (0.09 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into session values
    -> (1104 ,'Session 1104', '2022-10-15', '2022-10-27', 11),(1203 ,'Session 1203', '2022-11-16', '2022-11-30', 12),
    -> (1204 ,'Session 1204', '2022-12-17', ''2022-12-31', 12);
    '> ^C
mysql> insert into session values
    -> (1401 ,'Session 1401', '2022-09-01', '2022-09-11', 14),(1402 ,'Session 1402', '2022-08-08', '2022-08-18', 14);
ERROR 1062 (23000): Duplicate entry '1401' for key 'session.PRIMARY'
mysql> select * from session ;
+----------+--------------+------------+------------+----------+
| codeSess | nomsess      | datedebut  | datefin    | codeform |
+----------+--------------+------------+------------+----------+
|     1101 | Session1101  | 2022-01-02 | 2022-01-14 |       11 |
|     1102 | Session 1102 | 2022-02-03 | 2022-02-15 |       11 |
|     1201 | Session 1201 | 2022-03-04 | 2022-03-18 |       12 |
|     1202 | Session 1202 | 2022-04-05 | 2022-04-19 |       12 |
|     1301 | Session 1301 | 2022-01-06 | 2022-01-21 |       13 |
|     1302 | Session 1302 | 2022-05-07 | 2022-05-22 |       13 |
|     1303 | Session 1303 | 2022-06-08 | 2022-06-23 |       13 |
|     1401 | Session 1401 | 2022-09-01 | 2022-09-11 |       14 |
|     1402 | Session 1402 | 2022-08-08 | 2022-08-18 |       14 |
|     1501 | Session 1501 | 2022-11-11 | 2022-12-01 |       15 |
|     1502 | Session 1502 | 2022-09-12 | 2022-10-02 |       15 |
|     1601 | Session 1601 | 2022-09-13 | 2022-09-25 |       16 |
|     1602 | Session 1602 | 2022-10-14 | 2022-10-26 |       16 |
+----------+--------------+------------+------------+----------+
13 rows in set (0.00 sec)

mysql> insert into session values
    -> (1104 ,'Session 1104', '2022-10-15', '2022-10-27', 11),(1203 ,'Session 1203', '2022-11-16', '2022-11-30', 12);
Query OK, 2 rows affected (0.10 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into session values
    -> (1204 ,'Session 1204', '2022-12-17', ''2022-12-31', 12);
    '> ^C
mysql> insert into session values
    -> (1204 ,'Session 1204', '2022-12-17', '2022-12-31', 12);
Query OK, 1 row affected (0.12 sec)

mysql> select * from session ;
+----------+--------------+------------+------------+----------+
| codeSess | nomsess      | datedebut  | datefin    | codeform |
+----------+--------------+------------+------------+----------+
|     1101 | Session1101  | 2022-01-02 | 2022-01-14 |       11 |
|     1102 | Session 1102 | 2022-02-03 | 2022-02-15 |       11 |
|     1104 | Session 1104 | 2022-10-15 | 2022-10-27 |       11 |
|     1201 | Session 1201 | 2022-03-04 | 2022-03-18 |       12 |
|     1202 | Session 1202 | 2022-04-05 | 2022-04-19 |       12 |
|     1203 | Session 1203 | 2022-11-16 | 2022-11-30 |       12 |
|     1204 | Session 1204 | 2022-12-17 | 2022-12-31 |       12 |
|     1301 | Session 1301 | 2022-01-06 | 2022-01-21 |       13 |
|     1302 | Session 1302 | 2022-05-07 | 2022-05-22 |       13 |
|     1303 | Session 1303 | 2022-06-08 | 2022-06-23 |       13 |
|     1401 | Session 1401 | 2022-09-01 | 2022-09-11 |       14 |
|     1402 | Session 1402 | 2022-08-08 | 2022-08-18 |       14 |
|     1501 | Session 1501 | 2022-11-11 | 2022-12-01 |       15 |
|     1502 | Session 1502 | 2022-09-12 | 2022-10-02 |       15 |
|     1601 | Session 1601 | 2022-09-13 | 2022-09-25 |       16 |
|     1602 | Session 1602 | 2022-10-14 | 2022-10-26 |       16 |
+----------+--------------+------------+------------+----------+
16 rows in set (0.00 sec)

mysql> desc inscription ;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| codeSess   | int         | YES  | MUL | NULL    |       |
| num_cin    | varchar(10) | YES  |     | NULL    |       |
| type_cours | varchar(10) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select codesess , count(numcinetu)
    -> as nbr_insc
    -> left join inscription on session.codesess = inscription.codesess
    -> group by codesess;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'left join inscription on session.codesess = inscription.codesess
group by codese' at line 3
mysql> select codesess , count(numcinetu)
    -> as nbr_insc
    -> join inscription on session.codesess = inscription.codesess
    -> group by codesess;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'join inscription on session.codesess = inscription.codesess
group by codesess' at line 3
mysql> select codesess , count(num_cin)
    -> as nbr_insc
    -> join inscription on session.codesess = inscription.codesess
    -> group by codesess;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'join inscription on session.codesess = inscription.codesess
group by codesess' at line 3
mysql> select codesess , count(num_cin)
    -> as nbr_insc
    -> left join inscription on session.codesess = inscription.codesess
    -> group by codesess;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'left join inscription on session.codesess = inscription.codesess
group by codese' at line 3
mysql> select codesess , count(numcinetu)
    -> as nbr_insc
    -> from session
    -> left join inscription on session.codesess = inscription.codesess
    -> group by codesess;
ERROR 1052 (23000): Column 'codesess' in field list is ambiguous
mysql> select codesess , count(num_cin)
    -> as nbr_insc
    -> from session
    -> left join inscription on session.codesess = inscription.codesess
    -> group by session.codesess;
ERROR 1052 (23000): Column 'codesess' in field list is ambiguous
mysql> select s.codesess , count(num_cin)
    -> as nbr_insc
    -> from session s
    -> left join inscription on s.codesess = inscription.codesess
    -> group by s.codesess;
+----------+----------+
| codesess | nbr_insc |
+----------+----------+
|     1101 |        0 |
|     1102 |        0 |
|     1104 |        0 |
|     1201 |        0 |
|     1202 |        0 |
|     1203 |        0 |
|     1204 |        0 |
|     1301 |        0 |
|     1302 |        0 |
|     1303 |        0 |
|     1401 |        0 |
|     1402 |        0 |
|     1501 |        0 |
|     1502 |        0 |
|     1601 |        0 |
|     1602 |        0 |
+----------+----------+
16 rows in set (0.08 sec)

mysql> select * from incription ;
ERROR 1146 (42S02): Table 'centre_formation.incription' doesn't exist
mysql> select * from inscription ;
Empty set (0.00 sec)

mysql> alter table session
    -> add foreign key (codeform) references formatoin(codeform);
ERROR 1824 (HY000): Failed to open the referenced table 'formatoin'
mysql> insert into inscription values
    -> (1101 AB234567 Distanciel
    -> 1101 G5346789 Distanciel,^C
mysql> insert into inscription values
    -> (1101, 'AB234567' ,'Distanciel'),
    -> 1101 G5346789 Distanciel
    -> ^C
mysql> insert into inscription values
    -> (1101, 'AB234567' ,'Distanciel'),
    -> (1101, 'G5346789', 'Distanciel'),
    -> (1101 ,'C0987265', 'Distanciel'),
    -> (1101, 'D2356903', 'Distanciel'),
    -> (1101, 'Y1234987' , 'Distanciel'),
    -> (1101 ,'J3578902' ,'Distanciel'),
    -> (1101 ,'F9827363' ,'Distanciel'),
    -> (1201 ,'AB234567' ,'Présentiel'),
    -> (1201 ,'G5346789' ,'Présentiel'),
    -> (1201 ,'C0987265' ,'Présentiel'),
    -> (1201 ,'D2356903' ,'Présentiel'),
    -> (1201 ,'Y1234987', 'Présentiel'),
    -> (1201 ,'J3578902','Présentiel'),
    -> (1302 ,'AB234567', 'Présentiel'),
    -> (1302 ,'G5346789' ,'Distanciel'),
    -> (1302 ,'C0987265' ,'Présentiel'),
    -> (1302 ,'D2356903' ,'Présentiel'),
    -> (1302 ,'Y1234987' ,'Présentiel'),
    -> (1401 ,'G5346789' ,'Distanciel'),
    -> (1401 ,'C0987265' ,'Distanciel'),
    -> (1401 ,'D2356903' ,'Distanciel'),
    -> (1401 ,'Y1234987' ,'Distanciel'),
    -> (1401 ,'J3578902' ,'Distanciel'),
    -> (1401 ,'F9827363' ,'Distanciel'),
    -> (1501 ,'AB234567' ,'Distanciel'),
    -> (1501 ,'G5346789' ,'Présentiel'),
    -> (1501 ,'C0987265' ,'Distanciel'),
    -> (1501 ,'D2356903' ,'Présentiel'),
    -> (1501 ,'Y1234987' ,'Présentiel'),
    -> (1501 ,'J3578902' ,'Présentiel'),
    -> (1501, 'F9827363' ,'Présentiel');
Query OK, 31 rows affected (0.13 sec)
Records: 31  Duplicates: 0  Warnings: 0

mysql> select s.codesess , count(num_cin)
    ->     -> as nbr_insc
    ->     -> from session s
    ->     -> left join inscription on s.codesess = inscription.codesess
    ->     -> group by s.codesess;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> as nbr_insc
    -> from session s
    -> left join inscription on s.codesess ' at line 2
mysql> select s.codesess , count(num_cin)
    -> as nbr_insc
    -> from session s
    -> left join inscription on s.codesess = inscription.codesess
    -> group by s.codesess;
+----------+----------+
| codesess | nbr_insc |
+----------+----------+
|     1101 |        7 |
|     1102 |        0 |
|     1104 |        0 |
|     1201 |        6 |
|     1202 |        0 |
|     1203 |        0 |
|     1204 |        0 |
|     1301 |        0 |
|     1302 |        5 |
|     1303 |        0 |
|     1401 |        6 |
|     1402 |        0 |
|     1501 |        7 |
|     1502 |        0 |
|     1601 |        0 |
|     1602 |        0 |
+----------+----------+
16 rows in set (0.00 sec)

mysql> select distinct numcinetu
    -> from etudiant
    -> join inscription in etudiant.numcinetu = inscription.numcinetu ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'in etudiant.numcinetu = inscription.numcinetu' at line 3
mysql> select distinct etudiant.numcinetu
    -> from etudiant
    -> join inscription in etudiant.numcinetu = inscription.numcinetu ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'in etudiant.numcinetu = inscription.numcinetu' at line 3
mysql> select distinct etudiant.numcinetu
    -> from etudiant
    -> join inscription on etudiant.'numcinetu' = inscription.'numcinetu' ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''numcinetu' = inscription.'numcinetu'' at line 3
mysql> select distinct etudiant.numcinetu
    -> from etudiant
    -> join inscription on etudiant.numcinetu = inscription.numcinetu ;
ERROR 1054 (42S22): Unknown column 'inscription.numcinetu' in 'on clause'
mysql> desc inscription;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| codeSess   | int         | YES  | MUL | NULL    |       |
| num_cin    | varchar(10) | YES  |     | NULL    |       |
| type_cours | varchar(10) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select distinct etudiant.numcinetu
    -> from etudiant
    -> join inscription on etudiant.numcinetu = inscription.num_cin ;
+-----------+
| numcinetu |
+-----------+
| AB234567  |
| G5346789  |
| C0987265  |
| D2356903  |
| Y1234987  |
| J3578902  |
+-----------+
6 rows in set (0.00 sec)

mysql>