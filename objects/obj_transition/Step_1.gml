/// @description Start transition
with (obj_player)
{
	if (state != scr_player_state_dead)
	{
		state = scr_player_state_transition;
	}
}

if (leading == TRANSITION_OUT)
{
	percent = min(1, percent + TRANSITION_SPEED);
	if (percent >= 1)
	{
		// screen is obscured
		room_goto(target_room);
		leading = TRANSITION_IN;
	}
}
else
{
	percent = max(0, percent - TRANSITION_SPEED);
	if (percent <= 0)
	{
		with (obj_player)
		{
			state = scr_player_state_free;
		}
		// screen is revealed
		instance_destroy();
		
	}
}