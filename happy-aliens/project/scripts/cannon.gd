extends Node2D

var power := 500.0
var angle := -TAU/8

#basic firing 
func _physics_process(delta: float) -> void:
		if Input.is_action_just_pressed("fire"):
			var alien : RigidBody2D = preload("res://project/scenes/ailen.tscn").instantiate()
			add_sibling(alien)
			alien.global_position = global_position
			alien.apply_impulse(Vector2(1,0).rotated(angle) * power)
			
			
		#angle controls	
		if Input.is_action_just_pressed("angle_up"):
			angle -= 0.1
			
		if Input.is_action_just_pressed("angle_down"):
			angle += 0.1
			
			
		#power controls
		if Input.is_action_just_pressed("power_increase"):
			power += 50
		
		if Input.is_action_just_pressed("power_decrease"):
			power -= 50
			
			
			
func _draw() -> void:
		draw_circle(Vector2.ZERO, 45, Color.BLACK)
