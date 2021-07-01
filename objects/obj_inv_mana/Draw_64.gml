/// @description Insert description here
// You can write your code in this editor
if (obj_ui.game_state == "IN_GAME")
{
	exit;
}

if (!gem.can_use)
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

if (gem.can_use)
{
	draw_sprite(spr_mana_gems, gem.item_index, floor(x), floor(y));
}

if (hover)
{
	draw_mana_gem_infobox(gem, x - 12, y);
}