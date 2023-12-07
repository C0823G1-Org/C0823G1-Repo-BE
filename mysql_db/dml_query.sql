USE `online_game_store`;

insert into `online_game_store`.`developer` (`developer_name`,`about_description`,`developer_url`)
values ("SEGA","SEGA® brings the Best of Japan to PC with its best-in-class conversions that include all the features exacting PC gamers expect wherever possible. We love PC gaming!",
"https://store.steampowered.com/developer/Sega"),
("Ubisoft","Ubisoft may have 21,000 employees in offices and studios around the world, but the company began with a family.",
"https://store.steampowered.com/developer/ubisoft"),
("2K","2K develops and publishes critically-acclaimed franchises such as BioShock, Borderlands, Sid Meier’s Civilization, XCOM, WWE 2K, and NBA 2K.",
"https://store.steampowered.com/developer/2K"),
("Valve","Valve's debut title, Half-Life, was released in 1998. Since then, we've released dozens of titles that changed the world (and one that didn't). Today, millions of people play our games every day.",
"https://store.steampowered.com/developer/valve"),
("Electronic Arts","Driven by passion, we are a global leader in digital interactive entertainment.",
"https://store.steampowered.com/developer/EA"),
("Half-Life","Driven by passion, we are a global leader in digital interactive entertainment.",
"https://store.steampowered.com/developer/Half-Life");



insert into `online_game_store`.`rating_type` (`rating_type_name`)
values ("positive"),
("mixed"),
("negative");

insert into `online_game_store`.`review_rating` (`rating_type_rating_type_id`)
values (1),
		(2),
        (3);

