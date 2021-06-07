/// @description Insert description here
// You can write your code in this editor
//surface_set_target(obj_ui.overlay_surface);
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

//surface_reset_target();
//draw_surface(obj_ui.overlay_surface, 0, 0);