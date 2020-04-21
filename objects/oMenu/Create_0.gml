/// @description GUI/Vers/Menu setup

//macro = copypaste that is global (dont use = or ;)
#macro SAVEFILE "Save.sav"


gui_width = display_get_gui_width()
gui_height = display_get_gui_height()
gui_margin = 64; //margin between edge and menu

menu_x = gui_width //+ 100;
menu_y = gui_height - gui_margin -100;
menu_x_target = gui_width - gui_margin
menu_speed = 40; //lower is faster
menu_font = fMenu;
menu_itemheight = font_get_size(fMenu); //dynamic scaling to fontsize
menu_committed = -1; //status of menu nav
menu_control = true;

//selection array
menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Quit";

//one dimentional array is a simple way of know how many variables are held
menu_items = array_length_1d(menu)
menu_cursor = 2;
