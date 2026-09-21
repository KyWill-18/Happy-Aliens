extends RigidBody2D
class_name Alien

signal fell_off_world

func _ready() -> void:
	$AudioStreamPlayer2D.play()

func _physics_process(_delta: float) -> void:
	if global_position.y > 1000:
		fell_off_world.emit()
		queue_free()
