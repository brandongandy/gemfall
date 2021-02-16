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
	if (!_collisionX)
	{
		x = _newX;
	}
	//if (tilemap_get_at_pixel(collision_map, x + h_speed, y))
	//{
	//	// put back at edge of tile.
	//	x -= x mod TILE_SIZE;
	//	if (sign(h_speed) == 1)
	//	{
	//		x += TILE_SIZE - 1;
	//	}
	//	h_speed = 0;
	//	_collision = true;
	//}
	
	
	// Vertical Tiles
	// vertical movement
	
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
	if (!_collisionY)
	{
		y += v_speed;
	}	
	
	return (_collisionX || _collisionY);
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
		if (_tile_index != elevation)
		{
			_found = true;
		}
	}
	
	return _found;
}

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