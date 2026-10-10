/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 0E21851D
draw_set_colour($FFFFFFFF & $ffffff);
var l0E21851D_0=($FFFFFFFF >> 24);
draw_set_alpha(l0E21851D_0 / $ff);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 7343D737
/// @DnDArgument : "alpha" "fade"
draw_set_alpha(fade);

/// @DnDAction : YoYo Games.Drawing.Draw_Rectangle
/// @DnDVersion : 1
/// @DnDHash : 296E5452
/// @DnDArgument : "x2" "display_get_gui_width()"
/// @DnDArgument : "y2" "display_get_gui_height()"
/// @DnDArgument : "fill" "1"
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), 0);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 1B8670B9
draw_set_alpha(1);