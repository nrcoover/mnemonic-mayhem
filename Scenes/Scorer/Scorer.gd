class_name Scorer


extends Node


static var SelectionEnabled: bool = true


@onready var reveal_timer: Timer = $RevealTimer
@onready var pair_sound: AudioStreamPlayer = $PairSound


var _selected_tiles: Array[MemoryTile]
var _pairs_made: int = 0
var _moves_made: int = 0
var _target_pairs: int = 99


func _ready() -> void:
	subscribe_to_signals()


func subscribe_to_signals() -> void:
	SignalManager.on_tile_selected.connect(on_tile_selected)
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)


func on_tile_selected(tile: MemoryTile) -> void:
	if !SelectionEnabled: return
	if tile in _selected_tiles: return
	
	_selected_tiles.append(tile)
	process_pair()


func on_game_exit_pressed() -> void:
	reveal_timer.stop()
	clear_tiles()
	enable_selection()


func check_for_pair() -> void:
	increment_moves_made()
	
	if _selected_tiles[0].matches_other_tile(_selected_tiles[1]):
		_selected_tiles[0].kill_on_pair()
		_selected_tiles[1].kill_on_pair()
		_pairs_made += 1
		pair_sound.play()


func check_game_over() -> void:
	if _pairs_made != _target_pairs:
		enable_selection()
	else:
		SignalManager.emit_on_game_over(_moves_made)


func process_pair() -> void:
	if _selected_tiles.size() != 2: return
	
	disable_selection()
	reveal_timer.start()
	check_for_pair()


func reset_selected_tiles() -> void:
	for tile in _selected_tiles:
		tile.reveal(false)


func clear_tiles() -> void:
	_selected_tiles.clear()


func reset_pairs_made() -> void:
	_pairs_made = 0


func reset_moves_made() -> void:
	_moves_made = 0


func get_pairs_string() -> String:
	return "%d / %d" % [ _pairs_made, _target_pairs]


func get_moves_string() -> String:
	return "%d" % [ _moves_made ]


func clear_new_game(target_pairs: int) -> void:
	clear_tiles()
	enable_selection()
	reset_pairs_made()
	set_target_pairs(target_pairs)
	reset_moves_made()


func set_target_pairs(target_pairs: int) -> void:
	_target_pairs = target_pairs


func enable_selection() -> void:
	SelectionEnabled = true


func disable_selection() -> void:
	SelectionEnabled = false


func increment_moves_made() -> void:
	_moves_made += 1


func _on_reveal_timer_timeout() -> void:
	reset_selected_tiles()
	check_game_over()
	clear_tiles()
