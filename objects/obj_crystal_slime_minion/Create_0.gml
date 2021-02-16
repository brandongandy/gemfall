/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
image_speed = 0;

first_fall = true;
z = 180;
grav = 0;
bounce = 0;
bounce_count = 1;
bounce_speed = 0.05;
bounce_height = 9;

aggro_check_duration = 30;

mob_script[MOB_STATE.IDLE] = -1;
mob_script[MOB_STATE.WANDER] = scr_crystal_slime_minion_wander;
mob_script[MOB_STATE.CHASE] = scr_crystal_slime_minion_chase;
mob_script[MOB_STATE.ATTACK] = scr_crystal_slime_minion_attack;
mob_script[MOB_STATE.HURT] = scr_crystal_slime_minion_hurt;
mob_script[MOB_STATE.DIE] = scr_crystal_slime_minion_die;