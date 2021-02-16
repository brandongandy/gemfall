// Scrip
function scr_pop_debris()
{
}

function scr_bullet_explode()
{
	var _distance_to_go = point_distance(x, y, x_to, y_to);
	if (_distance_to_go > mob_speed)
	{
		dir = point_direction(x, y, x_to, y_to);
		h_speed = lengthdir_x(mob_speed, dir);
		v_speed = lengthdir_y(mob_speed, dir);
		if (h_speed != 0)
		{
			image_xscale = -sign(h_speed);
		}
		
		// collide and move
		scr_mob_tile_collision()
	}

}