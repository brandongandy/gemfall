// input
key_left = obj_input.left;
key_right = obj_input.right;
key_up = obj_input.up;
key_down = obj_input.down;
key_activate = obj_input.button_a;
key_attack = obj_input.button_b;
key_item = obj_input.button_x;
key_gem = obj_input.button_y;

// movement
input_direction = point_direction(0, 0, key_right - key_left, key_down - key_up);
input_magnitude = (key_right - key_left != 0) || (key_down - key_up != 0);

if (!global.game_paused)
{
	script_execute(state);
	if (invulnerable > 0)
	{
		invulnerable = max(invulnerable - 1, 0);
		flash = max(flash - 0.05, 0);
	}
	
	if (status_effect != -1)
	{
		script_execute(status_effect);
	}
	
	// entity shake
	if (shake_enabled)
	{
		x += random_range(-shake_remain, shake_remain);
		y += random_range(-shake_remain, shake_remain);

		shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));
		if (shake_remain <= 0)
		{
			x = start_x;
			y = start_y;
			start_x = 0;
			start_y = 0;
			shake_enabled = false;
		}
	}
}

depth = -(bbox_bottom - player_height);