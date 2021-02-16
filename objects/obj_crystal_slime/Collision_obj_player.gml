/// @description Insert description here
// You can write your code in this editor
var _can_hit = true;
if (z > 0)
{
	_can_hit = false;
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