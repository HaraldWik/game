module eng

import sdl

@[noinit]
pub struct Window {
	context_type ContextType

	pub:
	instance &sdl.Window

	title string
	x int
	y int
}

pub fn create_window(title string, x int, y int, resizable bool, context ContextType) &Window {
    if sdl.init(sdl.init_video) < 0 {
        println("Failed to initialize SDL: ${sdl.get_error()}")
        eprint("Initialization failed")
    }

	mut rez := u32(0)

	if resizable {
		rez = u32(sdl.WindowFlags.resizable)
	}

    window := sdl.create_window(title.str,
        sdl.windowpos_undefined, sdl.windowpos_undefined,
        x, y, 
        u32(sdl.WindowFlags.hidden) | rez | u32(context)
    )
    if window == unsafe { nil } {
        eprint("Failed to create window: ${sdl.get_error()}")
        sdl.quit()
        exit(1)
    }

	sdl.show_window(window)

	return &Window{
		context_type: context,

		instance: window,

		title: title, x: x, y: y,
	}
}

pub fn (win Window) should_close() bool {
	mut should_close := false
	for {
		event := sdl.Event{}
		for 0 < sdl.poll_event(&event) {
			match event.@type {
				.quit { should_close = true }
				else {}
			}
		}

		return should_close
    }

	return true
}

pub fn (mut win Window) close() {
    match win.context_type {
        .non { }
        .opengl { sdl.gl_delete_context(sdl.gl_get_current_context()) }
        .vulkan {  }
    }

    sdl.destroy_window(win.instance)
    sdl.quit()
}

pub fn (win &Window) set_fullscreen(enebled bool) {
	sdl.set_window_fullscreen(win.instance, u32(enebled))
}

pub fn (win &Window) set_cursor_appearance(appearance sdl.SystemCursor) {
	sdl.create_system_cursor(appearance)
}