module gl

pub enum Type {
	false = C.GL_FALSE
	true = C.GL_TRUE
    float = C.GL_FLOAT
    unsigned_short = C.GL_UNSIGNED_SHORT
    byte = C.GL_BYTE
    unsigned_byte = C.GL_UNSIGNED_BYTE
    short = C.GL_SHORT
    unsigned_int = C.GL_UNSIGNED_INT
    int = C.GL_INT
    double = C.GL_DOUBLE
}

pub fn (t Type) to_gl() u32 {
	return u32(t)
}

// OpenGL Constants (Partial - Extend this list)
pub const color_buffer_bit = u32(C.GL_COLOR_BUFFER_BIT)
pub const depth_buffer_bit = u32(C.GL_DEPTH_BUFFER_BIT)
pub const stencil_buffer_bit = u32(C.GL_STENCIL_BUFFER_BIT)

pub const static_draw = u32(C.GL_STATIC_DRAW)

pub const true = u32(C.GL_TRUE)
pub const false = u32(C.GL_FALSE)

pub const triangles = u32(C.GL_TRIANGLES)
pub const triangle_strip = u32(C.GL_TRIANGLE_STRIP)
pub const triangle_fan = u32(C.GL_TRIANGLE_FAN)

pub const array_buffer = u32(C.GL_ARRAY_BUFFER)
pub const element_array_buffer = u32(C.GL_ELEMENT_ARRAY_BUFFER)

// Error Codes
pub const no_error = u32(C.GL_NO_ERROR)
pub const invalid_enum = u32(C.GL_INVALID_ENUM)
pub const invalid_value = u32(C.GL_INVALID_VALUE)
pub const invalid_operation = u32(C.GL_INVALID_OPERATION)
pub const invalid_framebuffer_operation = u32(C.GL_INVALID_FRAMEBUFFER_OPERATION)
pub const out_of_memory = u32(C.GL_OUT_OF_MEMORY)

// Shader types
pub const vertex_shader = u32(C.GL_VERTEX_SHADER)
pub const fragment_shader = u32(C.GL_FRAGMENT_SHADER)
pub const geometry_shader = u32(C.GL_GEOMETRY_SHADER)
pub const tess_control_shader = u32(C.GL_TESS_CONTROL_SHADER)
pub const tess_evaluation_shader = u32(C.GL_TESS_EVALUATION_SHADER)
pub const compute_shader = u32(C.GL_COMPUTE_SHADER)

// Shader compile status
pub const compile_status = u32(C.GL_COMPILE_STATUS)

// Shader info log parameters
pub const info_log_length = u32(C.GL_INFO_LOG_LENGTH)
pub const shader_source_length = u32(C.GL_SHADER_SOURCE_LENGTH)

// Program link status
pub const link_status = u32(C.GL_LINK_STATUS)

// Program info log parameters
pub const program_info_log_length = u32(C.GL_INFO_LOG_LENGTH)
pub const program_binary_length = u32(C.GL_PROGRAM_BINARY_LENGTH)
pub const attached_shaders = u32(C.GL_ATTACHED_SHADERS)
pub const active_attributes = u32(C.GL_ACTIVE_ATTRIBUTES)
pub const active_uniforms = u32(C.GL_ACTIVE_UNIFORMS)