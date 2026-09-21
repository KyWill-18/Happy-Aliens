extends RigidBody2D

func _on_body_entered(body: Node) -> void:
	if body is Alien:
		$Sprite2D.texture = preload("res://sad_alien/alienGreen_round.png")
		$Sprite2D.modulate = Color(1, 1, 1, 1)
		$AudioStreamPlayer2D.play()
