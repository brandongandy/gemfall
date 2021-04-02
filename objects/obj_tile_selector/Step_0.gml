/// @description Insert description here
// You can write your code in this editor
key_left = obj_input.left_released;
key_right = obj_input.right_released;
key_up = obj_input.up_released;
key_down = obj_input.down_released;
key_activate = obj_input.button_y;


if (!global.game_paused)
{
	if (key_left)
	{
		x -= TILE_SIZE;
	}
	else if (key_right)
	{
		x += TILE_SIZE;
	}
	else if (key_up)
	{
		y -= TILE_SIZE;
	}
	else if (key_down)
	{
		y += TILE_SIZE;
	}
	
	if (key_activate)
	{
		// get distance in tiles
		var _travel_distance = point_distance(x, y, obj_player.x, obj_player.y) / TILE_SIZE;
		if (scr_spend_mana(base_mana, _travel_distance * base_cost))
		{
			// travel
			// destroy me
			with (obj_player)
			{
				var bbox_height = (bbox_bottom-bbox_top);
				// center player on tile
				x = other.x;
				y = other.y + (bbox_height / 2);
				state = scr_player_state_free;
			}
			
			instance_destroy();
		}
		else
		{
			// play sound?
			scr_shake_entity(30, 1);
		}
	}
}