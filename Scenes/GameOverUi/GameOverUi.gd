extends PanelContainer


@onready var moves_label: Label = $VBox/MovesLabel


func _ready() -> void:
	subscribe_to_signals()


func subscribe_to_signals() -> void:
	SignalManager.on_game_over.connect(on_game_over)
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)


func on_game_over(moves_made: int) -> void:
	show()
	moves_label.text = "You took %d moves" % moves_made


func on_game_exit_pressed() -> void:
	hide()
