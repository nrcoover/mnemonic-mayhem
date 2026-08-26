extends Control


const MEMORY_TILE = preload("uid://bd1h0dudwaeg3")


@onready var grid_container: GridContainer = $HBox/GridContainer


func _ready() -> void:
	connect_to_signals()


func connect_to_signals() -> void:
	SignalManager.on_level_selected.connect(on_level_selected)


func on_level_selected(level_setting: LevelSetting) -> void:
	set_grid_columns(level_setting)
	set_memory_tiles(level_setting)


func set_grid_columns(level_setting: LevelSetting) -> void:
	grid_container.columns = level_setting.columns


func set_memory_tiles(level_setting: LevelSetting) -> void:
	for tile in level_setting.total_tiles:
		grid_container.add_child(MEMORY_TILE.instantiate())


func clear_tiles() -> void:
	for tile in grid_container.get_children():
		tile.queue_free()


func _on_exit_button_pressed() -> void:
	clear_tiles()
	SignalManager.emit_on_game_exit_pressed()
