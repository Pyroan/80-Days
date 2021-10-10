BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Location" (
	"location_id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	"name"	TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS "Log" (
	"log_id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	"date"	TEXT NOT NULL,
	"game_day"	INTEGER,
	"msg"	TEXT NOT NULL,
	"sent"	INTEGER NOT NULL DEFAULT 0,
	"target_channel_id"	INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS "Payment" (
	"payment_id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	"player_id"	INTEGER,
	"team_id"	INTEGER NOT NULL,
	"amount"	INTEGER NOT NULL,
	"location_edge"	INTEGER NOT NULL,
	"time"	INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS "LocationEdge" (
	"edge_id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	"start_location_id"	INTEGER NOT NULL,
	"end_location_id"	INTEGER NOT NULL,
	"weight"	INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS "Team" (
	"team_id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	"name"	TEXT NOT NULL,
	"current_location_id"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Player" (
	"player_id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	"discord_id"	TEXT NOT NULL UNIQUE,
	"team_id"	INTEGER,
	"coins"	INTEGER
);
INSERT INTO "Location" VALUES (0,'London');
INSERT INTO "Location" VALUES (1,'London');
INSERT INTO "Location" VALUES (2,'Dublin');
INSERT INTO "Location" VALUES (3,'Madrid');
INSERT INTO "Location" VALUES (4,'Lisbon');
INSERT INTO "Location" VALUES (5,'Casablanca');
INSERT INTO "Location" VALUES (6,'Reykjavik');
INSERT INTO "Location" VALUES (7,'Quebec City');
INSERT INTO "Location" VALUES (8,'New York City');
INSERT INTO "Location" VALUES (9,'Ottawa');
INSERT INTO "Location" VALUES (10,'Montreal');
INSERT INTO "Location" VALUES (11,'Charlotte');
INSERT INTO "Location" VALUES (12,'Port-au-Prince');
INSERT INTO "Location" VALUES (13,'Caracas');
INSERT INTO "Location" VALUES (14,'Havana');
INSERT INTO "Location" VALUES (15,'Miami');
INSERT INTO "Location" VALUES (16,'Lima');
INSERT INTO "Location" VALUES (17,'Pittsburgh');
INSERT INTO "Location" VALUES (18,'Atlanta');
INSERT INTO "Location" VALUES (19,'Detroit');
INSERT INTO "Location" VALUES (20,'Nashville');
INSERT INTO "Location" VALUES (21,'Panama City');
INSERT INTO "Location" VALUES (22,'Galapagos Islands');
INSERT INTO "Location" VALUES (23,'Guatemala');
INSERT INTO "Location" VALUES (24,'Mexico City');
INSERT INTO "Location" VALUES (25,'Santiago');
INSERT INTO "Location" VALUES (26,'Chicago');
INSERT INTO "Location" VALUES (27,'New Orleans');
INSERT INTO "Location" VALUES (28,'Minneapolis');
INSERT INTO "Location" VALUES (29,'Kansas City');
INSERT INTO "Location" VALUES (30,'Winnipeg');
INSERT INTO "Location" VALUES (31,'Edmonton');
INSERT INTO "Location" VALUES (32,'Denver');
INSERT INTO "Location" VALUES (33,'Dallas');
INSERT INTO "Location" VALUES (34,'El Paso');
INSERT INTO "Location" VALUES (35,'Phoenix');
INSERT INTO "Location" VALUES (36,'Juneau');
INSERT INTO "Location" VALUES (37,'Las Vegas');
INSERT INTO "Location" VALUES (38,'San Diego');
INSERT INTO "Location" VALUES (39,'San Francisco');
INSERT INTO "Location" VALUES (40,'Seattle');
INSERT INTO "Location" VALUES (41,'Vancouver');
INSERT INTO "Location" VALUES (42,'Los Angeles');
INSERT INTO "Location" VALUES (43,'Anchorage');
INSERT INTO "Location" VALUES (44,'Honolulu');
INSERT INTO "Location" VALUES (45,'Auckland');
INSERT INTO "Location" VALUES (46,'Sydney');
INSERT INTO "Location" VALUES (47,'Melbourne');
INSERT INTO "Location" VALUES (48,'Adelaide');
INSERT INTO "Location" VALUES (49,'Perth');
INSERT INTO "Location" VALUES (50,'Jakarta');
INSERT INTO "Location" VALUES (51,'Singapore');
INSERT INTO "Location" VALUES (52,'Colombo');
INSERT INTO "Location" VALUES (53,'Bangkok');
INSERT INTO "Location" VALUES (54,'Tokyo');
INSERT INTO "Location" VALUES (55,'Seoul');
INSERT INTO "Location" VALUES (56,'Beijing');
INSERT INTO "Location" VALUES (57,'Shanghai');
INSERT INTO "Location" VALUES (58,'Chongqing');
INSERT INTO "Location" VALUES (59,'Taipei');
INSERT INTO "Location" VALUES (60,'Hong Kong');
INSERT INTO "Location" VALUES (61,'Hanoi');
INSERT INTO "Location" VALUES (62,'Dhaka');
INSERT INTO "Location" VALUES (63,'Kathmandu');
INSERT INTO "Location" VALUES (64,'Mumbai');
INSERT INTO "Location" VALUES (65,'Dubai');
INSERT INTO "Location" VALUES (66,'Baghdad');
INSERT INTO "Location" VALUES (67,'Ankara');
INSERT INTO "Location" VALUES (68,'Istanbul');
INSERT INTO "Location" VALUES (69,'Izmir');
INSERT INTO "Location" VALUES (70,'Cairo');
INSERT INTO "Location" VALUES (71,'Athens');
INSERT INTO "Location" VALUES (72,'Catania');
INSERT INTO "Location" VALUES (73,'Naples');
INSERT INTO "Location" VALUES (74,'Tunis');
INSERT INTO "Location" VALUES (75,'Sarajevo');
INSERT INTO "Location" VALUES (76,'Rome');
INSERT INTO "Location" VALUES (77,'Beirut');
INSERT INTO "Location" VALUES (78,'Sofia');
INSERT INTO "Location" VALUES (79,'Bucharest');
INSERT INTO "Location" VALUES (80,'Valencia');
INSERT INTO "Location" VALUES (81,'Barcelona');
INSERT INTO "Location" VALUES (82,'Vienna');
INSERT INTO "Location" VALUES (83,'Prague');
INSERT INTO "Location" VALUES (84,'Munich');
INSERT INTO "Location" VALUES (85,'Katowice');
INSERT INTO "Location" VALUES (86,'Berlin');
INSERT INTO "Location" VALUES (87,'Zurich');
INSERT INTO "Location" VALUES (88,'Paris');
INSERT INTO "Location" VALUES (89,'Brussels');
INSERT INTO "Location" VALUES (90,'Amsterdam');
INSERT INTO "Location" VALUES (91,'Copenhagen');
INSERT INTO "Location" VALUES (92,'Oslo');
INSERT INTO "Location" VALUES (93,'Edinburgh');
INSERT INTO "Location" VALUES (94,'Manchester');
INSERT INTO "Location" VALUES (95,'Monaco');
INSERT INTO "Location" VALUES (96,'Budapest');
INSERT INTO "Location" VALUES (97,'Frankfurt');
INSERT INTO "Location" VALUES (98,'Cologne');
INSERT INTO "Log" VALUES (1,'2019-08-24',0,'Hi I''m a brand spanking new log!',1,614344478601510912);
INSERT INTO "Log" VALUES (2,'2019-08-24 22:49:55.599521',0,':notes: It''s a brand new day and my logging works :notes:',1,614344478601510912);
INSERT INTO "Log" VALUES (3,'2019-08-25 13:23:07.662531',5,'A new day has begun! Welcome to day **{}**!
Here''s what''s happened since yesterday:
Nothing!**Argent Boars**, here are your destination options for today:
And for you, **Azure Wolves**:
Finally, **Crimson Stallions**:
Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (4,'2019-08-25 13:28:24.644703',5,'A new day has begun! Welcome to day **{}**!
Here''s what''s happened since yesterday:
Nothing!**Argent Boars**, here are your destination options for today:
And for you, **Azure Wolves**:
Finally, **Crimson Stallions**:
Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (5,'2019-08-25 13:33:52.168214',5,'A new day has begun! Welcome to day **<function get_game_day at 0x03BF0348>**!
Here''s what''s happened since yesterday:
```
Nothing!
```
**Argent Boars**, here are your destination options for today:
Dublin: 462 coinsMadrid: 1257 coinsLisbon: 1582 coinsAnd for you, **Azure Wolves**:
Dublin: 462 coinsMadrid: 1257 coinsLisbon: 1582 coinsFinally, **Crimson Stallions**:
Dublin: 462 coinsMadrid: 1257 coinsLisbon: 1582 coinsGood luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (6,'2019-08-25 13:34:22.327346',5,'A new day has begun! Welcome to day **<function get_game_day at 0x03BF0348>**!
Here''s what''s happened since yesterday:
```
Nothing!
```
**Argent Boars**, here are your destination options for today:
Dublin: 462 coinsMadrid: 1257 coinsLisbon: 1582 coinsAnd for you, **Azure Wolves**:
Dublin: 462 coinsMadrid: 1257 coinsLisbon: 1582 coinsFinally, **Crimson Stallions**:
Dublin: 462 coinsMadrid: 1257 coinsLisbon: 1582 coinsGood luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (7,'2019-08-25 13:35:15.163834',5,'A new day has begun! Welcome to day **5**!
Here''s what''s happened since yesterday:
```
Nothing!
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (8,'2019-08-25 14:05:54.616234',6,'10 minutes remaining in the day! Get those payments in!!!',1,614344478601510912);
INSERT INTO "Log" VALUES (9,'2019-08-25 14:50:00.336479',6,'10 minutes remaining in the day! Get those payments in!!!',1,614344478601510912);
INSERT INTO "Log" VALUES (10,'2019-08-25 15:12:26.832281',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```




```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (11,'2019-08-25 15:14:14.079990',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
 
 
 

```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (12,'2019-08-25 15:17:36.908272',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
 
 
 

```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (13,'2019-08-25 15:19:37.837138',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began!
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (14,'2019-08-25 16:50:00.667978',2,'10 minutes remaining in the day! Get those payments in!!!',1,614344478601510912);
INSERT INTO "Log" VALUES (15,'2019-08-25 17:00:00.221719',3,'A new day has begun! Welcome to day **3**!
Here''s what''s happened since yesterday:
```
 
 
 

```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (16,'2019-08-25 17:27:49.218919',3,'A new day has begun! Welcome to day **3**!
Here''s what''s happened since yesterday:
```
The Argent Boars weren''t able to raise enough to book passage anywhere...
The Azure Wolves have successfully reached Dublin!
The Crimson Stallions weren''t able to raise enough to book passage anywhere...

```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Madrid: 1453 coins
Lisbon: 1641 coins
Reykjavik: 1495 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (17,'2019-08-25 17:28:19.604300',3,'A new day has begun! Welcome to day **3**!
Here''s what''s happened since yesterday:
```
The Argent Boars weren''t able to raise enough to book passage anywhere...
The Azure Wolves have successfully reached Dublin!
The Crimson Stallions weren''t able to raise enough to book passage anywhere...

```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Madrid: 1453 coins
Lisbon: 1641 coins
Reykjavik: 1495 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (18,'2019-08-25 17:28:49.914188',3,'A new day has begun! Welcome to day **3**!
Here''s what''s happened since yesterday:
```
The Argent Boars weren''t able to raise enough to book passage anywhere...
The Azure Wolves have successfully reached Dublin!
The Crimson Stallions weren''t able to raise enough to book passage anywhere...

```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Madrid: 1453 coins
Lisbon: 1641 coins
Reykjavik: 1495 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (19,'2019-08-25 17:29:49.742623',3,'A new day has begun! Welcome to day **3**!
Here''s what''s happened since yesterday:
```
The Argent Boars weren''t able to raise enough to book passage anywhere...
The Azure Wolves have successfully reached Dublin!
The Crimson Stallions weren''t able to raise enough to book passage anywhere...

```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Madrid: 1453 coins
Lisbon: 1641 coins
Reykjavik: 1495 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (20,'2019-08-25 17:30:20.007213',3,'A new day has begun! Welcome to day **3**!
Here''s what''s happened since yesterday:
```
The Argent Boars weren''t able to raise enough to book passage anywhere...
The Azure Wolves have successfully reached Dublin!
The Crimson Stallions weren''t able to raise enough to book passage anywhere...

```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Madrid: 1453 coins
Lisbon: 1641 coins
Reykjavik: 1495 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (21,'2019-08-25 17:30:50.231588',3,'A new day has begun! Welcome to day **3**!
Here''s what''s happened since yesterday:
```
The Argent Boars weren''t able to raise enough to book passage anywhere...
The Azure Wolves have successfully reached Dublin!
The Crimson Stallions weren''t able to raise enough to book passage anywhere...

```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Madrid: 1453 coins
Lisbon: 1641 coins
Reykjavik: 1495 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (22,'2019-08-25 17:33:32.094109',3,'A new day has begun! Welcome to day **3**!
Here''s what''s happened since yesterday:
```
The Argent Boars weren''t able to raise enough to book passage anywhere...

The Crimson Stallions weren''t able to raise enough to book passage anywhere...

```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (23,'2019-08-25 17:34:02.329741',3,'A new day has begun! Welcome to day **3**!
Here''s what''s happened since yesterday:
```
The Argent Boars weren''t able to raise enough to book passage anywhere...

The Crimson Stallions weren''t able to raise enough to book passage anywhere...

```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (24,'2019-08-25 17:36:07.526744',3,'A new day has begun! Welcome to day **3**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves tried to travel to Dublin, but someone sabotaged them and they were stopped by the Black Cats!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (25,'2019-08-25 17:36:37.898021',3,'A new day has begun! Welcome to day **3**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Dublin!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Madrid: 1453 coins
Lisbon: 1641 coins
Reykjavik: 1495 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (26,'2019-08-25 17:42:25.644965',3,'A new day has begun! Welcome to day **3**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Dublin!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Madrid: 1453 coins
Lisbon: 1641 coins
Reykjavik: 1495 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (27,'2019-08-25 17:43:29.975740',3,'A new day has begun! Welcome to day **3**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Madrid!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Lisbon: 505 coins
Casablanca: 836 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (28,'2019-08-25 18:35:49.169492',4,'A new day has begun! Welcome to day **4**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (29,'2019-08-25 18:38:19.888738',4,'A new day has begun! Welcome to day **4**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (30,'2019-08-25 18:42:19.066714',4,'A new day has begun! Welcome to day **4**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (31,'2019-08-25 18:42:49.333933',4,'A new day has begun! Welcome to day **4**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (32,'2019-08-25 18:44:06.820714',4,'A new day has begun! Welcome to day **4**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```And for you, **Azure Wolves**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins
Madrid: 1257 coins
Lisbon: 1582 coins
```Good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (33,'2019-08-25 19:50:00.946573',5,'10 minutes remaining in the day! Get those payments in!!!',1,614344478601510912);
INSERT INTO "Log" VALUES (34,'2019-08-25 20:02:57.459511',6,'A new day has begun! Welcome to day **6**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least -1 from the goal
Madrid: 1257 coins, at least -1 from the goal
Lisbon: 1582 coins, at least -1 from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least -1 from the goal
Madrid: 1257 coins, at least -1 from the goal
Lisbon: 1582 coins, at least -1 from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least -1 from the goal
Madrid: 1257 coins, at least -1 from the goal
Lisbon: 1582 coins, at least -1 from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (35,'2019-08-25 20:09:30.947878',6,'A new day has begun! Welcome to day **6**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (36,'2019-08-25 20:42:44.864049',6,'A new day has begun! Welcome to day **6**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Edinburgh: 929 coins, at least 532km from the goal
```Finally, **Crimson Stallions**:
```
London: 532 coins, at least 31400km from the goal
Manchester: 281 coins, at least 260km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (37,'2019-08-25 20:43:15.124823',6,'A new day has begun! Welcome to day **6**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Edinburgh: 929 coins, at least 532km from the goal
```Finally, **Crimson Stallions**:
```
London: 532 coins, at least 31400km from the goal
Manchester: 281 coins, at least 260km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (38,'2019-08-25 20:44:25.078560',6,'A new day has begun! Welcome to day **6**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Edinburgh: 929 coins, at least 532km from the goal
```Finally, **Crimson Stallions**:
```
London: 532 coins, at least 31400km from the goal
Manchester: 281 coins, at least 260km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (39,'2019-08-25 20:54:15.150099',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Edinburgh: 929 coins, at least 532km from the goal
```Finally, **Crimson Stallions**:
```
London: 532 coins, at least 31400km from the goal
Manchester: 281 coins, at least 260km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (40,'2019-08-25 20:54:45.382853',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Edinburgh: 929 coins, at least 532km from the goal
```Finally, **Crimson Stallions**:
```
London: 532 coins, at least 31400km from the goal
Manchester: 281 coins, at least 260km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (41,'2019-08-25 20:55:15.612589',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Edinburgh: 929 coins, at least 532km from the goal
```Finally, **Crimson Stallions**:
```
London: 532 coins, at least 31400km from the goal
Manchester: 281 coins, at least 260km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (42,'2019-08-25 21:04:07.526249',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (43,'2019-08-25 21:08:11.560127',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (44,'2019-08-25 21:08:32.238743',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (45,'2019-08-25 21:10:41.659865',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (46,'2019-08-25 21:12:37.324273',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (47,'2019-08-25 21:15:25.791692',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (48,'2019-08-25 21:15:26.409387',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (49,'2019-08-25 21:15:56.784580',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (50,'2019-08-25 21:22:05.721726',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (51,'2019-08-25 21:22:06.588805',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (52,'2019-08-25 21:22:36.879993',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (53,'2019-08-25 21:30:33.573193',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (54,'2019-08-25 21:30:47.378265',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (55,'2019-08-25 21:31:17.620271',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (56,'2019-08-25 21:45:41.556759',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
: 532 coins, at least 0km from the goal
Manchester: 281 coins, at least 260km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (57,'2019-08-25 21:46:11.847094',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
: 532 coins, at least 0km from the goal
Manchester: 281 coins, at least 260km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (58,'2019-08-25 21:48:25.066950',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
London: 532 coins, at least 0km from the goal
Manchester: 281 coins, at least 260km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (59,'2019-08-25 21:48:55.395840',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
London: 532 coins, at least 0km from the goal
Manchester: 281 coins, at least 260km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (60,'2019-08-25 21:49:25.663181',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
London: 532 coins, at least 0km from the goal
Manchester: 281 coins, at least 260km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (61,'2019-08-25 21:49:55.914864',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
London: 532 coins, at least 0km from the goal
Manchester: 281 coins, at least 260km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (62,'2019-08-25 21:54:54.395335',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (63,'2019-08-25 21:59:25.441643',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (64,'2019-08-25 21:59:28.440671',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (65,'2019-08-25 21:59:58.746438',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (66,'2019-08-25 22:06:04.611656',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614344478601510912);
INSERT INTO "Log" VALUES (67,'2019-08-25 22:13:38.695941',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (68,'2019-08-26 23:53:53.429443',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (69,'2019-08-27 00:00:00.822780',2,'A new day has begun! Welcome to day **2**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Dublin!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Madrid: 1453 coins, at least 32178km from the goal
Lisbon: 1641 coins, at least 31673km from the goal
Reykjavik: 1495 coins, at least 29443km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (70,'2019-08-27 00:50:00.339077',2,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (71,'2019-08-27 01:00:01.160975',3,'A new day has begun! Welcome to day **3**!
Here''s what''s happened since yesterday:
```
The Argent Boars have successfully reached Lisbon!

The Azure Wolves have successfully reached Reykjavik!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
New York City: 5430 coins, at least 26243km from the goal
Port-au-Prince: 6429 coins, at least 28157km from the goal
Miami: 6678 coins, at least 27032km from the goal
```And for you, **Azure Wolves**:
```
Quebec City: 3522 coins, at least 25921km from the goal
New York City: 4205 coins, at least 26243km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (72,'2019-08-27 08:17:24.455606',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```Finally, **Crimson Stallions**:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (73,'2019-08-27 08:50:00.352863',1,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (74,'2019-08-27 09:00:01.436666',2,'A new day has begun! Welcome to day **2**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Madrid!

The Crimson Stallions have successfully reached Dublin!


```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
Lisbon: 505 coins, at least 31673km from the goal
Casablanca: 836 coins, at least 33960km from the goal
```Finally, **Crimson Stallions**:
```
Madrid: 1453 coins, at least 32178km from the goal
Lisbon: 1641 coins, at least 31673km from the goal
Reykjavik: 1495 coins, at least 29443km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (75,'2019-08-27 09:50:00.021151',2,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (76,'2019-08-27 10:00:01.003332',3,'A new day has begun! Welcome to day **3**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Lisbon!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
New York City: 5430 coins, at least 26243km from the goal
Port-au-Prince: 6429 coins, at least 28157km from the goal
Miami: 6678 coins, at least 27032km from the goal
```Finally, **Crimson Stallions**:
```
Madrid: 1453 coins, at least 32178km from the goal
Lisbon: 1641 coins, at least 31673km from the goal
Reykjavik: 1495 coins, at least 29443km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (77,'2019-08-27 10:50:00.275864',3,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (78,'2019-08-27 11:00:00.959360',4,'A new day has begun! Welcome to day **4**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions have successfully reached Lisbon!


```
**Argent Boars**, here are your destination options for today:
```
Dublin: 462 coins, at least 30938km from the goal
Madrid: 1257 coins, at least 32178km from the goal
Lisbon: 1582 coins, at least 31673km from the goal
```And for you, **Azure Wolves**:
```
New York City: 5430 coins, at least 26243km from the goal
Port-au-Prince: 6429 coins, at least 28157km from the goal
Miami: 6678 coins, at least 27032km from the goal
```Finally, **Crimson Stallions**:
```
New York City: 5430 coins, at least 26243km from the goal
Port-au-Prince: 6429 coins, at least 28157km from the goal
Miami: 6678 coins, at least 27032km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (79,'2019-08-27 11:50:00.903357',4,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (80,'2019-08-27 12:00:00.797759',5,'A new day has begun! Welcome to day **5**!
Here''s what''s happened since yesterday:
```
The Argent Boars have successfully reached Dublin!

The Azure Wolves have successfully reached New York City!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Madrid: 1453 coins, at least 32178km from the goal
Lisbon: 1641 coins, at least 31673km from the goal
Reykjavik: 1495 coins, at least 29443km from the goal
```And for you, **Azure Wolves**:
```
Charlotte: 853 coins, at least 26318km from the goal
Pittsburgh: 508 coins, at least 25735km from the goal
```Finally, **Crimson Stallions**:
```
New York City: 5430 coins, at least 26243km from the goal
Port-au-Prince: 6429 coins, at least 28157km from the goal
Miami: 6678 coins, at least 27032km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (81,'2019-08-27 12:50:00.718296',5,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (82,'2019-08-27 13:00:00.388754',6,'A new day has begun! Welcome to day **6**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Pittsburgh!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Madrid: 1453 coins, at least 32178km from the goal
Lisbon: 1641 coins, at least 31673km from the goal
Reykjavik: 1495 coins, at least 29443km from the goal
```And for you, **Azure Wolves**:
```
Detroit: 333 coins, at least 25453km from the goal
Nashville: 759 coins, at least 25712km from the goal
Chicago: 663 coins, at least 25072km from the goal
```Finally, **Crimson Stallions**:
```
New York City: 5430 coins, at least 26243km from the goal
Port-au-Prince: 6429 coins, at least 28157km from the goal
Miami: 6678 coins, at least 27032km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (83,'2019-08-27 13:50:00.429551',6,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (84,'2019-08-27 14:00:01.178631',7,'A new day has begun! Welcome to day **7**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Detroit!

The Crimson Stallions have successfully reached Miami!


```
**Argent Boars**, here are your destination options for today:
```
Madrid: 1453 coins, at least 32178km from the goal
Lisbon: 1641 coins, at least 31673km from the goal
Reykjavik: 1495 coins, at least 29443km from the goal
```And for you, **Azure Wolves**:
```
Chicago: 381 coins, at least 25072km from the goal
Kansas City: 1035 coins, at least 25041km from the goal
```Finally, **Crimson Stallions**:
```
Charlotte: 1053 coins, at least 26318km from the goal
Atlanta: 976 coins, at least 26056km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (85,'2019-08-27 14:50:00.094390',7,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (86,'2019-08-27 15:00:00.753528',8,'A new day has begun! Welcome to day **8**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Chicago!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Madrid: 1453 coins, at least 32178km from the goal
Lisbon: 1641 coins, at least 31673km from the goal
Reykjavik: 1495 coins, at least 29443km from the goal
```And for you, **Azure Wolves**:
```
Minneapolis: 580 coins, at least 24492km from the goal
Kansas City: 668 coins, at least 25041km from the goal
```Finally, **Crimson Stallions**:
```
Charlotte: 1053 coins, at least 26318km from the goal
Atlanta: 976 coins, at least 26056km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (87,'2019-08-27 15:50:00.712888',8,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (88,'2019-08-27 16:00:00.499762',9,'A new day has begun! Welcome to day **9**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Kansas City!

The Crimson Stallions have successfully reached Atlanta!


```
**Argent Boars**, here are your destination options for today:
```
Madrid: 1453 coins, at least 32178km from the goal
Lisbon: 1641 coins, at least 31673km from the goal
Reykjavik: 1495 coins, at least 29443km from the goal
```And for you, **Azure Wolves**:
```
Denver: 904 coins, at least 24137km from the goal
Dallas: 724 coins, at least 25202km from the goal
```Finally, **Crimson Stallions**:
```
Nashville: 344 coins, at least 25712km from the goal
Dallas: 1156 coins, at least 25202km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (89,'2019-08-27 16:50:00.464844',9,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (90,'2019-08-27 17:00:01.337603',10,'A new day has begun! Welcome to day **10**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Denver!

The Crimson Stallions have successfully reached Nashville!


```
**Argent Boars**, here are your destination options for today:
```
Madrid: 1453 coins, at least 32178km from the goal
Lisbon: 1641 coins, at least 31673km from the goal
Reykjavik: 1495 coins, at least 29443km from the goal
```And for you, **Azure Wolves**:
```
Phoenix: 944 coins, at least 24189km from the goal
Las Vegas: 973 coins, at least 23737km from the goal
Seattle: 1640 coins, at least 22497km from the goal
```Finally, **Crimson Stallions**:
```
Chicago: 640 coins, at least 25072km from the goal
Kansas City: 761 coins, at least 25041km from the goal
Dallas: 990 coins, at least 25202km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (91,'2019-08-27 17:50:00.271749',10,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (92,'2019-08-27 18:00:01.026277',11,'A new day has begun! Welcome to day **11**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Seattle!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Madrid: 1453 coins, at least 32178km from the goal
Lisbon: 1641 coins, at least 31673km from the goal
Reykjavik: 1495 coins, at least 29443km from the goal
```And for you, **Azure Wolves**:
```
Vancouver: 196 coins, at least 22337km from the goal
Tokyo: 7696 coins, at least 14801km from the goal
```Finally, **Crimson Stallions**:
```
Chicago: 640 coins, at least 25072km from the goal
Kansas City: 761 coins, at least 25041km from the goal
Dallas: 990 coins, at least 25202km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (93,'2019-08-27 18:50:00.345850',11,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (94,'2019-08-27 19:00:01.278735',12,'A new day has begun! Welcome to day **12**!
Here''s what''s happened since yesterday:
```
The Argent Boars have successfully reached Reykjavik!

The Azure Wolves have successfully reached Vancouver!

The Crimson Stallions have successfully reached Dallas!


```
**Argent Boars**, here are your destination options for today:
```
Quebec City: 3522 coins, at least 25921km from the goal
New York City: 4205 coins, at least 26243km from the goal
```And for you, **Azure Wolves**:
```
Juneau: 1241 coins, at least 21292km from the goal
Tokyo: 7536 coins, at least 14801km from the goal
```Finally, **Crimson Stallions**:
```
Denver: 1065 coins, at least 24137km from the goal
El Paso: 917 coins, at least 24673km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (95,'2019-08-27 19:50:00.474162',12,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (96,'2019-08-27 20:00:00.362186',13,'A new day has begun! Welcome to day **13**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Juneau!

The Crimson Stallions have successfully reached Denver!


```
**Argent Boars**, here are your destination options for today:
```
Quebec City: 3522 coins, at least 25921km from the goal
New York City: 4205 coins, at least 26243km from the goal
```And for you, **Azure Wolves**:
```
Anchorage: 929 coins, at least 20363km from the goal
```Finally, **Crimson Stallions**:
```
Phoenix: 944 coins, at least 24189km from the goal
Las Vegas: 973 coins, at least 23737km from the goal
Seattle: 1640 coins, at least 22497km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (97,'2019-08-27 20:50:00.372889',13,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (98,'2019-08-27 21:00:01.234714',14,'A new day has begun! Welcome to day **14**!
Here''s what''s happened since yesterday:
```
The Argent Boars have successfully reached New York City!

The Azure Wolves have successfully reached Anchorage!

The Crimson Stallions tried to travel to Las Vegas, but someone sabotaged them and they were stopped by the Black Cats!


```
**Argent Boars**, here are your destination options for today:
```
Charlotte: 853 coins, at least 26318km from the goal
Pittsburgh: 508 coins, at least 25735km from the goal
```And for you, **Azure Wolves**:
```
Tokyo: 5562 coins, at least 14801km from the goal
```Finally, **Crimson Stallions**:
```
Phoenix: 944 coins, at least 24189km from the goal
Las Vegas: 973 coins, at least 23737km from the goal
Seattle: 1640 coins, at least 22497km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (99,'2019-08-27 21:50:00.331993',14,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (100,'2019-08-27 22:00:01.175660',15,'A new day has begun! Welcome to day **15**!
Here''s what''s happened since yesterday:
```
The Argent Boars have successfully reached Pittsburgh!

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions have successfully reached Seattle!


```
**Argent Boars**, here are your destination options for today:
```
Detroit: 333 coins, at least 25453km from the goal
Nashville: 759 coins, at least 25712km from the goal
Chicago: 663 coins, at least 25072km from the goal
```And for you, **Azure Wolves**:
```
Tokyo: 5562 coins, at least 14801km from the goal
```Finally, **Crimson Stallions**:
```
Vancouver: 196 coins, at least 22337km from the goal
Tokyo: 7696 coins, at least 14801km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (101,'2019-08-27 22:50:00.491635',15,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (102,'2019-08-27 23:00:00.230029',16,'A new day has begun! Welcome to day **16**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions have successfully reached Vancouver!


```
**Argent Boars**, here are your destination options for today:
```
Detroit: 333 coins, at least 25453km from the goal
Nashville: 759 coins, at least 25712km from the goal
Chicago: 663 coins, at least 25072km from the goal
```And for you, **Azure Wolves**:
```
Tokyo: 5562 coins, at least 14801km from the goal
```Finally, **Crimson Stallions**:
```
Juneau: 1241 coins, at least 21292km from the goal
Tokyo: 7536 coins, at least 14801km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (103,'2019-08-27 23:50:00.372160',16,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (104,'2019-08-28 00:00:00.949076',17,'A new day has begun! Welcome to day **17**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Detroit: 333 coins, at least 25453km from the goal
Nashville: 759 coins, at least 25712km from the goal
Chicago: 663 coins, at least 25072km from the goal
```And for you, **Azure Wolves**:
```
Tokyo: 5562 coins, at least 14801km from the goal
```Finally, **Crimson Stallions**:
```
Juneau: 1241 coins, at least 21292km from the goal
Tokyo: 7536 coins, at least 14801km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (105,'2019-08-28 00:50:00.885215',17,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (106,'2019-08-28 01:00:00.507018',18,'A new day has begun! Welcome to day **18**!
Here''s what''s happened since yesterday:
```
The Argent Boars have successfully reached Detroit!

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Chicago: 381 coins, at least 25072km from the goal
Kansas City: 1035 coins, at least 25041km from the goal
```And for you, **Azure Wolves**:
```
Tokyo: 5562 coins, at least 14801km from the goal
```Finally, **Crimson Stallions**:
```
Juneau: 1241 coins, at least 21292km from the goal
Tokyo: 7536 coins, at least 14801km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (107,'2019-08-28 01:50:00.427702',18,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (108,'2019-08-28 02:00:00.969988',19,'A new day has begun! Welcome to day **19**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Chicago: 381 coins, at least 25072km from the goal
Kansas City: 1035 coins, at least 25041km from the goal
```And for you, **Azure Wolves**:
```
Tokyo: 5562 coins, at least 14801km from the goal
```Finally, **Crimson Stallions**:
```
Juneau: 1241 coins, at least 21292km from the goal
Tokyo: 7536 coins, at least 14801km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (109,'2019-08-28 02:50:00.930090',19,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (110,'2019-08-28 03:00:00.516365',20,'A new day has begun! Welcome to day **20**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Chicago: 381 coins, at least 25072km from the goal
Kansas City: 1035 coins, at least 25041km from the goal
```And for you, **Azure Wolves**:
```
Tokyo: 5562 coins, at least 14801km from the goal
```Finally, **Crimson Stallions**:
```
Juneau: 1241 coins, at least 21292km from the goal
Tokyo: 7536 coins, at least 14801km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (111,'2019-08-28 03:50:00.460953',20,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (112,'2019-08-28 04:00:01.010839',21,'A new day has begun! Welcome to day **21**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Chicago: 381 coins, at least 25072km from the goal
Kansas City: 1035 coins, at least 25041km from the goal
```And for you, **Azure Wolves**:
```
Tokyo: 5562 coins, at least 14801km from the goal
```Finally, **Crimson Stallions**:
```
Juneau: 1241 coins, at least 21292km from the goal
Tokyo: 7536 coins, at least 14801km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (113,'2019-08-28 04:50:00.034396',21,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (114,'2019-08-28 05:00:00.574309',22,'A new day has begun! Welcome to day **22**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Chicago: 381 coins, at least 25072km from the goal
Kansas City: 1035 coins, at least 25041km from the goal
```And for you, **Azure Wolves**:
```
Tokyo: 5562 coins, at least 14801km from the goal
```Finally, **Crimson Stallions**:
```
Juneau: 1241 coins, at least 21292km from the goal
Tokyo: 7536 coins, at least 14801km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (115,'2019-08-28 05:50:00.905285',22,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (116,'2019-08-28 06:00:00.714386',23,'A new day has begun! Welcome to day **23**!
Here''s what''s happened since yesterday:
```
The Argent Boars have successfully reached Chicago!

The Azure Wolves tried to travel to Tokyo, but someone sabotaged them and they were stopped by the Black Cats!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Minneapolis: 580 coins, at least 24492km from the goal
Kansas City: 668 coins, at least 25041km from the goal
```And for you, **Azure Wolves**:
```
Tokyo: 5562 coins, at least 14801km from the goal
```Finally, **Crimson Stallions**:
```
Juneau: 1241 coins, at least 21292km from the goal
Tokyo: 7536 coins, at least 14801km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (117,'2019-08-28 06:50:00.998511',23,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (118,'2019-08-28 07:00:01.237413',24,'A new day has begun! Welcome to day **24**!
Here''s what''s happened since yesterday:
```
The Argent Boars have successfully reached Minneapolis!

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions have successfully reached Juneau!


```
**Argent Boars**, here are your destination options for today:
```
Winnipeg: 620 coins, at least 23872km from the goal
Denver: 1119 coins, at least 24137km from the goal
```And for you, **Azure Wolves**:
```
Tokyo: 5562 coins, at least 14801km from the goal
```Finally, **Crimson Stallions**:
```
Anchorage: 929 coins, at least 20363km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (119,'2019-08-28 07:50:00.592955',24,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (120,'2019-08-28 08:00:00.338093',1,'A new day has begun! Welcome to day **1**!
Here''s what''s happened since yesterday:
```
The race began! All teams are currently in London
```
**Argent Boars**, here are your destination options for today:
```
Winnipeg: 620 coins, at least 23872km from the goal
Denver: 1119 coins, at least 24137km from the goal
```And for you, **Azure Wolves**:
```
Tokyo: 5562 coins, at least 14801km from the goal
```Finally, **Crimson Stallions**:
```
Anchorage: 929 coins, at least 20363km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (121,'2019-08-28 08:43:10.271558',24,'Wait... was _I_ sabotaged? I can''t remember... is it day **24**?
It is, it''s day **24**! Wow, sorry travelers, I don''t know what came over me!
It''s fuzzy... but I think the **Argent Boars** are in Minneapolis, the **Azure Wolves** are still in anchorage, and the **Crimson Stallions** are up in Juneau',1,614336214786375682);
INSERT INTO "Log" VALUES (122,'2019-08-28 08:50:00.134425',25,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (123,'2019-08-28 09:00:01.162700',26,'A new day has begun! Welcome to day **26.0**!
Here''s what''s happened since yesterday:
```
The Argent Boars have successfully reached Winnipeg!

The Azure Wolves have successfully reached Tokyo!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Edmonton: 1190 coins, at least 22682km from the goal
Seattle: 1855 coins, at least 22497km from the goal
```And for you, **Azure Wolves**:
```
Seoul: 1161 coins, at least 13901km from the goal
Shanghai: 1766 coins, at least 13035km from the goal
Taipei: 2105 coins, at least 13159km from the goal
```Finally, **Crimson Stallions**:
```
Anchorage: 929 coins, at least 20363km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (124,'2019-08-28 09:50:00.911844',26,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (125,'2019-08-28 10:00:00.711662',27,'A new day has begun! Welcome to day **27**!
Here''s what''s happened since yesterday:
```
The Argent Boars tried to travel to Edmonton, but someone sabotaged them and they were stopped by the Black Cats!

The Azure Wolves have successfully reached Shanghai!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Edmonton: 1190 coins, at least 22682km from the goal
Seattle: 1855 coins, at least 22497km from the goal
```And for you, **Azure Wolves**:
```
Chongqing: 1413 coins, at least 11622km from the goal
```Finally, **Crimson Stallions**:
```
Anchorage: 929 coins, at least 20363km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (126,'2019-08-28 10:50:00.317046',27,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (127,'2019-08-28 11:00:01.254806',28,'A new day has begun! Welcome to day **28**!
Here''s what''s happened since yesterday:
```
The Argent Boars have successfully reached Edmonton!

The Azure Wolves have successfully reached Chongqing!

The Crimson Stallions have successfully reached Anchorage!


```
**Argent Boars**, here are your destination options for today:
```
Juneau: 1390 coins, at least 21292km from the goal
```And for you, **Azure Wolves**:
```
Hanoi: 948 coins, at least 11478km from the goal
Dhaka: 1752 coins, at least 9870km from the goal
```Finally, **Crimson Stallions**:
```
Tokyo: 5562 coins, at least 14801km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (128,'2019-08-28 11:50:00.919615',28,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (129,'2019-08-28 12:00:00.793804',29,'A new day has begun! Welcome to day **29**!
Here''s what''s happened since yesterday:
```
The Argent Boars have successfully reached Juneau!

The Azure Wolves have successfully reached Hanoi!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Anchorage: 929 coins, at least 20363km from the goal
```And for you, **Azure Wolves**:
```
Dhaka: 1608 coins, at least 9870km from the goal
```Finally, **Crimson Stallions**:
```
Tokyo: 5562 coins, at least 14801km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (130,'2019-08-28 12:50:00.443893',29,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (131,'2019-08-28 13:00:00.362752',30,'A new day has begun! Welcome to day **30**!
Here''s what''s happened since yesterday:
```
The Argent Boars tried to travel to Anchorage, but someone sabotaged them and they were stopped by the Black Cats!

The Azure Wolves tried to travel to Dhaka, but someone sabotaged them and they were stopped by the Black Cats!

The Crimson Stallions have successfully reached Tokyo!


```
**Argent Boars**, here are your destination options for today:
```
Anchorage: 929 coins, at least 20363km from the goal
```And for you, **Azure Wolves**:
```
Dhaka: 1608 coins, at least 9870km from the goal
```Finally, **Crimson Stallions**:
```
Seoul: 1161 coins, at least 13901km from the goal
Shanghai: 1766 coins, at least 13035km from the goal
Taipei: 2105 coins, at least 13159km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (132,'2019-08-28 13:50:00.000726',30,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (133,'2019-08-28 14:00:00.980760',31,'A new day has begun! Welcome to day **31**!
Here''s what''s happened since yesterday:
```
The Argent Boars have successfully reached Anchorage!

The Azure Wolves tried to travel to Dhaka, but someone sabotaged them and they were stopped by the Black Cats!

The Crimson Stallions have successfully reached Shanghai!


```
**Argent Boars**, here are your destination options for today:
```
Tokyo: 5562 coins, at least 14801km from the goal
```And for you, **Azure Wolves**:
```
Dhaka: 1608 coins, at least 9870km from the goal
```Finally, **Crimson Stallions**:
```
Chongqing: 1413 coins, at least 11622km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (134,'2019-08-28 14:50:00.633044',31,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (135,'2019-08-28 15:00:00.369290',32,'A new day has begun! Welcome to day **32**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves tried to travel to Dhaka, but someone sabotaged them and they were stopped by the Black Cats!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Tokyo: 5562 coins, at least 14801km from the goal
```And for you, **Azure Wolves**:
```
Dhaka: 1608 coins, at least 9870km from the goal
```Finally, **Crimson Stallions**:
```
Chongqing: 1413 coins, at least 11622km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (136,'2019-08-28 15:50:00.068552',32,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (137,'2019-08-28 16:00:00.978068',33,'A new day has begun! Welcome to day **33**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Dhaka!

The Crimson Stallions have successfully reached Chongqing!


```
**Argent Boars**, here are your destination options for today:
```
Tokyo: 5562 coins, at least 14801km from the goal
```And for you, **Azure Wolves**:
```
Kathmandu: 671 coins, at least 9575km from the goal
Mumbai: 1886 coins, at least 7984km from the goal
```Finally, **Crimson Stallions**:
```
Hanoi: 948 coins, at least 11478km from the goal
Dhaka: 1752 coins, at least 9870km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (138,'2019-08-28 16:50:00.614337',33,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (139,'2019-08-28 17:00:00.839372',34,'A new day has begun! Welcome to day **34**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves tried to travel to Mumbai, but someone sabotaged them and they were stopped by the Black Cats!

The Crimson Stallions have successfully reached Dhaka!


```
**Argent Boars**, here are your destination options for today:
```
Tokyo: 5562 coins, at least 14801km from the goal
```And for you, **Azure Wolves**:
```
Kathmandu: 671 coins, at least 9575km from the goal
Mumbai: 1886 coins, at least 7984km from the goal
```Finally, **Crimson Stallions**:
```
Kathmandu: 671 coins, at least 9575km from the goal
Mumbai: 1886 coins, at least 7984km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (140,'2019-08-28 17:50:00.694623',34,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (141,'2019-08-28 18:00:00.490274',35,'A new day has begun! Welcome to day **35**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Mumbai!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Tokyo: 5562 coins, at least 14801km from the goal
```And for you, **Azure Wolves**:
```
Dubai: 1938 coins, at least 6046km from the goal
```Finally, **Crimson Stallions**:
```
Kathmandu: 671 coins, at least 9575km from the goal
Mumbai: 1886 coins, at least 7984km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (142,'2019-08-28 18:50:00.114403',35,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (143,'2019-08-28 19:00:00.908233',36,'A new day has begun! Welcome to day **36**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions have successfully reached Mumbai!


```
**Argent Boars**, here are your destination options for today:
```
Tokyo: 5562 coins, at least 14801km from the goal
```And for you, **Azure Wolves**:
```
Dubai: 1938 coins, at least 6046km from the goal
```Finally, **Crimson Stallions**:
```
Dubai: 1938 coins, at least 6046km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (144,'2019-08-28 20:00:00.915683',37,'A new day has begun! Welcome to day **37**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions have successfully reached Dubai!


```
**Argent Boars**, here are your destination options for today:
```
Tokyo: 5562 coins, at least 14801km from the goal
```And for you, **Azure Wolves**:
```
Dubai: 1938 coins, at least 6046km from the goal
```Finally, **Crimson Stallions**:
```
Baghdad: 1388 coins, at least 4658km from the goal
Cairo: 2427 coins, at least 4192km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (145,'2019-08-28 20:50:00.572351',37,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (146,'2019-08-28 21:00:00.327296',38,'A new day has begun! Welcome to day **38**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Dubai!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Tokyo: 5562 coins, at least 14801km from the goal
```And for you, **Azure Wolves**:
```
Baghdad: 1388 coins, at least 4658km from the goal
Cairo: 2427 coins, at least 4192km from the goal
```Finally, **Crimson Stallions**:
```
Baghdad: 1388 coins, at least 4658km from the goal
Cairo: 2427 coins, at least 4192km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (147,'2019-08-28 21:50:00.913493',38,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (148,'2019-08-28 22:00:00.861320',39,'A new day has begun! Welcome to day **39**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Baghdad!

The Crimson Stallions have successfully reached Baghdad!


```
**Argent Boars**, here are your destination options for today:
```
Tokyo: 5562 coins, at least 14801km from the goal
```And for you, **Azure Wolves**:
```
Ankara: 1262 coins, at least 3396km from the goal
Beirut: 824 coins, at least 4223km from the goal
```Finally, **Crimson Stallions**:
```
Ankara: 1262 coins, at least 3396km from the goal
Beirut: 824 coins, at least 4223km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (149,'2019-08-28 22:50:00.487472',39,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (150,'2019-08-28 23:00:00.256580',40,'A new day has begun! Welcome to day **40**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves tried to travel to Ankara, but someone sabotaged them and they were stopped by the Black Cats!

The Crimson Stallions have successfully reached Ankara!


```
**Argent Boars**, here are your destination options for today:
```
Tokyo: 5562 coins, at least 14801km from the goal
```And for you, **Azure Wolves**:
```
Ankara: 1262 coins, at least 3396km from the goal
Beirut: 824 coins, at least 4223km from the goal
```Finally, **Crimson Stallions**:
```
Istanbul: 344 coins, at least 3052km from the goal
Izmir: 518 coins, at least 3370km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (151,'2019-08-28 23:50:00.922822',40,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (152,'2019-08-29 00:00:00.916546',41,'A new day has begun! Welcome to day **41**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves tried to travel to Ankara, but someone sabotaged them and they were stopped by the Black Cats!

The Crimson Stallions have successfully reached Istanbul!


```
**Argent Boars**, here are your destination options for today:
```
Tokyo: 5562 coins, at least 14801km from the goal
```And for you, **Azure Wolves**:
```
Ankara: 1262 coins, at least 3396km from the goal
Beirut: 824 coins, at least 4223km from the goal
```Finally, **Crimson Stallions**:
```
Sofia: 503 coins, at least 2599km from the goal
Bucharest: 441 coins, at least 2611km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (153,'2019-08-29 00:50:00.605542',41,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (154,'2019-08-29 01:00:00.579893',42,'A new day has begun! Welcome to day **42**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Beirut!

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Tokyo: 5562 coins, at least 14801km from the goal
```And for you, **Azure Wolves**:
```
Izmir: 904 coins, at least 3370km from the goal
Athens: 1151 coins, at least 3072km from the goal
```Finally, **Crimson Stallions**:
```
Sofia: 503 coins, at least 2599km from the goal
Bucharest: 441 coins, at least 2611km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (155,'2019-08-29 01:50:00.236665',42,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (156,'2019-08-29 02:00:00.402768',43,'A new day has begun! Welcome to day **43**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Tokyo: 5562 coins, at least 14801km from the goal
```And for you, **Azure Wolves**:
```
Izmir: 904 coins, at least 3370km from the goal
Athens: 1151 coins, at least 3072km from the goal
```Finally, **Crimson Stallions**:
```
Sofia: 503 coins, at least 2599km from the goal
Bucharest: 441 coins, at least 2611km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (157,'2019-08-29 02:50:00.205839',43,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (158,'2019-08-29 03:00:01.235218',44,'A new day has begun! Welcome to day **44**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Tokyo: 5562 coins, at least 14801km from the goal
```And for you, **Azure Wolves**:
```
Izmir: 904 coins, at least 3370km from the goal
Athens: 1151 coins, at least 3072km from the goal
```Finally, **Crimson Stallions**:
```
Sofia: 503 coins, at least 2599km from the goal
Bucharest: 441 coins, at least 2611km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (159,'2019-08-29 03:50:00.176768',44,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (160,'2019-08-29 04:00:00.262802',45,'A new day has begun! Welcome to day **45**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves didn''t raise enough to book passage anywhere...

The Crimson Stallions didn''t raise enough to book passage anywhere...


```
**Argent Boars**, here are your destination options for today:
```
Tokyo: 5562 coins, at least 14801km from the goal
```And for you, **Azure Wolves**:
```
Izmir: 904 coins, at least 3370km from the goal
Athens: 1151 coins, at least 3072km from the goal
```Finally, **Crimson Stallions**:
```
Sofia: 503 coins, at least 2599km from the goal
Bucharest: 441 coins, at least 2611km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (161,'2019-08-29 04:50:00.002238',45,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (162,'2019-08-29 05:00:01.331350',46,'A new day has begun! Welcome to day **46**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Izmir!

The Crimson Stallions tried to travel to Sofia, but someone sabotaged them and they were stopped by the Black Cats!


```
**Argent Boars**, here are your destination options for today:
```
Tokyo: 5562 coins, at least 14801km from the goal
```And for you, **Azure Wolves**:
```
Athens: 298 coins, at least 3072km from the goal
Catania: 1060 coins, at least 2772km from the goal
Tunis: 1504 coins, at least 2895km from the goal
```Finally, **Crimson Stallions**:
```
Sofia: 503 coins, at least 2599km from the goal
Bucharest: 441 coins, at least 2611km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (163,'2019-08-29 05:50:00.063332',46,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (164,'2019-08-29 06:00:01.347958',47,'A new day has begun! Welcome to day **47**!
Here''s what''s happened since yesterday:
```
The Argent Boars have successfully reached Tokyo!

The Azure Wolves have successfully reached Tunis!

The Crimson Stallions tried to travel to Sofia, but someone sabotaged them and they were stopped by the Black Cats!


```
**Argent Boars**, here are your destination options for today:
```
Seoul: 1161 coins, at least 13901km from the goal
Shanghai: 1766 coins, at least 13035km from the goal
Taipei: 2105 coins, at least 13159km from the goal
```And for you, **Azure Wolves**:
```
Rome: 603 coins, at least 2292km from the goal
Valencia: 971 coins, at least 2633km from the goal
```Finally, **Crimson Stallions**:
```
Sofia: 503 coins, at least 2599km from the goal
Bucharest: 441 coins, at least 2611km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (165,'2019-08-29 06:50:00.104248',47,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (166,'2019-08-29 07:00:01.417271',48,'A new day has begun! Welcome to day **48**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves tried to travel to Rome, but someone sabotaged them and they were stopped by the Black Cats!

The Crimson Stallions have successfully reached Bucharest!


```
**Argent Boars**, here are your destination options for today:
```
Seoul: 1161 coins, at least 13901km from the goal
Shanghai: 1766 coins, at least 13035km from the goal
Taipei: 2105 coins, at least 13159km from the goal
```And for you, **Azure Wolves**:
```
Rome: 603 coins, at least 2292km from the goal
Valencia: 971 coins, at least 2633km from the goal
```Finally, **Crimson Stallions**:
```
Sarajevo: 616 coins, at least 2280km from the goal
Budapest: 641 coins, at least 1970km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (167,'2019-08-29 07:50:00.144951',48,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (168,'2019-08-29 08:00:00.398753',49,'A new day has begun! Welcome to day **49**!
Here''s what''s happened since yesterday:
```
The Argent Boars have successfully reached Shanghai!

The Azure Wolves have successfully reached Rome!

The Crimson Stallions tried to travel to Budapest, but someone sabotaged them and they were stopped by the Black Cats!


```
**Argent Boars**, here are your destination options for today:
```
Chongqing: 1413 coins, at least 11622km from the goal
```And for you, **Azure Wolves**:
```
Barcelona: 860 coins, at least 2334km from the goal
Monaco: 462 coins, at least 1830km from the goal
```Finally, **Crimson Stallions**:
```
Sarajevo: 616 coins, at least 2280km from the goal
Budapest: 641 coins, at least 1970km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (169,'2019-08-29 08:50:00.055987',49,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (170,'2019-08-29 09:00:01.422773',50,'A new day has begun! Welcome to day **50**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves tried to travel to Monaco, but someone sabotaged them and they were stopped by the Black Cats!

The Crimson Stallions have successfully reached Budapest!


```
**Argent Boars**, here are your destination options for today:
```
Chongqing: 1413 coins, at least 11622km from the goal
```And for you, **Azure Wolves**:
```
Barcelona: 860 coins, at least 2334km from the goal
Monaco: 462 coins, at least 1830km from the goal
```Finally, **Crimson Stallions**:
```
Vienna: 214 coins, at least 1776km from the goal
Prague: 443 coins, at least 1527km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (171,'2019-08-29 09:50:00.272783',50,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (172,'2019-08-29 10:00:00.773660',51,'A new day has begun! Welcome to day **51**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Monaco!

The Crimson Stallions have successfully reached Prague!


```
**Argent Boars**, here are your destination options for today:
```
Chongqing: 1413 coins, at least 11622km from the goal
```And for you, **Azure Wolves**:
```
Zurich: 412 coins, at least 1418km from the goal
Paris: 688 coins, at least 1181km from the goal
```Finally, **Crimson Stallions**:
```
Berlin: 281 coins, at least 1446km from the goal
Frankfurt: 410 coins, at least 1117km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (173,'2019-08-29 10:50:00.692045',51,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (174,'2019-08-29 11:00:01.244711',52,'A new day has begun! Welcome to day **52**!
Here''s what''s happened since yesterday:
```
The Argent Boars have successfully reached Chongqing!

The Azure Wolves tried to travel to Paris, but someone sabotaged them and they were stopped by the Black Cats!

The Crimson Stallions have successfully reached Frankfurt!


```
**Argent Boars**, here are your destination options for today:
```
Hanoi: 948 coins, at least 11478km from the goal
Dhaka: 1752 coins, at least 9870km from the goal
```And for you, **Azure Wolves**:
```
Zurich: 412 coins, at least 1418km from the goal
Paris: 688 coins, at least 1181km from the goal
```Finally, **Crimson Stallions**:
```
Brussels: 318 coins, at least 926km from the goal
Amsterdam: 364 coins, at least 753km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (175,'2019-08-29 11:50:00.226805',52,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (176,'2019-08-29 12:00:01.553828',53,'A new day has begun! Welcome to day **53**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Paris!

The Crimson Stallions have successfully reached Amsterdam!


```
**Argent Boars**, here are your destination options for today:
```
Hanoi: 948 coins, at least 11478km from the goal
Dhaka: 1752 coins, at least 9870km from the goal
```And for you, **Azure Wolves**:
```
Brussels: 263 coins, at least 926km from the goal
Amsterdam: 428 coins, at least 753km from the goal
```Finally, **Crimson Stallions**:
```
Manchester: 493 coins, at least 260km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (177,'2019-08-29 12:50:00.392189',53,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (178,'2019-08-29 13:00:00.521230',54,'A new day has begun! Welcome to day **54**!
Here''s what''s happened since yesterday:
```
The Argent Boars didn''t raise enough to book passage anywhere...

The Azure Wolves have successfully reached Amsterdam!

The Crimson Stallions tried to travel to Manchester, but someone sabotaged them and they were stopped by the Black Cats!


```
**Argent Boars**, here are your destination options for today:
```
Hanoi: 948 coins, at least 11478km from the goal
Dhaka: 1752 coins, at least 9870km from the goal
```And for you, **Azure Wolves**:
```
Manchester: 493 coins, at least 260km from the goal
```Finally, **Crimson Stallions**:
```
Manchester: 493 coins, at least 260km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (179,'2019-08-29 13:50:00.265588',54,'10 minutes remaining in the day! Get those payments in!!!',1,614336214786375682);
INSERT INTO "Log" VALUES (180,'2019-08-29 14:00:01.016398',55,'A new day has begun! Welcome to day **55**!
Here''s what''s happened since yesterday:
```
The Argent Boars have successfully reached Dhaka!

The Azure Wolves tried to travel to Manchester, but someone sabotaged them and they were stopped by the Black Cats!

The Crimson Stallions have successfully reached Manchester!


```
**Argent Boars**, here are your destination options for today:
```
Kathmandu: 671 coins, at least 9575km from the goal
Mumbai: 1886 coins, at least 7984km from the goal
```And for you, **Azure Wolves**:
```
Manchester: 493 coins, at least 260km from the goal
```Finally, **Crimson Stallions**:
```
London: 260 coins, at least 0km from the goal
```You''ve all already received your salaries and refunds, so get booking and good luck!',1,614336214786375682);
INSERT INTO "Log" VALUES (181,'2019-08-29 14:50:00.706028',55,'10 minutes remaining in the day! Get those payments in!!!',0,614336214786375682);
INSERT INTO "Payment" VALUES (1,1,3,3,1,-1);
INSERT INTO "Payment" VALUES (2,1,3,3,2,-1);
INSERT INTO "Payment" VALUES (3,1,3,5,1,-1);
INSERT INTO "Payment" VALUES (4,1,2,-5,1,-1);
INSERT INTO "Payment" VALUES (5,1,2,-5,1,-1);
INSERT INTO "Payment" VALUES (6,1,2,-5,1,-1);
INSERT INTO "Payment" VALUES (7,2,2,50,1,-1);
INSERT INTO "Payment" VALUES (8,3,2,10,1,-1);
INSERT INTO "Payment" VALUES (9,3,2,30,2,-1);
INSERT INTO "Payment" VALUES (10,3,2,1200,2,-1);
INSERT INTO "Payment" VALUES (11,2,3,-400,1,-1);
INSERT INTO "Payment" VALUES (12,2,2,533,193,-1);
INSERT INTO "Payment" VALUES (13,3,2,3,1,-1);
INSERT INTO "Payment" VALUES (14,3,3,-20,1,-1);
INSERT INTO "Payment" VALUES (15,8,2,462,1,-1);
INSERT INTO "Payment" VALUES (16,7,2,1495,6,-1);
INSERT INTO "Payment" VALUES (17,6,1,2000,3,-1);
INSERT INTO "Payment" VALUES (18,6,2,-4200,15,-1);
INSERT INTO "Payment" VALUES (19,5,2,1200,2,1);
INSERT INTO "Payment" VALUES (20,10,2,57,2,1);
INSERT INTO "Payment" VALUES (21,7,3,462,1,1);
INSERT INTO "Payment" VALUES (22,8,2,505,7,2);
INSERT INTO "Payment" VALUES (23,7,3,1641,5,3);
INSERT INTO "Payment" VALUES (24,6,2,-6200,10,3);
INSERT INTO "Payment" VALUES (25,12,2,-200,10,3);
INSERT INTO "Payment" VALUES (26,6,1,1500,1,4);
INSERT INTO "Payment" VALUES (27,5,2,1832,9,4);
INSERT INTO "Payment" VALUES (28,10,2,1071,9,4);
INSERT INTO "Payment" VALUES (29,8,2,2527,9,4);
INSERT INTO "Payment" VALUES (30,10,1,-200,1,4);
INSERT INTO "Payment" VALUES (31,12,3,500,10,4);
INSERT INTO "Payment" VALUES (32,8,2,500,19,5);
INSERT INTO "Payment" VALUES (33,5,2,500,19,5);
INSERT INTO "Payment" VALUES (34,12,3,500,10,5);
INSERT INTO "Payment" VALUES (35,5,2,1,41,6);
INSERT INTO "Payment" VALUES (36,5,2,332,41,6);
INSERT INTO "Payment" VALUES (37,4,3,4000,10,6);
INSERT INTO "Payment" VALUES (38,4,3,32,10,6);
INSERT INTO "Payment" VALUES (39,7,3,1929,10,6);
INSERT INTO "Payment" VALUES (40,12,3,1000,10,6);
INSERT INTO "Payment" VALUES (41,10,2,1,41,6);
INSERT INTO "Payment" VALUES (42,10,2,332,41,6);
INSERT INTO "Payment" VALUES (43,11,1,-1453,4,6);
INSERT INTO "Payment" VALUES (44,10,1,-371,5,6);
INSERT INTO "Payment" VALUES (45,11,3,-747,38,7);
INSERT INTO "Payment" VALUES (46,10,2,381,46,7);
INSERT INTO "Payment" VALUES (47,10,3,-250,38,7);
INSERT INTO "Payment" VALUES (48,10,3,-100,38,7);
INSERT INTO "Payment" VALUES (49,8,2,103,46,7);
INSERT INTO "Payment" VALUES (50,8,3,-100,37,7);
INSERT INTO "Payment" VALUES (51,12,3,1000,38,8);
INSERT INTO "Payment" VALUES (52,10,2,688,59,8);
INSERT INTO "Payment" VALUES (53,8,2,668,59,8);
INSERT INTO "Payment" VALUES (54,8,1,-2,4,8);
INSERT INTO "Payment" VALUES (55,8,1,-2,5,8);
INSERT INTO "Payment" VALUES (56,10,3,-3,38,8);
INSERT INTO "Payment" VALUES (57,8,1,-2,6,8);
INSERT INTO "Payment" VALUES (58,10,3,-3,37,8);
INSERT INTO "Payment" VALUES (59,8,3,-2,37,8);
INSERT INTO "Payment" VALUES (60,8,3,-2,38,8);
INSERT INTO "Payment" VALUES (61,8,2,1119,65,9);
INSERT INTO "Payment" VALUES (62,5,2,200,65,9);
INSERT INTO "Payment" VALUES (63,5,3,-1000,45,9);
INSERT INTO "Payment" VALUES (64,12,3,750,44,9);
INSERT INTO "Payment" VALUES (65,5,2,967,71,10);
INSERT INTO "Payment" VALUES (66,13,1,1200,6,10);
INSERT INTO "Payment" VALUES (67,8,2,500,71,10);
INSERT INTO "Payment" VALUES (68,10,2,173,71,10);
INSERT INTO "Payment" VALUES (69,7,3,990,48,11);
INSERT INTO "Payment" VALUES (70,7,2,-1,85,11);
INSERT INTO "Payment" VALUES (71,13,1,1600,6,11);
INSERT INTO "Payment" VALUES (72,5,2,300,85,11);
INSERT INTO "Payment" VALUES (73,5,2,700,88,12);
INSERT INTO "Payment" VALUES (74,8,2,800,88,12);
INSERT INTO "Payment" VALUES (75,13,2,-500,87,12);
INSERT INTO "Payment" VALUES (76,7,3,1070,73,12);
INSERT INTO "Payment" VALUES (77,7,2,-100,88,12);
INSERT INTO "Payment" VALUES (78,5,2,500,78,13);
INSERT INTO "Payment" VALUES (79,7,3,1001,69,13);
INSERT INTO "Payment" VALUES (80,8,2,500,78,13);
INSERT INTO "Payment" VALUES (81,11,1,-100,15,13);
INSERT INTO "Payment" VALUES (82,11,1,-100,16,13);
INSERT INTO "Payment" VALUES (83,11,3,-100,71,13);
INSERT INTO "Payment" VALUES (84,11,3,-100,70,13);
INSERT INTO "Payment" VALUES (85,11,3,-100,69,13);
INSERT INTO "Payment" VALUES (86,11,2,500,78,13);
INSERT INTO "Payment" VALUES (87,7,2,-100,78,13);
INSERT INTO "Payment" VALUES (88,6,1,14500,15,13);
INSERT INTO "Payment" VALUES (89,14,1,200,19,14);
INSERT INTO "Payment" VALUES (90,5,2,200,91,14);
INSERT INTO "Payment" VALUES (91,24,2,200,91,14);
INSERT INTO "Payment" VALUES (92,25,1,200,19,14);
INSERT INTO "Payment" VALUES (93,19,2,400,91,14);
INSERT INTO "Payment" VALUES (94,22,2,300,91,14);
INSERT INTO "Payment" VALUES (95,11,1,-100,20,14);
INSERT INTO "Payment" VALUES (96,11,1,-100,19,14);
INSERT INTO "Payment" VALUES (97,6,2,-285,91,14);
INSERT INTO "Payment" VALUES (98,17,1,100,19,14);
INSERT INTO "Payment" VALUES (99,21,1,8,19,14);
INSERT INTO "Payment" VALUES (100,7,3,1273,71,14);
INSERT INTO "Payment" VALUES (101,16,3,485,71,14);
INSERT INTO "Payment" VALUES (102,28,2,-200,91,14);
INSERT INTO "Payment" VALUES (103,14,2,-100,91,14);
INSERT INTO "Payment" VALUES (104,14,1,100,19,14);
INSERT INTO "Payment" VALUES (105,11,3,-100,70,14);
INSERT INTO "Payment" VALUES (106,11,3,-100,69,14);
INSERT INTO "Payment" VALUES (107,11,3,-100,71,14);
INSERT INTO "Payment" VALUES (108,14,1,100,42,15);
INSERT INTO "Payment" VALUES (109,16,3,285,85,15);
INSERT INTO "Payment" VALUES (110,6,2,-250,91,15);
INSERT INTO "Payment" VALUES (111,14,1,560,42,16);
INSERT INTO "Payment" VALUES (112,6,1,250,41,16);
INSERT INTO "Payment" VALUES (113,6,1,333,41,17);
INSERT INTO "Payment" VALUES (114,22,2,1200,91,21);
INSERT INTO "Payment" VALUES (115,5,2,1750,91,22);
INSERT INTO "Payment" VALUES (116,10,2,3812,91,22);
INSERT INTO "Payment" VALUES (117,17,1,300,46,22);
INSERT INTO "Payment" VALUES (118,17,1,100,46,22);
INSERT INTO "Payment" VALUES (119,17,2,-1000,91,22);
INSERT INTO "Payment" VALUES (120,13,1,600,58,23);
INSERT INTO "Payment" VALUES (121,13,3,-29,87,23);
INSERT INTO "Payment" VALUES (122,14,3,-46,87,23);
INSERT INTO "Payment" VALUES (123,14,2,-100,91,23);
INSERT INTO "Payment" VALUES (124,14,1,200,58,23);
INSERT INTO "Payment" VALUES (125,12,3,1500,88,23);
INSERT INTO "Payment" VALUES (126,14,1,620,63,24);
INSERT INTO "Payment" VALUES (127,14,3,-42,78,24);
INSERT INTO "Payment" VALUES (128,7,3,1000,78,24);
INSERT INTO "Payment" VALUES (129,12,3,500,78,24);
INSERT INTO "Payment" VALUES (130,13,1,200,63,24);
INSERT INTO "Payment" VALUES (131,13,2,-1000,91,24);
INSERT INTO "Payment" VALUES (132,5,3,-200,78,24);
INSERT INTO "Payment" VALUES (133,8,3,-3,78,24);
INSERT INTO "Payment" VALUES (134,14,3,-100,78,24);
INSERT INTO "Payment" VALUES (135,8,2,2597,91,25);
INSERT INTO "Payment" VALUES (136,5,2,1712,91,25);
INSERT INTO "Payment" VALUES (137,26,2,2600,91,25);
INSERT INTO "Payment" VALUES (138,17,1,620,63,25);
INSERT INTO "Payment" VALUES (139,8,2,100,110,26);
INSERT INTO "Payment" VALUES (140,5,2,200,110,26);
INSERT INTO "Payment" VALUES (141,11,2,1600,110,26);
INSERT INTO "Payment" VALUES (142,8,1,-3,66,26);
INSERT INTO "Payment" VALUES (143,8,1,-3,67,26);
INSERT INTO "Payment" VALUES (144,8,3,-3,78,26);
INSERT INTO "Payment" VALUES (145,13,1,1300,66,26);
INSERT INTO "Payment" VALUES (146,13,2,-20,109,26);
INSERT INTO "Payment" VALUES (147,11,2,100,110,26);
INSERT INTO "Payment" VALUES (148,13,2,-20,110,26);
INSERT INTO "Payment" VALUES (149,13,2,-20,111,26);
INSERT INTO "Payment" VALUES (150,10,3,-234,78,26);
INSERT INTO "Payment" VALUES (151,10,1,-234,66,26);
INSERT INTO "Payment" VALUES (152,10,2,1413,116,27);
INSERT INTO "Payment" VALUES (153,10,2,100,116,27);
INSERT INTO "Payment" VALUES (154,8,2,150,116,27);
INSERT INTO "Payment" VALUES (155,5,2,200,116,27);
INSERT INTO "Payment" VALUES (156,11,2,300,116,27);
INSERT INTO "Payment" VALUES (157,12,3,1000,78,27);
INSERT INTO "Payment" VALUES (158,13,1,1500,66,27);
INSERT INTO "Payment" VALUES (159,13,2,-400,116,27);
INSERT INTO "Payment" VALUES (160,17,1,664,68,28);
INSERT INTO "Payment" VALUES (161,6,1,2630,68,28);
INSERT INTO "Payment" VALUES (162,8,1,-3,68,28);
INSERT INTO "Payment" VALUES (163,8,3,-3,91,28);
INSERT INTO "Payment" VALUES (164,11,3,-500,91,28);
INSERT INTO "Payment" VALUES (165,13,2,-347,118,28);
INSERT INTO "Payment" VALUES (166,5,2,1,118,28);
INSERT INTO "Payment" VALUES (167,5,3,-199,91,28);
INSERT INTO "Payment" VALUES (168,11,2,1000,117,28);
INSERT INTO "Payment" VALUES (169,26,2,200,117,28);
INSERT INTO "Payment" VALUES (170,8,1,-3,78,29);
INSERT INTO "Payment" VALUES (171,8,3,-3,91,29);
INSERT INTO "Payment" VALUES (172,5,2,200,123,29);
INSERT INTO "Payment" VALUES (173,8,2,100,123,29);
INSERT INTO "Payment" VALUES (174,26,2,600,123,29);
INSERT INTO "Payment" VALUES (175,16,3,3990,91,29);
INSERT INTO "Payment" VALUES (176,12,3,3000,91,29);
INSERT INTO "Payment" VALUES (177,8,2,400,123,29);
INSERT INTO "Payment" VALUES (178,12,1,-500,78,29);
INSERT INTO "Payment" VALUES (179,17,1,375,78,29);
INSERT INTO "Payment" VALUES (180,13,1,600,78,29);
INSERT INTO "Payment" VALUES (181,13,2,-500,123,29);
INSERT INTO "Payment" VALUES (182,6,2,-222,123,29);
INSERT INTO "Payment" VALUES (183,11,2,500,123,29);
INSERT INTO "Payment" VALUES (184,13,1,21,78,29);
INSERT INTO "Payment" VALUES (185,11,2,200,123,30);
INSERT INTO "Payment" VALUES (186,13,1,500,78,30);
INSERT INTO "Payment" VALUES (187,13,2,-188,123,30);
INSERT INTO "Payment" VALUES (188,10,2,1600,123,30);
INSERT INTO "Payment" VALUES (189,6,2,-222,123,30);
INSERT INTO "Payment" VALUES (190,7,3,2000,110,30);
INSERT INTO "Payment" VALUES (191,30,3,-200,110,30);
INSERT INTO "Payment" VALUES (192,14,1,500,78,30);
INSERT INTO "Payment" VALUES (193,14,2,-432,123,30);
INSERT INTO "Payment" VALUES (194,14,2,-400,123,30);
INSERT INTO "Payment" VALUES (195,8,2,785,123,31);
INSERT INTO "Payment" VALUES (196,11,2,1206,123,31);
INSERT INTO "Payment" VALUES (197,11,2,200,123,31);
INSERT INTO "Payment" VALUES (198,5,2,531,123,31);
INSERT INTO "Payment" VALUES (199,12,3,630,116,31);
INSERT INTO "Payment" VALUES (200,16,3,570,116,31);
INSERT INTO "Payment" VALUES (201,14,2,-300,123,31);
INSERT INTO "Payment" VALUES (202,27,2,300,123,31);
INSERT INTO "Payment" VALUES (203,14,2,-422,123,31);
INSERT INTO "Payment" VALUES (204,6,2,-200,123,31);
INSERT INTO "Payment" VALUES (205,14,2,-100,123,31);
INSERT INTO "Payment" VALUES (206,14,2,-400,123,31);
INSERT INTO "Payment" VALUES (207,27,2,1000,123,32);
INSERT INTO "Payment" VALUES (208,11,2,1220,123,32);
INSERT INTO "Payment" VALUES (209,8,2,754,123,32);
INSERT INTO "Payment" VALUES (210,5,2,564,123,32);
INSERT INTO "Payment" VALUES (211,4,3,1200,116,32);
INSERT INTO "Payment" VALUES (212,31,2,366,123,32);
INSERT INTO "Payment" VALUES (213,10,2,366,123,32);
INSERT INTO "Payment" VALUES (214,12,3,500,116,32);
INSERT INTO "Payment" VALUES (215,10,2,1000,123,32);
INSERT INTO "Payment" VALUES (216,4,2,-3000,123,32);
INSERT INTO "Payment" VALUES (217,12,2,-257,123,32);
INSERT INTO "Payment" VALUES (218,10,2,1886,125,33);
INSERT INTO "Payment" VALUES (219,10,2,200,125,33);
INSERT INTO "Payment" VALUES (220,5,2,166,125,33);
INSERT INTO "Payment" VALUES (221,8,2,166,125,33);
INSERT INTO "Payment" VALUES (222,27,2,300,125,33);
INSERT INTO "Payment" VALUES (223,4,3,1752,118,33);
INSERT INTO "Payment" VALUES (224,4,2,-1500,125,33);
INSERT INTO "Payment" VALUES (225,7,3,200,118,33);
INSERT INTO "Payment" VALUES (226,5,2,290,125,34);
INSERT INTO "Payment" VALUES (227,8,2,290,125,34);
INSERT INTO "Payment" VALUES (228,26,2,1329,125,34);
INSERT INTO "Payment" VALUES (229,10,2,605,125,34);
INSERT INTO "Payment" VALUES (230,10,3,-627,125,34);
INSERT INTO "Payment" VALUES (231,16,3,1567,125,35);
INSERT INTO "Payment" VALUES (232,12,3,855,125,35);
INSERT INTO "Payment" VALUES (233,7,3,2200,127,36);
INSERT INTO "Payment" VALUES (234,27,2,2000,127,37);
INSERT INTO "Payment" VALUES (235,7,3,1440,129,38);
INSERT INTO "Payment" VALUES (236,8,2,664,128,38);
INSERT INTO "Payment" VALUES (237,27,2,1500,129,38);
INSERT INTO "Payment" VALUES (238,11,2,1162,130,39);
INSERT INTO "Payment" VALUES (239,8,2,138,130,39);
INSERT INTO "Payment" VALUES (240,4,3,1260,130,39);
INSERT INTO "Payment" VALUES (241,4,3,2,130,39);
INSERT INTO "Payment" VALUES (242,7,3,200,130,39);
INSERT INTO "Payment" VALUES (243,7,2,-85,130,39);
INSERT INTO "Payment" VALUES (244,4,2,-2000,130,39);
INSERT INTO "Payment" VALUES (245,8,2,20,130,39);
INSERT INTO "Payment" VALUES (246,8,2,790,130,40);
INSERT INTO "Payment" VALUES (247,11,2,800,130,40);
INSERT INTO "Payment" VALUES (248,16,3,1425,132,40);
INSERT INTO "Payment" VALUES (249,4,2,-400,130,40);
INSERT INTO "Payment" VALUES (250,11,2,1,131,41);
INSERT INTO "Payment" VALUES (251,11,2,850,131,41);
INSERT INTO "Payment" VALUES (252,5,3,-700,134,42);
INSERT INTO "Payment" VALUES (253,5,3,-628,135,42);
INSERT INTO "Payment" VALUES (254,22,2,5000,157,45);
INSERT INTO "Payment" VALUES (255,5,3,-498,134,45);
INSERT INTO "Payment" VALUES (256,12,3,550,134,45);
INSERT INTO "Payment" VALUES (257,12,3,550,134,46);
INSERT INTO "Payment" VALUES (258,10,2,1800,138,46);
INSERT INTO "Payment" VALUES (259,10,3,-400,134,46);
INSERT INTO "Payment" VALUES (260,10,3,-300,135,46);
INSERT INTO "Payment" VALUES (261,22,2,300,138,46);
INSERT INTO "Payment" VALUES (262,17,1,4879,91,46);
INSERT INTO "Payment" VALUES (263,13,1,2000,91,46);
INSERT INTO "Payment" VALUES (264,13,2,-1330,137,46);
INSERT INTO "Payment" VALUES (265,12,2,-1100,152,47);
INSERT INTO "Payment" VALUES (266,22,2,762,152,47);
INSERT INTO "Payment" VALUES (267,12,3,500,135,47);
INSERT INTO "Payment" VALUES (268,5,2,332,152,47);
INSERT INTO "Payment" VALUES (269,27,2,300,152,47);
INSERT INTO "Payment" VALUES (270,32,3,50,135,47);
INSERT INTO "Payment" VALUES (271,22,2,737,152,48);
INSERT INTO "Payment" VALUES (272,14,1,1766,110,48);
INSERT INTO "Payment" VALUES (273,10,2,351,152,48);
INSERT INTO "Payment" VALUES (274,5,3,-415,162,48);
INSERT INTO "Payment" VALUES (275,27,2,1000,152,48);
INSERT INTO "Payment" VALUES (276,32,2,-200,152,48);
INSERT INTO "Payment" VALUES (277,8,2,200,152,48);
INSERT INTO "Payment" VALUES (278,8,3,-100,162,48);
INSERT INTO "Payment" VALUES (279,8,3,-100,161,48);
INSERT INTO "Payment" VALUES (280,7,3,700,162,48);
INSERT INTO "Payment" VALUES (281,32,3,50,162,48);
INSERT INTO "Payment" VALUES (282,32,2,-50,152,48);
INSERT INTO "Payment" VALUES (283,22,2,100,155,49);
INSERT INTO "Payment" VALUES (284,8,2,800,155,49);
INSERT INTO "Payment" VALUES (285,5,2,166,155,49);
INSERT INTO "Payment" VALUES (286,16,3,1000,162,49);
INSERT INTO "Payment" VALUES (287,16,2,-1000,155,49);
INSERT INTO "Payment" VALUES (288,8,2,100,155,49);
INSERT INTO "Payment" VALUES (289,8,2,1200,155,50);
INSERT INTO "Payment" VALUES (290,5,2,290,155,50);
INSERT INTO "Payment" VALUES (291,22,2,307,155,50);
INSERT INTO "Payment" VALUES (292,7,3,1000,164,50);
INSERT INTO "Payment" VALUES (293,11,2,1640,155,50);
INSERT INTO "Payment" VALUES (294,17,1,404,116,50);
INSERT INTO "Payment" VALUES (295,32,3,200,164,50);
INSERT INTO "Payment" VALUES (296,22,2,100,148,51);
INSERT INTO "Payment" VALUES (297,8,2,593,148,51);
INSERT INTO "Payment" VALUES (298,22,2,66,148,51);
INSERT INTO "Payment" VALUES (299,5,2,166,148,51);
INSERT INTO "Payment" VALUES (300,27,2,300,148,51);
INSERT INTO "Payment" VALUES (301,32,3,600,172,51);
INSERT INTO "Payment" VALUES (302,26,2,150,148,51);
INSERT INTO "Payment" VALUES (303,26,2,10,148,51);
INSERT INTO "Payment" VALUES (304,12,2,-750,148,51);
INSERT INTO "Payment" VALUES (305,12,2,-500,147,51);
INSERT INTO "Payment" VALUES (306,7,3,200,172,51);
INSERT INTO "Payment" VALUES (307,12,2,-500,147,51);
INSERT INTO "Payment" VALUES (308,12,2,-750,148,51);
INSERT INTO "Payment" VALUES (309,17,1,500,116,51);
INSERT INTO "Payment" VALUES (310,13,1,1000,116,51);
INSERT INTO "Payment" VALUES (311,13,1,100,116,51);
INSERT INTO "Payment" VALUES (312,13,2,-100,148,51);
INSERT INTO "Payment" VALUES (313,17,3,-100,171,51);
INSERT INTO "Payment" VALUES (314,17,3,-100,172,51);
INSERT INTO "Payment" VALUES (315,8,3,-3,175,52);
INSERT INTO "Payment" VALUES (316,8,3,-3,176,52);
INSERT INTO "Payment" VALUES (317,26,2,1200,148,52);
INSERT INTO "Payment" VALUES (318,8,2,604,148,52);
INSERT INTO "Payment" VALUES (319,5,2,290,148,52);
INSERT INTO "Payment" VALUES (320,22,2,290,148,52);
INSERT INTO "Payment" VALUES (321,16,3,400,176,52);
INSERT INTO "Payment" VALUES (322,8,2,166,186,53);
INSERT INTO "Payment" VALUES (323,16,3,500,188,53);
INSERT INTO "Payment" VALUES (324,26,2,600,186,53);
INSERT INTO "Payment" VALUES (325,26,3,-600,188,53);
INSERT INTO "Payment" VALUES (326,32,3,587,188,53);
INSERT INTO "Payment" VALUES (327,12,3,544,188,53);
INSERT INTO "Payment" VALUES (328,5,3,-166,188,53);
INSERT INTO "Payment" VALUES (329,22,2,100,186,53);
INSERT INTO "Payment" VALUES (330,26,3,-400,188,53);
INSERT INTO "Payment" VALUES (331,26,2,100,186,53);
INSERT INTO "Payment" VALUES (332,27,2,500,186,53);
INSERT INTO "Payment" VALUES (333,26,2,367,188,54);
INSERT INTO "Payment" VALUES (334,8,2,153,188,54);
INSERT INTO "Payment" VALUES (335,5,2,153,188,54);
INSERT INTO "Payment" VALUES (336,27,2,586,188,54);
INSERT INTO "Payment" VALUES (337,7,3,1500,188,54);
INSERT INTO "Payment" VALUES (338,32,3,662,188,54);
INSERT INTO "Payment" VALUES (339,12,3,630,188,54);
INSERT INTO "Payment" VALUES (340,22,2,219,188,54);
INSERT INTO "Payment" VALUES (341,6,1,2400,118,54);
INSERT INTO "Payment" VALUES (342,6,2,-1500,188,54);
INSERT INTO "Payment" VALUES (343,16,2,-1000,188,54);
INSERT INTO "Payment" VALUES (344,7,3,1349,194,55);
INSERT INTO "Payment" VALUES (345,8,2,267,188,55);
INSERT INTO "Payment" VALUES (346,17,1,1000,125,55);
INSERT INTO "Payment" VALUES (347,6,1,1206,125,55);
INSERT INTO "Payment" VALUES (348,13,1,800,125,55);
INSERT INTO "Payment" VALUES (349,26,2,428,188,55);
INSERT INTO "Payment" VALUES (350,5,2,267,188,55);
INSERT INTO "Payment" VALUES (351,22,2,317,188,55);
INSERT INTO "Payment" VALUES (352,27,2,500,188,55);
INSERT INTO "Payment" VALUES (353,32,3,222,194,55);
INSERT INTO "Payment" VALUES (354,31,3,-3792,194,55);
INSERT INTO "Payment" VALUES (355,7,3,1233,194,56);
INSERT INTO "Payment" VALUES (356,8,2,153,194,56);
INSERT INTO "Payment" VALUES (357,5,2,153,194,56);
INSERT INTO "Payment" VALUES (358,26,2,153,194,56);
INSERT INTO "Payment" VALUES (359,27,2,945,194,56);
INSERT INTO "Payment" VALUES (360,16,3,636,194,56);
INSERT INTO "Payment" VALUES (361,4,3,4000,194,56);
INSERT INTO "Payment" VALUES (362,4,3,242,194,56);
INSERT INTO "Payment" VALUES (363,13,2,-376,194,56);
INSERT INTO "Payment" VALUES (364,36,2,-200,194,56);
INSERT INTO "Payment" VALUES (365,6,2,-400,194,56);
INSERT INTO "Payment" VALUES (366,17,2,-353,194,56);
INSERT INTO "Payment" VALUES (367,11,2,963,194,56);
INSERT INTO "Payment" VALUES (368,31,3,-153,194,56);
INSERT INTO "Payment" VALUES (369,12,3,444,194,57);
INSERT INTO "Payment" VALUES (370,22,2,100,194,57);
INSERT INTO "LocationEdge" VALUES (1,1,2,462);
INSERT INTO "LocationEdge" VALUES (2,1,3,1257);
INSERT INTO "LocationEdge" VALUES (3,1,4,1582);
INSERT INTO "LocationEdge" VALUES (4,2,3,1453);
INSERT INTO "LocationEdge" VALUES (5,2,4,1641);
INSERT INTO "LocationEdge" VALUES (6,2,6,1495);
INSERT INTO "LocationEdge" VALUES (7,3,4,505);
INSERT INTO "LocationEdge" VALUES (8,3,5,836);
INSERT INTO "LocationEdge" VALUES (9,4,8,5430);
INSERT INTO "LocationEdge" VALUES (10,4,15,6678);
INSERT INTO "LocationEdge" VALUES (11,4,12,6429);
INSERT INTO "LocationEdge" VALUES (12,5,15,6928);
INSERT INTO "LocationEdge" VALUES (13,5,12,6568);
INSERT INTO "LocationEdge" VALUES (14,5,13,6522);
INSERT INTO "LocationEdge" VALUES (15,6,8,4205);
INSERT INTO "LocationEdge" VALUES (16,6,7,3522);
INSERT INTO "LocationEdge" VALUES (17,7,9,378);
INSERT INTO "LocationEdge" VALUES (18,7,10,233);
INSERT INTO "LocationEdge" VALUES (19,8,17,508);
INSERT INTO "LocationEdge" VALUES (20,8,11,853);
INSERT INTO "LocationEdge" VALUES (21,9,26,1034);
INSERT INTO "LocationEdge" VALUES (22,9,19,679);
INSERT INTO "LocationEdge" VALUES (23,9,30,1671);
INSERT INTO "LocationEdge" VALUES (24,9,17,650);
INSERT INTO "LocationEdge" VALUES (25,10,9,169);
INSERT INTO "LocationEdge" VALUES (26,10,19,838);
INSERT INTO "LocationEdge" VALUES (27,10,17,773);
INSERT INTO "LocationEdge" VALUES (28,11,17,583);
INSERT INTO "LocationEdge" VALUES (29,11,18,839);
INSERT INTO "LocationEdge" VALUES (30,11,20,757);
INSERT INTO "LocationEdge" VALUES (31,12,21,1316);
INSERT INTO "LocationEdge" VALUES (32,12,14,1155);
INSERT INTO "LocationEdge" VALUES (33,13,21,1390);
INSERT INTO "LocationEdge" VALUES (34,13,16,2765);
INSERT INTO "LocationEdge" VALUES (35,14,27,1079);
INSERT INTO "LocationEdge" VALUES (36,14,23,1269);
INSERT INTO "LocationEdge" VALUES (37,15,11,1053);
INSERT INTO "LocationEdge" VALUES (38,15,18,976);
INSERT INTO "LocationEdge" VALUES (39,16,22,1938);
INSERT INTO "LocationEdge" VALUES (40,16,25,2466);
INSERT INTO "LocationEdge" VALUES (41,17,19,333);
INSERT INTO "LocationEdge" VALUES (42,17,26,663);
INSERT INTO "LocationEdge" VALUES (43,17,20,759);
INSERT INTO "LocationEdge" VALUES (44,18,20,344);
INSERT INTO "LocationEdge" VALUES (45,18,33,1156);
INSERT INTO "LocationEdge" VALUES (46,19,26,381);
INSERT INTO "LocationEdge" VALUES (47,19,29,1035);
INSERT INTO "LocationEdge" VALUES (48,20,33,990);
INSERT INTO "LocationEdge" VALUES (49,20,26,640);
INSERT INTO "LocationEdge" VALUES (50,20,29,761);
INSERT INTO "LocationEdge" VALUES (51,21,23,1343);
INSERT INTO "LocationEdge" VALUES (52,21,24,2408);
INSERT INTO "LocationEdge" VALUES (53,22,44,7709);
INSERT INTO "LocationEdge" VALUES (54,23,24,1043);
INSERT INTO "LocationEdge" VALUES (55,24,33,1507);
INSERT INTO "LocationEdge" VALUES (56,24,34,1563);
INSERT INTO "LocationEdge" VALUES (57,25,45,9670);
INSERT INTO "LocationEdge" VALUES (58,26,28,580);
INSERT INTO "LocationEdge" VALUES (59,26,29,668);
INSERT INTO "LocationEdge" VALUES (60,27,33,721);
INSERT INTO "LocationEdge" VALUES (61,27,29,1107);
INSERT INTO "LocationEdge" VALUES (62,28,32,1119);
INSERT INTO "LocationEdge" VALUES (63,28,30,620);
INSERT INTO "LocationEdge" VALUES (64,29,33,724);
INSERT INTO "LocationEdge" VALUES (65,29,32,904);
INSERT INTO "LocationEdge" VALUES (66,30,31,1190);
INSERT INTO "LocationEdge" VALUES (67,30,40,1855);
INSERT INTO "LocationEdge" VALUES (68,31,36,1390);
INSERT INTO "LocationEdge" VALUES (69,32,37,973);
INSERT INTO "LocationEdge" VALUES (70,32,35,944);
INSERT INTO "LocationEdge" VALUES (71,32,40,1640);
INSERT INTO "LocationEdge" VALUES (72,33,34,917);
INSERT INTO "LocationEdge" VALUES (73,33,32,1065);
INSERT INTO "LocationEdge" VALUES (74,34,35,556);
INSERT INTO "LocationEdge" VALUES (75,34,37,936);
INSERT INTO "LocationEdge" VALUES (76,35,42,569);
INSERT INTO "LocationEdge" VALUES (77,35,38,476);
INSERT INTO "LocationEdge" VALUES (78,36,43,929);
INSERT INTO "LocationEdge" VALUES (79,37,39,673);
INSERT INTO "LocationEdge" VALUES (80,37,38,430);
INSERT INTO "LocationEdge" VALUES (81,37,42,365);
INSERT INTO "LocationEdge" VALUES (82,38,44,4192);
INSERT INTO "LocationEdge" VALUES (83,39,54,8263);
INSERT INTO "LocationEdge" VALUES (84,39,40,1089);
INSERT INTO "LocationEdge" VALUES (85,40,41,196);
INSERT INTO "LocationEdge" VALUES (86,40,54,7696);
INSERT INTO "LocationEdge" VALUES (87,41,54,7536);
INSERT INTO "LocationEdge" VALUES (88,41,36,1241);
INSERT INTO "LocationEdge" VALUES (89,42,54,8819);
INSERT INTO "LocationEdge" VALUES (90,42,44,4133);
INSERT INTO "LocationEdge" VALUES (91,43,54,5562);
INSERT INTO "LocationEdge" VALUES (92,44,45,7081);
INSERT INTO "LocationEdge" VALUES (93,44,46,8170);
INSERT INTO "LocationEdge" VALUES (94,44,54,6199);
INSERT INTO "LocationEdge" VALUES (95,45,46,2155);
INSERT INTO "LocationEdge" VALUES (96,46,47,707);
INSERT INTO "LocationEdge" VALUES (97,46,49,3283);
INSERT INTO "LocationEdge" VALUES (98,46,48,1167);
INSERT INTO "LocationEdge" VALUES (99,47,48,648);
INSERT INTO "LocationEdge" VALUES (100,47,49,2709);
INSERT INTO "LocationEdge" VALUES (101,48,49,2146);
INSERT INTO "LocationEdge" VALUES (102,49,50,2994);
INSERT INTO "LocationEdge" VALUES (103,50,51,910);
INSERT INTO "LocationEdge" VALUES (104,51,53,1492);
INSERT INTO "LocationEdge" VALUES (105,51,52,2730);
INSERT INTO "LocationEdge" VALUES (106,52,64,1546);
INSERT INTO "LocationEdge" VALUES (107,53,62,1542);
INSERT INTO "LocationEdge" VALUES (108,53,61,978);
INSERT INTO "LocationEdge" VALUES (109,54,55,1161);
INSERT INTO "LocationEdge" VALUES (110,54,57,1766);
INSERT INTO "LocationEdge" VALUES (111,54,59,2105);
INSERT INTO "LocationEdge" VALUES (112,55,56,952);
INSERT INTO "LocationEdge" VALUES (113,55,57,866);
INSERT INTO "LocationEdge" VALUES (114,56,58,1448);
INSERT INTO "LocationEdge" VALUES (115,56,60,1967);
INSERT INTO "LocationEdge" VALUES (116,57,58,1413);
INSERT INTO "LocationEdge" VALUES (117,58,61,948);
INSERT INTO "LocationEdge" VALUES (118,58,62,1752);
INSERT INTO "LocationEdge" VALUES (119,59,60,811);
INSERT INTO "LocationEdge" VALUES (120,59,57,693);
INSERT INTO "LocationEdge" VALUES (121,60,61,870);
INSERT INTO "LocationEdge" VALUES (122,60,58,1062);
INSERT INTO "LocationEdge" VALUES (123,61,62,1608);
INSERT INTO "LocationEdge" VALUES (124,62,63,671);
INSERT INTO "LocationEdge" VALUES (125,62,64,1886);
INSERT INTO "LocationEdge" VALUES (126,63,64,1591);
INSERT INTO "LocationEdge" VALUES (127,64,65,1938);
INSERT INTO "LocationEdge" VALUES (128,65,70,2427);
INSERT INTO "LocationEdge" VALUES (129,65,66,1388);
INSERT INTO "LocationEdge" VALUES (130,66,67,1262);
INSERT INTO "LocationEdge" VALUES (131,66,77,824);
INSERT INTO "LocationEdge" VALUES (132,67,68,344);
INSERT INTO "LocationEdge" VALUES (133,67,69,518);
INSERT INTO "LocationEdge" VALUES (134,68,78,503);
INSERT INTO "LocationEdge" VALUES (135,68,79,441);
INSERT INTO "LocationEdge" VALUES (136,69,71,298);
INSERT INTO "LocationEdge" VALUES (137,69,72,1060);
INSERT INTO "LocationEdge" VALUES (138,69,74,1504);
INSERT INTO "LocationEdge" VALUES (139,70,71,1120);
INSERT INTO "LocationEdge" VALUES (140,70,72,1702);
INSERT INTO "LocationEdge" VALUES (141,71,78,524);
INSERT INTO "LocationEdge" VALUES (142,71,75,792);
INSERT INTO "LocationEdge" VALUES (143,71,76,1053);
INSERT INTO "LocationEdge" VALUES (144,72,73,380);
INSERT INTO "LocationEdge" VALUES (145,72,76,538);
INSERT INTO "LocationEdge" VALUES (146,72,95,942);
INSERT INTO "LocationEdge" VALUES (147,95,87,412);
INSERT INTO "LocationEdge" VALUES (148,95,88,688);
INSERT INTO "LocationEdge" VALUES (149,73,76,185);
INSERT INTO "LocationEdge" VALUES (150,73,95,648);
INSERT INTO "LocationEdge" VALUES (151,74,80,971);
INSERT INTO "LocationEdge" VALUES (152,74,76,603);
INSERT INTO "LocationEdge" VALUES (153,75,82,504);
INSERT INTO "LocationEdge" VALUES (154,75,96,413);
INSERT INTO "LocationEdge" VALUES (155,76,95,462);
INSERT INTO "LocationEdge" VALUES (156,76,81,860);
INSERT INTO "LocationEdge" VALUES (157,77,69,904);
INSERT INTO "LocationEdge" VALUES (158,77,71,1151);
INSERT INTO "LocationEdge" VALUES (159,78,75,419);
INSERT INTO "LocationEdge" VALUES (160,78,96,629);
INSERT INTO "LocationEdge" VALUES (161,79,75,616);
INSERT INTO "LocationEdge" VALUES (162,79,96,641);
INSERT INTO "LocationEdge" VALUES (163,96,82,214);
INSERT INTO "LocationEdge" VALUES (164,96,83,443);
INSERT INTO "LocationEdge" VALUES (165,80,95,803);
INSERT INTO "LocationEdge" VALUES (166,80,81,302);
INSERT INTO "LocationEdge" VALUES (167,81,95,504);
INSERT INTO "LocationEdge" VALUES (168,82,83,250);
INSERT INTO "LocationEdge" VALUES (169,82,84,355);
INSERT INTO "LocationEdge" VALUES (170,82,85,298);
INSERT INTO "LocationEdge" VALUES (171,83,86,281);
INSERT INTO "LocationEdge" VALUES (172,83,97,410);
INSERT INTO "LocationEdge" VALUES (173,84,97,304);
INSERT INTO "LocationEdge" VALUES (174,84,87,240);
INSERT INTO "LocationEdge" VALUES (175,97,89,318);
INSERT INTO "LocationEdge" VALUES (176,97,90,364);
INSERT INTO "LocationEdge" VALUES (177,85,83,326);
INSERT INTO "LocationEdge" VALUES (178,85,86,464);
INSERT INTO "LocationEdge" VALUES (179,86,91,360);
INSERT INTO "LocationEdge" VALUES (180,86,98,480);
INSERT INTO "LocationEdge" VALUES (181,87,89,492);
INSERT INTO "LocationEdge" VALUES (182,87,88,488);
INSERT INTO "LocationEdge" VALUES (183,98,89,182);
INSERT INTO "LocationEdge" VALUES (184,98,90,213);
INSERT INTO "LocationEdge" VALUES (185,88,89,263);
INSERT INTO "LocationEdge" VALUES (186,88,90,428);
INSERT INTO "LocationEdge" VALUES (187,89,90,173);
INSERT INTO "LocationEdge" VALUES (188,90,94,493);
INSERT INTO "LocationEdge" VALUES (189,91,93,983);
INSERT INTO "LocationEdge" VALUES (190,91,92,484);
INSERT INTO "LocationEdge" VALUES (191,92,93,929);
INSERT INTO "LocationEdge" VALUES (192,93,94,281);
INSERT INTO "LocationEdge" VALUES (193,93,0,532);
INSERT INTO "LocationEdge" VALUES (194,94,0,260);
INSERT INTO "Team" VALUES (1,'Argent Boars',64);
INSERT INTO "Team" VALUES (2,'Azure Wolves',94);
INSERT INTO "Team" VALUES (3,'Crimson Stallions',94);
INSERT INTO "Player" VALUES (4,'146089977229344770',3,0);
INSERT INTO "Player" VALUES (5,'220813682261753856',2,0);
INSERT INTO "Player" VALUES (6,'262037102307442688',1,0);
INSERT INTO "Player" VALUES (7,'534239829949546506',3,0);
INSERT INTO "Player" VALUES (8,'257252308042252288',2,0);
INSERT INTO "Player" VALUES (9,'497268261927256064',3,18388);
INSERT INTO "Player" VALUES (10,'307272022545793036',2,1289);
INSERT INTO "Player" VALUES (11,'178328208666525696',2,0);
INSERT INTO "Player" VALUES (12,'425707337634938881',3,0);
INSERT INTO "Player" VALUES (13,'398883730644795392',1,0);
INSERT INTO "Player" VALUES (14,'313824735001575424',1,3918);
INSERT INTO "Player" VALUES (15,'210631310425718785',3,12056);
INSERT INTO "Player" VALUES (16,'215587817554837505',3,0);
INSERT INTO "Player" VALUES (17,'240644983554572289',1,0);
INSERT INTO "Player" VALUES (18,'402626550547349505',1,9911);
INSERT INTO "Player" VALUES (19,'174667975003996160',2,7792);
INSERT INTO "Player" VALUES (20,'316259268238114828',2,7892);
INSERT INTO "Player" VALUES (21,'139284147368624128',1,9903);
INSERT INTO "Player" VALUES (22,'215342807232151562',2,53);
INSERT INTO "Player" VALUES (23,'186635429829672962',3,12056);
INSERT INTO "Player" VALUES (24,'549441676486115337',2,7842);
INSERT INTO "Player" VALUES (25,'128660234297147392',1,9711);
INSERT INTO "Player" VALUES (26,'200840655533113344',2,0);
INSERT INTO "Player" VALUES (27,'271870169108709379',2,0);
INSERT INTO "Player" VALUES (28,'249716540276998146',1,9426);
INSERT INTO "Player" VALUES (29,'445063199318999041',1,8126);
INSERT INTO "Player" VALUES (30,'495934684379742218',2,4292);
INSERT INTO "Player" VALUES (31,'437887599940599818',2,0);
INSERT INTO "Player" VALUES (32,'227569040443310081',3,388);
INSERT INTO "Player" VALUES (33,'284170044034908160',2,659);
INSERT INTO "Player" VALUES (34,'189790697295970304',1,800);
INSERT INTO "Player" VALUES (35,'474061507320217601',3,866);
INSERT INTO "Player" VALUES (36,'202420850568331264',1,0);
COMMIT;
