function scr_bat_idle()
{	
	image_index = 3;
	image_speed = 0;
	// check for aggro
	if (++aggro_check_elapsed >= aggro_check_duration)
	{
		aggro_check_elapsed = 0;
		if (instance_exists(obj_player)) &&
			(point_distance(x, y, obj_player.x, obj_player.y) <= mob_aggro_radius)
		{
			// player's in the circle, let's get em
			x_to = center_x + lengthdir_x(flight_radius, theta);
			y_to = center_y + lengthdir_y(flight_radius, theta);
			state = MOB_STATE.ATTACK;
			target = obj_player;
		}
	}
}

// Scrip
function scr_bat_wander()
{
	//sprite_index = sprite_move;
	image_index = 0;
	image_speed = 1.0;
	
	// arrived at dest, or given up
	if ((x == x_to) && (y == y_to)) ||
		(time_passed > mob_wander_distance / mob_speed)
	{
		h_speed = 0;
		v_speed = 0;
		
		// wait, then set new dest
		if (++wait >= wait_duration)
		{
			wait = 0;
			time_passed = 0;
			// aim back at start, add 45 degrees to both sides, then move
			dir = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45);
			
			// set our destination, breaking us out of this loop
			x_to = x + lengthdir_x(mob_wander_distance, dir);
			y_to = y + lengthdir_y(mob_wander_distance, dir);
		}
	}
	else
	{
		// time to move it move it
		time_passed++;
		
		// make sure we don't overshoot our destination
		var _distance_left = point_distance(x, y, x_to, y_to);
		var _speed_this_frame = mob_speed;
		if (_distance_left < mob_speed)
		{
			_speed_this_frame = _distance_left;
		}
		
		dir = point_direction(x, y, x_to, y_to);
		h_speed = lengthdir_x(_speed_this_frame, dir);
		v_speed = lengthdir_y(_speed_this_frame, dir);
		
		if (h_speed != 0)
		{
			// face us the right dir
			image_xscale = sign(h_speed);
		}
		
		// collision check
		scr_mob_tile_collision();
	}
	
	// check for aggro
	if (++aggro_check_elapsed >= aggro_check_duration)
	{
		aggro_check_elapsed = 0;
		if (instance_exists(obj_player)) &&
			(point_distance(x, y, obj_player.x, obj_player.y) <= mob_aggro_radius)
		{
			// player's in the circle, let's get em
			state = MOB_STATE.CHASE;
			target = obj_player;
		}
	}
}

function scr_bat_fly_to_point()
{
	z = 16;
	image_speed = 1.0;
	
	var _distance_to_go = point_distance(x, y, x_to, y_to);
	dir = point_direction(x, y, x_to, y_to);
	if (_distance_to_go > mob_speed)
	{
		h_speed = lengthdir_x(mob_speed, dir);
		v_speed = lengthdir_y(mob_speed, dir);
	}
	else
	{
		state = MOB_STATE.CHASE;
	}
	
	x += h_speed;
	y += v_speed;
}

function scr_bat_chase()
{
	z = 16;
	image_speed = 1.0;
	
	theta += theta_speed;
	if (theta >= 360)
	{
		theta -= 360;
	}
	
	x = center_x + lengthdir_x(flight_radius, theta);
	y = center_y + lengthdir_y(flight_radius, theta);
	
	depth = -(bbox_bottom - z);
	
	/*
	if (target != noone) && (instance_exists(target))
	{
		x_to = target.x;
		y_to = target.y;
		var _distance_to_go = point_distance(x, y, x_to, y_to);
		image_speed = 1.0;
		dir = point_direction(x, y, x_to, y_to);
		if (_distance_to_go > mob_speed)
		{
			h_speed = lengthdir_x(mob_speed, dir);
			v_speed = lengthdir_y(mob_speed, dir);
		}
		else
		{
			h_speed = lengthdir_x(_distance_to_go, dir);
			v_speed = lengthdir_y(_distance_to_go, dir);
		}
		
		if (h_speed != 0)
		{
			image_xscale = sign(h_speed);
		}
		
		scr_mob_tile_collision();
	}
	
	// if the player is outside our attack radius, cool down
	if (target != noone) && (instance_exists(target))
	{
		if (point_distance(x, y, target.x, target.y) >= mob_attack_radius)
		{
			if (++aggro_check_elapsed >= aggro_check_duration)
			{
				state = MOB_STATE.IDLE;
			}
		}
	}
	*/
}