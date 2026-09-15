extends Control

@export var cannon : Cannon

func _ready() -> void:
	cannon.ammo_changed.connect(_update_hud)
	_update_hud()
	
	
func _update_hud() -> void:
	$%AmmoLabel.text = "Ammo %d" % cannon.ammo	
