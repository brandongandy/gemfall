// Scrip
/// @desc Makes the camera snap to the X coordinate, while following the player
/// along the Y
function scr_camera_snap_x()
{
	if (instance_exists(obj_camera))
	{
		with (obj_camera)
		{
			prev_state = state;
			next_state = "SNAP_X";
		}
	}
}

/// @desc Makes the camera snap to the Y coordinate, while following the player
/// along the X
function scr_camera_snap_y()
{
	if (instance_exists(obj_camera))
	{
		with (obj_camera)
		{
			prev_state = state;
			next_state = "SNAP_Y";
		}
	}
}

function scr_camera_snap()
{
	if (instance_exists(obj_camera))
	{
		with (obj_camera)
		{
			prev_state = state;
			if (prev_state != "SNAP")
			{
				first_snap = true;
			}
			next_state = "SNAP";
		}
	}
}