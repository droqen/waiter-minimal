extends Node
class_name PinMan
func _ready():
	add_to_group("pinman")
var stick : Vector2 = Vector2(0, 0)
var a : bool = false
func _physics_process(_delta):
	a = Input.is_key_pressed(KEY_A)
	stick = Vector2(
		int(Input.is_key_pressed(KEY_RIGHT))
		- int(Input.is_key_pressed(KEY_LEFT)),
		int(Input.is_key_pressed(KEY_DOWN))
		- int(Input.is_key_pressed(KEY_UP))
	)
