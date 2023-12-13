delimiter //
create procedure get_user_cart(user_id_request int)
begin
select g.game_title,g.price,i.url,g.game_id
from game_in_cart as c
join user as u on c.user_id = u.user_id
join game as g on c.game_id= g.game_id
join image as i on i.game_game_id = g.game_id
where c.user_id = user_id_request and i.image_type_image_type_id=2 and c.is_deleted=0;
end
// delimiter ;

delimiter //
create procedure remove_cart_item(request_user_id int,request_game_id int)
begin
update game_in_cart as c
join user as u on c.user_id=u.user_id
set c.is_deleted=1
where  c.game_id=request_game_id and u.user_id=request_user_id;
end
// delimiter ;

select *
from game_in_cart c
join user as u on c.user_id = c.user_id
where c.game_id=2 and u.user_id=1;


delimiter //
CREATE PROCEDURE update_all(game_id int ,game_title text,price double,description text,age_requirement int ,developer_id int ,release_date date,dlc_id int,review_rating_id int,`minium_system_requirement` text,`recommend_system_requirement`text)
BEGIN
update game set game_title = game_title , price = price , reviewRatingId = reviewRatingId where game_title = game_title;
 END 
 // delimiter  ;

