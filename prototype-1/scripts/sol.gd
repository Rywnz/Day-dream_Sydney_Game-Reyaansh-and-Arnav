extends CharacterBody2D

@export var speed: float = 200.0
@export var jump_velocity: float = -400.0
@export var gravity: float = 900.0
@export var wall_jump_velocity: Vector2 = Vector2(250, -400)
@onready var run_sound: AudioStreamPlayer2D = $run_sound

@onready var sprite: AnimatedSprite2D = $AnimatedSprite
@onready var left_wall_check: RayCast2D = $check_left
@onready var right_wall_check: RayCast2D = $check_right

func _ready() -> void:
	# Load stats from Global
	speed = Global.player_stats.get("speed", speed)
	jump_velocity = Global.player_stats.get("jump_velocity", jump_velocity)

func _physics_process(delta: float) -> void:
	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction * speed

	if not is_on_floor():
		velocity.y += gravity * delta

	var touching_left_wall = left_wall_check.is_colliding()
	var touching_right_wall = right_wall_check.is_colliding()

	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = jump_velocity
		elif touching_left_wall:
			velocity = Vector2(wall_jump_velocity.x, wall_jump_velocity.y)
		elif touching_right_wall:
			velocity = Vector2(-wall_jump_velocity.x, wall_jump_velocity.y)

	move_and_slide()

	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false

	if not is_on_floor():
		sprite.play("jump")
		if run_sound.playing:
			run_sound.stop()
	elif direction != 0:
		sprite.play("RUN")
		if not run_sound.playing:
			run_sound.play()
	else:
		sprite.play("idle")
		if run_sound.playing:
			run_sound.stop()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("go_to_menu"):
		print("esc pressed")
		get_tree().change_scene_to_file("res://scences/main_menu.tscn")
