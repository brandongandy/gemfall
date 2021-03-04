// Scrip
function scr_push_script(_id, _direction, _length)
{
	if (_length == undefined) || (_length < 0)
	{
		_length = 16;
	}
	
	with (_id)
	{
		x_to = x + lengthdir_x(_length, _direction);
		y_to = y + lengthdir_y(_length, _direction);
		
		var _bbox_width = bbox_right - bbox_left;
		var _bbox_height = bbox_bottom - bbox_top;
		var _new_bbox_left = x_to - (_bbox_width / 2); 
		var _new_bbox_top = y_to - (_bbox_height / 2);
		var _new_bbox_right = x_to + (_bbox_width / 2);
		var _new_bbox_bottom = y_to + (_bbox_height / 2);
		
		var _inst = collision_rectangle(_new_bbox_left, _new_bbox_top,
			_new_bbox_right, _new_bbox_bottom, obj_p_entity, false, true);
		if (_inst != noone)
		{
			return;
		}
		
		if (scr_tile_collide_at_points_mob(collision_map,
		  [_new_bbox_left, _new_bbox_top],
		  [_new_bbox_right, _new_bbox_bottom]))
		{
			return;
		}
		
		pushed = true;
		moving = true;
	}
}