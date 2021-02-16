/// @description draw the sprite
draw_sprite_ext(sprite_index,
	image_index,
	// floor may not be necessary here but keep it for now
	floor(x),
	floor(y - z),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)