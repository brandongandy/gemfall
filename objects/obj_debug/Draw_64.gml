/// @description Insert description here
// You can write your code in this editor
line_alpha ^= keyboard_check_pressed(vk_ralt);
global.debug ^= keyboard_check_pressed(vk_ralt);

draw_set_alpha(line_alpha * 0.1);
for (var i = 0; i < room_width >> BITSHIFT; ++i)
{
	draw_line(0 + (i * CELLSIZE), 0, 0 + (i * CELLSIZE), room_height);
}

for (var i = 0; i < room_height >> BITSHIFT; ++i)
{
	draw_line(0, 0 + (i * CELLSIZE), room_width, 0 + (i * CELLSIZE));
}
draw_set_alpha(1);

draw_text(1, 150, "State: " + string(obj_player.state));
draw_text(1, 180, "H: " + string(obj_player.player_height));
draw_text(1, 160, "X: " + string(floor(obj_player.x)));
draw_text(1, 170, "Y: " + string(floor(obj_player.y)));
draw_text(96, 160, "BBOX Left: " + string(obj_player.bbox_left));
draw_text(178, 160, "BBOX Right: " + string(obj_player.bbox_right));
draw_text(96, 170, "BBOX Top: " + string(obj_player.bbox_top));
draw_text(178, 170, "BBOX Bottom: " + string(obj_player.bbox_bottom));

draw_text(32, 160, "R Mana: " + string(obj_inventory.mana[MANA_TYPE.RUBY].mana));
draw_text(32, 170, "G Mana: " + string(obj_inventory.mana[MANA_TYPE.EMERALD].mana));
draw_text(32, 180, "B Mana: " + string(obj_inventory.mana[MANA_TYPE.SAPPHIRE].mana));