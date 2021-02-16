function scr_player_collision()
{
	return scr_check_player_height_collision(height_map);
}

function scr_check_player_collision(_collision_map)
{
	var _collision = false;
	var _entity_list = ds_list_create();
	
	// Horizontal Tiles
	var _newX = x + h_speed;
	var _collisionX = false;
	if (h_speed > 0)
	{
		var _tile_right = scr_tile_collide_at_points(_collision_map,
			[bbox_right + 2, bbox_top + 1],
			[bbox_right + 2, bbox_bottom - 1]);
		if (_tile_right)
		{
			_newX = bbox_right & ~ (COL_TILE - 1);
			_newX -= bbox_right - _newX;
			h_speed = 0;
			_collision = true;
			_collisionX = true;
		}
	}
	else if (h_speed < 0)
	{
		var _tile_left = scr_tile_collide_at_points(_collision_map,
			[bbox_left - 2, bbox_top + 1],
			[bbox_left - 2, bbox_bottom - 1]);
		if (_tile_left)
		{
			_newX = bbox_left & ~ (COL_TILE - 1);
			_newX += COL_TILE + _newX - bbox_left;
			h_speed = 0;
			_collision = true;
			_collisionX = true;
		}
	}
	if (!_collisionX)
	{
		x = _newX;
	}
	
	// Horizontal Entity List
	_newX = x + h_speed;
	if (sign(h_speed) == -1)
	{
		_newX += bbox_left + sprite_get_xoffset(sprite_index);
	}
	else
	{
		_newX += bbox_right - sprite_get_xoffset(sprite_index);
	}
	var _entity_count = instance_place_list(_newX, y, obj_p_entity, _entity_list, false);
	var _snap_x;
	var _mobCollisionX = false;
	while (_entity_count > 0)
	{
		var _entity_check = _entity_list[| 0];
		if (_entity_check.entity_collides == true)
		{
			// move as close we can to the entity first
			if (sign(h_speed) == -1)
			{ 
				// moving left, snap to right
				_newX = _entity_check.bbox_right + 1 + bbox_left;
			}
			else
			{
				// moving right, snap to left
				_newX = _entity_check.bbox_left - 1 - bbox_right;
			}
			h_speed = 0;
			_mobCollisionX = true;
			// if we collided, skip over all the other entities in the list to prevent extra work
			
			_entity_count = 0;
		}
		
		if (state != scr_player_state_roll) && 
			 (_entity_check.object_index == obj_spike_trap)
		{
			if (_entity_check.spikes_out)
			{
				scr_hurt_player(point_direction(_entity_check.x, _entity_check.y, obj_player.x, obj_player.y), 16, 0.5);
			}
		}
		
		// nothing found, continue looping
		ds_list_delete(_entity_list, 0);
		_entity_count--;
	}
	if (!_mobCollisionX)
	{
		x = _newX;
	}
	
	// clear list between axes
	ds_list_clear(_entity_list);
	
	// Vertical Tiles
	var _collisionY = false;
	var _newY = y + v_speed;
	if (v_speed > 0)
	{
		var _tile_bottom = scr_tile_collide_at_points(_collision_map,
			[bbox_left + 2, bbox_bottom + 1],
			[bbox_right - 2, bbox_bottom + 1]);
		if (_tile_bottom)
		{
			_newY = bbox_bottom & ~ (COL_TILE - 1);
			_newY -= bbox_bottom - _newY;
			v_speed = 0;
			_collision = true;
			_collisionY = true;
		}
	}
	else if (v_speed < 0)
	{
		var _tile_top = scr_tile_collide_at_points(_collision_map,
			[bbox_left + 2, bbox_top - 1],
			[bbox_right - 2, bbox_top - 1]);
		if (_tile_top)
		{
			_newY = bbox_top & ~ (COL_TILE - 1);
			_newY += COL_TILE + _newY - bbox_top;
			v_speed = 0;
			_collision = true;
			_collisionY = true;
		}
	}
	if (!_collisionY)
	{
		y = _newY;
	}
	
	// Vertical Entity List
	var _entity_count = instance_position_list(x, y + v_speed, obj_p_entity, _entity_list, false);
	var _snap_y;
	var _mobCollisionY = false;
	while (_entity_count > 0)
	{
		var _entity_check = _entity_list[| 0];
		if (_entity_check.entity_collides == true)
		{
			// move as close we can to the entity first
			if (sign(v_speed) == -1)
			{ 
				// moving up, snap to bottom
				_snap_y = _entity_check.bbox_bottom + (bbox_bottom - bbox_top);
			}
			else
			{
				// moving down, snap to top
				_snap_y = _entity_check.bbox_top - (bbox_bottom - bbox_top);
			}
			y = _snap_y;
			v_speed = 0;
			_mobCollisionY = true;
			// if we collided, skip over all the other entities in the list to prevent extra work
			_entity_count = 0;
		}
		// nothing found, continue looping
		ds_list_delete(_entity_list, 0);
		_entity_count--;
	}	
	
	ds_list_destroy(_entity_list);
	
	return (_collisionX || _collisionY || _mobCollisionX || _mobCollisionY);
}

