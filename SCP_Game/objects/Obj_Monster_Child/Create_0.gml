event_inherited()
is_monster = true;
// Contains classifier violations from the manual
dialogue.origin = "Sector 9";       // Suspicious
dialogue.purpose = "Hunting";       // Suspicious
dialogue.diet = "Raw meat only.";   // Suspicious

// Dynamic questions catch them off guard
dynamic_inquiries = [
    { label: "Incident one",    response: "placeholder" },
    { label: "Incident two", response: "placeholder" },
    { label: "Incident three",    response: "placeholder" }
];