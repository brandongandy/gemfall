// Scrip
function scr_crystal_slime_idle()
{
	// wait a bit, send a minion into attack
	if (++time_passed <= 240)
	{
		time_passed = 0;
		state_target = MOB_STATE.SPECIAL_02;
		state = MOB_STATE.WAIT;
	}
}

function scr_crystal_slime_attack()
{
	if (boss_stage < 3)
	{
		sprite_index = spr_crystal_slime_attack;
		image_speed = 1.0;
	
		if (floor(image_index) == 2) && (!has_fired)
		{
			has_fired = true;
			var _angle = 225;
			for (var i = 0; i < 3; i++)
			{
				with (instance_create_layer(x, y, "Instances", obj_bullet))
				{
					direction = _angle;
				}
				// add new angle to space them apart in an even circly
				_angle += 45;
			}
		}
	
		if (floor(image_index) == 4)
		{
			has_fired = false;
			state_target = MOB_STATE.SPECIAL_01;
			state = MOB_STATE.WAIT;
		}
	}
	else if (boss_stage >= 3)
	{
		var _speed = mob_speed * 3;
		var _done_moving = false;
	
		var _distance_to_go = point_distance(x, y, x_to, y_to);
		if (_distance_to_go > _speed)
		{
			dir = point_direction(x, y, x_to, y_to);
			h_speed = lengthdir_x(_speed, dir);
			v_speed = lengthdir_y(_speed, dir);
		
			// commit to move, then stop if we hit something
			if (scr_mob_tile_collision() == true)
			{
				x_to = x; 
				y_to = y;
				_done_moving = true;
			}
		}
		else
		{
			x = x_to;
			y = y_to;
			_done_moving = true;
		}
		
		if (_done_moving)
		{		
			sprite_index = spr_crystal_slime_attack;
			image_speed = 1.0;
	
			if (floor(image_index) == 3) && (!has_fired)
			{
				has_fired = true;
				var _angle = point_direction(x, y, obj_player.x, obj_player.y) - 90;
				var _angle_per_bullet = 180 / 15;
				for (var i = 0; i < 15; i++)
				{
					with (instance_create_layer(x, y, "Instances", obj_bullet))
					{
						direction = _angle;
					}
					// add new angle to space them apart in an even circly
					_angle += _angle_per_bullet;
				}
			}
	
			if (floor(image_index) == 0) && (has_fired)
			{
				has_fired = false;
				state_target = MOB_STATE.ATTACK;
				state = MOB_STATE.WAIT;
			}
		}
	}
}

function scr_crystal_slime_special01()
{
	sprite_index = spr_crystal_slime_attack;
	image_speed = 1.0;
	
	if (floor(image_index) == 3) && (!has_fired)
	{
		has_fired = true;
		var _angle = irandom_range(135, 270);
		var _angle_per_bullet = 180 / 7;
		for (var i = 0; i < 7; i++)
		{
			with (instance_create_layer(x, y, "Instances", obj_bullet))
			{
				direction = _angle;
			}
			// add new angle to space them apart in an even circly
			_angle += _angle_per_bullet;
		}
	}
	
	if (floor(image_index) == 0) && (has_fired)
	{
		has_fired = false;
		if (boss_stage == 2)
		{
			state_target = MOB_STATE.SPECIAL_02;
			state = MOB_STATE.WAIT;
		}
		else
		{
			state_target = MOB_STATE.ATTACK;
			state = MOB_STATE.WAIT;
		}
	}
}

function scr_crystal_slime_special02()
{
	// pick a random minion and activate it
	if (boss_stage == 0)
	{
		if (instance_number(obj_crystal_slime_minion) > 0)
		{
			with (instance_find(obj_crystal_slime_minion, irandom(instance_number(obj_crystal_slime_minion) - 1)))
			{
				state_target = MOB_STATE.WANDER;
				state = MOB_STATE.WAIT;
			}
		}
		else
		{
			boss_stage = 1;
		}
	}
	else if (boss_stage == 1)
	{
		repeat(10)
		{
			var _left_edge = 18;
			var _right_edge = room_width - 18;
			var _top_edge = 18;
			var _bottom_edge = room_height - 18;
			
			var _x = irandom_range(_left_edge, _right_edge);
			var _y = irandom_range(_top_edge, _bottom_edge);
			
			with (instance_create_layer(_x, _y, "Instances", obj_slime))
			{
				z = 180;
			}
		}
		boss_stage = 2;
	}
	else if (boss_stage == 2)
	{
		if (instance_number(obj_slime) <= 0)
		{
			boss_stage = 3;
		}
	}
	
	state_target = MOB_STATE.ATTACK;
	state = MOB_STATE.WAIT;
	// if no more random minions, increase stage
	// then summon a random amount of normal slimes
	// once no more slimes, increase stage
}

function scr_crystal_slime_wait()
{
	// not used until Stage 3, but let's just get em anyway
	x_to = obj_player.x;
	y_to = obj_player.y;
	
	sprite_index = spr_crystal_slime;
	image_speed = 0;
	if (++state_wait_elapsed >= state_wait_duration)
	{
		state_wait_elapsed = 0;
		state = state_target;
	}
}

function scr_crystal_slime_die()
{
	scr_set_quest_status("Dungeon01", 9);
	
	scr_drop_items(x, y, [obj_emerald_small, obj_heart_container]);
	
	if (instance_exists(obj_door))
	{
		with (obj_door)
		{
			open = true;
		}
	}
	
	instance_destroy();
}

function scr_crystal_slime_hurt()
{
	if (boss_stage < 3)
	{
		// don't do anything if my minions are alive
		return;
	}
	
	var _player_damage;
	if (other.object_index == obj_player)
	{
		_player_damage = obj_player.base_damage;
	}
	else if (other.object_index == obj_explosion)
	{
		_player_damage = 25;
	}
	
	if (state != MOB_STATE.DIE)
	{
		mob_hp -= _player_damage;
		flash = 1;
	}
	
	if (mob_hp <= 0)
	{
		state = MOB_STATE.DIE;
	}
}