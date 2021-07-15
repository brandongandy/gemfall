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

function scr_player_animate_sprite_one_dir()
{
	// update sprite
	// using different script just in case?
	var total_frames = sprite_get_number(sprite_index);
	image_index = local_frame;
	local_frame += sprite_get_speed(sprite_index) / FRAME_RATE;

	// if anim would loop on next step
	if (local_frame >= total_frames)
	{
		animation_end = true;
		local_frame -= total_frames;
		local_frame = clamp(local_frame, 0, sprite_get_number(sprite_index));
	}
	else
	{
		animation_end = false;
	}
}

function scr_mob_animate_sprite()
{
	// update sprite
	// using different script just in case?
	var total_frames = sprite_get_number(sprite_index) / 4;
	image_index = local_frame + (CARDINAL_DIR * total_frames);
	local_frame += sprite_get_speed(sprite_index) / FRAME_RATE;

	// if anim would loop on next step
	if (local_frame >= total_frames)
	{
		animation_end = true;
		local_frame -= total_frames;
		local_frame = clamp(local_frame, 0, sprite_get_number(sprite_index));
	}
	else
	{
		animation_end = false;
	}
}

function scr_mob_animate_sprite_one_dir()
{
	// update sprite
	// using different script just in case?
	var total_frames = sprite_get_number(sprite_index);
	image_index = local_frame;
	local_frame += sprite_get_speed(sprite_index) / FRAME_RATE;

	// if anim would loop on next step
	if (local_frame >= total_frames)
	{
		animation_end = true;
		local_frame -= total_frames;
		local_frame = clamp(local_frame, 0, sprite_get_number(sprite_index));
	}
	else
	{
		animation_end = false;
	}
}