insert into `online_game_store`.`game` (`game_title`,`price`,`description`,`age_requirement`,`developer_id`,`release_date`,`dlc_id`,`review_rating_id`
,`minium_system_requirement`,`recommend_system_requirement`)
 values ("RESIDENT EVIL",39.69,"Resident Evil, or Biohazard[a] in Japan and Southeast Asia",1,1,"2003-09-23",null,1,"MINIMUM:
Requires a 64-bit processor and operating system
OS: Windows 10 (x64) - Windows 11 (x64)
Processor: Intel Core i5-2310
Memory: 6 GB RAM
Graphics: Geforce GTS 450 or equivalent or better
DirectX: Version 11
Network: Broadband Internet connection
Storage: 2 GB available space","RECOMMENDED:
Requires a 64-bit processor and operating system
OS: Windows 10 (x64) - Windows 11 (x64)
Processor: Intel Core i5 4th Generation and above
Memory: 8 GB RAM
Graphics: Geforce GTX 600 Series or equivalent or better
DirectX: Version 11
Network: Broadband Internet connection
Storage: 2 GB available space"),

("SEKIRO",19.69,"SHADOWS DIE TWICE",1,2,"2001-12-22",null,2,"MINIMUM:
OS *: Windows 7, 8, 10
Processor: 3 GHz Quad Core Processor
Memory: 8 GB RAM
Graphics: DirectX 11 compatible GPU, 4GB dedicated VRAM (GeForce GTX 970 / Radeon RX 480)
DirectX: Version 11
Network: Broadband Internet connection
Storage: 10 GB available space","RECOMMENDED:
OS: Windows 10
Processor: 4 GHz Quad Core Processor
Memory: 16 GB RAM
Graphics: DirectX 11 compatible GPU, 6GB dedicated VRAM (GeForce GTX 1060 / Radeon RX 580)
DirectX: Version 11
Network: Broadband Internet connection
Storage: 10 GB available space"),

("Sons Of The Forest",27.69,"An entirely new experience from the makers of the ‘The Forest’",1,3,"2006-12-22",null,2,"MINIMUM:
OS *: Windows 7, 8, 10
Processor: 3 GHz Quad Core Processor
Memory: 8 GB RAM
Graphics: DirectX 11 compatible GPU, 4GB dedicated VRAM (GeForce GTX 970 / Radeon RX 480)
DirectX: Version 11
Network: Broadband Internet connection
Storage: 10 GB available space","RECOMMENDED:
OS: Windows 10
Processor: 4 GHz Quad Core Processor
Memory: 16 GB RAM
Graphics: DirectX 11 compatible GPU, 6GB dedicated VRAM (GeForce GTX 1060 / Radeon RX 580)
DirectX: Version 11
Network: Broadband Internet connection
Storage: 10 GB available space"),

("God of War",29.69,"His vengeance against the Gods of Olympus years behind him, Kratos now lives as a man in the realm of Norse Gods and monsters",1,4,"2001-12-22",null,2,"MINIMUM:
OS *: Windows 7, 8, 10
Processor: 3 GHz Quad Core Processor
Memory: 8 GB RAM
Graphics: DirectX 11 compatible GPU, 4GB dedicated VRAM (GeForce GTX 970 / Radeon RX 480)
DirectX: Version 11
Network: Broadband Internet connection
Storage: 10 GB available space","RECOMMENDED:
OS: Windows 10
Processor: 4 GHz Quad Core Processor
Memory: 16 GB RAM
Graphics: DirectX 11 compatible GPU, 6GB dedicated VRAM (GeForce GTX 1060 / Radeon RX 580)
DirectX: Version 11
Network: Broadband Internet connection
Storage: 10 GB available space"),

("Grounded",19.69,"The world is a vast, beautiful, and dangerous place – especially when you have been shrunk to the size of an ant",1,5,"2011-12-22",null,2,"MINIMUM:
OS *: Windows 7, 8, 10
Processor: 3 GHz Quad Core Processor
Memory: 8 GB RAM
Graphics: DirectX 11 compatible GPU, 4GB dedicated VRAM (GeForce GTX 970 / Radeon RX 480)
DirectX: Version 11
Network: Broadband Internet connection
Storage: 10 GB available space","RECOMMENDED:
OS: Windows 10
Processor: 4 GHz Quad Core Processor
Memory: 16 GB RAM
Graphics: DirectX 11 compatible GPU, 6GB dedicated VRAM (GeForce GTX 1060 / Radeon RX 580)
DirectX: Version 11
Network: Broadband Internet connection
Storage: 10 GB available space"),

("Lords of the Fallen",19.69,"The world is a vast, beautiful, and dangerous place – especially when you have been shrunk to the size of an ant",1,6,"1999-12-22",null,1,"MINIMUM:
OS *: Windows 7, 8, 10
Processor: 3 GHz Quad Core Processor
Memory: 8 GB RAM
Graphics: DirectX 11 compatible GPU, 4GB dedicated VRAM (GeForce GTX 970 / Radeon RX 480)
DirectX: Version 11
Network: Broadband Internet connection
Storage: 10 GB available space","RECOMMENDED:
OS: Windows 10
Processor: 4 GHz Quad Core Processor
Memory: 16 GB RAM
Graphics: DirectX 11 compatible GPU, 6GB dedicated VRAM (GeForce GTX 1060 / Radeon RX 580)
DirectX: Version 11
Network: Broadband Internet connection
Storage: 10 GB available space"),

("Dota 2",28.69,"Every day, millions of players worldwide enter battle as one of over a hundred Dota heroes. And no matter if it's their 10th hour of play or 1,000th",1,4,"1999-12-22",null,1,"MINIMUM:
OS *: Windows 7, 8, 10
Processor: 3 GHz Quad Core Processor
Memory: 8 GB RAM
Graphics: DirectX 11 compatible GPU, 4GB dedicated VRAM (GeForce GTX 970 / Radeon RX 480)
DirectX: Version 11
Network: Broadband Internet connection
Storage: 10 GB available space","RECOMMENDED:
OS: Windows 10
Processor: 4 GHz Quad Core Processor
Memory: 16 GB RAM
Graphics: DirectX 11 compatible GPU, 6GB dedicated VRAM (GeForce GTX 1060 / Radeon RX 580)
DirectX: Version 11
Network: Broadband Internet connection
Storage: 10 GB available space");



insert into `online_game_store`.`role` (`role_name`)
values ("admin"),
("user");

insert into `online_game_store`.`user_account`(`email`, `password`,`role_role_id`)
values ("nhatbao21@gmail.com",123456,2),
		("tieuvi21@gmail.com",123456,2),
        ("giakiet21@gmail.com",123456,2),
        ("admin@gmail.com",123456,1);
        
insert into `online_game_store`.`user` ( `user_name`,`birthday`,`email`)
values ("Nhật Bảo","29/02/2003","nhatbao21@gmail.com"),
("Tiểu vi","22/04/2001","tieuvi21@gmail.com"),
("Gia Kiệt","23/09/2003","giakiet21@gmail.com"),
("Admin","01/01/1990","admin@gmail.com");

insert into `online_game_store`.`bundle`(`percent_discount`)
values ("30%"),
("40%"),
("50%");

insert into `online_game_store`.`image_type`(`image_type_name`)
values ("normal"),
("cover");

 -- insert into image
insert into `online_game_store`.`image`(`url`,`game_game_id`,`image_type_image_type_id`)
values ("https://cdn.akamai.steamstatic.com/steam/apps/2050650/hero_capsule_alt_assets_0.jpg?t=1696242724",1,1),
("https://cdn.akamai.steamstatic.com/steam/apps/814380/hero_capsule.jpg?t=1678991267",2,2),
("https://cdn.akamai.steamstatic.com/steam/apps/1326470/hero_capsule.jpg?t=1697048131",3,2),
("https://cdn.akamai.steamstatic.com/steam/apps/1593500/hero_capsule.jpg?t=1695758729",4,1),
("https://cdn.akamai.steamstatic.com/steam/apps/962130/hero_capsule.jpg?t=1699908769",5,2),
("https://cdn.akamai.steamstatic.com/steam/apps/1501750/hero_capsule.jpg?t=1700572672",6,1),
("https://cdn.cloudflare.steamstatic.com/steam/apps/570/header.jpg?t=1701826869",7,2);


-- insert into `online_game_store`.`video`
insert into `online_game_store`.`video`(`url`,`game_game_id`)
values ("https://cdn.cloudflare.steamstatic.com/steam/apps/256938327/microtrailer.webm?t=1680071426",1),
 ("https://cdn.cloudflare.steamstatic.com/steam/apps/256806899/microtrailer.webm?t=1603837979",2),
 ("https://cdn.akamai.steamstatic.com/steam/apps/256932123/microtrailer.webm?t=1677175226",3),
  ("https://cdn.cloudflare.steamstatic.com/steam/apps/256864004/microtrailer.webm?t=1639001817",4),
   ("https://cdn.cloudflare.steamstatic.com/steam/apps/256982368/microtrailer.webm?t=1699907911",5),
    ("https://cdn.cloudflare.steamstatic.com/steam/apps/256975850/microtrailer.webm?t=1697236277",6),
     ("https://cdn.akamai.steamstatic.com/steam/apps/256819789/movie480_vp9.webm?t=1700261726",7);
insert into `online_game_store`.`tag`(`tag_name`)
values ("Action"), 
("Role-Playing"),
("JRPG"),
("Hack & Slash"),
("Arcade & Rhythm"),
("Casual");

insert into `online_game_store`.`game_tag`(`game_id`, `tag_id`)
values (1,2),
(2,1),
(1,3),
(2,2),
(3,3),
(3,4),
(3,6),
(4,3),
(4,1),
(5,1),
(6,1),
(7,1),
(6,2),
(6,3),
(7,2),
(5,2),
(7,6);

insert into `online_game_store`.`game_in_cart`(`user_id`, `game_id`)
values (1,2),
(1,1),
(1,6),
(1,3),
(2,1),
(2,4),
(2,6),
(2,7),
(3,1),
(2,5),
(2,3);

insert into `online_game_store`.`bundle_has_game`(`game_id`,`bundle_id`)
values (1,3),
(2,1),
(3,1),
(4,3),
(5,2),
(6,1),
(7,3);

