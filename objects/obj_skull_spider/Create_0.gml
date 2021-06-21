/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

dir = choose(0, 90, 180, 270);
collided_with_wall = false;

image_speed = 0;
mob_script[MOB_STATE.IDLE] = scr_skull_spider_idle;
mob_script[MOB_STATE.WANDER] = scr_skull_spider_wander;