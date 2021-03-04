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