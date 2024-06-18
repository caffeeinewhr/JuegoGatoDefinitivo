extends Node

func shake(cosaMover: Node2D, fuerza: float, duracion: float = 0.2) -> void:
	if not cosaMover:
		return

	var orig_pos := cosaMover.position
	var shake_count := 10
	var tween := create_tween()

	for i in range(shake_count):
		var shake_offset := Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0))
		var target := orig_pos + fuerza * shake_offset
		if i % 2 == 0:
			target = orig_pos
		tween.tween_property(cosaMover, "position", target, duracion / float(shake_count))
		fuerza *= 0.75

	# Conectar la señal de finalización del tween
	tween.finished.connect(func():
		if is_instance_valid(cosaMover):
			cosaMover.position = orig_pos
	)

	# Empezar el tween
	tween.play()
