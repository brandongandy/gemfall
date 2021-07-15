/// @description 
//draw_sprite(spr_shadow, 0, floor(x), floor(y));


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


// every 8 frames, flash/do thing
if (invulnerable != 0) && ((invulnerable mod 6 < 2) == 0)
	&& (flash == 0)
{
	// skip drawing
}
else
{
	if (flash != 0)
	{
		shader_set(flash_shader);
		u_flash = shader_get_uniform(flash_shader, "flash");
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
	
	// if height == 13, draw water splashing at feet
	
	if (shader_current() != -1)
	{
		shader_reset();
	}
}