// Scrip
function scr_player_state_jump()
{
	// get the target tile index and jump to it
	var _target_tile = -1;
	var _target_x;
	var _target_y;
	var _iteration = 0;
	while (true)
	{
		if (direction == 0)
		{
			_target_x = bbox_right + (COL_TILE * _iteration);
			_target_y = y;
			move_distance_remaining = point_distance(bbox_right, y, _target_x, _target_y);
			var _tile = tile_get_index(tilemap_get_at_pixel(height_map, _target_x, _target_y));
			if (_tile == 5) ||
				 (_tile == 6) ||
				 (_tile == 7) // ignore walls and doors -- everything else is
			{								// a potential target
				if (_iteration > 6)
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
				break;
			}
		}
		else if (direction == 90)
		{
			_target_x = x;
			_target_y = bbox_top - (COL_TILE * _iteration);
			move_distance_remaining = point_distance(x, bbox_top, _target_x, _target_y);
			var _tile = tile_get_index(tilemap_get_at_pixel(height_map, _target_x, _target_y));
			if (_tile == 5) ||
				 (_tile == 6) ||
				 (_tile == 7) // ignore walls and doors -- everything else is
			{								// a potential target
				if (_iteration > 6)
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
				break;
			}		
		}
		else if (direction == 180)
		{
			_target_x = bbox_left - (COL_TILE * _iteration);
			_target_y = y;
			move_distance_remaining = point_distance(bbox_left, y, _target_x, _target_y);
			var _tile = tile_get_index(tilemap_get_at_pixel(height_map, _target_x, _target_y));
			if (_tile == 5) ||
				 (_tile == 6) ||
				 (_tile == 7) // ignore walls and doors -- everything else is
			{								// a potential target
				if (_iteration > 6)
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
				break;
			}
		}
		else if (direction == 270)
		{
			_target_x = x;
			_target_y = bbox_bottom + (COL_TILE * _iteration + 1);
			move_distance_remaining = point_distance(x, bbox_bottom, _target_x, _target_y);
			var _tile = tile_get_index(tilemap_get_at_pixel(height_map, _target_x, _target_y));
			if (_tile >= 5 && _tile <= 7) // ignore walls and doors -- everything else is
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
				break;
			}
		}
		else
		{
			break;
		}
	}
	
	// if it's walkable, go to free
	if (_target_tile >= 1 && _target_tile <= 5)
	{
		move_distance_remaining = max(0, move_distance_remaining - walk_speed);
		z = sin(((move_distance_remaining / 32) * pi)) * 12;
		h_speed = lengthdir_x(walk_speed, direction);
		v_speed = lengthdir_y(walk_speed, direction);
		x += h_speed;
		y += v_speed;
				
		if (move_distance_remaining <= 0)
		{
			state = scr_player_state_free;
		}
	}
	
	// if it's a pit, fall
	
}