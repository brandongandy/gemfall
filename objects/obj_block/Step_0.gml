/// @description Insert description here
// You can write your code in this editor
if (moving)
{
	if (x_to < 0) || (y_to < 0)
	{
		moving = false;
	}
	
	if (x == x_to) && (y == y_to)
	{
		moving = false;
	}
	else
	{
		x = lerp(x, x_to, 0.05);
		y = lerp(y, y_to, 0.05);
	}
}

if (pushed && !script_executed)
{
	if (push_success_script == -1)
	{
		script_executed = true;
		return;
	}
	
	var _can_execute = false;
	
	if (push_success_dir == -1)
	{
		_can_execute = true;
	}
	else
	{
		if (push_dir == push_success_dir)
		{
			_can_execute = true;
		}
	}
	
	if (_can_execute)
	{
		scr_execute_array(push_success_script, push_success_script_args);
		script_executed = true;
	}
	else
	{
		// we can't execute the script, but we've already been pushed
		// so quit trying, until the room reloads and we can try again
		script_executed = true;
	}
}