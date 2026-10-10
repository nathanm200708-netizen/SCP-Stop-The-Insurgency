// obj_human_child : Create Event

// CRITICAL: Runs obj_unit_parent's Create Event where current_speech is defined!
event_inherited();

is_monster = false;

dialogue.origin = "Sector 2";
dialogue.purpose = "Family visit";
dialogue.diet = "Bread and canned stew.";

// Set the initial spoken line
current_speech = dialogue.greeting;

dynamic_inquiries = [
    {
        label: "Daily Routine",
        statement: "I take the 7 AM train from Sector 2 every morning. I work at the grain mill until sundown, then head straight home to my family.",
        can_confront: false,
        confront_label: "",
        confront_response: ""
    },
    {
        label: "Luggage Contents",
        statement: "Just work tools and lunch. A thermos of soup, some bread, and a few wrench sets for the machinery at the dock.",
        can_confront: false,
        confront_label: "",
        confront_response: ""
    }
];
