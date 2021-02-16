/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (thrown)
{
	start_countdown = true;
}

if (start_countdown)
{
	time_to_explode--;
	if (time_to_explode <= 0)
	{
		instance_destroy();
	}
}