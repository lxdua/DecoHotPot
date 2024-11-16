extends TextureRect

const OPTION_BUTTON = preload("res://Scene/Plank/option_button.tscn")

@onready var question_label: Label = $Calendar/VBoxContainer/MarginContainer1/TextureRect/QuestionLabel
@onready var button_container: HBoxContainer = $Calendar/VBoxContainer/MarginContainer2/ButtonContainer

@export var question_pool: Array[Question]

func update_question():
	clear_button()
	var question: Question = pick_question()
	question_label.text = question.question_content
	for option: Option in question.option_list:
		var new_option_button: = OPTION_BUTTON.instantiate()
		new_option_button.option = option
		button_container.add_child(new_option_button)

func pick_question(should_erase: bool = false):
	var question: Question = question_pool.pick_random()
	return question
func erase_question(question: Question):
	question_pool.erase(question)
func add_question(question: Question):
	question_pool.append(question)

func clear_button():
	for node in button_container.get_children():
		node.queue_free()

func _on_option_button_pressed():
	update_question()
