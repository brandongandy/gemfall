/// @description Insert description here
// You can write your code in this editor
if (!draw_gui)
{
	exit;
}

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

if (global.i_inv.current_quest != -1 && global.i_inv.current_quest.is_dungeon)
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

if (global.current_room != -1)
{
	location_str = global.current_room;
}

#endregion


switch (game_state)
{
	case "IN_GAME":
	{
		global.i_mouse.draw_hand = false;
		
		if (!deactivated)
		{
			instance_deactivate_object(obj_inv_gem);
			instance_deactivate_object(obj_inv_mana);
			instance_deactivate_object(obj_inv_item);
			deactivated = true;
		}
		
		if (obj_input.start)
		{
			instance_activate_object(obj_inv_gem);
			instance_activate_object(obj_inv_mana);
			instance_activate_object(obj_inv_item);
			
			scr_toggle_pause_game(undefined);
			game_state = "INV_TRANSITION";
			global.i_mouse.draw_hand = true;
		}
		if (obj_input.pause)
		{
			scr_toggle_pause_game(true);
			game_state = "PAUSE";
			global.i_mouse.draw_hand = true;
		}
		break;
	}
	case "INV_TRANSITION":
	{
		deactivated = false;
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
		
		hud_key_ypos = ypos + RESOLUTION_H + 6;
		hud_equipped_ypos = ypos + RESOLUTION_H + 11;
		hud_heart_ypos = ypos + RESOLUTION_H + 8;
		hud_money_ypos = ypos + RESOLUTION_H + 6;
		mana_bar_y = ypos + RESOLUTION_H + 9;
		location_y = ypos + 100;
		
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
	case "PAUSE":
	{
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