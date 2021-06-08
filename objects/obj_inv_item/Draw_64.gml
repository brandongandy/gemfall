/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index,
	image_index,
	floor(x),
	floor(y),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
);

if (item_sprite != -1)
{
	draw_sprite(item_sprite, 0, floor(x), floor(y));
}