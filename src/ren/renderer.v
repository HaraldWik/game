module ren

import ren.gl

pub struct Renderer {}

pub fn (ren Renderer) init() {
	if gl.glew_init() != C.GLEW_OK {
		eprint("GLEW could not be initialized!")
		exit(1)
	}

	send_gl_data()

	install_shaders()

	gl.enable(0x92E0)
}

pub fn (ren Renderer) draw() {
	gl.viewport(0, 0, 800, 800)

	gl.clear(gl.color_buffer_bit | gl.depth_buffer_bit | gl.stencil_buffer_bit)

	gl.draw_array(gl.triangles, 0, 6)
	gl.draw_elements(gl.triangles, 6, gl.Type.unsigned_short.to_gl(), unsafe { nil })
}

fn send_gl_data() {
	verts := [
		f32(0.0), 0.0,
		1.0, 0.0, 0.0
		1.0, 1.0,
		1.0, 0.0, 0.0
		-1.0, 1.0,
		1.0, 0.0, 0.0

		0.0, 0.0,
		1.0, 0.0, 0.0
		-1.0, -1.0,
		1.0, 0.0, 0.0
		1.0, -1.0,
		1.0, 0.0, 0.0
	]
	verts_buffer_id := u32(0)

	gl.gen_buffer(1, &verts_buffer_id)
	gl.bind_buffer(gl.array_buffer, verts_buffer_id)
	gl.buffer_data(gl.array_buffer, sizeof(verts), verts, gl.static_draw)
	gl.enable_vertex_attrib_array(0)
	C.glVertexAttribPointer(0, 2, gl.Type.float.to_gl(), 0, int(sizeof(f32)) * 5, 0)
	gl.enable_vertex_attrib_array(1)
	C.glVertexAttribPointer(1, 3, gl.Type.float.to_gl(), 0, int(sizeof(f32)) * 5, int(sizeof(f32)) * 2)

	indices := [
		u16(0), 
		1, 
		2, 
		0,
		3, 
		4
	]
	indices_buffer_id := u32(1)

	gl.gen_buffer(1, &indices_buffer_id)
	gl.bind_buffer(gl.element_array_buffer, indices_buffer_id)
	gl.buffer_data(gl.element_array_buffer, sizeof(indices), indices, gl.static_draw)
}

fn install_shaders() {
	vertex_shader_id := gl.create_shader(gl.vertex_shader)

	fragment_shader_id := gl.create_shader(gl.fragment_shader)

	mut adapter := &vertex_shader_code.str
	C.glShaderSource(vertex_shader_id, 1, adapter, 0)
	adapter = &fragment_shader_code.str
	C.glShaderSource(fragment_shader_id, 1, adapter, 0)

	gl.compile_shader(vertex_shader_id)
	gl.compile_shader(fragment_shader_id)

	program_id := gl.create_program()
	gl.attach_shader(program_id, vertex_shader_id)
	gl.attach_shader(program_id, fragment_shader_id)
	gl.link_program(program_id)

	gl.use_program(program_id)
}