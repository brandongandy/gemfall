/// @description Insert description here
// You can write your code in this editor
var _btn_width = 128;
var _xx = centerx - _btn_width / 2;

var _save_game = load_game_data(0);
if (_save_game != -1)
{
	create_button(
		_xx, 
		yy, 
		_btn_width, 
		button_height, 
		"Save Game 01", 
		load_game,
		_save_game);
}
else
{
	create_button(
		_xx, 
		yy, 
		_btn_width, 
		button_height, 
		"No Data", 
		-1,
		undefined);
}
		
yy += (button_height + space);

var _save_game_1 = load_game_data(1);
if (_save_game_1 != -1)
{
	create_button(
		_xx, 
		yy, 
		_btn_width, 
		button_height, 
		"Save Game 02", 
		load_game,
		_save_game_1);
}
else
{
	create_button(
		_xx, 
		yy, 
		_btn_width, 
		button_height, 
		"No Data", 
		-1, undefined);
}
		
yy += (button_height + space);

var _save_game_2 = load_game_data(2);
if (_save_game_2 != -1)
{
	create_button(
		_xx, 
		yy, 
		_btn_width, 
		button_height, 
		"Save Game 03", 
		load_game,
		_save_game_2);
}
else
{
	create_button(
		_xx, 
		yy, 
		_btn_width, 
		button_height, 
		"No Data", 
		-1,
		undefined);
}
		
yy += (button_height + space) + 8;

create_button(
	_xx, 
	yy, 
	_btn_width, 
	button_height, 
	"Back", 
	btn_back_to_start,
	undefined);