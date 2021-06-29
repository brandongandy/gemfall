/// @description Insert description here
// You can write your code in this editor
depth = 0;
seconds = global.i_inv.daycycle.seconds;
minutes = global.i_inv.daycycle.minutes;
hours = global.i_inv.daycycle.hours;

day = global.i_inv.daycycle.day;
season = global.i_inv.daycycle.season;
year = global.i_inv.daycycle.year;

// seconds per step
time_increment = 24;
time_paused = false;

max_darkness = 0.99;
darkness = 0;
light_color = c_black;
draw_daylight = false;

// used by status effects, dark rooms, etc.
force_draw = false;

phase_start = phase.daytime;
phase_end = phase.sunset;

enum phase
{
	sunrise = 6,
	daytime = 8.5,
	sunset = 18,
	nighttime = 22
}

// surface
daycycle_surf = surface_create(RESOLUTION_W + 16, RESOLUTION_H + 16);
//daycycle_buffer = buffer_create(RESOLUTION_H * RESOLUTION_W, buffer_grow, 1);
