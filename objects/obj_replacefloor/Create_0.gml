/// @description Insert description here
// You can write your code in this editor

solid = true
depth = 1
move = noone
move = instance_place(x,y,obj_bluefloormove)
if move != noone{
image_xscale = move.image_xscale
image_yscale = move.image_yscale
}