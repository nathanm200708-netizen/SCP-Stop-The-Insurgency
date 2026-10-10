if (!instance_exists(current_entrant)) {
    current_entrant = instance_find(obj_unit_parent, 0);
}

if (instance_exists(current_entrant)) {
    if (keyboard_check_pressed(vk_tab)) {
        show_manual = !show_manual;
    }

    // Toggle Dynamic Interrogation
    if (keyboard_check_pressed(ord("Q"))) {
        interrogation_mode = !interrogation_mode;
        selected_dynamic_q = 0;
        can_press_current = false;
    }

    // --- Static Questions ---
    if (!interrogation_mode) {
        can_press_current = false;
        if (keyboard_check_pressed(ord("1"))) {
            current_entrant.current_speech = "Origin: " + current_entrant.dialogue.origin;
        }
        if (keyboard_check_pressed(ord("2"))) {
            current_entrant.current_speech = "Purpose: " + current_entrant.dialogue.purpose;
        }
        if (keyboard_check_pressed(ord("3"))) {
            current_entrant.current_speech = "Diet: " + current_entrant.dialogue.diet;
        }
    }
    // --- Dynamic Interrogation ---
    else {
        var count = array_length(current_entrant.dynamic_inquiries);
        if (count > 0) {
            // Scroll questions
            if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
                selected_dynamic_q = (selected_dynamic_q + 1) mod count;
            }
            if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
                selected_dynamic_q = (selected_dynamic_q - 1 + count) mod count;
            }

            // Ask the selected topic
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
                var inquiry = current_entrant.dynamic_inquiries[selected_dynamic_q];
                current_entrant.current_speech = inquiry.statement;

                // Check if this statement contains a pressable contradiction
                if (inquiry.can_confront) {
                    can_press_current = true;
                    active_confront_label = inquiry.confront_label;
                    active_confront_reply = inquiry.confront_response;
                } else {
                    can_press_current = false;
                }
            }

            // Press contradiction with [E]
            if (can_press_current && keyboard_check_pressed(ord("E"))) {
                current_entrant.current_speech = active_confront_reply;
                can_press_current = false; // Discrepancy has been pressed
            }
        }
    }

    // Stamp decisions
    if (keyboard_check_pressed(ord("A"))) {
        feedback_message = current_entrant.is_monster ? "VIOLATION: Monster admitted!" : "APPROVED: Citizen cleared.";
        instance_destroy(current_entrant);
        interrogation_mode = false;
    }
    if (keyboard_check_pressed(ord("D"))) {
        feedback_message = current_entrant.is_monster ? "CORRECT: Monster apprehended!" : "PENALTY: Lawful citizen denied!";
        instance_destroy(current_entrant);
        interrogation_mode = false;
    }
}