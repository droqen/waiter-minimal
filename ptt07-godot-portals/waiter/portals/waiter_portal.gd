extends Area2D
class_name WaiterPortal

var spawnbuf : int = 4

func _physics_process(_delta):
	if spawnbuf > 0: spawnbuf -= 1

func _on_portal_body_entered(body):
	if spawnbuf > 0: return # no effect
	
	body.queue_free()
	prints("entered portal", name)
