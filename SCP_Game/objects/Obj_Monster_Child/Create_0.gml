// obj_monster_child : Create Event
event_inherited();

is_monster = true;

dialogue.origin = "Sector 9";
dialogue.purpose = "Hunting";
dialogue.diet = "Raw meat only.";

// Set initial spoken line
current_speech = dialogue.greeting;

dynamic_inquiries = [
    {
        label: "Daily Routine",
        statement: "I work daytime shifts at Sector 2 warehouse. Though usually, the midday sun is far too dark to see anything without burning.",
        can_confront: true,
        confront_label: "Press: 'Sun too dark?'",
        confront_response: "I-I mean bright! Far too bright! It hurts my eyes, that is all!"
    },
    {
        label: "Luggage Contents",
        statement: "Nothing illegal. Only fresh red cuts from the market. It needs to stay moist or it loses its warmth.",
        can_confront: true,
        confront_label: "Press: 'Moist red cuts?'",
        confront_response: "It's standard beef! Why are you staring at my bag like that?!"
    }
];