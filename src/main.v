module main

import eng
import sdl
import eng.input
import gl
import math

fn main() {
	mut window := eng.create_window('window', 800, 600, true, .opengl)

	gl_ctx := eng.create_gl_context(window,3.3)

	mut r := f64(1.0)
	mut g := f64(0.1)
	mut b := f64(0.3)

	for !window.should_close() {
    	gl.clear_color(f32(r), f32(g), f32(b), 1.0)
    	gl.clear(gl.color_buffer_bit)

		match input.get_pressed_keys()[0] {
			.r { r = math.fmod(r + 0.005, 1.0) }
			.g { g = math.fmod(g + 0.005, 1.0) }
			.b { b = math.fmod(b + 0.005, 1.0) }
			else {}
		}

		gl_ctx.swap_window(window)
		sdl.delay(16)
	}
}
