/// @desc Initialize & Globals
randomize();

global.debug = false;

global.game_paused = false;
global.text_speed = 0.75;

// room transition vars
global.target_room = -1;
global.target_x = -1;
global.target_y = -1;
global.target_dir = 0;

// questing
global.quest_status = ds_map_create();
global.quest_status[? "TheHatQuest"] = 0;
// dungeons - still go in the quest map
global.quest_status[? "Dungeon01"] = 0;

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
// player
global.i_inv = instance_create_layer(0, 0, layer, obj_inventory);
global.i_ui = instance_create_layer(0, 0, layer, obj_ui);
global.input = instance_create_layer(0, 0, layer, obj_input);

// instance ID of a lifted object
global.i_lifted = noone;
global.held_item = noone;

// init other managers
global.i_camera = instance_create_layer(0, 0, layer, obj_camera);
//global.i_crt = instance_create_layer(0, 0, layer, obj_CRT_controller);

// other
global.previous_room = -1;

room_goto(rm_debug);