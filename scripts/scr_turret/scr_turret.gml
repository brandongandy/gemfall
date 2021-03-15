// Scrip
function scr_turret_block_idle()
{
	target = noone;
	image_index = 0;
	var _centerX = (x + bbox_right) / 2;
	var _centerY = (y + bbox_bottom) / 2;
	if (++aggro_check_elapsed >= aggro_check_duration)
	{
		aggro_check_elapsed = 0;
		if (instance_exists(obj_player)) &&
			(point_distance(_centerX, _centerY, obj_player.x, obj_player.y) <= mob_aggro_radius)
		{
			target = obj_player;
			state_target = MOB_STATE.ATTACK;
			state = MOB_STATE.WAIT;
		}
		else
		{
			target = noone;
			state_target = MOB_STATE.IDLE;
			state = MOB_STATE.WAIT;
		}
	}
}

function scr_turret_block_attack()
{
	if (target != noone)
	{
		image_index = 2;
		var _centerX = x;
		var _centerY = y - 8;
		var bullet_dir = point_direction(_centerX, _centerY, target.x, target.y);
		var new_bullet = instance_create_layer(_centerX, _centerY, "Instances", obj_bullet);
		with (new_bullet)
		{
			direction = bullet_dir;
		}
		target = noone;
	}
	
	image_index = 0;
	state_target = MOB_STATE.IDLE;
	state = MOB_STATE.WAIT;
}

function scr_turret_block_die()
{
	image_index = 1;
}

function scr_turret_hurt()
{
	state = MOB_STATE.IDLE;
}