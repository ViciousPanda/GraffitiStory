/// @description Setup camera
cam = view_camera[0];
follow = oPlayer;

//center camera
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = x;
yTo = y;