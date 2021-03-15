/// @description Insert description here
// You can write your code in this editor
if (!global.game_paused)
{
	image_angle = direction;

	if (scr_mob_projectile_collision_strict())
	{
		// TODO: stick arrow in wall for a second, and then destroy
		instance_destroy();
	}
}