// Scrip
function create_button(_x, _y, _width, _height, _text, _script, _script_args)
{
	if (_script_args == undefined)
	{
		_script_args = [-1];
	}
	var _button = instance_create_layer(_x, _y, "Instances", obj_button);
	
	with (_button)
	{
		width = _width;
		height = _height;
		text = _text;
		scr = _script;
		args = _script_args;
	}
	
	return _button;
}

function btn_resume()
{
	obj_input.pause = true;
}

function btn_close_game()
{
	game_end();
}

function btn_save_game()
{
	save_game();
}

function btn_main_menu()
{
	room_goto(rm_start_screen);
}

function btn_new_game()
{
	//obj_ui.draw_gui = true;
	//scr_toggle_pause_game(false);
	scr_room_transition(TRANSITION_TYPE.SLIDE, rm_player_house);
	//room_goto(rm_player_house);
}

#region Start Screen

function btn_load_game()
{
	obj_start_screen.shifted_state = false;
	obj_start_screen.screen_state = "LOAD";
}

function btn_back_to_start()
{
	obj_start_screen.shifted_state = false;
	obj_start_screen.screen_state = "START";
}

#endregion