module main

import eng
import ren

fn main() {
	mut window := eng.create_window('window', 800, 600, true, .opengl)
	mut renderer := ren.Renderer{}

	gl_ctx := eng.create_gl_context(window, 4.3)

	renderer.init()

	for !window.should_close() {

		renderer.draw()

		gl_ctx.swap_window(window)
	}
}
