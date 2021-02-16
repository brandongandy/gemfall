function scr_player_animate_sprite()
{
	// update sprite
	var total_frames = sprite_get_number(sprite_index) / 4;
	image_index = local_frame + (CARDINAL_DIR * total_frames);
	local_frame += sprite_get_speed(sprite_index) / FRAME_RATE;

	// if anim would loop on next step
	if (local_frame >= total_frames)
	{
		animation_end = true;
		local_frame -= total_frames;
	}
	else
	{
		animation_end = false;
	}
}