// @function scr_screen_shake(magnitude, frames)
// @param Magnitude sets the strength of the shake (distance range)
// @param Frames sets the length of the shake in frames (60 per second)
function scr_screen_shake(_magnitude, _frames)
{
	with (global.i_camera)
	{
		shake_enabled = true;
		if (_magnitude > shake_remain)
		{
			shake_magnitude = _magnitude;
			shake_remain = shake_magnitude;
			shake_length = _frames;
		}
	}
}