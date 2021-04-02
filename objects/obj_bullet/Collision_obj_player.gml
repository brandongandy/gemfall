/// @description Insert description here
// You can write your code in this editor

var _can_hurt = false;
if (instance_exists(obj_player))
{
	with (obj_player)
	{
		if (!attacking)
		{
			_can_hurt = true;
		}
	}
}

if (_can_hurt)
{
	scr_hurt_player(point_direction(x, y, obj_player.x, obj_player.y), mob_force_touch, mob_damage_touch);
}

instance_destroy();