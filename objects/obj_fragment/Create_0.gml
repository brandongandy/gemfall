/// @description 
bounce = 0;
deteriorate = 0;
z = 0;
// speed
spd = 0;
// friction
fric = 0;
image_speed = 0;
image_index = irandom(image_number - 1);
collision_map = layer_tilemap_get_id(layer_get_id("ColHeight"));

elevation = 0; // todo
image_xscale = choose(-1, 1);