extends Node2D

func _ready() -> void:
	var tween = create_tween().set_loops()
	tween.tween_property($PanelContainer, "modulate:a", 0.5, 0.9)
	tween.tween_property($PanelContainer, "modulate:a", 1.0, 1.0)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if $PanelContainer.get_global_rect().has_point(event.position):
			get_tree().change_scene_to_file("res://world.tscn")
