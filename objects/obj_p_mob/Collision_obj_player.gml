/// @description
var _can_hit = false;
with (obj_player)
{
	if (move_distance_remaining <= 0)
	{
		_can_hit = true;
	}
}

if (state == MOB_STATE.DIE)
{
	_can_hit = false;
	entity_collides = false;
}

if (_can_hit)
{
	scr_hurt_player(point_direction(x, y, obj_player.x, obj_player.y), mob_force_touch, mob_damage_touch);	
}