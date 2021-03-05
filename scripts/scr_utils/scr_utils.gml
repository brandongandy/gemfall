// @description Takes a value and snaps it to a compass point (0, 90, 180, 270)
function snap_to_compass_point(_direction)
{
	return round(_direction / 90) * 90
}