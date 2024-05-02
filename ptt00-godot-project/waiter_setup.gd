tool
extends Node
class_name WaiterSetup
export var click_to_save_changes : bool setget _do_save_changes, _get_none
export var last_save_time : String
export var click_for_random_name : bool setget _do_random_name, _get_none
export var click_to_autogen_date : bool setget _do_autogen_date, _get_none
export var unique_name : String = ""
export var todays_date : String = ""

func _process(_delta):
	if click_to_save_changes: save_changes() # can never happen though
func save_changes():
	click_to_save_changes = false
	last_save_time = Time.get_time_string_from_system()
	print("OK! Save completed @ "+last_save_time)
	property_list_changed_notify()
	
func _get_none(): return false

func _do_save_changes(_v):
	last_save_time = Time.get_time_string_from_system()
	print("OK! Save completed @ "+last_save_time)
	property_list_changed_notify()
func _do_random_name(_v):
	unique_name = "TODO: make random name generator work"
	property_list_changed_notify()
func _do_autogen_date(_v):
	todays_date = Time.get_date_string_from_system()
	property_list_changed_notify()
	
