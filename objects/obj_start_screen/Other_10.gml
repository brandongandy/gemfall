/// @description Insert description here
// You can write your code in this editor
create_button(
	xx, 
	yy, 
	button_width, 
	button_height, 
	"Continue", 
	btn_close_game);
		
yy += (button_height + space);

create_button(xx, yy,
	button_width,
	button_height,
	"Load Game",
	btn_load_game);
		
yy += (button_height + space);

create_button(xx, yy,
	button_width,
	button_height,
	"New Game",
	btn_new_game);
		
yy += (button_height + space);

create_button(
	xx, 
	yy, 
	button_width, 
	button_height, 
	"Exit Game", 
	btn_close_game);