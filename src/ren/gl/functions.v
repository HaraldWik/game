module gl

#include <GL/glew.h>
#include <GL/gl.h>

#flag -lGLEW -lGL -lGLU

// Glew
fn C.glewInit() int

pub fn glew_init() int {
	return C.glewInit()
}

// Generall
fn C.glViewport(x int, y int, width int, heigt int)

pub fn viewport(x int, y int, width int, heigt int) {
	C.glViewport(x, y, width, heigt)
}

fn C.glClear(mask u32)

pub fn clear(mask u32) {
	C.glClear(mask)
}

fn C.glClearColor(r f32, g f32, b f32, a f32)

pub fn clear_color(r f32, g f32, b f32, a f32) {
	C.glClearColor(r, g, b, a)
}

// Buffer
fn C.glGenBuffers(n u32, buffers &u32)

pub fn gen_buffer(n u32, buffers &u32) {
	C.glGenBuffers(n, buffers)
}

fn C.glBindBuffer(target u32, buffer u32)

pub fn bind_buffer(target u32, buffer u32) {
	C.glBindBuffer(target, buffer)
}

fn C.glBufferData(target u32, size isize, data voidptr, usage u32)

pub fn buffer_data(target u32, size isize, data voidptr, usage u32) {
	C.glBufferData(target, size, data, usage)
}

// Vertex
fn C.glEnableVertexAttribArray(index u32)

pub fn enable_vertex_attrib_array(index u32) {
    C.glEnableVertexAttribArray(index)
}

// Function signature in C
fn C.glVertexAttribPointer(index u32, size int, typ u32, normalized u8, stride int, pointer voidptr)

// V function binding
pub fn vertex_attrib_pointer(index u32, size int, typ u32, normalized bool, stride int, pointer int) {
    C.glVertexAttribPointer(index, size, typ, u8(normalized), stride, unsafe { voidptr(&pointer) })
}


// Draw
fn C.glDrawArrays(mode u32, first int, count int)

pub fn draw_array(mode u32, first int, count int) {
	C.glDrawArrays(mode, first, count)
}

fn C.glDrawElements(mode u32, count int, typ u32, indices voidptr)

pub fn draw_elements(mode u32, count int, typ u32, indices voidptr) {
    C.glDrawElements(mode, count, typ, indices)
}

// Shaders
fn C.glCreateShader(shader_type u32) u32

pub fn create_shader(shader_type u32) u32 {
    return C.glCreateShader(shader_type)
}

fn C.glCompileShader(shader u32)

pub fn compile_shader(shader u32) {
    C.glCompileShader(shader)
}

fn C.glAttachShader(program u32, shader u32)

pub fn attach_shader(program u32, shader u32) {
    C.glAttachShader(program, shader)
}

fn C.glCreateProgram() u32

pub fn create_program() u32 {
    return C.glCreateProgram()
}

fn C.glLinkProgram(program u32)

pub fn link_program(program u32) {
    C.glLinkProgram(program)
}

fn C.glUseProgram(program u32)

pub fn use_program(program u32) {
    C.glUseProgram(program)
}

fn C.glShaderSource(shader u32, count int, strings &&char, lengths &&int)

pub fn shader_source(shader u32, count int, code &&char, lengths &&int) {
    C.glShaderSource(shader, count, code, lengths)
}

fn C.glGetShaderInfoLog(shader u32, max_length int, length &int, info_log &char)

pub fn get_shader_info_log(shader u32, max_length int, length &int, info_log &char) {
    C.glGetShaderInfoLog(shader, max_length, length, info_log)
}

fn C.glGetShaderiv(shader u32, pname u32, params &int)

pub fn get_shader_iv(shader u32, pname u32, params &int) {
    C.glGetShaderiv(shader, pname, params)
}

fn C.glGetProgramInfoLog(program u32, max_length int, length &int, info_log &char)

pub fn get_program_info_log(program u32, max_length int, length &int, info_log &char) {
    C.glGetProgramInfoLog(program, max_length, length, info_log)
}

fn C.glGetProgramiv(program u32, pname u32, params &int)

pub fn get_program_iv(program u32, pname u32, params &int) {
    C.glGetProgramiv(program, pname, params)
}


// Error
fn C.glGetError() u32

pub fn get_error() u32 {
    return C.glGetError()
}
