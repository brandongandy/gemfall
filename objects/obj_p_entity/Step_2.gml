/// @description Entity Loop

if (!global.game_paused)
{
	depth = -(bbox_bottom - elevation);

	if (lifted) && (instance_exists(obj_player))
	{
		// make sure we're not in the process of lifting still
		if (obj_player.sprite_index != spr_player_lift)
		{
			x = obj_player.x;
			y = obj_player.y;
			z = 13;
			depth = obj_player.depth - 1;
		}
	}
	
	if (!lifted) 
	{
		if (thrown)
		{
			throw_distance_traveled = min(throw_distance_traveled + 3, entity_throw_distance);
			x = x_start + lengthdir_x(throw_distance_traveled, direction);
			y = y_start + lengthdir_y(throw_distance_traveled, direction);
			if (tile_get_index(tilemap_get_at_pixel(collision_map, x, y)) == 6) &&
				(elevation == 1)
			{
				thrown = false;
				grav = 0.1;
			}
			
			throw_percent = throw_start_percent + lerp(0, 1 - throw_start_percent, throw_distance_traveled / entity_throw_distance);
			
			z = throw_peak_height * sin(throw_percent * pi);
			
			if (entity_throw_distance <= throw_distance_traveled)
			{
				thrown = false;
				if (entity_throw_break)
				{
					instance_destroy();
				}
			}
		}
		else
		{
			// fall, if z > 0
			if (z > 0)
			{
				z = max(z - grav, 0);
				grav += 0.1;
				if (z == 0) && (entity_throw_break)
				{
					instance_destroy();
				}
			}
			else
			{
				grav = 0.1;
			}
		}
	}
	
	// entity shake
	if (shake_enabled)
	{
		x += random_range(-shake_remain, shake_remain);
		y += random_range(-shake_remain, shake_remain);

		shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));
		if (shake_remain <= 0)
		{
			x = start_x;
			y = start_y;
			start_x = 0;
			start_y = 0;
			shake_enabled = false;
		}
	}
}
flash = max(flash - 0.08, 0);