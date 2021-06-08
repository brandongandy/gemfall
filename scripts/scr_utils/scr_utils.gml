// @description Takes a value and snaps it to a compass point (0, 90, 180, 270)
function snap_to_compass_point(_direction)
{
	return round(_direction / 90) * 90
}

function draw_text_outlined(_x, _y, _string, _color)
{
	if (_color == undefined)
	{
		_color = c_black;
	}
	
	draw_set_color(_color);
  draw_text(_x + 1, _y, _string);
  draw_text(_x - 1, _y, _string);
  draw_text(_x, _y + 1, _string);
  draw_text(_x, _y - 1, _string);
  draw_set_color(c_white);
  draw_text(_x, _y, _string);
}