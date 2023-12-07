delimiter //
create procedure get_user_cart(user_id_request int)
begin
select g.game_title,g.price,i.url
from game_in_cart as c
join user as u on c.user_id = u.user_id
join game as g on c.game_id= g.game_id
join image as i on i.game_game_id = g.game_id
where c.user_id = user_id_request and i.image_type_image_type_id=2 and c.is_deleted=0;
end
// delimiter ;