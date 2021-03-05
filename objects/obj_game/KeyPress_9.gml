/// @description Insert description here
// You can write your code in this editor

//room_goto(rm_debug);
if (global.debug)
{
  instance_destroy(obj_debug);
	global.debug = false;
	show_debug_overlay(false);
}
else
{
	instance_create_layer(0, 0, "Instances", obj_debug);
	global.debug = true;
	show_debug_overlay(true);
}