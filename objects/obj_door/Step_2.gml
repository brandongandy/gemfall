/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (inc++ >= 4)
{
	inc = 0;
	if (auto_check_script) &&
		(door_activate_script != -1)
	{
		scr_execute_array(door_activate_script, door_activate_args);
	}
}

if (open)
{
	if (door_open_anim != -1)
	{
		sprite_index = door_open_anim;
		image_speed = 1.0;
		if (image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number)
		{
			instance_destroy();
		}
	}
	else
	{
		instance_destroy();
	}
	
	entity_collides = false;
	
	if (target_x != 0) &&
		(target_y != 0) &&
		(target_room != 0)
	{
		var _newX = x - (sprite_width / 2);
		var _newY = y - (sprite_height / 2);
		var inst = instance_create_layer(_newX, _newY, "Instances", obj_room_exit);
		inst.target_x = target_x;
		inst.target_y = target_y;
		inst.target_room = target_room;
		inst.target_dir = target_dir;
	}
}
