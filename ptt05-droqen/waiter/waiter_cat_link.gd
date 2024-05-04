extends Node
class_name WaiterCatLink
onready var Cat = JavaScript.get_interface("Cat")
func _ready():
	if Cat:
		print("gd.  Sending gprop...")
		Cat.set_gprop("BG", "#" + ProjectSettings.get("rendering/environment/default_clear_color").to_html(false))
		print("gd.  Sent!")
#		Bridge.setup_joystick_if_mobile(_jscb_get_droqever_input_changed)
		print("gd.  Spoke to Cat.")
	else:
		print("gd.  No Cat. (maybe you're not running on web?) v66")
