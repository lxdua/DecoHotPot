extends PanelContainer

@onready var power_progress_bar: ProgressBar = $MarginContainer/HBoxContainer/ProgressBarContainer/PowerProgressBar
@onready var spicy_progress_bar: ProgressBar = $MarginContainer/HBoxContainer/ProgressBarContainer/SpicyProgressBar
@onready var satiety_progress_bar: ProgressBar = $MarginContainer/HBoxContainer/ProgressBarContainer/SatietyProgressBar

@onready var game_manager: GameManager = get_tree().get_first_node_in_group("GameManager")


func _on_game_manager_value_updated() -> void:
	power_progress_bar.value = float(game_manager.current_power) / float(game_manager.max_power)
	spicy_progress_bar.value = float(game_manager.current_spicy) / float(game_manager.max_spicy)
	satiety_progress_bar.value = float(game_manager.current_satiety) / float(game_manager.max_satiety)
	prints(game_manager.current_power, game_manager.current_spicy, game_manager.current_satiety)
	prints(power_progress_bar.value, spicy_progress_bar.value, satiety_progress_bar.value)
