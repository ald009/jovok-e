
INSERT INTO teams (team_name, sport_type, home_city, level) VALUES
('Budapest Wolves', 'Labdarúgás', 'Budapest', 'félprofi'),
('Debrecen Smash', 'Kosárlabda', 'Debrecen', 'amatőr'),
('Szeged Sharks', 'Röplabda', 'Szeged', 'hobbi');

INSERT INTO captains (captain_name) VALUES
('Nagy Péter'),
('Kiss Ádám'),
('Tóth László');

INSERT INTO positions (position) VALUES
('Kapus'),
('Védő'),
('Középpályás'),
('Csatár'),
('Irányító'),
('Center'),
('Feladó'),
('Ütő');

INSERT INTO players (name, email, phone_number, reliability_rate) VALUES
('Kovács János','p1@mail.hu','061111111',95),
('Kovács Árpád','p2@mail.hu','062222222',90),
('Szabó Péter','p3@mail.hu','063333333',85),
('Barta Bulcsú','p4@mail.hu','064444444',100),
('Kiss László','p5@mail.hu','065555555',88),
('Nagy Balázs','p6@mail.hu','066666666',92),
('Tóth Gergely','p7@mail.hu','067777777',97),
('Horváth András','p8@mail.hu','068888888',80),
('Molnár Tamás','p9@mail.hu','069999999',75),
('Németh Bence','p10@mail.hu','061010101',93),
('Farkas Dávid','p11@mail.hu','061111112',89),
('Papp Roland','p12@mail.hu','061111113',91),
('Kelemen Márk','p13@mail.hu','061111114',94),
('Lukács Máté','p14@mail.hu','061111115',90),
('Takács Norbert','p15@mail.hu','061111116',86),
('Balogh Kristóf','p16@mail.hu','061111117',88),
('Varga Zoltán','p17@mail.hu','061111118',82),
('Sipos Levente','p18@mail.hu','061111119',96),
('Bálint Richárd','p19@mail.hu','061111120',84),
('Szalai Áron','p20@mail.hu','061111121',87);

INSERT INTO events
(event_name,start_date,end_date,event_type,place,price,expected_members,real_members)
VALUES
('Edzés 1','2026-01-05 18:00','2026-01-05 20:00','Edzés','Sportcsarnok',12000,12,11),
('Edzés 2','2026-01-07 18:00','2026-01-07 20:00','Edzés','Sportcsarnok',12000,12,10),
('Edzés 3','2026-01-09 18:00','2026-01-09 20:00','Edzés','Sportcsarnok',12000,12,12),
('Mérkőzés 1','2026-01-12 17:00','2026-01-12 19:00','Mérkőzés','Városi stadion',20000,16,15),
('Mérkőzés 2','2026-01-15 17:00','2026-01-15 19:00','Mérkőzés','Városi stadion',20000,16,14),

-- további események
('Edzés 4','2026-01-17 18:00','2026-01-17 20:00','Edzés','Csarnok',5000,10,NULL),
('Edzés 5','2026-01-19 18:00','2026-01-19 20:00','Edzés','Csarnok',5000,10,NULL),
('Edzés 6','2026-01-21 18:00','2026-01-21 20:00','Edzés','Csarnok',5000,10,NULL),
('Mérkőzés 3','2026-01-23 17:00','2026-01-23 19:00','Mérkőzés','Aréna',NULL,16,NULL),
('Mérkőzés 4','2026-01-25 17:00','2026-01-25 19:00','Mérkőzés','Aréna',NULL,16,NULL),
('Edzés 7','2026-01-27 18:00','2026-01-27 20:00','Edzés','Csarnok',5000,10,NULL),
('Edzés 8','2026-01-29 18:00','2026-01-29 20:00','Edzés','Csarnok',5000,10,NULL),
('Edzés 9','2026-02-01 18:00','2026-02-01 20:00','Edzés','Csarnok',5000,10,NULL),
('Mérkőzés 5','2026-02-03 17:00','2026-02-03 19:00','Mérkőzés','Aréna',NULL,16,NULL),
('Mérkőzés 6','2026-02-05 17:00','2026-02-05 19:00','Mérkőzés','Aréna',NULL,16,NULL);

INSERT INTO reply (state, replytext, players_idplayers) VALUES
('Jön','Ott leszek',1),
('Talán','Még nem biztos',2),
('Nem jön','Sérült',3),
('Jön',NULL,4),
('Jön','Időben érkezem',5);

INSERT INTO events_has_reply
(events_idevents, reply_idreply, reply_players_idplayers, team_post)
VALUES
(1,1,1,'A csapat'),
(1,2,2,'B csapat'),
(2,3,3,'A csapat'),
(3,4,4,'B csapat'),
(4,5,5,'Vegyes');