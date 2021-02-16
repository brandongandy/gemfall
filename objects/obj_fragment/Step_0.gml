/// @description Insert description here
// You can write your code in this editor
if (!global.game_paused)
{
	depth = -(bbox_bottom - elevation);
	// bounce
	if (bounce_count != 0)
	{
		bounce += (pi * bounce_speed);
		if (bounce > pi)
		{
			bounce -= pi;
			bounce_height *= 0.6;
			bounce_count--;
		}
		z = sin(bounce) * bounce_height;
	}
	else
	{
		z = 0;
	}
	
	// deteriorate the fragments
	deteriorate++;
	if (deteriorate > deteriorate_after)
	{
		// fade out
		image_alpha -= 1/deteriorate_time;
		if (image_alpha <= 0)
		{
			instance_destroy();
		}
	}
	
	// friction for sliding along movement path
	fric = 0.05;
	if (z == 0)
	{
		fric = 0.1;
	}
	
	// finally, move
	x += lengthdir_x(spd, direction);
	y += lengthdir_y(spd, direction);
	
	// if we collide, stop moving
	if (tile_get_index(tilemap_get_at_pixel(collision_map, x, y)) == 6)
	{
		spd = 0;
	}
	
	spd = max(spd - fric, 0);
}