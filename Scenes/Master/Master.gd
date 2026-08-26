extends Control

@onready var main: Control = $Main
@onready var game: Control = $Game


func _ready() -> void:
	connect_to_signals()
	show_game(false)

func connect_to_signals() -> void:
	SignalManager.on_level_selected.connect(on_level_selected)
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)


func on_level_selected(_level_setting: LevelSetting) -> void:
	show_game(true)


func on_game_exit_pressed() -> void:
	show_game(false)


func show_game(isShowing: bool) -> void:
	game.visible = isShowing
	main.visible = !isShowing
