/// @description Insert description here
// You can write your code in this editor
if (!pause_menu)
{
	var _space = 6;
	var _centerx = RESOLUTION_W / 2;
	var _centery = RESOLUTION_H / 2;
	var _button_width = 56;
	var _button_height = 16;
	var _xx = _centerx - _button_width / 2;
	var _yy = _centery - (((_button_height + _space) * 3) / 2);
	
	create_button(
		_xx, 
		_yy, 
		_button_width, 
		_button_height, 
		"Resume", 
		btn_resume);
		
	_yy += (_button_height + _space);
		
	create_button(
		_xx, 
		_yy, 
		_button_width, 
		_button_height, 
		"Save Game",
		btn_save_game);
		
	_yy += (_button_height + _space);
	
	create_button(
		_xx, 
		_yy, 
		_button_width, 
		_button_height, 
		"Exit Game",
		btn_close_game);
	pause_menu = true;
}
