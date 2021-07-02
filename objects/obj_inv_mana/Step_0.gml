if (obj_ui.game_state == "IN_GAME")
{
	exit;
}

if (!gem.can_use)
{
	exit;
}

base_x = obj_ui.xpos;
base_y = obj_ui.ypos;
x = base_x + x_offset;
y = base_y + y_offset;

if (gem.mana < 100)
{
	if (gem.mana < 10)
	{
		mana_count_str = "x 0" + string(gem.mana);
	}
	else
	{
		mana_count_str = "x " + string(gem.mana);
	}
}
else
{
	mana_count_str = "x" + string(gem.mana);
}

if (obj_ui.game_state == "IN_INV")
{
	if (point_in_rectangle(obj_ui.mouse_pos_x, obj_ui.mouse_pos_y,
		bbox_left, bbox_top, bbox_right, bbox_bottom))
	{
		if (gem.can_use)
		{
			highlight = true;
		  hover = true;
			depth = -10001;
	
			if (mouse_check_button_released(mb_left))
			{
				gem.Imbue();
			}
		}
	}
	else
	{
		depth = -10000;
		hover = false;
		if (gem.can_use &&
			  obj_inventory.equipped_mana == gem)
		{
			highlight = true;
		}
		else
		{
			highlight = false;
		}
	}
}
else
{
	hover = false;
	highlight = false;
}