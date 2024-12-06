module main

import eng
import eng.input
import gl

fn main() {
	mut window := eng.create_window('window', 800, 600, true, .opengl)

	gl_ctx := eng.create_gl_context(window, 3.3)

	mut r := f32(1.0)
	mut g := f32(0.1)
	mut b := f32(0.3)

	mut is_fullscreen := false
	mut is_mouse_captured := false

	for !window.should_close() {
    	gl.clear_color(f32(r), f32(g), f32(b), 1.0)
    	gl.clear(gl.color_buffer_bit)

		match input.get_pressed_keys()[0] {
			.r { r = wrap_value(r + f32(input.get_mouse_scroll())/75) }
			.g { g = wrap_value(g + f32(input.get_mouse_scroll())/75) }
			.b { b = wrap_value(b + f32(input.get_mouse_scroll())/75) }
			.f { is_fullscreen = !is_fullscreen }
			.c { is_mouse_captured = !is_mouse_captured }
			else {}
		}

		window.set_fullscreen(is_fullscreen)
		input.set_mouse_capture(is_mouse_captured)

		gl_ctx.swap_window(window)
	}
}

fn wrap_value(x f32) f32 {
    if x < 0.0 {
        return 1.0
    } else if x > 1.0 {
        return 0.0
    }
    return x
}
