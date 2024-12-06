module input

import sdl

fn get_pressed_mouse_buttons() []Key {
    mut pressed_buttons := []int{}

    mut x := 0
    mut y := 0

    mouse_state := sdl.get_mouse_state(&x, &y)

    for button in 1 .. 6 {
        if mouse_state & u32(sdl.button(button)) != 0 {
            pressed_buttons << button
        }
    }

    mut pressed_keys := []Key{}

    for button in pressed_buttons {
        pressed_keys << match button {
            1 { .mouse_left }
            2 { .mouse_middle }
            3 { .mouse_right }
            4 { .mouse_back }
            5 { .mouse_forward }
            else {
                .none
            }
        }
    }

    return pressed_keys
}

pub fn get_mouse_scroll() int {
    mut should_close := false
    for !should_close {
    	event := sdl.Event{}
		for 0 < sdl.poll_event(&event) {
			match event.@type {
				.quit { should_close = true }
				.mousewheel {
                	scroll_event := unsafe { &sdl.MouseWheelEvent(&event) }

                	return scroll_event.y
            	}
				else {
                    return 0
                }
			}
		}
    }
    return 0
}

pub fn get_mouse_position() (int, int) {
    mut x := 0
    mut y := 0
    sdl.get_mouse_state(&x, &y)
    return x, y
}

pub fn set_mouse_capture(enebled bool) {
    sdl.capture_mouse(enebled)
    sdl.set_relative_mouse_mode(enebled)
    sdl.show_cursor(match enebled {
        true { sdl.disable }
        false { sdl.enable }
    })
}