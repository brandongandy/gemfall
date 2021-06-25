/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = MOB_STATE.IDLE;

image_speed = 0;
state_wait_duration = 60;
aggro_check_duration = 60;

mob_script[MOB_STATE.IDLE] = scr_turret_block_idle;
mob_script[MOB_STATE.ATTACK] = scr_turret_block_attack;
mob_script[MOB_STATE.DIE] = scr_turret_block_die;
mob_script[MOB_STATE.HURT] = scr_turret_hurt;