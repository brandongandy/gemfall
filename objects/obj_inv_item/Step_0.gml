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

if (point_in_rectangle(_mouse_pos_x, _mouse_pos_y,
	bbox_left, bbox_top, bbox_right, bbox_bottom))
{
	image_index = 1;
	
	if (mouse_check_button(mb_left))
	{
		image_index = 0;
	}
}
else
{
	image_index = 0;
}

if (for_gem_pick)
{
	switch (gem_index)
	{
		case 0:
			if (scr_player_has_gem(GEM.EXEMPLAR))
			{
				item_sprite = spr_gem_exemplar;
			}
			break;
		case 1:
			if (scr_player_has_gem(GEM.SCREAMING))
			{
				item_sprite = spr_gem_screaming;
			}
			break;
		case 2:
			if (scr_player_has_gem(GEM.SIREN))
			{
				item_sprite = spr_gem_siren;
			}
			break;
		case 3:
			if (scr_player_has_gem(GEM.SKYRIDER))
			{
				item_sprite = spr_gem_skyrider;
			}
			break;
		case 4:
			if (scr_player_has_gem(GEM.TRAVELER))
			{
				item_sprite = spr_gem_traveler;
			}
			break;
		default:
			item_sprite = -1;
			break;
	}
}