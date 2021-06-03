/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// sprites
image_speed = 0;
sprite_move = spr_bat;
sprite_attack = spr_bat;
sprite_hurt = spr_bat;

state_wait_duration = 60;

// scripts
mob_script[MOB_STATE.IDLE] = scr_bat_idle;
mob_script[MOB_STATE.WANDER] = scr_bat_wander;
mob_script[MOB_STATE.CHASE] = scr_bat_chase;
mob_script[MOB_STATE.ATTACK] = scr_bat_fly_to_point;
mob_script[MOB_STATE.HURT] = scr_mob_hurt;
mob_script[MOB_STATE.DIE] = scr_mob_die;
mob_script[MOB_STATE.WAIT] = scr_mob_wait;

// bat specific / flight vars
center_x = x;
center_y = y;
flight_radius = 64;
theta = 0;
theta_speed = 2;