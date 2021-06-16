/// @description Insert description here
// You can write your code in this editor
#region Step Calculation
// must be performed each step - for regular draw GUI stuff

if (global.i_inv.player_money > 0)
{
	if (global.i_inv.player_money < 10)
	{
		money_text = "00" + string(global.i_inv.player_money);
	}
	else if (global.i_inv.player_money < 100)
	{
		money_text = "0" + string(global.i_inv.player_money);
	}
	else
	{
		money_text = string(global.i_inv.player_money);
	}
}

var _keys = global.i_inv.keys[? "Dungeon01"];
if (_keys > 0)
{
	if (_keys >= 10)
	{
		key_count = string(_keys);
	}
	else
	{
		key_count = "0" + string(_keys);
	}
}

mana_g_percent = obj_inventory.mana[MANA_TYPE.EMERALD].Percent() * 30;
mana_r_percent = obj_inventory.mana[MANA_TYPE.RUBY].Percent() * 30;
mana_b_percent = obj_inventory.mana[MANA_TYPE.SAPPHIRE].Percent() * 30;

#endregion


switch (game_state)
{
	case "IN_GAME":
	{
		if (obj_input.start)
		{
			scr_toggle_pause_game(undefined);
			game_state = "INV_TRANSITION";
		}
		if (obj_input.button_l1)
		{
			//scr_toggle_pause_game(true);
			//game_state = "GEM_TRANSITION";
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
		
		hud_key_ypos = ypos + RESOLUTION_H + 14;
		hud_equipped_ypos = ypos + RESOLUTION_H + 20;
		hud_heart_ypos = ypos + RESOLUTION_H + 8;
		hud_money_ypos = ypos + RESOLUTION_H + 14;
		mana_bar_y = ypos + RESOLUTION_H + 11;
		
		break;
	}
	case "IN_INV":
	{
		mouse_pos_x = device_mouse_x_to_gui(0);
		mouse_pos_y = device_mouse_y_to_gui(0);
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
			var _offset = -pi * i / total_items - 0.315;
			var _xx = _center_x + cos(_offset) * 64;
			var _yy = _center_y + sin(_offset) * 64;
			with (instance_create_layer(_center_x, _center_y, "Instances", obj_inv_item))
			{
				for_gem_pick = true;
				gem_index = other.i;
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
		if (obj_input.button_l1 || exit_gem_inv)
		{
			exit_gem_inv = false;
			with (obj_inv_item)
			{
				instance_destroy();
			}
			scr_toggle_pause_game(false);
			game_state = "IN_GAME";
		}
	}
}