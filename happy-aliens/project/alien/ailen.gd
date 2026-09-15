extends RigidBody2D
class_name Alien

func _ready() -> void:
	await get_tree().create_timer(0.1).timeout
	$AudioStreamPlayer2D.play()
