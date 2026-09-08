extends Node2D

var power := 500.0
var angle := -TAU/8


func _physics_process(delta: float) -> void:
		if Input.is_action_just_pressed("fire"):
			var alien : RigidBody2D = preload("res://project/scenes/ailen.tscn").instantiate()
			add_sibling(alien)
			alien.global_position = global_position
			alien.apply_impulse(Vector2(1,0).rotated(angle) * power)
			
func _draw() -> void:
		draw_circle(Vector2.ZERO, 45, Color.BLACK)
