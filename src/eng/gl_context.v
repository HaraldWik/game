module eng

import sdl

pub enum ContextType {
	non
	opengl = int(sdl.WindowFlags.opengl)
	vulkan = int(sdl.WindowFlags.vulkan)
}

@[noinit]
pub struct GlContext {
	pub:
	version f32

	instance &sdl.GLContext
}

pub fn create_gl_context(window &Window, version f32) GlContext {
	sdl.gl_set_attribute(sdl.GLattr.context_major_version, int(version.str().split('.')[0].int()))
	sdl.gl_set_attribute(sdl.GLattr.context_minor_version, int(version.str().split('.')[1].int()))
    sdl.gl_set_attribute(sdl.GLattr.context_profile_mask, 1)

	instance := sdl.gl_create_context(window.instance)
	if instance == unsafe { nil } {
		println('When creating a OpenGl context you need todo "Context.opengl" in window creation!')
		eprint("OpenGL context could not be created! SDL_Error: ${sdl.get_error()}")
		sdl.destroy_window(window.instance)
		sdl.quit()
		exit(1)
	}

	return GlContext{
		instance: &instance
		version: version
	}
}

pub fn (ctx GlContext) swap_window(window Window) {
	sdl.gl_swap_window(window.instance)
}