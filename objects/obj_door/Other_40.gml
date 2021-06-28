/// @description Insert description here
// You can write your code in this editor
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