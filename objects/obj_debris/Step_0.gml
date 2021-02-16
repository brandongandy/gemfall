/// @description Insert description here
// You can write your code in this editor
//image_alpha -= 0.075;
//if (image_alpha <= 0)
//{
//	instance_destroy();
//}	
if (image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number)
{
	instance_destroy();
}