/// @description Insert description here
// You can write your code in this editor
if (entity_shadow)
{
	draw_sprite(spr_shadow, 0, floor(x), bottom_y);
}

if (is_important)
{
	draw_sprite(spr_indicator, 0, floor(x), indicator_y);
}

if (flash != 0)
{
	shader_set(sha_white_flash);
	shader_set_uniform_f(u_flash, flash);
}

if (global.debug)
{
	image_alpha = 0.1;
	draw_set_alpha(0.5);
	draw_rectangle_colour(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red,c_red,c_red,c_red,false);
}
else
{
	if (image_alpha != 1.0)
	{
		image_alpha = 1.0;
	}
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