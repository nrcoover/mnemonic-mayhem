extends Node


@export var main_menu_music: AudioStream
@export var game_music: AudioStream
@export var click_sfx: AudioStream
@export var tile_sfx: AudioStream
@export var game_over_sfx: AudioStream


@onready var music: AudioStreamPlayer = $Music
@onready var sfx: AudioStreamPlayer = $SFX


func _ready() -> void:
	subscribe_to_signals()
	play_music(main_menu_music)


func subscribe_to_signals() -> void:
	SignalManager.on_level_selected.connect(on_level_selected)
	SignalManager.on_tile_selected.connect(on_tile_selected)
	SignalManager.on_game_over.connect(on_game_over)
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)


func on_level_selected(_level: LevelSetting) -> void:
	play_music(game_music)
	play_sfx(click_sfx)


func on_tile_selected(_tile: MemoryTile) -> void:
	play_sfx(tile_sfx)


func on_game_over(_moves_taken: int) -> void:
	play_sfx(game_over_sfx)


func on_game_exit_pressed() -> void:
	play_music(main_menu_music)


func play_music(stream: AudioStream) -> void:
	music.stream = stream
	music.play()


func play_sfx(stream: AudioStream) -> void:
	sfx.stream = stream
	sfx.play()
