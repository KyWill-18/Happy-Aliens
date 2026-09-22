extends Node2D

func _ready() -> void:
	var tween = create_tween().set_loops()
	tween.tween_property($PressStart, "modulate:a", 0.0, 0.8)
	tween.tween_property($PressStart, "modulate:a", 1.0, 0.8)
	

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("start"):
		get_tree().change_scene_to_file("res://world.tscn")
