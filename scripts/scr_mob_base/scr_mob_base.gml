// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_mob_wait()
{
	if (++state_wait_elapsed >= state_wait_duration)
	{
		state_wait_elapsed = 0;
		state = state_target;
	}
}

function scr_mob_hurt()
{
	if (x_to != undefined)
	{
		var _distance_to_go = point_distance(x, y, x_to, y_to);
	}
	else
	{
		var _distance_to_go = 0;
	}	
	
	// if we've got further to go than we would move in a single frame
	if (_distance_to_go > mob_speed)
	{
		dir = point_direction(x, y, x_to, y_to);
		h_speed = lengthdir_x(mob_speed * 3, dir);
		v_speed = lengthdir_y(mob_speed * 3, dir);
		if (h_speed != 0)
		{
			image_xscale = -sign(h_speed);
		}
		
		// collide and move
		if (scr_mob_tile_collision())
		{
			x_to = x;
			y_to = y;
		}
	}
	else
	{
		x = x_to;
		y = y_to;
		// dont go right back to attack
		if (state_previous != MOB_STATE.ATTACK)
		{
			state = state_previous;
		}
		else
		{
			// chase always leads into attack, so if we were attacking
			// then go back to it
			state = MOB_STATE.CHASE;
		}
	}
}

function scr_mob_die()
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
		if (scr_mob_tile_collision())
		{
			start_death_anim = true;
		}
	}
	else
	{
		x = x_to;
		y = y_to;
		start_death_anim = true;
	}	

	if (start_death_anim)
	{
		if (sprite_index != sprite_die)
		{
			var centerX = x - sprite_get_xoffset(sprite_index) + sprite_width / 2;
			var centerY = y - sprite_get_yoffset( sprite_index) + sprite_height / 2;
			sprite_index = sprite_die;
			x = centerX;
			y = centerY;
			entity_shadow = false;	
			image_speed = 1.0;	
		}
		
		if (image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number)
		{
			instance_destroy();
		}
	}

}