/// @description Menu selection controle

//Item ease in
menu_x = menu_x + (menu_x_target - menu_x) / menu_speed;

//Keyboard controls
if (menu_control)
{
	if (keyboard_check_pressed(vk_up))
	{
		menu_cursor++;	
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	if (keyboard_check_pressed(vk_down))
	{
		menu_cursor--;	
		if (menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	if (keyboard_check_pressed(vk_enter))
	{
		MenuSelect();
	}

//Mouse controls
	var mouse_y_gui = device_mouse_y_to_gui(0);
	var mouse_x_gui = device_mouse_x_to_gui(0);
	if (mouse_y_gui < menu_y) and (mouse_y_gui > menu_top) and (mouse_x_gui > (menu_x_target - 200))
	{
		//div devides but gives back whole numbers
		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5);
		
		if (mouse_check_button_pressed(mb_left))
		{
			MenuSelect();
		}
	}
	
}

//Gamepad controls
if (menu_control) and (menu_d == 1) and (room == rMenu)
{
	if (gamepad_axis_value(0,gp_axislv) < -0.8)
	{
		menu_d = 0;
		alarm[0] = 15;
		menu_cursor++;	
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	if (gamepad_axis_value(0,gp_axislv) > 0.8)
	{
		menu_d = 0;
		alarm[0] = 15;
		menu_cursor--;	
		if (menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	if (gamepad_button_check_pressed(0,gp_face1))
	{
		MenuSelect();
	}
}


if (menu_x > gui_width + 150) and (menu_committed != -1)
{
	switch (menu_committed)
	{
	case 2: default: SlideTransition(TRANS_MODE.NEXT); break;
	case 1:
	{
		if (!file_exists(SAVEFILE))
		{
			SlideTransition(TRANS_MODE.NEXT);
		}
		else
		{
			var file = file_text_open_read(SAVEFILE);
			var target = file_text_read_real(file);
			file_text_close(file);
			SlideTransition(TRANS_MODE.GOTO,target);
		}
	}	
	break;
	case 0: game_end(); break;
	}
		
}