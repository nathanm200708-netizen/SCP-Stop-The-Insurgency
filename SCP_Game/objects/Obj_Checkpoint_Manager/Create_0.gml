current_entrant = instance_find(obj_unit_parent, 0);
feedback_message = "";
show_manual = false; // Toggle with TAB or F

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