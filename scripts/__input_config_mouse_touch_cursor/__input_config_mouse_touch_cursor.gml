//Size of the deadzone for detecting mouse movement, measured in pixels
//Higher values increase how far the mouse must travel before reporting the mouse as being used
#macro INPUT_MOUSE_MOVE_DEADZONE  2

//Maximum number of touch screen points to query
//This applies to touch screen devices only (excludes PlayStation)
#macro INPUT_MAX_TOUCHPOINTS  11

//Margin in pixels around the screen edge where gaining or losing a touch point will not register "pressed" or "released"
//Prevents false positives when dragging on to or off of the edge of a touchscreen.
#macro INPUT_TOUCH_EDGE_DEADZONE  35

//Whether to allow touch input (real, or simulated by physical mouse) to set mouse bindings on touch-enabled platforms
#macro INPUT_TOUCH_POINTER_ALLOWED  false

//Verbs that control motion of Input's device-agnostic cursor
#macro INPUT_CURSOR_VERB_UP     "up"
#macro INPUT_CURSOR_VERB_DOWN   "down"
#macro INPUT_CURSOR_VERB_LEFT   "left"
#macro INPUT_CURSOR_VERB_RIGHT  "right"

#macro INPUT_CURSOR_EXPONENT  1