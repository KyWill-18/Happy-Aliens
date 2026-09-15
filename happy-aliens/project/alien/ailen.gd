extends RigidBody2D
class_name Alien

signal fell_off_world

func _ready() -> void:
	await get_tree().create_timer(0.1).timeout
	$AudioStreamPlayer2D.play()

func  _physics_process(_delta: float) -> void:
	if global_position.y > 1000:
		fell_off_world.emit()
		queue_free()
