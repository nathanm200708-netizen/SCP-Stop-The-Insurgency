/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 392040F0
/// @DnDArgument : "halign" "fa_center"
draw_set_halign(fa_center);
draw_set_valign(fa_top);

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 3C7D2CDB
/// @DnDArgument : "font" "title"
/// @DnDSaveInfo : "font" "title"
draw_set_font(title);

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 520001BC
/// @DnDArgument : "x" "690"
/// @DnDArgument : "y" "150"
/// @DnDArgument : "caption" ""SCP: Stop The Insurgency""
draw_text(690, 150, string("SCP: Stop The Insurgency") + "");