// Scrip
function scr_player_state_jump()
{
	// get the target tile index and jump to it
	var _target_tile = -1;
	var _iteration = 0;
	while (!jump_tile_found)
	{
		if (jump_direction == 10)
		{
			target_x = bbox_right + sprite_width + (COL_TILE * _iteration + 1);
			target_y = y;
			move_distance_remaining = point_distance(bbox_right, y, target_x, target_y);
			var _tile = tile_get_index(tilemap_get_at_pixel(height_map, target_x, target_y));
			if (_tile >= 5 && _tile <= 12) // ignore walls and doors -- everything else is
			{								// a potential target
				if (_iteration > 8)
				{
					// leave this state
					state = scr_player_state_free;
					break;
				}
				else
				{
					_iteration++;
				}
			}
			else
			{
				_target_tile = _tile;
				jump_tile_found = true;
				break;
			}
		}
		else if (jump_direction == 11)
		{
			target_x = x;
			target_y = bbox_top - sprite_height - (COL_TILE * _iteration + 1);
			move_distance_remaining = point_distance(x, bbox_top, target_x, target_y);
			var _tile = tile_get_index(tilemap_get_at_pixel(height_map, target_x, target_y));
			if (_tile >= 5 && _tile <= 12) // ignore walls and doors -- everything else is
			{								// a potential target
				if (_iteration > 8)
				{
					// leave this state
					state = scr_player_state_free;
					break;
				}
				else
				{
					_iteration++;
				}
			}
			else
			{
				_target_tile = _tile;
				jump_tile_found = true;
				break;
			}		
		}
		else if (jump_direction == 12)
		{
			target_x = bbox_left - sprite_width - (COL_TILE * _iteration + 1);
			target_y = y;
			move_distance_remaining = point_distance(bbox_left, y, target_x, target_y);
			var _tile = tile_get_index(tilemap_get_at_pixel(height_map, target_x, target_y));
			if (_tile >= 5 && _tile <= 12) // ignore walls and doors -- everything else is
			{								// a potential target
				if (_iteration > 8)
				{
					// leave this state
					state = scr_player_state_free;
					break;
				}
				else
				{
					_iteration++;
				}
			}
			else
			{
				_target_tile = _tile;
				jump_tile_found = true;
				break;
			}
		}
		else if (jump_direction == 9)
		{
			target_x = x;
			target_y = bbox_bottom + sprite_height + (COL_TILE * _iteration + 1);
			move_distance_remaining = point_distance(x, bbox_bottom, target_x, target_y);
			var _tile = tile_get_index(tilemap_get_at_pixel(height_map, target_x, target_y));
			if (_tile >= 5 && _tile <= 12) // ignore walls and doors -- everything else is
			{								// a potential target
				if (_iteration > 8)
				{
					// leave this state
					state = scr_player_state_free;
					break;
				}
				else
				{
					_iteration++;
				}
			}
			else
			{
				_target_tile = _tile;
				jump_tile_found = true;
				break;
			}
		}
		else
		{
			break;
		}
	}
	
	// if it's walkable, go to free
	if (jump_tile_found)
	{
		var _target_dir = point_direction(x, y, target_x, target_y);
		//switch (jump_direction)
		//{
		//	case 9:
		//		_target_dir = 270;
		//		break;
		//	case 10:
		//		_target_dir = 0;
		//		break;
		//	case 11:
		//		_target_dir = 90;
		//		break;
		//	case 12:
		//	  _target_dir = 180;
		//		break;
		//}		
		var _distance_left = point_distance(x, y, target_x, target_y);
		var _speed_this_frame = walk_speed;
		if (_distance_left < walk_speed)
		{
			_speed_this_frame = _distance_left;
		}
		move_distance_remaining = max(0, move_distance_remaining - walk_speed);
		z = sin(((move_distance_remaining / 32) * pi)) * 12;
		h_speed = lengthdir_x(_speed_this_frame, _target_dir);
		v_speed = lengthdir_y(_speed_this_frame, _target_dir);
		x += h_speed;
		y += v_speed;
		
		if (_distance_left <= walk_speed ||
			(x == target_x && y == target_y))
		{
			state = scr_player_state_free;
			jump_tile_found = false;
		}
	}
	
	// if it's a pit, fall
	
}