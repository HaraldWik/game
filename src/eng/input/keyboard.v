module input

import sdl

pub enum Key {
    none = -1

    // Alphabet keys
    a = int(sdl.Scancode.scancode_a)
    b = int(sdl.Scancode.scancode_b)
    c = int(sdl.Scancode.scancode_c)
    d = int(sdl.Scancode.scancode_d)
    e = int(sdl.Scancode.scancode_e)
    f = int(sdl.Scancode.scancode_f)
    g = int(sdl.Scancode.scancode_g)
    h = int(sdl.Scancode.scancode_h)
    i = int(sdl.Scancode.scancode_i)
    j = int(sdl.Scancode.scancode_j)
    k = int(sdl.Scancode.scancode_k)
    l = int(sdl.Scancode.scancode_l)
    m = int(sdl.Scancode.scancode_m)
    n = int(sdl.Scancode.scancode_n)
    o = int(sdl.Scancode.scancode_o)
    p = int(sdl.Scancode.scancode_p)
    q = int(sdl.Scancode.scancode_q)
    r = int(sdl.Scancode.scancode_r)
    s = int(sdl.Scancode.scancode_s)
    t = int(sdl.Scancode.scancode_t)
    u = int(sdl.Scancode.scancode_u)
    v = int(sdl.Scancode.scancode_v)
    w = int(sdl.Scancode.scancode_w)
    x = int(sdl.Scancode.scancode_x)
    y = int(sdl.Scancode.scancode_y)
    z = int(sdl.Scancode.scancode_z)

    // Number keys
    _0 = int(sdl.Scancode.scancode_0)
    _1 = int(sdl.Scancode.scancode_1)
    _2 = int(sdl.Scancode.scancode_2)
    _3 = int(sdl.Scancode.scancode_3)
    _4 = int(sdl.Scancode.scancode_4)
    _5 = int(sdl.Scancode.scancode_5)
    _6 = int(sdl.Scancode.scancode_6)
    _7 = int(sdl.Scancode.scancode_7)
    _8 = int(sdl.Scancode.scancode_8)
    _9 = int(sdl.Scancode.scancode_9)

    // Function keys
    f1 = int(sdl.Scancode.scancode_f1)
    f2 = int(sdl.Scancode.scancode_f2)
    f3 = int(sdl.Scancode.scancode_f3)
    f4 = int(sdl.Scancode.scancode_f4)
    f5 = int(sdl.Scancode.scancode_f5)
    f6 = int(sdl.Scancode.scancode_f6)
    f7 = int(sdl.Scancode.scancode_f7)
    f8 = int(sdl.Scancode.scancode_f8)
    f9 = int(sdl.Scancode.scancode_f9)
    f10 = int(sdl.Scancode.scancode_f10)
    f11 = int(sdl.Scancode.scancode_f11)
    f12 = int(sdl.Scancode.scancode_f12)

    // Modifier keys
    shift_left = int(sdl.Scancode.scancode_lshift)
    shift_right = int(sdl.Scancode.scancode_rshift)
    ctrl_left = int(sdl.Scancode.scancode_lctrl)
    ctrl_right = int(sdl.Scancode.scancode_rctrl)
    alt_left = int(sdl.Scancode.scancode_lalt)
    alt_right = int(sdl.Scancode.scancode_ralt)

    // Special keys
    space = int(sdl.Scancode.scancode_space)
    enter = int(sdl.Scancode.scancode_return)
    escape = int(sdl.Scancode.scancode_escape)
    backspace = int(sdl.Scancode.scancode_backspace)
    tab = int(sdl.Scancode.scancode_tab)
    caps_lock = int(sdl.Scancode.scancode_capslock)

    // Arrow keys
    left = int(sdl.Scancode.scancode_left)
    right = int(sdl.Scancode.scancode_right)
    up = int(sdl.Scancode.scancode_up)
    down = int(sdl.Scancode.scancode_down)

    // Other keys
    insert = int(sdl.Scancode.scancode_insert)
    delete = int(sdl.Scancode.scancode_delete)
    home = int(sdl.Scancode.scancode_home)
    end = int(sdl.Scancode.scancode_end)
    page_up = int(sdl.Scancode.scancode_pageup)
    page_down = int(sdl.Scancode.scancode_pagedown)

    // Keypad keys
    kp_0 = int(sdl.Scancode.scancode_kp_0)
    kp_1 = int(sdl.Scancode.scancode_kp_1)
    kp_2 = int(sdl.Scancode.scancode_kp_2)
    kp_3 = int(sdl.Scancode.scancode_kp_3)
    kp_4 = int(sdl.Scancode.scancode_kp_4)
    kp_5 = int(sdl.Scancode.scancode_kp_5)
    kp_6 = int(sdl.Scancode.scancode_kp_6)
    kp_7 = int(sdl.Scancode.scancode_kp_7)
    kp_8 = int(sdl.Scancode.scancode_kp_8)
    kp_9 = int(sdl.Scancode.scancode_kp_9)
    kp_enter = int(sdl.Scancode.scancode_kp_enter)
    kp_plus = int(sdl.Scancode.scancode_kp_plus)
    kp_minus = int(sdl.Scancode.scancode_kp_minus)
    kp_multiply = int(sdl.Scancode.scancode_kp_multiply)
    kp_divide = int(sdl.Scancode.scancode_kp_divide)
    kp_period = int(sdl.Scancode.scancode_kp_period)

    // Miscellaneous keys
    print_screen = int(sdl.Scancode.scancode_printscreen)
    scroll_lock = int(sdl.Scancode.scancode_scrolllock)
    pause = int(sdl.Scancode.scancode_pause)
    menu = int(sdl.Scancode.scancode_menu)

    // Mouse buttons
    mouse_left
    mouse_middle
    mouse_right
    mouse_back
    mouse_forward
}

pub fn get_pressed_keys() []Key {
    mut pressed_keys := []Key{}
    numkeys := 0
    keyboard_state := sdl.get_keyboard_state(&numkeys)

    for scancode in 0 .. numkeys {
        unsafe { 
			if keyboard_state[scancode] != 0  {
            	if key := Key.from(scancode) {
                	pressed_keys << key
	            }
			}
        }
    }

    pressed_keys << get_pressed_mouse_buttons()

    if pressed_keys.len < 1 {
        return [.none]
    }

    return pressed_keys
}

pub fn keys_pressed(keys ...Key) bool {
    pressed_keys := get_pressed_keys()
    for key in keys {
        if key !in pressed_keys {
            return false
        }
    }
    return true
}
