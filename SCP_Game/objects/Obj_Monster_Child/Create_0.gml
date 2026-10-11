// 1. Inherit default variables from obj_unit_parent
event_inherited();

is_monster = true;

// 2. Define the pool of profiles
var profiles = [
    {
        origin: "Sector 1",
        purpose: "Grain Mill Work",
        diet: "Salted rations",
        inquiries: [
            {
                label: "Daily Routine",
                statement: "I take the early morning freight from Sector 3 straight to the terminal.",
                tag_key: "commute_origin",
                tag_val: "Sector 3" // Contradicts dialogue.origin ("Sector 1")
            },
            {
                label: "Work Schedule",
                statement: "I prefer working deep midnight shifts to avoid the heat.",
                tag_key: "schedule",
                tag_val: "Night"
            }
        ]
    },
    {
        origin: "Sector 4",
        purpose: "Family visit",
        diet: "Preserved roots",
        inquiries: [
            {
                label: "Daily Routine",
                statement: "I commute daily from Sector 2 over the perimeter pass.",
                tag_key: "commute_origin",
                tag_val: "Sector 2" // Contradicts dialogue.origin ("Sector 4")
            },
            {
                label: "Work Schedule",
                statement: "I work standard shifts inside Sector 4.",
                tag_key: "schedule",
                tag_val: "Day"
            }
        ]
    }
];

// 3. Pick one profile at random
var selected_profile = profiles[irandom(array_length(profiles) - 1)];

// 4. Assign profile data
dialogue.origin = selected_profile.origin;
dialogue.purpose = selected_profile.purpose;
dialogue.diet = selected_profile.diet;
dynamic_inquiries = selected_profile.inquiries;

current_speech = "I am ready for processing, inspector.";