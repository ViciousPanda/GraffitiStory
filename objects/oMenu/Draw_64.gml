/// @description Draw menu

//always set these when drawing font
draw_set_font(fMenu);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

//use "for" if you wanna manipulate a variable in a loop
for (var i = 0; i < menu_items; i = i + 1)
{
	var offset = 2; // outline offset
	var txt = menu[i];
	if (menu_cursor == i)
	{
		txt = string_insert("> ",txt, 0);
		var col = c_white;
	}
	else
	{
		var col = c_gray;
	}
	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * (i * 1.5));
	
	//outline
	draw_set_color(c_black);
	draw_text(xx-offset,yy,txt);
	draw_text(xx+offset,yy,txt);
	draw_text(xx,yy+offset,txt);
	draw_text(xx,yy-offset,txt);
	
	//text
	draw_set_color(col);
	draw_text(xx,yy,txt);
	
}

