extends TextureButton

var option: Option

@onready var option_content_label: Label = $OptionContentLabel

@onready var game_manager: GameManager = get_tree().get_first_node_in_group("GameManager")

signal option_button_pressed
func _on_pressed() -> void:
	print("pressed!")
	option_button_pressed.emit()
	for influence in option.influence_list:
		game_manager.run_influence(influence)

func _ready() -> void:
	option_button_pressed.connect(game_manager.plank._on_option_button_pressed)
	option_content_label.text = option.option_content
