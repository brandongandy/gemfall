/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (mob_execute_death_script)
{
	if (mob_death_script != -1)
	{
		scr_execute_array(mob_death_script, mob_death_script_args);
	}
}