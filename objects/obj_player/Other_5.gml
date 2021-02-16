/// @description Insert description here
// You can write your code in this editor
if (state = scr_player_state_dead)
{
	// if we're dead at the end of the room, game over, reset health
	global.i_inv.player_health = global.i_inv.player_health_max;
}