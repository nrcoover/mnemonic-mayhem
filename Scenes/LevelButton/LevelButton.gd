extends TextureButton


@export var level_setting: LevelSetting


@onready var label: Label = $Label


func _ready() -> void:
	label.text = str(level_setting)


func _on_pressed() -> void:
	SignalManager.emit_on_level_selected(level_setting)
