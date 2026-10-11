// 1. Always allow Guide toggle regardless of who is in front of the desk
if (keyboard_check_pressed(vk_tab)) {
    show_manual = !show_manual;
}

// 2. Entrant Interaction
if (instance_exists(current_entrant)) {

    // Toggle Contradiction Log with [C]
    if (keyboard_check_pressed(ord("C"))) {
        log_mode = !log_mode;
        if (log_mode) interrogation_mode = false; // Close interrogation menu if opening log
        log_cursor = 0;
    }

    // Toggle Deep Interrogation with [Q]
    if (keyboard_check_pressed(ord("Q"))) {
        interrogation_mode = !interrogation_mode;
        if (interrogation_mode) log_mode = false; // Close log if opening interrogation menu
        selected_dynamic_q = 0;
    }

    // --- SUB-SCREEN A: Contradiction Log ---
    if (log_mode) {
        var log_len = array_length(statement_log);
        if (log_len > 0) {
            if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
                log_cursor = (log_cursor + 1) mod log_len;
            }
            if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
                log_cursor = (log_cursor - 1 + log_len) mod log_len;
            }

            // Select statement pairs with Space / Enter
            if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
                if (selected_log_a == -1) {
                    selected_log_a = log_cursor;
                } else if (selected_log_b == -1 && log_cursor != selected_log_a) {
                    selected_log_b = log_cursor;
                } else {
                    selected_log_a = log_cursor;
                    selected_log_b = -1;
                }
            }

            // Confront pair with [E]
            if (selected_log_a != -1 && selected_log_b != -1 && keyboard_check_pressed(ord("E"))) {
                var item_a = statement_log[selected_log_a];
                var item_b = statement_log[selected_log_b];

                var is_mismatch = 
                    ((item_a.tag == "origin" && item_b.tag == "commute_origin") ||
                     (item_a.tag == "commute_origin" && item_b.tag == "origin")) &&
                    (item_a.val != item_b.val);

                if (is_mismatch && current_entrant.is_monster) {
                    current_entrant.current_speech = "DISCREPANCY EXPOSED: You caught me... Sector 3 has no transit line to Sector 1!";
                    feedback_message = "CONTRADICTION VERIFIED: Discrepancy confirmed.";
                } else {
                    current_entrant.current_speech = "Those statements do not conflict, inspector.";
                }

                selected_log_a = -1;
                selected_log_b = -1;
            }
        }
    }
    // --- SUB-SCREEN B: Deep Interrogation ---
    else if (interrogation_mode) {
        var q_count = array_length(current_entrant.dynamic_inquiries);
        if (q_count > 0) {
            if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
                selected_dynamic_q = (selected_dynamic_q + 1) mod q_count;
            }
            if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
                selected_dynamic_q = (selected_dynamic_q - 1 + q_count) mod q_count;
            }

            if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
                var inq = current_entrant.dynamic_inquiries[selected_dynamic_q];
                current_entrant.current_speech = inq.statement;
                log_statement(inq.tag_key, inq.tag_val, inq.label + ": " + inq.tag_val);
            }
        }
    }
    // --- SUB-SCREEN C: Standard 1-2-3 Protocol Questions ---
    else {
        if (keyboard_check_pressed(ord("1"))) {
            current_entrant.current_speech = "Origin: " + current_entrant.dialogue.origin;
            log_statement("origin", current_entrant.dialogue.origin, "Claimed Home: " + current_entrant.dialogue.origin);
        }
        if (keyboard_check_pressed(ord("2"))) {
            current_entrant.current_speech = "Purpose: " + current_entrant.dialogue.purpose;
            log_statement("purpose", current_entrant.dialogue.purpose, "Stated Purpose: " + current_entrant.dialogue.purpose);
        }
        if (keyboard_check_pressed(ord("3"))) {
            current_entrant.current_speech = "Diet: " + current_entrant.dialogue.diet;
            log_statement("diet", current_entrant.dialogue.diet, "Declared Food: " + current_entrant.dialogue.diet);
        }
    }

    // --- Stamp Decisions ---
    if (keyboard_check_pressed(ord("A"))) {
        feedback_message = current_entrant.is_monster ? "VIOLATION: Monster admitted!" : "APPROVED: Citizen cleared.";
        instance_destroy(current_entrant);
        current_entrant = noone;
        spawn_timer = 90;
    }
    else if (keyboard_check_pressed(ord("D"))) {
        feedback_message = current_entrant.is_monster ? "CORRECT: Monster apprehended!" : "PENALTY: Lawful citizen denied!";
        instance_destroy(current_entrant);
        current_entrant = noone;
        spawn_timer = 90;
    }
} 
// 3. Spawning Delay Loop
else {
    if (spawn_timer > 0) {
        spawn_timer--;
        if (spawn_timer == 0) spawn_next_entrant();
    }
}