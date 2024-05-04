extends Node
class_name WaiterCatLink
onready var Cat = JavaScript.get_interface("Cat")
const CATGROUP : String = "CATGROUP"
static func cat(n:Node) -> WaiterCatLink:
	return n.get_tree().get_nodes_in_group(CATGROUP)[0] # should be me
func _ready():
	add_to_group(CATGROUP)
	if Cat:
		print("gd.  Sending gprop...")
		Cat.set_gprop("BG", "#" + ProjectSettings.get("rendering/environment/default_clear_color").to_html(false))
		print("gd.  Sent!")
#		Bridge.setup_joystick_if_mobile(_jscb_get_droqever_input_changed)
		print("gd.  Spoke to Cat.")
	else:
		print("gd.  No Cat. (maybe you're not running on web?) v66")
func try_goto(garden_name:String) -> bool:
	if Cat:
		return Cat.goto(garden_name)
	else:
		return false
