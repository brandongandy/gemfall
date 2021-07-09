/// @description Insert description here
// You can write your code in this editor
obj_ui.draw_gui = false;

// states:
//  START
//  NEW
//  LOAD
//
screen_state = "START";
shifted_state = false;

space = 10;
centerx = RESOLUTION_W / 2;
centery = RESOLUTION_H / 2;
button_width = 64;
button_height = 16;
xx = centerx - button_width / 2;
yy = centery - (((button_height + space) * 3) / 2);
	

//event_user(0);