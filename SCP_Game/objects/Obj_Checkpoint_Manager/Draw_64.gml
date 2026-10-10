// --- 1. Spoken Dialogue Container ---
draw_set_color(c_black);
draw_rectangle(60, 420, 700, 520, false);
draw_set_color(c_white);
draw_rectangle(60, 420, 700, 520, true);

// Dialogue text display
if (instance_exists(current_entrant)) {
    draw_text(80, 450, "\"" + current_entrant.current_speech + "\"");
} else {
    draw_text(80, 450, feedback_message);
}

// --- 2. Action Menu ---
draw_set_color(c_yellow);
draw_text(60, 540, "[1] Ask Origin | [2] Ask Purpose | [3] Ask Diet | [TAB] Field Guide");
draw_set_color(c_lime);
draw_text(60, 570, "[A] APPROVE");
draw_set_color(c_red);
draw_text(220, 570, "[D] DENY");

// --- 3. Field Guidebook Overlay ---
if (show_manual) {
    draw_set_color(make_color_rgb(45, 52, 54));
    draw_rectangle(720, 80, 980, 520, false);
    draw_set_color(c_white);
    draw_rectangle(720, 80, 980, 520, true);

    draw_set_color(c_orange);
    draw_text(740, 100, "INSPECTOR'S FIELD GUIDE");
    draw_line(740, 125, 960, 125);

    draw_set_color(c_white);
    draw_text(740, 140, "VALID ORIGINS:");
    draw_text(740, 160, "Sectors 1, 2, 3, 4 only");

    draw_text(740, 200, "VALID PURPOSES:");
    draw_text(740, 220, "Work, Family, Medical");

    draw_text(740, 270, "MONSTER TELLTALES:");
    for (var i = 0; i < array_length(inspector_guide.monster_clues); i++) {
        draw_text_ext(740, 300 + (i * 55), inspector_guide.monster_clues[i], 16, 220);
    }
}