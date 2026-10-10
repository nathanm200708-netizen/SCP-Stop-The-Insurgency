if (instance_exists(current_entrant)) {
    // Press TAB to consult your Field Manual
    if (keyboard_check_pressed(vk_tab)) {
        show_manual = !show_manual;
    }

    // Interrogation choices
    if (keyboard_check_pressed(ord("1"))) {
        current_entrant.current_speech = "Origin: " + current_entrant.dialogue.origin;
    }
    if (keyboard_check_pressed(ord("2"))) {
        current_entrant.current_speech = "Purpose: " + current_entrant.dialogue.purpose;
    }
    if (keyboard_check_pressed(ord("3"))) {
        current_entrant.current_speech = "Diet: " + current_entrant.dialogue.diet;
    }

    // Decisions
    if (keyboard_check_pressed(ord("A"))) {
        feedback_message = current_entrant.is_monster ? "VIOLATION: Monster admitted!" : "APPROVED: Citizen cleared.";
        instance_destroy(current_entrant);
        show_manual = false;
    }
    if (keyboard_check_pressed(ord("D"))) {
        feedback_message = current_entrant.is_monster ? "CORRECT: Monster apprehended!" : "PENALTY: Lawful citizen denied!";
        instance_destroy(current_entrant);
        show_manual = false;
    }
}