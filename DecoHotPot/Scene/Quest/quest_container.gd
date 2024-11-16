extends PanelContainer

const QUEST_CHECK_BOX = preload("res://Scene/Quest/quest_check_box.tscn")

@onready var list_container: VBoxContainer = $MarginContainer/Panel/MarginContainer/ListContainer

func clear_list_container():
	for node in list_container.get_children():
		node.queue_free()

func add_quest_check_box():
	var new_quest_check_box: = QUEST_CHECK_BOX.instantiate()
	list_container.add_child(new_quest_check_box)
