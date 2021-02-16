/// @description Create object
/// obj_fall makes the player "fall" to the depths, then respawn at the beginning of the room
event_inherited();
active = true;
player_entered = false;

// steps from initial collision to player falling
fall_countdown = 30;
fallen = false;