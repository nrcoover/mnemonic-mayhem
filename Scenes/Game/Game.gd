extends Control


const MEMORY_TILE = preload("uid://bd1h0dudwaeg3")


@onready var grid_container: GridContainer = $HBox/GridContainer


func _ready() -> void:
	connect_to_signals()


func connect_to_signals() -> void:
	SignalManager.on_level_selected.connect(on_level_selected)


func on_level_selected(level_setting: LevelSetting) -> void:
	var selected_images = set_level_images(level_setting)
	
	set_grid_columns(level_setting)
	set_memory_tiles(selected_images)


func set_level_images(level_setting: LevelSetting) -> Array[Texture2D]:
	var level_data_selector: LevelDataSelector = LevelDataSelector.new()
	var images: Array[Texture2D] = level_data_selector.get_images_for_level(level_setting)
	return images


func set_frame_image() -> Texture2D:
	return ImageManager.get_random_frame_image()


func set_grid_columns(level_setting: LevelSetting) -> void:
	grid_container.columns = level_setting.columns


func set_memory_tiles(images: Array[Texture2D]) -> void:
	var frame_image: Texture2D = set_frame_image()
	
	for image in images:
		var memory_tile = MEMORY_TILE.instantiate()
		grid_container.add_child(memory_tile)
		memory_tile.setup(image, frame_image)


func clear_tiles() -> void:
	for tile in grid_container.get_children():
		tile.queue_free()


func _on_exit_button_pressed() -> void:
	clear_tiles()
	SignalManager.emit_on_game_exit_pressed()
