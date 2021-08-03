/// @description Insert description here
// You can write your code in this editor
var _hover = point_in_rectangle(
	global.i_mouse.pos_x, 
	global.i_mouse.pos_y, 
	x, 
	y, 
	x + width, 
	y + height);
var _click = _hover && mouse_check_button_released(mb_left);

if (_hover)
{
	background = 3;
}
else
{
	background = 0;
}

//hover = lerp(hover, _hover, 0.1);
//y = lerp(y, ystart - _hover * 8, 0.1);

if (_click && scr >= 0)
{
	scr_execute_array(scr, args);
}