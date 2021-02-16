/// @description Insert description here
// You can write your code in this editor

switch (game_state)
{
	case "IN_GAME":
	{
		// process as normal -- 
		if (obj_input.start)
		{
			scr_pause_game();
			game_state = "INV_TRANSITION";
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
			scr_pause_game();
			game_state = "INV_TRANSITION";
		}
		break;
	}
}