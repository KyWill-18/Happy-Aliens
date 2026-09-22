extends Node2D
class_name Cannon

signal ammo_changed
signal  out_of_ammo

var power := 500.0
var min_power := 10
var max_power := 1500

var angle := -TAU/8
var min_angle := -TAU/4
var max_angle := 0

var ammo := 5
var can_fire := true

#basic firing
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("fire") and can_fire and ammo > 0:
		$AudioStreamPlayer2D.play()
		var alien : RigidBody2D = preload("res://alien/alien.tscn").instantiate()
		add_sibling(alien)
		alien.global_position = global_position
		alien.apply_impulse(Vector2(1,0).rotated(angle) * power)
		ammo -= 1
		ammo_changed.emit()
		can_fire = false
		alien.sleeping_state_changed.connect(_on_alien_sleeping_state_changed.bind(alien))
		alien.fell_off_world.connect(_on_alien_fell_off_world)
		get_tree().create_timer(4.0).timeout.connect(_on_alien_timeout.bind(alien))

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


func _on_alien_fell_off_world() -> void:
	_finish_projectile()


func _on_alien_sleeping_state_changed(alien) -> void:
	if is_instance_valid(alien) and alien.sleeping:
		_finish_projectile()
		alien.queue_free()


func _on_alien_timeout(alien) -> void:
	if is_instance_valid(alien):
		_finish_projectile()
		alien.queue_free()


func _draw() -> void:
	draw_circle(Vector2.ZERO, 45, Color.BLACK)
	
	
func _finish_projectile() -> void:
	can_fire = true
	if ammo <= 0:
		out_of_ammo.emit()	
