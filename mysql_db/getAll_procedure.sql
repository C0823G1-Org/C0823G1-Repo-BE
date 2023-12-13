use online_game_store;

delimiter //
create procedure getAll()
begin
select g.game_title,g.price,img.url as img,v.url as video,b.percent_discount,rt.rating_type_name
from game g
join image img on img.game_game_id = g.game_id
join video v on v.game_game_id = g.game_id 
join bundle_has_game bhg on bhg.game_id = g.game_id
left join bundle b on b.bundle_id = bhg.bundle_id
left join review_rating rr on g.review_rating_id = rr.review_rating_id
left join rating_type rt on rr.rating_type_rating_type_id = rt.rating_type_id;
end
// delimiter ;

call  getAll();

with x as (select row_number() over (order by game_id desc) as r,game.game_title,game.price,image.url 
from game  
join image on game.game_id = image.game_game_id
where game_title like "%s%" ) 
select * from x where r between 1 and 3;

select game.game_title,game.price,image.url 
from game 
join image on game.game_id = image.game_game_id 
where game_title like "%s%";

-- Catelogy
delimiter //
create procedure categories()
begin
select g.game_title,g.price,img.url as img
from game g
join image img on img.game_game_id = g.game_id
join video v on v.game_game_id = g.game_id 
join bundle_has_game bhg on bhg.game_id = g.game_id;
end
// delimiter ;

call  categories();

select g.game_title,g.price,img.url as img,t.tag_name
from game g
join image img on img.game_game_id = g.game_id
join game_tag gt on gt.game_id = g.game_id
join tag t on t.tag_id = gt.tag_id
where tag_name = "Action";


with y as (select row_number() over (order by g.game_id ) as r,g.game_title,g.price,img.url as img,t.tag_name
from game g
join image img on img.game_game_id = g.game_id
join game_tag gt on gt.game_id = g.game_id
join tag t on t.tag_id = gt.tag_id
where t.tag_name = "Action") 
select * from y where r between 1 and 3;


select count(*)
from game g
join image img on img.game_game_id = g.game_id
join game_tag gt on gt.game_id = g.game_id
join tag t on t.tag_id = gt.tag_id
where t.tag_name = "Action";
