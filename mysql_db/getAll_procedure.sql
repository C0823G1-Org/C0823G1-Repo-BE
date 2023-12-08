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

drop procedure getAll;
call  getAll();

select g.game_title,g.price,img.url as img,v.url as video,b.percent_discount,rt.rating_type_name
from game g
join image img on img.game_game_id = g.game_id
join video v on v.game_game_id = g.game_id 
join bundle_has_game bhg on bhg.game_id = g.game_id
left join bundle b on b.bundle_id = bhg.bundle_id
left join review_rating rr on g.review_rating_id = rr.review_rating_id
left join rating_type rt on rr.rating_type_rating_type_id = rt.rating_type_id;
