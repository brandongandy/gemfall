// Scrip
function scr_shake_entity(_shake_length, _shake_magnitude)
{
	start_x = x;
	start_y = y;
	shake_enabled = true;
	if (_shake_magnitude > shake_remain)
	{
		shake_magnitude = _shake_magnitude;
		shake_remain = shake_magnitude;
		shake_length = _shake_length;
	}
}