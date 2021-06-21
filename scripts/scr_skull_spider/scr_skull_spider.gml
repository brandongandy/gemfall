// Scrip
function scr_skull_spider_idle()
{
	if (collided_with_wall)
	{
		var _flip = choose(0, 1);
		collided_with_wall = false;
		// left turns only
		dir -= 90;
		if (dir < 0)
		{
			dir = 270;
		}
		
		if (_flip)
		{
			dir = -dir;
		}
	}
	x_to = x + lengthdir_x(mob_wander_distance, dir);
	y_to = y + lengthdir_y(mob_wander_distance, dir);
	
	state_target = MOB_STATE.WANDER;
	state_wait_duration = irandom_range(20, 60);
	state = MOB_STATE.WAIT;
}

function scr_skull_spider_wander()
{	
	if ((x == x_to) && (y == y_to)) ||
		 (time_passed > mob_wander_distance / mob_speed)
	{
		h_speed = 0;
		v_speed = 0;
		time_passed = 0;
		
		if (!animation_end)
		{
			scr_mob_animate_sprite_one_dir();
		}
		else
		{
			local_frame = 0;
			state = MOB_STATE.IDLE;
		}
	}
	else
	{
		time_passed++;
		var _distance_left = point_distance(x, y, x_to, y_to);
		var _speed_this_frame = mob_speed;
		if (_distance_left < mob_speed)
		{
			_speed_this_frame = _distance_left;
		}
		
		h_speed = lengthdir_x(_speed_this_frame, dir);
		v_speed = lengthdir_y(_speed_this_frame, dir);
		direction = dir;
		scr_mob_animate_sprite_one_dir();
		if (scr_mob_tile_collision())
		{
			collided_with_wall = true;
			x_to = x;
			y_to = y;
		}
	}
}