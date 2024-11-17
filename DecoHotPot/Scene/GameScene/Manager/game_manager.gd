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
	if influence is ChangeValue:
		match influence.target:
			ChangeValue.Target.POWER:
				match influence.type:
					ChangeValue.Type.ADD:
						current_power += influence.value
					ChangeValue.Type.MULTIPLY_FROM_CURRENT:
						current_power += influence.value / 100.0 * current_power
					ChangeValue.Type.MULTIPLY_FROM_MAX:
						current_power += influence.value / 100.0 * max_power
			ChangeValue.Target.SCIPY:
				match influence.type:
					ChangeValue.Type.ADD:
						current_spicy += influence.value
					ChangeValue.Type.MULTIPLY_FROM_CURRENT:
						current_spicy += influence.value / 100.0 * current_spicy
					ChangeValue.Type.MULTIPLY_FROM_MAX:
						current_spicy += influence.value / 100.0 * max_spicy
			ChangeValue.Target.SATIETY:
				match influence.type:
					ChangeValue.Type.ADD:
						current_satiety += influence.value
					ChangeValue.Type.MULTIPLY_FROM_CURRENT:
						current_satiety += influence.value / 100.0 * current_satiety
					ChangeValue.Type.MULTIPLY_FROM_MAX:
						current_satiety += influence.value / 100.0 * max_satiety
	elif influence is AddQuestion:
		for question: Question in influence.question_dict:
			plank.add_question(question, influence.question_dict[question])
			prints("加入了", question, influence.question_dict[question], "个")

func initialize_data():
	max_power = 100
	current_power = 30
	max_satiety = 100
	current_satiety = 0
	max_spicy = 100
	current_spicy = 0

func start_game():
	pass
