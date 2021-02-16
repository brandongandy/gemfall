// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_throw()
{
	var throw_distance;
	if (h_speed == 0 && v_speed == 0)
	{
		throw_distance = 16;
	}
	else
	{
		if (global.i_lifted != noone)
		{
			throw_distance = global.i_lifted.entity_throw_distance;
		}
	}
	with (global.i_lifted)
	{
		entity_throw_distance = throw_distance;
		lifted = false;
		persistent = false;
		thrown = true;
		z = 13;
		throw_peak_height = z + 10;
		throw_distance_traveled = 0;
		// start a new arc from the z-height, and land at correct z-height for floor
		throw_start_percent = (13 / throw_peak_height) * 0.5;
		throw_percent = throw_start_percent;
		direction = other.direction;
		x_start = x;
		y_start = y;
		entity_collides = true;
	}
	
	scr_player_act_animation(spr_player_lift, undefined);
	sprite_idle = spr_player;
	sprite_run = spr_player_run;
	
	global.i_lifted = noone;
}