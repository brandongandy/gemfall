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

if (global.i_inv.current_quest.is_dungeon)
{
	var _keys = global.i_inv.current_quest.keys;
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
}

if (global.i_inv.mana[MANA_TYPE.EMERALD].can_use)
{
	draw_emerald = true;
	mana_g_percent = obj_inventory.mana[MANA_TYPE.EMERALD].Percent() * 30;
}
if (global.i_inv.mana[MANA_TYPE.RUBY].can_use)
{
	draw_ruby = true;
	mana_r_percent = obj_inventory.mana[MANA_TYPE.RUBY].Percent() * 30;	
}
if (global.i_inv.mana[MANA_TYPE.SAPPHIRE].can_use)
{
	draw_sapphire = true;
	mana_b_percent = obj_inventory.mana[MANA_TYPE.SAPPHIRE].Percent() * 30;	
}

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
		if (obj_input.pause)
		{
			scr_toggle_pause_game(true);
			game_state = "PAUSE";
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
	case "PAUSE":
	{
		mouse_pos_x = device_mouse_x_to_gui(0);
		mouse_pos_y = device_mouse_y_to_gui(0);
		event_user(0);
		if (obj_input.pause)
		{
			pause_menu = false;
			with(obj_button)
			{
				instance_destroy();
			}
			scr_toggle_pause_game(false);
			game_state = "IN_GAME";
		}
	}
}