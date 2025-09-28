extends Control

@onready var choice_1: Button = $choice_buttons/choice_1
@onready var choice_2: Button = $choice_buttons/choice_2

func _ready() -> void:
	if choice_1:
		choice_1.pressed.connect(_on_choice_1_pressed)
	else:
		print("choice_1 not found")

	if choice_2:
		choice_2.pressed.connect(_on_choice_2_pressed)
	else:
		print("choice_2 not found")

func _on_choice_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scences/choice_one_chosen.tscn")

func _on_choice_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scences/choice_two_chosen.tscn")
