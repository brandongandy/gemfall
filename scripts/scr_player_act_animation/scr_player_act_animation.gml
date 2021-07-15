/// @function scr_player_act_animation(_sprite, _end_script)
/// @param _sprite
/// @param _end_script
/// @desc carry out animation and set the player's end script to the provided end script
function scr_player_act_animation(_sprite, _end_script)
{
	if (_end_script != undefined)
	{
		animation_end_script = _end_script;
	}
	sprite_index = _sprite;
	
	//local_frame = 0;
	//image_index = 0;
	state = scr_player_state_act;
	//scr_player_animate_sprite();
}

function scr_player_act_animation_one_dir(_sprite, _end_script)
{
	if (_end_script != undefined)
	{
		animation_end_script = _end_script;
	}
	sprite_index = _sprite;
	
	//local_frame = 0;
	//image_index = 0;
	state = scr_player_state_act_one_dir;
	//scr_player_animate_sprite();
}