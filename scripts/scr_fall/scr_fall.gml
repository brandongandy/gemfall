// Scrip
function scr_fall_and_respawn()
{
	//sprite_index = spr_player;
	visible = false;
	if (global.target_room == room)
	{
		x = global.target_x;
		y = global.target_y;
		direction = global.target_dir;
		visible = true;
	}
	else
	{
		scr_room_transition(TRANSITION_TYPE.FADE, global.target_room);
	}
	
	if (global.take_fall_damage)
	{
		scr_hurt_player(direction, 0, 1);
	}
	// just set to true, don't worry about it
	global.take_fall_damage = true;
	direction += 180;
}