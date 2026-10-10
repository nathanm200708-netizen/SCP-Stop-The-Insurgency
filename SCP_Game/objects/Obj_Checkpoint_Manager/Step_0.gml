if (!instance_exists(current_entrant)) {
    current_entrant = instance_find(obj_unit_parent, 0);
}

if (instance_exists(current_entrant)) {
    // Toggle Inspector's Guide
    if (keyboard_check_pressed(vk_tab)) {
        show_manual = !show_manual;
    }

    // Toggle Dynamic Interrogation Sub-Menu with [Q]
    if (keyboard_check_pressed(ord("Q"))) {
        interrogation_mode = !interrogation_mode;
        selected_dynamic_q = 0; // Reset cursor to first question
    }

    // --- MODE 1: Standard Static Questions ---
    if (!interrogation_mode) {
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
    // --- MODE 2: Dynamic Interrogation Questions ---
    else {
        var count = array_length(current_entrant.dynamic_inquiries);
        
        if (count > 0) {
            // Scroll down
            if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
                selected_dynamic_q = (selected_dynamic_q + 1) mod count;
            }
            // Scroll up
            if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
                selected_dynamic_q = (selected_dynamic_q - 1 + count) mod count;
            }
            // Ask question
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
                current_entrant.current_speech = current_entrant.dynamic_inquiries[selected_dynamic_q].response;
            }
        }
    }

    // Decisions (Approve / Deny)
    if (keyboard_check_pressed(ord("A"))) {
        feedback_message = current_entrant.is_monster ? "VIOLATION: Monster admitted!" : "APPROVED: Citizen cleared.";
        instance_destroy(current_entrant);
        show_manual = false;
        interrogation_mode = false;
    }
    if (keyboard_check_pressed(ord("D"))) {
        feedback_message = current_entrant.is_monster ? "CORRECT: Monster apprehended!" : "PENALTY: Lawful citizen denied!";
        instance_destroy(current_entrant);
        show_manual = false;
        interrogation_mode = false;
    }
}