/// @description Insert description here
// You can write your code in this editor

next = keyboard_check_pressed(vk_tab)
if next{
	if (page+1 < array_length_1d(text)){
		page+=1
		charCount = 0
		stringHeight = string_height(text[page])
	}else{
		if room=room_tutorial{
			obj_movedownfloor.goback = true
		}
		if textnum ==4{
			global.timer = 0
			global.moved = false
			room_goto(room_chooselevel)	
			instance_destroy();	
		}

		instance_destroy();	
	}
}
if textnum == 1{
	text = ["Haha tricked ya, I wonder if you figured out the rule yet hmmm", "There's a yellow block somehwere around you, find it, can you jump on it?"]	
}if textnum == 2{
	text = ["See how it's transient?, I just created a red block for you farther left, go check that out..."]
}if textnum == 3{
	text = ["And that one was solid! try it again though and you will pass through it (contd.)", "Check the top left corner for your current color wheel, ge to the finish line to progress to the next level (contd.)", "Good luck my friend :)"]	
}if textnum == 4{
	text = ["Congratulations you finished in " + string(obj_finishfloor.leveltime) + " (s)!, Press Enter to restart level or	tab to return to level select"]	
}

