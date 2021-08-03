function scr_player_collision()
{
	if (state = scr_player_state_float || invulnerable > 0)
	{
		return scr_check_player_height_collision(height_map, false);
	}
	else
	{
		return scr_check_player_height_collision(height_map, true);
	}
}

/// @desc Does collision detection based on tile "height", as set by the tile index
/// in the tileset.
function scr_check_player_height_collision(_collision_map, _mobs_collide)
{	
	// Horizontal Tiles
	var _newX = x + h_speed;
	var _collisionX = false;
	if (h_speed > 0)
	{
		var _tile_right = scr_tile_collide_at_points_height(_collision_map,
			[bbox_right + h_speed, bbox_top + 1],
			[bbox_right + h_speed, bbox_bottom - 1]);
		if (_tile_right)
		{
			_newX = bbox_right & ~ (COL_TILE - 1);
			_newX -= bbox_right - _newX;
			h_speed = 0;
			_collisionX = true;
		}
	}
	else if (h_speed < 0)
	{
		var _tile_left = scr_tile_collide_at_points_height(_collision_map,
			[bbox_left + h_speed, bbox_top + 1],
			[bbox_left + h_speed, bbox_bottom - 1]);
		if (_tile_left)
		{
			_newX = bbox_left & ~ (COL_TILE - 1);
			_newX += COL_TILE + _newX - bbox_left;
			h_speed = 0;
			_collisionX = true;
		}
	}
	
	// Horizontal Entity List
	//_newX = x + h_speed;
	var _mobCollisionX = false;
	if (_mobs_collide)
	{
		if (h_speed > 0)
		{
			var _entity_right = collision_rectangle(bbox_left + h_speed, bbox_top + 1, bbox_right + h_speed, bbox_bottom - 1, obj_p_entity, false, true);
			if (_entity_right != noone) && (_entity_right.entity_collides)
			{
				h_speed = 0;
				_mobCollisionX = true;
			}
		}
		else if (h_speed < 0)
		{
			var _entity_left = collision_rectangle(bbox_left + h_speed, bbox_top + 1, bbox_right + h_speed, bbox_bottom - 1, obj_p_entity, false, true);
			if (_entity_left != noone) && (_entity_left.entity_collides)
			{
				h_speed = 0;
				_mobCollisionX = true;
			}
		}
	}
	
	if (!_collisionX) && (!_mobCollisionX)
	{
		var _tile = tilemap_get_at_pixel(_collision_map, x, y);
		player_height = tile_get_index(_tile); // current height
		x = _newX;
	}
	
	// Vertical Tiles
	var _collisionY = false;
	var _newY = y + v_speed;
	if (v_speed > 0)
	{
		var _tile_bottom = scr_tile_collide_at_points_height(_collision_map,
			[bbox_left + 1, bbox_bottom + v_speed],
			[bbox_right - 1, bbox_bottom + v_speed]);
		if (_tile_bottom)
		{
			_newY = bbox_bottom & ~ (COL_TILE - 1);
			_newY -= bbox_bottom - _newY;
			v_speed = 0;
			_collisionY = true;
		}
	}
	else if (v_speed < 0)
	{
		var _tile_top = scr_tile_collide_at_points_height(_collision_map,
			[bbox_left + 1, bbox_top + v_speed],
			[bbox_right - 1, bbox_top + v_speed]);
		if (_tile_top)
		{
			_newY = bbox_top & ~ (COL_TILE - 1);
			_newY += COL_TILE + _newY - bbox_top;
			v_speed = 0;
			_collisionY = true;
		}
	}
	
	// Vertical Entity List
	var _mobCollisionY = false;
	if (_mobs_collide)
	{
		if (v_speed > 0)
		{
			var _entity_bottom = collision_rectangle(bbox_left + 1, bbox_top + 1, bbox_right - 1, bbox_bottom + v_speed, obj_p_entity, false, true);
			if (_entity_bottom != noone) && (_entity_bottom.entity_collides)
			{
				_newY = _entity_bottom.bbox_top - (bbox_bottom - bbox_top);
				v_speed = 0;
				_mobCollisionY = true;
			}
		}
		else
		if (v_speed < 0)
		{
			var _entity_top = collision_rectangle(bbox_left + 1, bbox_top + v_speed, bbox_right - 1, bbox_bottom - 1, obj_p_entity, false, true);
			if (_entity_top != noone) && (_entity_top.entity_collides)
			{
				//show_debug_message("Ex: " + string(_entity_top.x) + ", Ey: " + string(_entity_top.y) + ", Px: , " + string(x) +"Py: " + string(y));
				v_speed = 0;
				_mobCollisionY = true;
			}
		}
	}
	
	if (!_collisionY) && (!_mobCollisionY)
	{
		var _tile = tilemap_get_at_pixel(_collision_map, x, y);
		player_height = tile_get_index(_tile); // current height
		y = _newY;
	}
	
	return (_collisionX || _collisionY || _mobCollisionX || _mobCollisionY);
}

function scr_tile_collide_at_points_height(_tilemap)
{
	var _found = false;
	
	var _vec2_x = 0;
	var _vec2_y = 1;
	
	for (var i = 1; i < argument_count; i++)
	{
		var _point = argument[i];
		var _tile = tilemap_get_at_pixel(_tilemap, _point[_vec2_x], _point[_vec2_y]);
		var _tile_index = tile_get_index(_tile);
		
		if (state = scr_player_state_float)
		{
			switch (_tile_index)
			{
				case 7:
					_found = true;
					break;
				default:
					break;
			}
		}
		else
		{
			switch (_tile_index)
			{
				case 1:
					_found = false;
					break;
				case 2:
					{
						if !(player_height >= 1 || player_height <= 3)
						{
							_found = true;
						}
					}
					break;
				case 3:
					_found = false;
					break;
				case 5:
					{
						if (instance_place(_point[_vec2_x], _point[_vec2_y], obj_door))
						{
							_found = true;
						}
						else
						{
							_found = false;
						}
					}
					break;
				case 6:
				case 7:
					{
						if (player_height >= 9) && (player_height <= 12)
						{
							time_to_jump--;
							if (time_to_jump <= 0)
							{
								// change state
								time_to_jump = 60;
								jump_direction = player_height;
								state = scr_player_state_jump;
								_found = false;
							}
							else
							{
								_found = true;
							}
						}
						else
						{
						  _found = true;
						}
					}
					break;
				default:
					break;
			}
		}
		
		if (_found)
		{
			break;
		}
		
		//if (_tile_index > player_height + 1)
		//{
		//	_found = true;
		//}
	}
	
	return _found;
}