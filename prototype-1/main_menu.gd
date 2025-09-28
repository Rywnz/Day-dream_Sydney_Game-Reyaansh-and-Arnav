extends Control

@onready var start_button: Button = $MenuButtons/start
@onready var quit_button: Button = $MenuButtons/quit

func _ready() -> void:
	start_button.pressed.connect(_on_start_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/node_2d.tscn")  # Make sure the path is correct

func _on_quit_pressed() -> void:
	get_tree().quit()
