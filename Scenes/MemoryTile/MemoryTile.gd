class_name MemoryTile


extends TextureButton


@onready var frame_image: TextureRect = $FrameImage
@onready var item_image: TextureRect = $ItemImage


func _ready() -> void:
	reveal(false)


func setup(image: Texture2D, frame: Texture2D) -> void:
	frame_image.texture = frame
	item_image.texture = image


func reveal(is_revealed: bool) -> void:
	frame_image.visible = is_revealed
	item_image.visible = is_revealed


func _on_pressed() -> void:
	reveal(true)
