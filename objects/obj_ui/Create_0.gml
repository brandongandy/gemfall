/// @description Insert description here
// You can write your code in this editor
depth = -9999;
game_state = "IN_GAME";
inv_open = false;
xpos = 0;
ypos = -RESOLUTION_H;

hud_money_xpos = xpos + 4;
hud_money_ypos = ypos + RESOLUTION_H + 10;
hud_key_xpos = xpos + 30;
hud_key_ypos = ypos + RESOLUTION_H + 10;

hud_equipped_xpos = xpos + 198 + 8;
hud_equipped_ypos = ypos + RESOLUTION_H + 8 + 16; 

hud_heart_xpos =  xpos + 208;
hud_heart_ypos = ypos + RESOLUTION_H + 12;

#region Gem HUD

_center_x = camera_get_view_width(view_camera[0]) * 0.5 - 12;
_center_y = camera_get_view_height(view_camera[0]) * 0.5 - 12;
total_items = 8;

#endregion

surf = surface_create(RESOLUTION_W, RESOLUTION_H);
overlay_surface = surface_create(RESOLUTION_W, RESOLUTION_H);
//surface_resize(surf, view_get_wport(view_current), view_get_hport(view_current));

//scr_CRT_init_shader(view_camera[0], false, 0.12, true, false, true, 0.03, 80.0, 1.0, true, 0.175, surf);