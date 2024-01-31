/// @description Insert description here
// You can write your code in this editor
global.lanternx = x
global.lanterny = y
radius = 50
with(all) {
   // Calculate the distance between the center point and the object
   
   if (collision_circle(global.lanternx,global.lanterny, obj_lantern.radius, self, false, false)) {
      // Change the object's visible variable to true
	  if object_index != obj_forjump{ 
		visible = true;
	  }
   }
}