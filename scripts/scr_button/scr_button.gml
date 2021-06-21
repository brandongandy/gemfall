// Scrip
function create_button(_x, _y, _width, _height, _text, _script)
{
	var _button = instance_create_layer(_x, _y, "Instances", obj_button);
	
	with (_button)
	{
		width = _width;
		height = _height;
		text = _text;
		scr = _script;
	}
	
	return _button;
}

function btn_resume()
{
	obj_input.pause = true;
	show_debug_message("click click");
}

function btn_close_game()
{
	game_end();
}

function btn_save_game()
{
	save_game();
}

function btn_new_game()
{
	room_goto(rm_player_house);
}