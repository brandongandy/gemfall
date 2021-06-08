/// @description Insert description here
// You can write your code in this editor
if (x_to > 0)
{
	var _distance_to_go = point_distance(x, y, x_to, y_to);
	if (_distance_to_go > 2)
	{
		dir = point_direction(x, y, x_to, y_to);
		h_speed = lengthdir_x(4, dir);
		v_speed = lengthdir_y(4, dir);
		x += h_speed;
		y += v_speed;
	}
}

var _mouse_pos_x = device_mouse_x_to_gui(0);
var _mouse_pos_y = device_mouse_y_to_gui(0);

var _gem = -1;
if (gem_index != -1)
{
	var _gem = scr_get_equippable_gem_by_index(gem_index);
}
if (point_in_rectangle(_mouse_pos_x, _mouse_pos_y,
	bbox_left, bbox_top, bbox_right, bbox_bottom))
{
	image_index = 1;
	
	if (mouse_check_button(mb_left))
	{
		image_index = 0;
	}
	
	if (mouse_check_button_released(mb_left))
	{
		if (gem_index != -1)
		{
			if (scr_player_has_gem(_gem))
			{
				obj_inventory.equipped_gem = _gem;
				obj_ui.exit_gem_inv = true;
			}
		}
	}
}
else
{
	image_index = 0;
}

if (for_gem_pick)
{
	if (gem_index != -1)
	{
		if (scr_player_has_gem(_gem))
		{
			item_sprite = scr_get_sprite_for_gem(_gem);
		}
	}
}