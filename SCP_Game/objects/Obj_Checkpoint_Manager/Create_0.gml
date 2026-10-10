current_entrant = instance_find(obj_unit_parent, 0);
feedback_message = "";
show_manual = false; // Toggle with TAB or F
// Sub-menu state
interrogation_mode = false;  // false = standard 1-2-3; true = dynamic questions
selected_dynamic_q = 0;      // highlight cursor index

// Predetermined rules/classifiers known to the inspector
inspector_guide = {
    valid_sectors: ["Sector 1", "Sector 2", "Sector 3", "Sector 4"],
    valid_purposes: ["Work transit", "Family visit", "Medical treatment"],
    monster_clues: [
        "- Monsters cannot state a valid sector (Sector 5+ do not exist).",
        "- Monsters claim travel for 'Hunting' or 'Leisure'.",
        "- Monsters slip up when asked about food or sunlight."
    ]
};
// Confrontation tracking
can_press_current = false;
active_confront_label = "";
active_confront_reply = "";