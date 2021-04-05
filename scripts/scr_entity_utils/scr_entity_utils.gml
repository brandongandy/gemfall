// Scrip
function scr_shake_entity(_shake_length, _shake_magnitude)
{
	start_x = x;
	start_y = y;
	shake_enabled = true;
	if (_shake_magnitude > shake_remain)
	{
		shake_magnitude = _shake_magnitude;
		shake_remain = shake_magnitude;
		shake_length = _shake_length;
	}
}

function scr_push_back_enemies_from(_originX, _originY)
{
	// only push enemies back if they're this close to the activate point
	var _push_radius = 16;
	
	// push them back this far
	var _knockback = 64;
	
	// do we hurt them if they impact?
	
	// get mobs and set their state to hurt
	// and set the x_to/y_to accordingly
	
	with (obj_p_mob)
	{
		if (distance_to_point(_originX, _originY) <= _push_radius)
		{
			stunned = true;
			state_wait_duration = 30;
			hurt_mob(id, 0, other.id, _knockback);
		}
	}	
}

//function scr_knockback_mob_id(_mob_id, _originX, _originY, _knockback)
//{
//	with (_mob_id)
//	{
//		scr_knockback_mob(_originX, _originY, _knockback);
//	}
//}

function scr_knockback_mob(_originX, _originY, _knockback)
{
	if (_knockback != 0)
	{
		var _knock_dir = point_direction(x, y, _originX, _originY);
		x_to = x - lengthdir_x(_knockback, _knock_dir);
		y_to = y - lengthdir_y(_knockback, _knock_dir);
	}
}