/// @description Don't Process
/// We don't want to process entity events if they're
/// outside the viewport. So, set them to inactive to skip processing
/// and drawing.
/// Only pause on the SNAP state, however
if (global.i_camera.state == "SNAP")
{
	active = false;
	if (mob_script[MOB_STATE.IDLE] != -1)
	{
		state = MOB_STATE.IDLE;
	}
	else if (mob_script[MOB_STATE.WANDER] != -1)
	{
		state = MOB_STATE.WANDER;
	}
}