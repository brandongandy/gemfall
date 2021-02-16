/// @description Insert description here
// You can write your code in this editor
if (entity_shadow)
{
	draw_sprite(spr_shadow, 0, floor(x), floor(y));
}

if (time_to_explode < 120) && ((time_to_explode mod 6 < 2) == 0)
{
	flash = 0.5;
}

if (flash != 0)
{
	shader_set(sha_red_flash);
	shader_set_uniform_f(u_flash, flash);
}

draw_sprite_ext(sprite_index,
	image_index,
	floor(x),
	floor(y - z),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
);

if (shader_current() != -1)
{
	shader_reset();
}
