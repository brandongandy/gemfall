// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_state_roll()
{
	// movement
	h_speed = lengthdir_x(roll_speed, direction);
	v_speed = lengthdir_y(roll_speed, direction);

	move_distance_remaining = max(0, move_distance_remaining - roll_speed);

	var _collided = scr_player_collision();
	
	// update sprite
	sprite_index = sprite_roll;
	var total_frames = sprite_get_number(sprite_index) / 4;
	image_index = (CARDINAL_DIR * total_frames) + 
		min(((1 - (move_distance_remaining / roll_distance)) * total_frames), total_frames - 1);
	
	// change state
	if (move_distance_remaining <= 0)
	{
		state = scr_player_state_free;
	}
	
	if (_collided)
	{
		state = scr_player_state_bonk;
		move_distance_remaining = bonk_distance;
		scr_screen_shake(2, 30);
	}
}