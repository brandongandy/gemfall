/// @description Insert description here
// You can write your code in this editor
if (obj_ui.game_state == "IN_GAME")
{
	exit;
}

if (item.item_index == ITEM.NONE)
{
	exit;
}

if (highlight)
{
	draw_sprite_ext(sprite_index,
		image_index,
		floor(x),
		floor(y),
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	);
}

if (item.item_index != ITEM.NONE)
{
	draw_sprite(spr_items, item.item_index, floor(x), floor(y));
}

if (hover)
{
	draw_item_infobox(item, x - 12, y);
}