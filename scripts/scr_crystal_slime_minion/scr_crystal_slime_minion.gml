// Scrip
function scr_crystal_slime_minion_wander()
{
	if (z > 0) && (first_fall)
	{
		z = max(z - grav, 0);
		grav += 0.1;
		if (z == 0)
		{
			first_fall = false;
		}
	}

	if (!first_fall) && (bounce_count != 0)
	{
		bounce += (pi * bounce_speed);
		if (bounce > pi)
		{
			bounce -= pi;
			bounce_height *= 0.6;
			bounce_count--;
		}
		z = sin(bounce) * bounce_height;
	}
	else
	{
		if (!first_fall)
		{
			z = 0;
			entity_shadow = true;
			state_target = MOB_STATE.ATTACK;
			state = MOB_STATE.WAIT;
		}
	}	
}

function scr_crystal_slime_minion_die()
{
	if (instance_number(obj_crystal_slime_minion) == 1)
	{
		if (instance_exists(obj_crystal_slime))
		{
			obj_crystal_slime.boss_stage = 1;
		}
	}
	instance_destroy();
}

function scr_crystal_slime_minion_chase()
{
	if (++aggro_check_elapsed >= aggro_check_duration)
	{
		aggro_check_elapsed = 0;
		
		x_to = obj_player.x;
		y_to = obj_player.y;
		
		state_target = MOB_STATE.ATTACK;
		state_wait_duration = 15;
		state = MOB_STATE.WAIT;
	}
}

function scr_crystal_slime_minion_attack()
{
	var _speed = mob_speed * 2;
	
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
		}
	}
	else
	{
		x = x_to;
		y = y_to;
		state_target = MOB_STATE.CHASE;
		state_wait_duration = 45;
		state = MOB_STATE.WAIT;
	}
}

function scr_crystal_slime_minion_hurt()
{
	if (++time_passed >= 120)
	{
		time_passed = 0;
		state_target = MOB_STATE.ATTACK;
		state_wait_duration = 15;
		image_index = 0;
		state = MOB_STATE.WAIT;
	}
}

function scr_crystal_slime_minion_hit()
{
	// it's not the bomb that hurts the mob but the explosion
	if (other.object_index == obj_explosion)
	{
		mob_hp = min(15, mob_hp);
		state = MOB_STATE.HURT;
		image_index = 1;
	}
	else
	{
		if (state == MOB_STATE.HURT)
		{
			if (other.object_index == obj_player)
			{
				hurt_slime_minion(obj_player.base_damage, obj_player.id, obj_player.base_knockback / 2);
			}
		}
		else
		{
			hurt_slime_minion(0, other.id, 16);
		}
	}
}

function hurt_slime_minion(_damage, _source, _knockback)
{
	// if not already dying...
	if (state != MOB_STATE.DIE)
	{
		mob_hp -= _damage;
		flash = 1;
			
		// hurt or kill
		if (mob_hp <= 0)
		{
			state = MOB_STATE.DIE;
		}
		
		scr_knockback_mob(_source.x, _source.y, _knockback);
		//var _knock_dir = point_direction(x, y, (_source).x, (_source).y);
		//// subtracting moves away from the source
		//x_to = x - lengthdir_x(_knockback, _knock_dir);
	}
}