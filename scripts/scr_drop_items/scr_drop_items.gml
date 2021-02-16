// @desc scr_drop_items(x, y, items)
// @param x real
// @param y real
// @param items []
function scr_drop_items(_x, _y, _items)
{
	var _item_count = array_length(_items);
	if (_item_count > 1)
	{
		// determine space between items
		var _angle_per_item = 360 / _item_count;
		
		// get angle to start dropping
		var _angle = random(360);
		for (var i = 0; i < _item_count; i++)
		{
			with (instance_create_layer(_x, _y, "Instances", _items[i]))
			{
				direction = _angle;
				spd = 0.75 + (_item_count * 0.1) + random(0.1);
			}
			// add new angle to space them apart in an even circly
			_angle += _angle_per_item;
		}
	}
	else
	{
		instance_create_layer(_x, _y, "Instances", _items[0]);
	}
}