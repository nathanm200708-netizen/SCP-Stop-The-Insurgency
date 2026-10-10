// Identity flag (human by default)
is_monster = false;

// --- Tier 1: Static Protocol Answers ---
dialogue = {
    greeting: "Hello, inspector.",
    origin: "Sector 1",
    purpose: "Work transit",
    diet: "Standard rations.",
    approved: "Thank you, officer.",
    denied: "Wait, you cannot do this!"
};
// --- Tier 2: Dynamic / Contextual Inquiries ---
// Each item has a button label and the entrant's spoken response
dynamic_inquiries = [
    { label: "Incident one", response: "placeholder." },
    { label: "Incident two",   response: "placeholder." }
];

// Current speech displayed on screen
current_speech = dialogue.greeting;