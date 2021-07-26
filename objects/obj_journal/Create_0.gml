/// @description Insert description here
// You can write your code in this editor
depth = -9999;
show_journal = false;
just_opened = false;

current_page = 0;
selected_journal_text = "";
selected_journal_turned_in = false;
selected_journal_name = "";

// set to false first so we can deactivate on load
deactivated = true;

var _i = 0 + (current_page * 30);
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
		_jrnl.journal_id = _i;
		_i++;
	}
}