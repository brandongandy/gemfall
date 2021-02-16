// @function scr_room_transition(_transition_type, _target_room)
// @desc Room
function scr_room_transition(_transition_type, _target_room)
{
	if (!instance_exists(obj_transition))
	{
		with (instance_create_depth(0, 0, -9999, obj_transition))
		{
			transition_type = _transition_type;
			target_room = _target_room;
		}
	}
	else
	{
		show_debug_message("Tried to transition while already transitioning!");
	}
}

function scr_move_camera_toward(_start, _end, _val)
{
	if (_start < _end)
	{
		return min(_start + _val, _end);
	}
	else
	{
		return max(_start - _val, _end);
	}
}

function scr_room_enter_message(_previous_room, _message)
{
	if (global.previous_room == _previous_room)
	{
		scr_new_textbox(_message, 0);
	}
}