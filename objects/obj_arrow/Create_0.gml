which = 0
grav = 0.45; // adjust the gravity as needed
shootspeed = 10
image_xscale = .75
image_yscale = .75
image_angle = direction + 180
_d = obj_player.x - x;
_t = abs(_d) / shootspeed;
_g = .45;  //gravity
_y = y - obj_player.y - 2;
set = false


