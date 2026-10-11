// --- Contradiction Log Variables ---
statement_log = [];          // List of statements recorded
log_mode = false;            // <--- This was missing!
selected_log_a = -1;         // First selected statement
selected_log_b = -1;         // Second selected statement
log_cursor = 0;              // Cursor index for scrolling
randomize();

feedback_message = "";
show_manual = false;

// Sub-menu state
interrogation_mode = false;
selected_dynamic_q = 0;

// Confrontation prompt tracking
can_press_current = false;
active_confront_label = "";
active_confront_reply = "";

// --- Contradiction Log System ---
statement_log = [];
log_mode = false;
selected_log_a = -1;
selected_log_b = -1;
log_cursor = 0;

// Function to log unique statements
log_statement = function(_tag, _value, _display_text) {
    for (var i = 0; i < array_length(statement_log); i++) {
        if (statement_log[i].tag == _tag) return;
    }
    array_push(statement_log, {
        tag: _tag,
        val: _value,
        text: _display_text
    });
};

// Inspector Field Guide
inspector_guide = {
    valid_sectors: ["Sector 1", "Sector 2", "Sector 3", "Sector 4"],
    valid_purposes: ["Work transit", "Family visit", "Medical treatment"],
    monster_clues: [
        "- Monsters cannot state a valid sector (Sector 5+ do not exist).",
        "- Monsters claim travel for 'Hunting' or 'Leisure'.",
        "- Monsters slip up when asked about food or sunlight."
    ]
};

// Spawner coordinates and timer
entrant_spawn_x = 576;
entrant_spawn_y = 384;
spawn_timer = 0;

// Spawning function
spawn_next_entrant = function() {
    var entrant_type = choose(Obj_Human_Child, Obj_Monster_Child);
    current_entrant = instance_create_layer(entrant_spawn_x, entrant_spawn_y, "Instances", entrant_type);

    interrogation_mode = false;
    log_mode = false;
    statement_log = [];
    selected_log_a = -1;
    selected_log_b = -1;
    log_cursor = 0;
};

// Start the loop
current_entrant = noone;
spawn_next_entrant();