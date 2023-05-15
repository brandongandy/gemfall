/// @description Update Camera

switch (state)
{
	case "ROOM_ENTER":
	{	
		global.game_paused = true;
		first_snap = true;
		x = lerp(x, obj_player.x - y, 0.075);
		y = lerp(y, obj_player.y - y, 0.075);
		//x += floor(obj_player.x - x);
		//y += floor(obj_player.y - y);
		x = clamp(x, view_width_half, room_width - view_width_half);
		y = clamp(y, view_height_half, room_height - view_height_half);
		camera_set_view_pos(cam, x - view_width_half, y - view_height_half);
		if (prev_state != "")
		{
			state = prev_state;
		}
		else
		{
			state = "FOLLOW";
		}
		global.game_paused = false;
	}
	break;
	case "FOLLOW":
	{
		// set first_snap to true for next time we swap state
		first_snap = true;
		// update destination
		if (instance_exists(follow))
		{
			xTo = follow.x;
			yTo = follow.y;
		}
	
		// if we're not snapping to room boundaries, then follow player
		x += (xTo - x) * 0.5;
		y += (yTo - y) * 0.5;
	
		// keep camera center inside room
		x = clamp(x, view_width_half, room_width - view_width_half);
		y = clamp(y, view_height_half, room_height - view_height_half);
		
		// screen shake
		if (shake_enabled)
		{
			x += random_range(-shake_remain, shake_remain);
			y += random_range(-shake_remain, shake_remain);

			shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));
			if (shake_remain <= 0)
			{
				shake_enabled = false;
			}
		}
		camera_set_view_pos(cam, floor(x - view_width_half), floor(y - view_height_half));
	}
	break;
	case "SNAP":
	{
		// used for dungeons
		// otherwise, snap to boundaries for "room" within room transitions
		if (instance_exists(follow))
		{
			var _width = camera_get_view_width(cam);
			var _height = camera_get_view_height(cam);
			//var _x_to = (follow.x div _width) * _width;
			//var _y_to = (follow.y div _height) * _height;
			var _x_to, _y_to;
			var _dirX = follow.h_speed > 0;
			var _dirY = follow.v_speed > 0;
			if (_dirX)
			{
				_x_to = (follow.bbox_right div _width) * _width;
			}
			else
			{
				_x_to = (follow.bbox_left div _width) * _width;
			}
			
			if (_dirY)
			{
				_y_to = (follow.bbox_bottom div _height) * _height;
			}
			else
			{
				_y_to = (follow.bbox_top div _height) * _height;
			}
		
			// pause while transitioning
			if (_x_to != x) || (_y_to != y)
			{
				scr_toggle_pause_game(true);
				transitioning = true;
			}
			else
			{
				if (transitioning)
				{
					scr_toggle_pause_game(false);
					transitioning = false;
					if (next_state != "")
					{
						state = next_state;
						next_state = "";
					}
				}
			}
			
			// only slide when not first swapping to snap
			if (!first_snap)
			{
				var _moving = false;
				x = scr_move_camera_toward(x, _x_to, 6);
				y = scr_move_camera_toward(y, _y_to, 6);
				_moving = x == _x_to && y == _y_to;
				if (!_moving)
				{
					var _dir = (point_direction(x, y, _x_to, _y_to) / 90);
					with (obj_player)
					{
						switch (_dir)
						{
							case 0:
								move_towards_point(x + TILE_SIZE + 8, y, 0.25);
							break;
							case 1:
								move_towards_point(x, y - TILE_SIZE - 8, 0.35);
							break;
							case 2:
								move_towards_point(x - TILE_SIZE - 8, y, 0.25);
							break;
							case 3:
								move_towards_point(x, y + TILE_SIZE + 8, 0.35);
							break;
						}
						
					}
				}
				else 
				{ 
					with (obj_player)
					{
						speed = 0; 
					}
				}
			}
			else
			{
				first_snap = false;
				x = _x_to;
				y = _y_to;
			}
			
			camera_set_view_pos(cam, floor(x), floor(y));
		}
	}
	break;
	case "SNAP_X":
	{		
		if (instance_exists(follow))
		{
			var _width = camera_get_view_width(cam);
			var _height = camera_get_view_height(cam);
			//var _x_to = (follow.x div _width) * _width;
			//var _y_to = (follow.y div _height) * _height;
			var _x_to, _y_to;
			var _dirX = follow.h_speed > 0;
			if (_dirX)
			{
				_x_to = (follow.bbox_right div _width) * _width;
			}
			else
			{
				_x_to = (follow.bbox_left div _width) * _width;
			}
			if (_x_to != x)
			{
				global.game_paused = true;
				transitioning = true;
			}
			else
			{
				global.game_paused = false;
				if (transitioning)
				{
					transitioning = false;
					if (next_state != "")
					{
						state = next_state;
						next_state = "";
					}
				}
			}
			var _moving = false;
			
			x = scr_move_camera_toward(x, _x_to, 6);
			_moving = x == _x_to;
			if (!_moving)
			{
				var _dir = (point_direction(x, y, _x_to, y) / 90);
				with (obj_player)
				{
					switch (_dir)
					{
						case 0:
							move_towards_point(x + TILE_SIZE + 8, y, 0.25);
						break;
						case 2:
							move_towards_point(x - TILE_SIZE - 8, y, 0.25);
						break;
					}
				}
			}
			else 
			{ 
				with (obj_player)
				{
					speed = 0; 
				}
			}
			
			
			yTo = follow.y;
			y += floor((yTo - y) / 5);
			y = clamp(y, view_height_half, room_height - view_height_half);
			
			camera_set_view_pos(cam, floor(x), floor(y - view_height_half));
		}
	}
	break;
	case "SNAP_Y":
	{
	
	}
	break;
}


