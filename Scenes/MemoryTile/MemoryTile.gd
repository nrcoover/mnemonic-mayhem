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


func matches_other_tile(other: MemoryTile) -> bool:
	return other != self and other.item_image.texture == item_image.texture


func kill_on_pair() -> void:
	z_index = 10
	disabled = true
	
	perform_pair_disappear_tween()


func _on_pressed() -> void:
	if !Scorer.SelectionEnabled: return
	
	reveal(true)
	SignalManager.emit_on_tile_selected(self)


func perform_pair_disappear_tween() -> void:
	var tween: Tween = create_tween()
	tween.set_parallel(true)
	
	var duration: float = 0.5
	
	var degrees: int = 720
	tween.tween_property(self, "rotation_degrees", degrees, duration)
	
	var scaler: float = 1.5
	tween.tween_property(self, "scale", Vector2(scaler, scaler), duration)
	
	tween.set_parallel(false)
	tween.tween_interval(duration)
	
	var short_duration: float = 0.2
	tween.tween_property(self, "modulate", Color.TRANSPARENT, short_duration)
