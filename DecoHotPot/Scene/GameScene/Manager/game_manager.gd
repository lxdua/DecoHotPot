extends Node
class_name GameManager

@export var quest_container: PanelContainer
@export var value_container: PanelContainer
@export var plank: TextureRect

signal value_updated
signal value_out_of_limit

var max_power: int = 100:
	set(v):
		max_power = v
		value_updated.emit()
var current_power: int:
	set(v):
		value_updated.emit()
		if v < 0 or max_power < v:
			value_out_of_limit.emit()
		current_power = clamp(v, 0, max_power)

var max_spicy: int = 100:
	set(v):
		max_spicy = v
		value_updated.emit()
var current_spicy: int:
	set(v):
		value_updated.emit()
		if v < 0 or max_spicy < v:
			value_out_of_limit.emit()
		current_spicy = clamp(v, 0, max_spicy)

var max_satiety: int = 100:
	set(v):
		max_satiety = v
		value_updated.emit()
var current_satiety: int:
	set(v):
		value_updated.emit()
		if v < 0 or max_satiety < v:
			value_out_of_limit.emit()
		current_satiety = clamp(v, 0, max_satiety)

var score: int = 0

func _ready() -> void:
	initialize_data()
	start_game()

func run_influence(influence: Influence):
	match influence.target:
		"power":
			match influence.type:
				Influence.InfluenceType.ADD:
					current_power += influence.value
				Influence.InfluenceType.MULTIPLY_FROM_CURRENT:
					current_power += influence.value / 100.0 * current_power
				Influence.InfluenceType.MULTIPLY_FROM_MAX:
					current_power += influence.value / 100.0 * max_power
		"spicy":
			match influence.type:
				Influence.InfluenceType.ADD:
					current_spicy += influence.value
				Influence.InfluenceType.MULTIPLY_FROM_CURRENT:
					current_spicy += influence.value / 100.0 * current_spicy
				Influence.InfluenceType.MULTIPLY_FROM_MAX:
					current_spicy += influence.value / 100.0 * max_spicy
		"satiety":
			match influence.type:
				Influence.InfluenceType.ADD:
					current_satiety += influence.value
				Influence.InfluenceType.MULTIPLY_FROM_CURRENT:
					current_satiety += influence.value / 100.0 * current_satiety
				Influence.InfluenceType.MULTIPLY_FROM_MAX:
					current_satiety += influence.value / 100.0 * max_satiety

func initialize_data():
	max_power = 100
	current_power = 30
	max_satiety = 100
	current_satiety = 0
	max_spicy = 100
	current_spicy = 0

func start_game():
	plank.update_question()
