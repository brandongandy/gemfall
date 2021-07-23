/// @description Insert description here
// You can write your code in this editor
depth = -9999;
show_journal = false;
just_opened = false;

current_page = 0;

// set to false first so we can deactivate on load
deactivated = true;

for (_y = 0; _y < 10; _y++)
{
	for (_x = 0; _x < 3; _x++)
	{
		var _xx = 72 + (_x * 20);
		var _yy = 15 + (_y * 20);
		var _jrnl = instance_create_layer(_xx, _yy,
			"Instances",
			obj_journal_item);
		_jrnl.depth = -10001;
	}
}