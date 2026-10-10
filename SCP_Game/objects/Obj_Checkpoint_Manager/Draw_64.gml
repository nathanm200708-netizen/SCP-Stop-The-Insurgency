// --- 1. Spoken Dialogue Box ---
draw_set_color(c_black);
draw_rectangle(60, 410, 700, 510, false);
draw_set_color(c_white);
draw_rectangle(60, 410, 700, 510, true);

if (instance_exists(current_entrant)) {
    draw_text_ext(80, 430, "\"" + current_entrant.current_speech + "\"", 20, 600);
} else {
    draw_text(80, 440, feedback_message);
}

// --- 2. Action Controls / Questions Section ---
if (instance_exists(current_entrant)) {
    if (!interrogation_mode) {
        // Standard View
        draw_set_color(c_yellow);
        draw_text(60, 525, "[1] Origin  |  [2] Purpose  |  [3] Diet  |  [Q] OPEN DEEP INTERROGATION");
    } else {
        // Dynamic Question View
        draw_set_color(c_aqua);
        draw_text(60, 520, "--- DEEP INTERROGATION (W/S to Select, Space/Enter to Ask, Q to Return) ---");

        var inquiries = current_entrant.dynamic_inquiries;
        for (var i = 0; i < array_length(inquiries); i++) {
            var is_sel = (i == selected_dynamic_q);
            draw_set_color(is_sel ? c_yellow : c_white);
            var prefix = is_sel ? "> " : "  ";
            draw_text(60 + (i * 200), 545, prefix + inquiries[i].label);
        }
    }
}

// --- 3. Persistent Action Bar ---
draw_set_color(c_gray);
draw_text(60, 580, "[TAB] Field Manual");
draw_set_color(c_lime);
draw_text(220, 580, "[A] APPROVE");
draw_set_color(c_red);
draw_text(350, 580, "[D] DENY");

// --- 4. Field Guide Overlay ---
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
    for (var j = 0; j < array_length(inspector_guide.monster_clues); j++) {
        draw_text_ext(740, 300 + (j * 55), inspector_guide.monster_clues[j], 16, 220);
    }
}