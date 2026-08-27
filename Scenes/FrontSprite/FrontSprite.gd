extends TextureRect


func _ready() -> void:
	set_random_item_image()
	run_tween()


func set_random_item_image() -> void:
	texture = ImageManager.get_random_item_image()


func get_random_spin_time() -> float:
	var minimum_spin_time = 1.0
	var maximum_spin_time = 2.0
	return randf_range(minimum_spin_time, maximum_spin_time)


func get_random_rotation() -> float:
	var minimum_rotation = -360
	var maximum_rotation = 360
	return deg_to_rad(randf_range(minimum_rotation, maximum_rotation))


func run_tween() -> void:
	var tween: Tween = create_tween()
	tween.set_loops()
	
	var minimum_scale = 0.05
	var maximun_scale = 1.0
	var duration = 1.0
	
	tween.tween_property(self, "scale", Vector2(minimum_scale, minimum_scale), duration)
	tween.tween_callback(set_random_item_image)
	tween.tween_property(self, "scale", Vector2(maximun_scale, maximun_scale), duration)
	tween.tween_property(self, "rotation", get_random_rotation(), get_random_spin_time())
	
	
	
