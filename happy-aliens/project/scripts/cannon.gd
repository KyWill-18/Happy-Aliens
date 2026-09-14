extends Node2D

var power := 500.0
var min_power := 10
var max_power := 1500

var angle := -TAU/8
var min_angle := -TAU/4
var max_angle := 10

 
#basic firing 
func _physics_process(delta: float) -> void:
		if Input.is_action_just_pressed("fire"):
			var alien : RigidBody2D = preload("res://scenes/alien.tscn").instantiate()
			add_sibling(alien)
			alien.global_position = global_position
			alien.apply_impulse(Vector2(1,0).rotated(angle) * power)
			
			
		#angle controls	
		if Input.is_action_just_pressed("angle_up"):
			angle -= 0.1
			
		if Input.is_action_just_pressed("angle_down"):
			angle += 0.1
		
		angle = clamp(angle, min_angle, max_angle)
			
			
		#power controls
		if Input.is_action_just_pressed("power_increase"):
			power += 50
		
		if Input.is_action_just_pressed("power_decrease"):
			power -= 50
			
		power = clamp(power, min_power, max_power)
			
			
			
func _draw() -> void:
		draw_circle(Vector2.ZERO, 45, Color.BLACK)
