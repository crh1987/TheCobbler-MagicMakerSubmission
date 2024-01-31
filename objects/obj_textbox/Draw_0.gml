/// @description Insert description here
// You can write your code in this editor

//draw textbox
draw_sprite(spr_box, 0, x, y)

//draw text


draw_set_color(c_black)
if (charCount < string_length(text[page])){
	charCount+=.5
}
textPart = string_copy(text[page], 1, charCount)
draw_text_ext(x + xBuffer,y + yBuffer,textPart, stringHeight-6, box_width )
