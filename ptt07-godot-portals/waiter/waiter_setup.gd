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
export var icon : Texture = preload("res://waiter/waiter100.png")
export var lcontrol_dpad : bool = false
export var lcontrol_stick : bool = false
export var rcontrol_numpad : bool = false
export var rcontrol_btn1 : String = ""
export var rcontrol_btn2 : String = ""
export var rcontrol_btn3 : String = ""
export var rcontrol_btn4 : String = ""
export var game_width : int = 100
export var game_height : int = 100

func _ready():
	if not Engine.editor_hint:
		
		# pass information to js?
		if lcontrol_dpad:
			print("l: dpad")
		else:
			print("l: stick")
		if rcontrol_numpad:
			print("r: numpad") # report numpad
		else:
			if rcontrol_btn1: print("r1: "+rcontrol_btn1) # report
			if rcontrol_btn2: print("r1: "+rcontrol_btn2) # report
			if rcontrol_btn3: print("r1: "+rcontrol_btn3) # report
			if rcontrol_btn4: print("r1: "+rcontrol_btn4) # report
		
#		queue_free()
	
func _get_none(): return false

func _do_save_changes(_v):
	if Engine.editor_hint:
		ProjectSettings.set("application/config/name", unique_name)
		ProjectSettings.set("application/config/description", todays_date)
		ProjectSettings.set("application/run/main_scene", get_tree().edited_scene_root.filename)
		ProjectSettings.set("rendering/environment/default_clear_color", bg_color)
		ProjectSettings.set("application/boot_splash/bg_color", bg_color)
		if icon:
			ProjectSettings.set("application/config/icon", icon.resource_path)
			ProjectSettings.set("application/boot_splash/image", icon.resource_path)
		ProjectSettings.set("application/boot_splash/fullsize", false)
		ProjectSettings.set("application/boot_splash/filter", false)
		ProjectSettings.set("display/window/size/test_width", 920)
		ProjectSettings.set("display/window/size/test_height", 640)
		if not has_node("Camera2D"):
			var cam = Camera2D.new()
			cam.current = true
			cam.anchor_mode = Camera2D.ANCHOR_MODE_DRAG_CENTER
			cam.zoom = Vector2.ONE * 0.5
			add_child(cam)
			cam.owner = owner if owner else self
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
