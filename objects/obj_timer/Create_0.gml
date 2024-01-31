/// @description Insert description here
// You can write your code in this editor
curroom = room_get_name(room) 
depth = -1
global.done = false
best = string("N/A")
global.blueorder = 0
global.bluenext = 0
global.redorder = 0
global.rednext = 0
global.yelloworder = 0
global.yellownext = 0
colorvis = false
levelselectheader = false
besttimes = [100,100,100,100,100,100,100,100,100,100]  
starttitlemusic = false
clickedboss = false
clickbosstimer = 0
roomlast = room_init
losestart = false
