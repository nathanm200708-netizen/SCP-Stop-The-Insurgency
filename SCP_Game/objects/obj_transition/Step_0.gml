if (transitioning) {
    if (fade_out) {
        fade += fade_speed;

        if (fade >= 1) {
            fade = 1;
            fade_out = false;
            room_goto(target_room);
        }
    } else {
        fade -= fade_speed;

        if (fade <= 0) {
            fade = 0;
            transitioning = false;
        }
    }
}