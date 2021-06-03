// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_state_bonk()
{
	// movement
	h_speed = lengthdir_x(bonk_speed, direction - 180);
	v_speed = lengthdir_y(bonk_speed, direction - 180);

	move_distance_remaining = max(0, move_distance_remaining - bonk_speed);
	
	if (scr_player_collision())
	{
		move_distance_remaining = 0;
	}
	
	// update sprite
	sprite_index = spr_player_hurt;
	image_index = CARDINAL_DIR - 2;
	
	// change height
	z = sin(((move_distance_remaining / bonk_distance) * pi)) * bonk_distance_height;
	
	// change state
	if (move_distance_remaining <= 0)
	{
		state = scr_player_state_free;
	}
}