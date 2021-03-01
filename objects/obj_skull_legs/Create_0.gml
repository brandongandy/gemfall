/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_speed = 0;
mob_script[MOB_STATE.IDLE] = scr_skull_legs_idle;
mob_script[MOB_STATE.WANDER] = scr_skull_legs_wander;