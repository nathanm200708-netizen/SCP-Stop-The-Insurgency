draw_self();

draw_set_font(menufont);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x + 85, y + 85, string(button_txt) + "");

draw_set_halign(fa_left);
draw_set_valign(fa_top);