extends Node2D  # Or whatever your root node is

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene_to_file("res://scences/main_menu.tscn")  # Update path if needed
