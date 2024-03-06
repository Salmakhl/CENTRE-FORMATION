Enter password: ******************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 84
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

mysql> use centre_formation;
Database changed
mysql>  select numcinetu ,
    -> from^C
mysql> select distinct num_cin
    -> from incription
    -> join etudiant on etudiant.numcinetu = inscription.num_cin
    -> group by num_cin;
ERROR 1146 (42S02): Table 'centre_formation.incription' doesn't exist
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
6 rows in set (0.07 sec)

mysql> select distinct num_cin
    -> from inscription
    -> join etudiant on etudiant.numcinetu = inscription.num_cin
    -> group by num_cin;
+----------+
| num_cin  |
+----------+
| AB234567 |
| G5346789 |
| C0987265 |
| D2356903 |
| Y1234987 |
| J3578902 |
+----------+
6 rows in set (0.00 sec)

mysql> select num_cin , count(num_cin)
    -> from inscription
    -> join etudiant on etudiant.numcinetu = inscription.num_cin
    -> group by num_cin;
+----------+----------------+
| num_cin  | count(num_cin) |
+----------+----------------+
| AB234567 |              4 |
| G5346789 |              5 |
| C0987265 |              5 |
| D2356903 |              5 |
| Y1234987 |              5 |
| J3578902 |              4 |
+----------+----------------+
6 rows in set (0.00 sec)

mysql> select codesess , nomsess
    -> from session^C
mysql> select codesess
    -> ^C
mysql> select codesess ,
    -> sum(case when typecours='DISTANCIEL'),
    -> sum(case when typecours='PRESENTIEL'),
    -> FROM INSCRIPTION
    -> groupby codesess;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '),
sum(case when typecours='PRESENTIEL'),
FROM INSCRIPTION
groupby codesess' at line 2
mysql> select codesess ,
    -> sum(case when typecours='DISTANCIEL'  THEN 1 ELSE 0 END),
    -> sum(case when typecours='PRESENTIEL' THEN 1 ELSE 0 END),
    -> groupby codesess;
ERROR 1054 (42S22): Unknown column 'codesess' in 'field list'
mysql> desc inscription;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| codeSess   | int         | YES  | MUL | NULL    |       |
| num_cin    | varchar(10) | YES  |     | NULL    |       |
| type_cours | varchar(10) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select codesess ,
    -> sum(case when type_cours='DISTANCIEL'  THEN 1 ELSE 0 END),
    -> sum(case when type_cours='PRESENTIEL' THEN 1 ELSE 0 END),
    -> select ^Cdesess ,
mysql> select codesess ,
    -> sum(case when type_cours='DISTANCIEL'  THEN 1 ELSE 0 END),
    -> sum(case when type_cours='PRESENTIEL' THEN 1 ELSE 0 END),
    -> from inscription
    -> group by codesess;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from inscription
group by codesess' at line 4
mysql> select codesess ,
    -> sum(case when type_cours='DISTANCIEL'  THEN 1 ELSE 0 END),
    -> sum(case when type_cours='PRESENTIEL' THEN 1 ELSE 0 END),
    -> ^C
mysql> select codesess ,
    -> sum(case when type_cours='DISTANCIEL'  THEN 1 ELSE 0 END),
    -> sum(case when type_cours='PRESENTIEL' THEN 1 ELSE 0 END)
    -> from inscription
    -> group by codesess;
+----------+-----------------------------------------------------------+----------------------------------------------------------+
| codesess | sum(case when type_cours='DISTANCIEL'  THEN 1 ELSE 0 END) | sum(case when type_cours='PRESENTIEL' THEN 1 ELSE 0 END) |
+----------+-----------------------------------------------------------+----------------------------------------------------------+
|     1101 |                                                         7 |                                                        0 |
|     1201 |                                                         0 |                                                        6 |
|     1302 |                                                         1 |                                                        4 |
|     1401 |                                                         6 |                                                        0 |
|     1501 |                                                         2 |                                                        5 |
+----------+-----------------------------------------------------------+----------------------------------------------------------+
5 rows in set (0.00 sec)

mysql>