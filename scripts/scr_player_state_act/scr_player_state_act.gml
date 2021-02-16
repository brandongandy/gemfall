// @desc Perform an action and animate it
function scr_player_state_act()
{
	scr_player_animate_sprite();
	if (animation_end)
	{
		if (next_state != -1)
		{
			state = next_state;
			next_state = -1;
		}
		else
		{
			state = scr_player_state_free;
		}
		animation_end = false;
		if (animation_end_script != -1)
		{
			script_execute(animation_end_script);
			animation_end_script = -1;
		}
	}
}