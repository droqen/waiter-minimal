tool
extends Node
class_name WaiterSetup
export var click_to_save_changes : bool setget _do_save_changes, _get_none
export var last_save_time : String
export var click_for_random_name : bool setget _do_random_name, _get_none
export var click_to_autogen_date : bool setget _do_autogen_date, _get_none
export var unique_name : String = ""
export var todays_date : String = ""
export var bg_color : Color = Color("#354148")

func _ready():
	if not Engine.editor_hint:
		# pass information to js?
		queue_free()
	
func _get_none(): return false

func _do_save_changes(_v):
	ProjectSettings.set("application/config/name", unique_name)
	ProjectSettings.set("application/config/description", todays_date)
	ProjectSettings.set("application/run/main_scene", get_tree().edited_scene_root.filename)
	ProjectSettings.set("rendering/environment/default_clear_color", bg_color)
	ProjectSettings.set("application/boot_splash/bg_color", bg_color)
	last_save_time = Time.get_time_string_from_system()
	print("OK! Save completed @ "+last_save_time)
	property_list_changed_notify()
	
func _do_random_name(_v):
	unique_name = "TODO: make random name generator work"
	property_list_changed_notify()
func _do_autogen_date(_v):
	todays_date = Time.get_date_string_from_system()
	property_list_changed_notify()
	
# ProjectSettings.get("display/window/size/width")
# ProjectSettings.get("display/window/size/height")
# ProjectSettings.set("dynamic_fonts/use_oversampling", false) # stop 
# ProjectSettings.set("network/limits/debugger_stdout/
# ProjectSettings.set("display/window/stretch/mode","viewport")
# ProjectSettings.set("rendering/quality/2d/use_pixel_snap",true)
# ProjectSettings.set("display/window/size/width", width)
# ProjectSettings.set("display/window/size/height", height)
# ProjectSettings.set("display/window/size/test_width", width * 
# ProjectSettings.set("display/window/size/test_height", height * 
# ProjectSettings.set("application/config/name", project_year + ", " + 
# ProjectSettings.set("application/config/description", project_desc)
# ProjectSettings.set("application/run/main_scene", 
# ProjectSettings.set("rendering/environment/default_clear_color", 
# ProjectSettings.set("application/boot_splash/bg_color", bg_color)
# ProjectSettings.set("application/config/icon", 
# ProjectSettings.set("application/boot_splash/image", 
# ProjectSettings.set("application/boot_splash/fullsize", false)
# ProjectSettings.set("application/boot_splash/filter", false)