/// @param _tilemap
/// @param _point_arrays...
function scr_tile_collide_at_points(_tilemap)
{
	var _found = false;
	
	var _vec2_x = 0;
	var _vec2_y = 1;
	
	for (var i = 1; i < argument_count; i++)
	{
		var _point = argument[i];
		_found = _found || (tilemap_get_at_pixel(_tilemap, _point[_vec2_x], _point[_vec2_y]));
	}
	
	return _found;
}

function scr_entity_collide_at_points()
{
	//var _entity_list = ds_list_create();
	var _found = noone;
	var _vec2_x = 0;
	var _vec2_y = 1;
	
	for (var i = 0; i < argument_count; i++)
	{
		var _point = argument[i];
		
		//var _entity_count = instance_place_list(floor(_point[_vec2_x]), floor(_point[_vec2_y]), obj_p_entity, _entity_list, false);
		
		var _entity_contact = instance_place(_point[_vec2_x], _point[_vec2_y], obj_p_entity);
		if (_entity_contact != noone)
		{
			if (_entity_contact.entity_collides)
			{
				show_debug_message("Check coords: " + string(_point[_vec2_x]) + "," + string(_point[_vec2_y]));
				show_debug_message("entity coords: " + string(_entity_contact.bbox_bottom) + "," + string(_entity_contact.bbox_left) + "," + string(_entity_contact.bbox_right) + "," + string(_entity_contact.bbox_top));
				_found = _entity_contact;
				return _found;
			}
			
			if (state != scr_player_state_roll) && 
				 (_entity_contact.object_index == obj_spike_trap)
			{
				if (_entity_contact.spikes_out)
				{
					scr_hurt_player(point_direction(_entity_contact.x, _entity_contact.y, obj_player.x, obj_player.y), 16, 0.5);
				}
			}
		}
	}
	
	return _found;
}

/// @desc Does collision detection based on tile "height", as set by the tile index
/// in the tileset.
function scr_check_player_height_collision(_collision_map)
{	
	
	// Horizontal Tiles
	var _newX = x + h_speed;
	var _collisionX = false;
	if (h_speed > 0)
	{
		var _tile_right = scr_tile_collide_at_points_height(_collision_map,
			[bbox_right + 1, bbox_top + 1],
			[bbox_right + 1, bbox_bottom - 1]);
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
			[bbox_left - 1, bbox_top + 1],
			[bbox_left - 1, bbox_bottom - 1]);
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
			[bbox_left + 1, bbox_bottom + 2],
			[bbox_right - 1, bbox_bottom + 2]);
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
			[bbox_left + 1, bbox_top - 2],
			[bbox_right - 1, bbox_top - 2]);
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
	
	if (!_collisionY) && (!_mobCollisionY)
	{
		var _tile = tilemap_get_at_pixel(_collision_map, x, y);
		player_height = tile_get_index(_tile); // current height
		y = _newY;
	}
	
	var _collision = (_collisionX || _collisionY || _mobCollisionX || _mobCollisionY)
	
	if (!_collision)
	{
	}
	
	return _collision;
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
		//_found = _found || ;
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
					if (player_height == 4)
					{
						time_to_jump--;
						if (time_to_jump <= 0)
						{
							// change state
							time_to_jump = 60;
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
		
		//if (_tile_index > player_height + 1)
		//{
		//	_found = true;
		//}
	}
	
	return _found;
}