// Scrip
function scr_player_state_hold_item()
{
	with (global.held_item)
	{
		instance_destroy();
	}
	global.held_item = noone;
	sprite_idle = spr_player;
	state = last_state;
}