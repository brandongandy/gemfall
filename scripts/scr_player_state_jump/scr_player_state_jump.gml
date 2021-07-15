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
		if (jump_direction == 10)
		{
			_target_x = bbox_right + sprite_width + (COL_TILE * _iteration);
			_target_y = y;
			move_distance_remaining = point_distance(bbox_right, y, _target_x, _target_y);
			var _tile = tile_get_index(tilemap_get_at_pixel(height_map, _target_x, _target_y));
			if (_tile >= 5 && _tile <= 12) // ignore walls and doors -- everything else is
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
		else if (jump_direction == 11)
		{
			_target_x = x;
			_target_y = bbox_top - sprite_height - (COL_TILE * _iteration);
			move_distance_remaining = point_distance(x, bbox_top, _target_x, _target_y);
			var _tile = tile_get_index(tilemap_get_at_pixel(height_map, _target_x, _target_y));
			if (_tile >= 5 && _tile <= 12) // ignore walls and doors -- everything else is
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
		else if (jump_direction == 12)
		{
			_target_x = bbox_left - sprite_width - (COL_TILE * _iteration);
			_target_y = y;
			move_distance_remaining = point_distance(bbox_left, y, _target_x, _target_y);
			var _tile = tile_get_index(tilemap_get_at_pixel(height_map, _target_x, _target_y));
			if (_tile >= 5 && _tile <= 12) // ignore walls and doors -- everything else is
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
		else if (jump_direction == 9)
		{
			_target_x = x;
			_target_y = bbox_bottom + sprite_height + (COL_TILE * _iteration + 1);
			move_distance_remaining = point_distance(x, bbox_bottom, _target_x, _target_y);
			var _tile = tile_get_index(tilemap_get_at_pixel(height_map, _target_x, _target_y));
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
		var _target_dir;
		switch (jump_direction)
		{
			case 9:
				_target_dir = 270;
				break;
			case 10:
				_target_dir = 0;
				break;
			case 11:
				_target_dir = 90;
				break;
			case 12:
			  _target_dir = 180;
				break;
		}
		move_distance_remaining = max(0, move_distance_remaining - walk_speed);
		z = sin(((move_distance_remaining / 32) * pi)) * 12;
		h_speed = lengthdir_x(walk_speed, _target_dir);
		v_speed = lengthdir_y(walk_speed, _target_dir);
		x += h_speed;
		y += v_speed;
				
		if (move_distance_remaining <= 0)
		{
			state = scr_player_state_free;
		}
	}
	
	// if it's a pit, fall
	
}