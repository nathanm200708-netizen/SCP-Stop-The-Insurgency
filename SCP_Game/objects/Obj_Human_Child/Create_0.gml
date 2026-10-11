event_inherited();
is_monster = false;

dialogue.origin = "Sector 2";
dialogue.purpose = "Grain Mill Work";
dialogue.diet = "Bread and stew";
current_speech = "Hello officer, here is my paperwork.";

// Dynamic inquiries tagged with factual keys
dynamic_inquiries = [
    {
        label: "Daily Routine",
        statement: "I take the 7 AM train from Sector 2 every morning to reach the grain mill.",
        tag_key: "commute_origin",
        tag_val: "Sector 2"
    },
    {
        label: "Work Schedule",
        statement: "I work standard daylight shifts at the mill until dusk.",
        tag_key: "schedule",
        tag_val: "Day"
    }
];