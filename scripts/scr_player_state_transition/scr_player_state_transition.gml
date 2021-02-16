// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_state_transition()
{
	// keep moving for a moment while transitioning
	//scr_player_collision();
	scr_player_animate_sprite();
}