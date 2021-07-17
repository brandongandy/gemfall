/// @function scr_new_textbox(_message, _background, [_responses])
/// @param {string} message			The string message to display
/// @param {real}   background		The background index of the dialog box
/// @param {array}	[responses]		The possible responses to this dialogue
function scr_new_textbox_response(_message, _background, _responses)
{
	var _obj;
	if (instance_exists(obj_text))
	{
		_obj = obj_text_queued;
	}
	else
	{
		_obj = obj_text;
	}
	with (instance_create_layer(0, 0, "Instances", _obj))
	{
		text_message = _message;
		// other is the caller of this script
		if (instance_exists(other))
		{
			origin_instance = other.id;
		}
		else
		{
			origin_instance = noone;
		}
		
		background = _background;
		if (!is_undefined(_responses))
		{
			responses = _responses;
			// trim markers from responses
			for (var i = 0; i < array_length(responses); i++)
			{
				var _marker_pos = string_pos(":", responses[i]);
				response_scripts[i] = string_copy(responses[i], 1, _marker_pos - 1);
				response_scripts[i] = real(response_scripts[i]);
				responses[i] = string_delete(responses[i], 1, _marker_pos);
			}
		}
		else
		{
			// responses aren't defined, so init empty arrays
			responses = [-1];
			response_scripts = [-1];
		}
	}
	
	with (obj_player)
	{
		if (state != scr_player_state_lock)
		{
			last_state = state;
			state = scr_player_state_lock;
		}
	}
}

function scr_new_textbox(_message, _background)
{
	scr_new_textbox_response(_message, _background, undefined);
}
/// @function scr_new_textbox(_message, _background, [_responses])
/// @param {string} message			The string message to display
/// @param {real}   background		The background index of the dialog box
/// @desc Basically the same as the new_textbox script, but makes a larger
/// window
function scr_new_textbox_large(_message, _background)
{
	var _obj;
	if (instance_exists(obj_text))
	{
		_obj = obj_text_queued;
	}
	else
	{
		_obj = obj_text;
	}
	with (instance_create_layer(0, 0, "Instances", _obj))
	{
		y1 = TILE_SIZE * 2;
		y2 = RESOLUTION_H - y1;
		x1_target = y1 * 2;
		x2_target = RESOLUTION_W - x1_target;
		text_message = _message;
		// other is the caller of this script
		if (instance_exists(other))
		{
			origin_instance = other.id;
		}
		else
		{
			origin_instance = noone;
		}
		
		background = _background;

		// responses aren't defined, so init empty arrays
		responses = [-1];
		response_scripts = [-1];
	}
	
	with (obj_player)
	{
		if (state != scr_player_state_lock)
		{
			last_state = state;
			state = scr_player_state_lock;
		}
	}
}