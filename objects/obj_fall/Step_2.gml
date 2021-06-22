/// @description Check for Collision
if (!global.game_paused) && (active)
{
	if (player_entered) && (!fallen)
	{
		var _reset_coords = false;
		fallen = true;
		if (falls_to_next_floor)
		{
			global.take_fall_damage = false;
		}
		
		// set sensible values if they're not there.
		if (target_room == 0)
		{
			target_room = room;
		}
		// if target x is zero, then both are invalid.
		if (target_x == 0)
		{
			_reset_coords = true;
			var _dir = obj_player.direction + 180;
			var _x = obj_player.x;
			var _y = obj_player.y;
			var _iter = 0;
			while (true)
			{
				_x += lengthdir_x((COL_TILE * 2 * _iter), _dir);
				_y += lengthdir_y((COL_TILE * 2 * _iter), _dir);
				var _tile = tile_get_index(tilemap_get_at_pixel(obj_player.height_map,
					_x, _y));
				if (_tile >= 4 && _tile <= 12)
				{
					// couldn't find?
					if (_iter > 6)
					{
						_x = obj_player.xstart;
						_y = obj_player.ystart;
						break;
					}
					else
					{
						_iter++;
					}
				}
				else
				{
					break;
				}
			}
			
			target_x = _x;
			target_y = _y;
		}
		
		global.target_room = target_room;
		global.target_x = target_x;
		global.target_y = target_y;
		
		if (target_dir != -1)
		{
			global.target_dir = target_dir;
		}
		else
		{
			global.target_dir = obj_player.direction;
		}
			
		if (is_pit)
		{
			with (obj_player)
			{
				scr_player_act_animation(spr_player_fall, scr_fall_and_respawn);
			}
		}
		
		if (_reset_coords)
		{
			target_x = 0;
		}
	}
	else if (!position_meeting(obj_player.x, obj_player.y, id))
	{
		fallen = false;
		player_entered = false;
	}
}