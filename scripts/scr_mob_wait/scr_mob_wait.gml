// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_mob_wait()
{
	if (++state_wait_elapsed >= state_wait_duration)
	{
		state_wait_elapsed = 0;
		state = state_target;
	}
}