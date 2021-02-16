/// @description Creation
x1 = RESOLUTION_W / 2;
y1 = RESOLUTION_H - 70;
x2 = RESOLUTION_W / 2;
y2 = RESOLUTION_H;

x1_target = TILE_SIZE * 2;
x2_target = RESOLUTION_W - x1_target;

lerp_progress = 0;
text_progress = 0;

response_selected = 0;

global.game_paused = true;