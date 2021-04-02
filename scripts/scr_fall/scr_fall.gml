// Scrip
function scr_fall_and_respawn()
{
	sprite_index = spr_player;
	if (global.target_room == room)
	{
		x = global.target_x;
		y = global.target_y;
		direction = global.target_dir;
	}
	else
	{
		// TODO: stop player animating while transitioning
		scr_room_transition(TRANSITION_TYPE.FADE, global.target_room);
	}
				
	scr_hurt_player(direction, 0, 1);
	direction += 180;
}