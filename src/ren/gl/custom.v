module gl

pub fn check_error(message string, place string) {
	mut error := get_error()
	if error != 0 {
		println('ERROR line=${place} msg=${message}, id=${error}')
	}
}