/// @description Insert description here
// You can write your code in this editor

switch (game_state)
{
	case "IN_GAME":
	{
		// process as normal -- 
		if (obj_input.start)
		{
			scr_toggle_pause_game(undefined);
			game_state = "INV_TRANSITION";
		}
		if (obj_input.button_l1)
		{
			scr_toggle_pause_game(true);
			game_state = "GEM_TRANSITION";
		}
		break;
	}
	case "INV_TRANSITION":
	{
		menu_speed = 8;
		
		if (!inv_open)
		{
			ypos += menu_speed;
			var y_target = 0;
			if (ypos == y_target)
			{
				// finished opening - we're inside inventory now
				inv_open = true;
				game_state = "IN_INV";
			}
		}
		else
		{
			ypos -= menu_speed;
			var y_target = -RESOLUTION_H;
			if (ypos == y_target)
			{
				inv_open = false;
				game_state = "IN_GAME";
			}
		}
		
		hud_key_ypos = ypos + RESOLUTION_H + 10;
		hud_equipped_ypos = ypos + RESOLUTION_H + 8 + 16;
		hud_heart_ypos = ypos + RESOLUTION_H + 12;
		hud_money_ypos = ypos + RESOLUTION_H + 10;
		
		break;
	}
	case "IN_INV":
	{
		if (obj_input.start)
		{
			scr_toggle_pause_game(undefined);
			game_state = "INV_TRANSITION";
		}
		break;
	}
	case "GEM_TRANSITION":
	{
		for (i = 0; i < total_items; i++)
		{
			var _offset = 2.0 * pi * i / total_items;
			var _xx = _center_x + cos(_offset) * 64;
			var _yy = _center_y + sin(_offset) * 64;
			with (instance_create_layer(_center_x, _center_y, "Instances", obj_inv_item))
			{
				x_to = _xx;
				y_to = _yy
			}
			//instance_create_layer(_xx, _yy, "Instances", obj_inv_item);
		}
		game_state = "IN_GEM_INV";
		break;
	}
	case "IN_GEM_INV":
	{
		if (obj_input.button_l1)
		{
			with (obj_inv_item)
			{
				instance_destroy();
			}
			scr_toggle_pause_game(false);
			game_state = "IN_GAME";
		}
	}
}