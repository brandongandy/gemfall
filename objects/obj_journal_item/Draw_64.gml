/// @description Insert description here
// You can write your code in this editor
if (!global.i_journal.show_journal)
{
	exit;
}

draw_sprite(sprite_index, image_index, x, y);

if (hover)
{
	var _name = journal_name;
	if (!found)
	{
		_name = "???";
	}
	draw_journal_infobox(_name, x, y);
}