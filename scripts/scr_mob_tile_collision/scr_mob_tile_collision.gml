// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_mob_tile_collision()
{
	//var _collision = false;

	// Horizontal Tiles
	// horizontal movement
	var _newX = x + h_speed;
	var _collisionX = false;
	if (h_speed > 0)
	{
		var _tile_right = scr_tile_collide_at_points_mob(collision_map,
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
		var _tile_left = scr_tile_collide_at_points_mob(collision_map,
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
	
	var _entityCollisionX = false;
	if (h_speed > 0)
	{
		var _entity_right = collision_rectangle(bbox_left + h_speed, bbox_top + 1,
			bbox_right + h_speed, bbox_bottom - 1, obj_p_entity, false, true);
		if (_entity_right != noone) && (_entity_right.entity_collides)
		{
			h_speed = 0;
			_entityCollisionX = true;
		}
	}
	else if (h_speed < 0)
	{
		var _entity_left = collision_rectangle(bbox_left + h_speed, bbox_top + 1, 
			bbox_right + h_speed, bbox_bottom - 1, obj_p_entity, false, true);
		if (_entity_left != noone) &&
			 (_entity_left.entity_collides)
		{
			h_speed = 0;
			_entityCollisionX = true;
		}
	}
	
	// now check for player collision
	if (h_speed != 0 && !_collisionX && !_entityCollisionX)
	{
		var _playerX = collision_rectangle(bbox_left, bbox_top, 
			bbox_right, bbox_bottom, obj_player, false, true);
		if (_playerX != noone)
		{
			h_speed = 0;
			_entityCollisionX = true;
		}
	}
	
	if (!_collisionX) && (!_entityCollisionX)
	{
		x = _newX;
	}
	
	// Vertical Tiles
	var _newY = y + v_speed;
	var _collisionY = false;
	if (v_speed > 0)
	{
		var _tile_bottom = scr_tile_collide_at_points_mob(collision_map,
			[bbox_left + 1, bbox_bottom + 1],
			[bbox_right - 1, bbox_bottom + 1]);
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
		var _tile_top = scr_tile_collide_at_points_mob(collision_map,
			[bbox_left + 1, bbox_top - 1],
			[bbox_right - 1, bbox_top - 1]);
		if (_tile_top)
		{
			_newY = bbox_top & ~ (COL_TILE - 1);
			_newY += COL_TILE + _newY - bbox_top;
			v_speed = 0;
			_collisionY = true;
		}
	}
	
	var _entityCollisionY = false;
	if (v_speed > 0)
	{
		var _entity_bottom = collision_rectangle(bbox_left + 1, bbox_top + 1, 
			bbox_right - 1, bbox_bottom + v_speed, obj_p_entity, false, true);
		if (_entity_bottom != noone) && 
			 (_entity_bottom.entity_collides)
		{
			_newY = _entity_bottom.bbox_top - (bbox_bottom - bbox_top);
			v_speed = 0;
			_entityCollisionY = true;
		}
	}
	else
	if (v_speed < 0)
	{
		var _entity_top = collision_rectangle(bbox_left + 1, bbox_top + v_speed, bbox_right - 1, bbox_bottom - 1, obj_p_entity, false, true);
		if (_entity_top != noone) &&
			 (_entity_top.entity_collides)
		{
			v_speed = 0;
			_entityCollisionY = true;
		}
	}
	
	// now check for player collision
	if (v_speed != 0 && !_collisionY && !_entityCollisionY)
	{
		var _playerY = collision_rectangle(bbox_left, bbox_top, 
			bbox_right, bbox_bottom, obj_player, false, true);
		if (_playerY != noone)
		{
			v_speed = 0;
			_entityCollisionY = true;
		}
	}
	
	if (!_collisionY) && (!_entityCollisionY)
	{
		y = _newY;
	}	
	
	return (_collisionX || _entityCollisionX || _collisionY || _entityCollisionY);
}

/// @desc gets collision for mob aabb -- prevents elevation changes
function scr_tile_collide_at_points_mob(_tilemap)
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
				_found = true;
				break;
			case 3:
				_found = false;
				break;
			case 4:
				{
					if (state != undefined)
					{
						if (state == MOB_STATE.HURT)
						{
							// if the state is hurt, then we're being knocked back - so
							// fall and die
							// TODO: Animate fall
							instance_destroy();
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
			case 5:
			case 6:
			case 7:
			case 8:
			case 9:
			case 10:
			case 11:
			case 12:
			  _found = true;
				break;
			default:
				break;
		}
	}
	
	return _found;
}

// non-strict projectile checking - only impacts on tile 7, otherwise passes
// over 
function scr_tile_collide_at_points_bullet(_tilemap)
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
		if (_tile_index == 7)
		{
			_found = true;
		}
	}
	
	return _found;
}

// used for non-bullets, ie, things that do not float and should "hit"
// the first valid tile
function scr_tile_collide_at_points_projectile(_tilemap)
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
		if (_tile_index >= 5 && _tile_index <= 7)
		{
			_found = true;
		}
	}
	
	return _found;
}