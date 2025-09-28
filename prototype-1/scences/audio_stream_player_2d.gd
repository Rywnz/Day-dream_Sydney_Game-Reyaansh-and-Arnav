extends Node

@onready var bgm: AudioStreamPlayer2D = $"."



func _ready():
	bgm.play()
