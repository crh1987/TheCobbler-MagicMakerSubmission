if generated == 0{
	instance_destroy(obj_textbox)
	instance_create_depth(200,50, -1,obj_textbox)
	obj_textbox.text = ["See how it's transient?, I just created a red block for you farther left, go check that out..."]
	generated = 1
	instance_create_depth(211, 418,1, obj_redfloortrigger)
}


