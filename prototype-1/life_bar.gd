extends ProgressBar

var max_life := 100
var current_life := 100

func _ready():
	value = current_life

func drain_life(amount: int):
	current_life = clamp(current_life - amount, 0, max_life)
	value = current_life
	check_death()

func restore_life(amount: int):
	current_life = clamp(current_life + amount, 0, max_life)
	value = current_life

func check_death():
	if current_life <= 0:
		get_tree().change_scene("res://assets/GAME OVERa heading.png")  # Replace with your actual game over scene
