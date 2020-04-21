/// @description Slide Transition(mode, targetroom)
/// @arg Mode sets transition mode between next, restart and goto.
/// @arg Target sets target room when using teh goto mode.

//script is essencially a custom command
//argument[0] is the first of the arguments. Without [] the argument becomes required

with (oTransition)
{
	mode = argument[0];
	if (argument_count >1) target = argument[1];
}

