extends Area2D

@export var target_scene: String = "res://scences/choices.tscn"
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file(target_scene)
