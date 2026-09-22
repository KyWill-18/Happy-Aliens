extends Node2D

@export var cannon : Cannon
@export var sad_alien : Node

var game_over := false

func _ready() -> void:
	sad_alien.won.connect(_on_won)
	cannon.out_of_ammo.connect(_on_out_of_ammo)


func _on_won() -> void:
	if game_over:
		return
	game_over = true
	await get_tree().create_timer(1.0).timeout
	get_tree().call_deferred("change_scene_to_file", "res://outcome/win.tscn")


func _on_out_of_ammo() -> void:
	if game_over:
		return
	game_over = true
	get_tree().call_deferred("change_scene_to_file", "res://outcome/lose.tscn")
