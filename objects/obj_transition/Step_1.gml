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
	if (!activated)
	{
		instance_activate_object(obj_journal_item);
		instance_activate_object(obj_inv_gem);
		instance_activate_object(obj_inv_mana);
		instance_activate_object(obj_inv_item);
		activated = true;
	}
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
	if (activated)
	{
		instance_deactivate_object(obj_journal_item);
		instance_deactivate_object(obj_inv_gem);
		instance_deactivate_object(obj_inv_mana);
		instance_deactivate_object(obj_inv_item);
		activated = false;
	}
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