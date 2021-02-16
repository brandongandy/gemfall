// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_slime_attack()
{
	// how fast to move
	var _speed = mob_speed * 2;
	// don't move while getting ready to jump
	if (image_index < 2)
	{
		_speed = 0;
	}
	
	// freeze animation in midair and after landing
	if (floor(image_index) == 3) || (floor(image_index) == 5)
	{
		image_speed = 0.0;
	}
	
	// how far to jump
	var _distance_to_go = point_distance(x, y, x_to, y_to);
	
	// begin landing once nearly done
	if (_distance_to_go < 4) && (image_index < 5)
	{
		image_speed = 1.0;
	}
	
	// move time
	if (_distance_to_go > _speed)
	{
		dir = point_direction(x, y, x_to, y_to);
		h_speed = lengthdir_x(_speed, dir);
		v_speed = lengthdir_y(_speed, dir);
		if (h_speed != 0)
		{
			image_xscale = sign(h_speed);
		}
		
		// commit to move, then stop if we hit something
		if (scr_mob_tile_collision() == true)
		{
			x_to = x; 
			y_to = y;
		}
	}
	else
	{
		x = x_to;
		y = y_to;
		if (floor(image_index) == 5)
		{
			state_target = MOB_STATE.CHASE;
			state_wait_duration = 15;
			state = MOB_STATE.WAIT;
		}
	}
}

// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_slime_chase()
{
	sprite_index = sprite_move;
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
	
	// if we're close enough to launch an attack, then do it
	if (target != noone) && (instance_exists(target))
	{
		if (point_distance(x, y, target.x, target.y) <= mob_attack_radius)
		{
			state = MOB_STATE.ATTACK;
			sprite_index = spr_slime_attack;
			image_index = 0;
			image_speed = 1.0;
			
			// jump toward the player
			x_to += lengthdir_x(8, dir);
			y_to += lengthdir_y(8, dir);
		}
	}
}

// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_slime_wander()
{
	sprite_index = sprite_move;
	
	// arrived at dest, or given up
	if ((x == x_to) && (y == y_to)) ||
		(time_passed > mob_wander_distance / mob_speed)
	{
		h_speed = 0;
		v_speed = 0;
		
		// end move
		if (image_index < 1)
		{
			image_speed = 0.0;
			image_index = 0;
		}
		
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
		image_speed = 1.0;
		
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

function slime_hurt()
{
	sprite_index = sprite_hurt;
	var _distance_to_go = point_distance(x, y, x_to, y_to);
	
	// if we've got further to go than we would move in a single frame
	if (_distance_to_go > mob_speed)
	{
		image_speed = 1.0;
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
			state = MOB_STATE.CHASE;
		}
	}
}

function slime_die()
{
	sprite_index = sprite_die;
	image_speed = 1.0;
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
	else
	{
		x = x_to;
		y = y_to;
	}
	
	// if image index plus frames of animation per fps is greater than number of frames
	// we're done animating
	if (image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number)
	{
		instance_destroy();
	}
}
