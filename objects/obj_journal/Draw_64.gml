/// @description Insert description here
// You can write your code in this editor
if (!show_journal)
{
	exit;
}

draw_sprite(spr_journal, 0, x, y);

if (selected_journal_text != "")
{
	draw_text_ext(152, 16, selected_journal_text, 10, 224);
}