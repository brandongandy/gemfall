/// @description Essential Entity Setup
z = 0;
flash = 0;
grav = 0;
// gets the flash variable from the shader
u_flash = shader_get_uniform(sha_white_flash, "flash");

// if exists but not active, then nothing is processed for its actions
active = true;

// denotes whether this has been lifted by the player
lifted = false;
thrown = false;
orig_x = x;
orig_y = y;

collision_map = layer_tilemap_get_id(layer_get_id("ColHeight"));

// elevation - used for drawing and for logic sometimes
elevation = tile_get_index(tilemap_get_at_pixel(collision_map, x, y));