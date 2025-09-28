extends Area2D

@export var target_scene: String = "res://scences/world 2.tscn"
@export var new_speed: float = 150.0
@export var new_jump_velocity: float = -280.0

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		Global.player_stats["speed"] = new_speed
		Global.player_stats["jump_velocity"] = new_jump_velocity
		get_tree().change_scene_to_file(target_scene)
