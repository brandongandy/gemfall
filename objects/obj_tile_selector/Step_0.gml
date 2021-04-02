/// @description Insert description here
// You can write your code in this editor
key_left = obj_input.left_released;
key_right = obj_input.right_released;
key_up = obj_input.up_released;
key_down = obj_input.down_released;
key_activate = obj_input.button_a;


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
		var _can_teleport = true;
		// first determine if we can actually teleport here
		if (scr_tile_collide_at_points_projectile(collision_map,
			[bbox_left, bbox_top], [bbox_right, bbox_bottom]) || 
			collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom,
				obj_p_entity, false, true))
		{
			_can_teleport = false;
			var inst = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom,
				obj_p_entity, false, true);
			if (inst != noone)
			{
				if (inst.object_index == obj_fall)
				{
					_can_teleport = true;
				}
			}
			// TODO: if the collision entity is liftable, and we can lift it, then it's
			// ok to teleport onto
			if !(_can_teleport)
			{
				scr_shake_entity(30, 1);
			}
		}
		if (_can_teleport)
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
					//if (scr_tile_collide_at_points_height(height_map,
					//	[bbox_left, bbox_top], [bbox_right, bbox_bottom]))
					//{
					//	x = start_x;
					//	y = start_y;
					//	scr_shake_entity(30, 1);
					//	scr_add_mana(other.base_mana, _travel_distance * other.base_cost);
					
					//}
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
}