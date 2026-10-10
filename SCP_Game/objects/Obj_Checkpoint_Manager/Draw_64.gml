/// --- 1. Main Dialogue Window ---
draw_set_color(c_black);
draw_rectangle(60, 380, 700, 510, false);
draw_set_color(c_white);
draw_rectangle(60, 380, 700, 510, true);

if (instance_exists(current_entrant)) {
    // draw_text_ext wraps multi-sentence statements so they fit inside the box
    draw_text_ext(80, 395, "\"" + current_entrant.current_speech + "\"", 20, 600);
} else {
    draw_text(80, 420, feedback_message);
}

// --- 2. Discrepancy / Confront Prompt (Appears when contradiction is present) ---
if (instance_exists(current_entrant) && interrogation_mode && can_press_current) {
    draw_set_color(c_red);
    draw_rectangle(60, 345, 450, 375, false);
    draw_set_color(c_white);
    draw_text(70, 352, "[E] CONFRONT: " + active_confront_label);
}

// --- 3. Topic Menu ---
if (instance_exists(current_entrant)) {
    if (!interrogation_mode) {
        draw_set_color(c_yellow);
        draw_text(60, 525, "[1] Origin  |  [2] Purpose  |  [3] Diet  |  [Q] DEEP INTERROGATION");
    } else {
        draw_set_color(c_aqua);
        draw_text(60, 520, "--- SELECT TOPIC (W/S to Scroll, Enter to Ask, Q to Return) ---");

        var inquiries = current_entrant.dynamic_inquiries;
        for (var i = 0; i < array_length(inquiries); i++) {
            var is_sel = (i == selected_dynamic_q);
            draw_set_color(is_sel ? c_yellow : c_gray);
            var prefix = is_sel ? "> " : "  ";
            draw_text(60 + (i * 220), 545, prefix + inquiries[i].label);
        }
    }
}

// --- 4. Controls & Guide ---
draw_set_color(c_gray);
draw_text(60, 580, "[TAB] Field Guide");
draw_set_color(c_lime);
draw_text(220, 580, "[A] APPROVE");
draw_set_color(c_red);
draw_text(350, 580, "[D] DENY");

// Field guide render (keep your existing if (show_manual) block here)
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