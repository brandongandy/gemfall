/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_speed = 0;
base_distance = mob_wander_distance;
mob_script[MOB_STATE.IDLE] = scr_snake_idle;
mob_script[MOB_STATE.WANDER] = scr_snake_wander;