extends Control

@export var cannon : Cannon

func _ready() -> void:
	cannon.ammo_changed.connect(_update_hud)
	_update_hud()


func _update_hud() -> void:
	if cannon.ammo > 0:
		%AmmoLabel.text = "Ammo: %d" % cannon.ammo
	else:
		%AmmoLabel.text = "Out of ammo"


func _process(_delta: float) -> void:
	$AngleLabel.text = "Angle: %.1f" % abs(rad_to_deg(cannon.angle))
	$PowerLabel.text = "Power: %d" % cannon.power
