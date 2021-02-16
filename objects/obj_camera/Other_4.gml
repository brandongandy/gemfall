/// @description Center on Player
if (instance_exists(obj_player))
{
	if (instance_exists(obj_camera_snap))
	{
		prev_state = "SNAP";
	}
	else
	{
		prev_state = "FOLLOW";
	}
	state = "ROOM_ENTER";
}