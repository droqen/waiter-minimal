extends Node2D

var aheld : bool = false

func _physics_process(_delta):
	var pin = $Pin
	var spr : Sprite = get_child(0)
	spr.rotation = lerp(spr.rotation, PI*0.5 if pin.man.a else 0.0, 0.5)
	spr.position = lerp(spr.position, pin.man.stick * 100, 0.5)
	if aheld != pin.man.a: # if just pressed
		aheld = pin.man.a
		if aheld: $gumdrop.play()
