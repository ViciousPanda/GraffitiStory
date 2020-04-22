/// @description Shader red overlay

draw_self();

if (flash > 0)
{
	flash = flash - 1;
	shader_set(shRed);
	draw_self();
	shader_reset();
}

if (daze <= 1)
{
	shader_set(shRed);
	draw_self();
	shader_reset();
}
