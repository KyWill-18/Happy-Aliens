extends RigidBody2D

func _on_body_entered(body: Node) -> void:
	if body is Alien:
		$Sprite2D.modulate = Color(1, 1, 1, 1)
