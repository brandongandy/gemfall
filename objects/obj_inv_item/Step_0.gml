/// @description Insert description here
// You can write your code in this editor
if (x_to > 0)
{
	var _distance_to_go = point_distance(x, y, x_to, y_to);
	if (_distance_to_go > 2)
	{
		dir = point_direction(x, y, x_to, y_to);
		h_speed = lengthdir_x(4, dir);
		v_speed = lengthdir_y(4, dir);
		x += h_speed;
		y += v_speed;
	}
}