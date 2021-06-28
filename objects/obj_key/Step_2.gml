/// @description Override End Step
/// This is the same as the regular Collectibel End Step,
/// except keys do not decay.
flash = max(0, flash - 0.05);
fric = 0.05;
// fall, if z > 0
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
if (z == 0)
{ 
	fric = 0.10;
}

// magnetise me cap'n
if (instance_exists(obj_player))
{
	var _px = obj_player.x;
	var _py = obj_player.y;
	var _dist = point_distance(x, y, _px, _py);
	
	if (_dist < magnet_radius) // magnet radius
	{
		spd += 0.25;
		direction = point_direction(x, y, _px, _py);
		spd = min(spd, 3);
		fric = 0;
		
		if (_dist < 5)
		{
			// collect radius
			if (collect_script_args != -1)
			{
				scr_execute_array(collect_script, collect_script_args);
			}
			else
			{
				if (collect_script != -1)
				{
					script_execute(collect_script);
				}				
			}
			
			instance_destroy();
		}
	}
}

x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);
spd = max(spd - fric, 0);
depth = -bbox_bottom;