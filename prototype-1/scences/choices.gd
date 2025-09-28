extends Control

@onready var choice_1: Button = $MenuButtons/start
@onready var choice_2: Button = $MenuButtons/quit

func _ready() -> void:
	if choice_1:
		choice_1.pressed.connect(_on_start_pressed)
	else:
		print("choice 1 not found")

	if choice_2:
		choice_2.pressed.connect(_on_quit_pressed)
	else:
		print("choice 2 not found")

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scences/world1.tscn")  # Make sure this path is correct

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://scences/world1.tscn") 
