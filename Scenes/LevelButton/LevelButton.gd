extends TextureButton


@export var level_setting: LevelSetting


@onready var label: Label = $Label


func _ready() -> void:
	label.text = str(level_setting)
