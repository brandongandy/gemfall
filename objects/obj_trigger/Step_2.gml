/// @description Process player collision
event_inherited();
if (instance_exists(obj_player))
{
	if (player_entered)
	{
		// we collided, so set enter to true
		
		// now trigger enter event if there
		if (trigger_on_enter != -1)
		{
			scr_execute_array(trigger_on_enter, trigger_on_enter_args);
			//script_execute(trigger_on_enter);
		}
		
		if !(position_meeting(obj_player.x, obj_player.x, id))
		{
			player_exited = true;
			player_entered = false;
		}
	}
	
	if (player_exited)
	{
		player_entered = false;
		player_exited = false;
		if (trigger_on_exit != -1)
		{
			scr_execute_array(trigger_on_exit, trigger_on_exit_args);
			//script_execute(trigger_on_exit);
		}
	}
	else
	{
		player_entered = false;
	}
}