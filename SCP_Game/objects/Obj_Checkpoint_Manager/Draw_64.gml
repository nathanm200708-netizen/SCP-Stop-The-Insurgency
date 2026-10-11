// 1. Spoken Dialogue Window
draw_set_color(c_black);
draw_rectangle(60, 380, 700, 490, false);
draw_set_color(c_white);
draw_rectangle(60, 380, 700, 490, true);

if (instance_exists(current_entrant)) {
    draw_text_ext(80, 395, "\"" + current_entrant.current_speech + "\"", 20, 600);
} else {
    draw_text(80, 425, feedback_message);
}

// 2. Center Panel: Log View vs Dynamic Interrogation Options
if (instance_exists(current_entrant)) {
    if (log_mode) {
        // Log Box
        draw_set_color(make_color_rgb(20, 24, 30));
        draw_rectangle(60, 100, 520, 360, false);
        draw_set_color(c_white);
        draw_rectangle(60, 100, 520, 360, true);

        draw_set_color(c_aqua);
        draw_text(75, 115, "CONTRADICTION LOG (Select 2 statements, press [E])");
        draw_line(75, 135, 505, 135);

        var len = array_length(statement_log);
        if (len == 0) {
            draw_set_color(c_gray);
            draw_text(75, 160, "No statements recorded yet. Ask questions first.");
        } else {
            for (var i = 0; i < len; i++) {
                var y_pos = 150 + (i * 26);
                var is_cursor = (i == log_cursor);
                var is_a = (i == selected_log_a);
                var is_b = (i == selected_log_b);

                var item_color = c_white;
                if (is_a || is_b) item_color = c_yellow;
                if (is_cursor) item_color = c_lime;

                draw_set_color(item_color);
                var marker = is_cursor ? "> " : "  ";
                if (is_a) marker = "[1] ";
                if (is_b) marker = "[2] ";

                draw_text(80, y_pos, marker + statement_log[i].text);
            }
        }
    } else if (interrogation_mode) {
        // Deep Interrogation Topics List
        draw_set_color(c_aqua);
        draw_text(60, 500, "--- DEEP INTERROGATION (W/S to Scroll, Enter to Ask, Q to Return) ---");

        var inquiries = current_entrant.dynamic_inquiries;
        for (var k = 0; k < array_length(inquiries); k++) {
            var is_sel = (k == selected_dynamic_q);
            draw_set_color(is_sel ? c_yellow : c_ltgray);
            var prefix = is_sel ? "> " : "  ";
            draw_text(60 + (k * 220), 525, prefix + inquiries[k].label);
        }
    }
}

// 3. Navigation Controls Bar
draw_set_color(c_yellow);
if (log_mode) {
    draw_text(60, 555, "[W/S] Navigate  |  [Space] Select Claim  |  [E] CONFRONT PAIR  |  [C] EXIT LOG");
} else if (interrogation_mode) {
    draw_text(60, 555, "[W/S] Choose Question  |  [Enter/Space] Ask  |  [Q] Return to Protocol");
} else {
    draw_text(60, 520, "[1,2,3] Protocol Qs  |  [Q] Deep Interrogation  |  [C] Open Log (" + string(array_length(statement_log)) + ")");
}

draw_set_color(c_gray);
draw_text(60, 580, "[TAB] Field Guide");
draw_set_color(c_lime);
draw_text(220, 580, "[A] APPROVE");
draw_set_color(c_red);
draw_text(350, 580, "[D] DENY");

// 4. Field Guide Overlay (Renders on right side of screen)
if (show_manual) {
    draw_set_color(make_color_rgb(45, 52, 54));
    draw_rectangle(720, 60, 980, 540, false);
    draw_set_color(c_white);
    draw_rectangle(720, 60, 980, 540, true);

    draw_set_color(c_orange);
    draw_text(740, 80, "INSPECTOR'S FIELD GUIDE");
    draw_line(740, 105, 960, 105);

    draw_set_color(c_white);
    draw_text(740, 120, "VALID ORIGINS:");
    draw_text(740, 140, "Sectors 1, 2, 3, 4 only");

    draw_text(740, 180, "VALID PURPOSES:");
    draw_text(740, 200, "Work, Family, Medical");

    draw_text(740, 250, "MONSTER TELLTALES:");
    for (var j = 0; j < array_length(inspector_guide.monster_clues); j++) {
        draw_text_ext(740, 280 + (j * 55), inspector_guide.monster_clues[j], 16, 220);
    }
}