if (obj_ui.game_state == "IN_GAME")
{
	exit;
}

if (item.item_index == ITEM.NONE)
{
	exit;
}

base_x = obj_ui.xpos;
base_y = obj_ui.ypos;
x = base_x + x_offset;
y = base_y + y_offset;

if (obj_ui.game_state == "IN_INV")
{
	if (point_in_rectangle(obj_ui.mouse_pos_x, obj_ui.mouse_pos_y,
		bbox_left, bbox_top, bbox_right, bbox_bottom))
	{
		if (item.item_index != ITEM.NONE)
		{
		  highlight = true;
			hover = true;
			depth = -10001;
	
			if (mouse_check_button_released(mb_left))
			{
				item.Equip();
			}
		}
	}
	else
	{
		depth = -10000;
		hover = false;
		if (item.item_index != ITEM.NONE &&
			  obj_inventory.equipped == item)
		{
			highlight = true;
		}
		else
		{
			highlight = false;
		}
	}
}
