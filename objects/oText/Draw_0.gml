var halfw = w * 0.5;

//Draw the box
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_roundrect_ext(x-halfw-margin_o,y-h-(margin_o*2),x+halfw+margin_o,y,margin_i,margin_i,false);
draw_sprite(sMarker,0,x,y);
draw_set_alpha(1);

//Draw text
DrawSetText(c_white,fSign, fa_center, fa_top);
draw_text(x,y-h-margin_o,text_current);
