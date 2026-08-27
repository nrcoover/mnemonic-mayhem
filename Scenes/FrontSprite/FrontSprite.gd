extends TextureRect


func _ready() -> void:
	texture = ImageManager.get_random_item_image()
