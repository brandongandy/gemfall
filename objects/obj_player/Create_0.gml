// states
state = scr_player_state_free;
state_attack = attack_slash;
entities_hit_by_attack = -1;
last_state = state;
next_state = -1;
attacking = false;

// collision
collision_map = layer_tilemap_get_id(layer_get_id("ColHeight"));
height_map = layer_tilemap_get_id(layer_get_id("ColHeight"));
time_to_jump = 60;
time_to_push = 60;

if (layer_exists(layer_get_id("TilesLowerDecoration")))
{
	layer_depth(layer_get_id("TilesLowerDecoration"), -(room_height));
}

// stop spinning / going through animation
image_speed = 0;

// movement stuff
h_speed = 0;
v_speed = 0;
walk_speed = 2;
roll_speed = walk_speed * 1.75;
roll_distance = 52;
bonk_distance = 40;
bonk_distance_height = 12;
bonk_speed = 1.5;
z = 0;
player_height = 0;
move_distance_remaining = 0;

// attack stuff
equipped_weapon = global.i_inv.items[ITEM.SWORD];

// the number of frames we're invulnerable
invulnerable = 0;
flash = 0;
flash_shader = sha_white_flash;

// script to be called after executing a particular animation
animation_end_script = -1;

sprite_run = spr_player_run;
sprite_roll = spr_player_roll;
sprite_idle = spr_player;
sprite_attack = spr_attack_01;
local_frame = 0;

// room transition handling
if (global.target_x != -1)
{
	x = global.target_x;
	y = global.target_y;
	direction = global.target_dir;
	
	//global.target_x = -1;
	//global.target_y = -1;
	//global.target_dir = 0;
}

// respawn
start_x = x;
start_y = y;

// status effects
status_effect = -1;
// how long, in seconds, the status lasts
status_duration = 0;
status_counter = 0;

shake_enabled = false;
shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;