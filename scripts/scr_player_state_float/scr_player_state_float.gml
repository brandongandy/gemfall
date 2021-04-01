// Scrip
function scr_player_state_float()
{
	// first, make the player "bob" in place
	z = 6 + (2 * sin(0.01 * current_time));
	
	// movement
	h_speed = lengthdir_x(input_magnitude * walk_speed, input_direction);
	v_speed = lengthdir_y(input_magnitude * walk_speed, input_direction);
	scr_player_collision();
	
	// Sprite update
	var old_sprite = sprite_index;
	if (input_magnitude != 0)
	{
		move_distance_remaining++;
		if (move_distance_remaining mod 16 == 0)
		{
			show_debug_message(string(move_distance_remaining));
			move_distance_remaining = 0;
			if (!scr_spend_mana(
				global.i_inv.inv_gems[# GEM.SKYRIDER, INVENTORY_STAT.MANA_TYPE],
				global.i_inv.inv_gems[# GEM.SKYRIDER, INVENTORY_STAT.MANA_COST]))
			{
				z = 0;
				if (player_height == 6 || player_height == 7)
				{
					x = start_x;
					y = start_y;
				}
				state = scr_player_state_free;
			}
		}
		direction = input_direction;
		sprite_index = sprite_run;
	}
	else
	{
		sprite_index = sprite_idle;
	}

	if (old_sprite != sprite_index)
	{
		local_frame = 0;
	}

	// update image index
	scr_player_animate_sprite();
	
	// highlight them?
	
	// consume mana on non-normal tiles, but not on normal tiles?
	// track distance traveled here, instead of in collision
	
	if (global.input.button_y)
	{
		z = 0;
		if (player_height >= 5 && player_height <= 7)
		{
			x = start_x;
			y = start_y;
		}
		state = scr_player_state_free;
	}
}