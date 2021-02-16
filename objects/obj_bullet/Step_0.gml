/// @description Insert description here
// You can write your code in this editor
if (!global.game_paused)
{
	image_angle = direction;

	if (scr_mob_projectile_collision())
	{
		instance_destroy();
	}

	if (mob_hp <= 0)
	{
		instance_destroy();
	}
}