extends RigidBody2D

signal won

func _on_body_entered(body: Node) -> void:
	if body is Alien:
		won.emit()
		$AudioStreamPlayer2D.play()
		$Sprite2D.texture = preload("res://sad_alien/alienGreen_round.png")
		$Sprite2D.modulate = Color.WHITE
