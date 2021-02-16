/// @description Cause Room Transition
if (instance_exists(obj_player)) &&
	(position_meeting(obj_player.x, obj_player.y, id))
{
	if (!instance_exists(obj_transition)) && (obj_player.state != scr_player_state_dead)
	{
		global.target_room = target_room;
		global.target_x = target_x;
		global.target_y = target_y;
		if (target_dir != -1)
		{
			global.target_dir = target_dir;
		}
		else
		{
			global.target_dir = obj_player.direction;
		}
		
	
		with (obj_player)
		{
			state = scr_player_state_transition;
		}
	
		scr_room_transition(TRANSITION_TYPE.FADE, target_room);
	
		// double check to make sure we don't accidentally step through this twice on collision
		instance_destroy();
	}
}