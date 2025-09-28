extends Control

@onready var start_button: Button = $MenuButtons/start
@onready var quit_button: Button = $MenuButtons/quit

func _ready() -> void:
	if start_button:
		start_button.pressed.connect(_on_start_pressed)
	else:
		print("start button not found")

	if quit_button:
		quit_button.pressed.connect(_on_quit_pressed)
	else:
		print("quit button not found")

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scences/world1.tscn")  # Make sure this path is correct

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://scences/world1.tscn") 
