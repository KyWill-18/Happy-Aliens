extends Node2D

const STAR_COUNT := 80

func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	rng.seed = 42
	for i in range(STAR_COUNT):
		var star := ColorRect.new()
		star.color = Color.WHITE
		star.size = Vector2(2, 2)
		star.pivot_offset = Vector2(1,1)
		star.scale = Vector2.ZERO
		add_child(star)
		_loop_star(star, rng)
		
		
func _loop_star(star: ColorRect, rng: RandomNumberGenerator) -> void:
	star.position = Vector2(rng.randf_range(0, 1152), randf_range(0, 648))
	var tween := create_tween()
	tween.tween_interval(rng.randf_range(0.0, 1.0))
	tween.tween_property(star, "scale", Vector2.ONE, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_interval(0.75)
	tween.tween_property(star, "scale", Vector2.ZERO, 0.1)
	tween.tween_callback(_loop_star.bind(star, rng))
