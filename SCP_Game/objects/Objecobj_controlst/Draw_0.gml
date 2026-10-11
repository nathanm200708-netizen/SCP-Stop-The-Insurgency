/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 7C3A7A22
/// @DnDArgument : "halign" "fa_center"
draw_set_halign(fa_center);
draw_set_valign(fa_top);

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 53F972B9
/// @DnDArgument : "font" "contrls_font"
/// @DnDSaveInfo : "font" "contrls_font"
draw_set_font(contrls_font);

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 12F7B2BB
/// @DnDArgument : "x" "690"
/// @DnDArgument : "y" "700"
/// @DnDArgument : "caption" ""Find the insurgents and stop them from entering""
draw_text(690, 700, string("Find the insurgents and stop them from entering") + "");

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 4E3FD72B
draw_set_halign(fa_left);
draw_set_valign(fa_top);