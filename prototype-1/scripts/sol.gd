extends CharacterBody2D

@export var speed: float = 200.0
@export var jump_velocity: float = -400.0
@export var gravity: float = 900.0
@export var wall_jump_velocity: Vector2 = Vector2(250, -400)

@onready var sprite: AnimatedSprite2D = $AnimatedSprite
@onready var left_wall_check: RayCast2D = $check_left
@onready var right_wall_check: RayCast2D = $check_right

func _physics_process(delta: float) -> void:
	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	# Horizontal movement
	velocity.x = direction * speed

	# Apply gravity if not grounded
	if not is_on_floor():
		velocity.y += gravity * delta

	# Wall jump detection
	var touching_left_wall = left_wall_check.is_colliding()
	var touching_right_wall = right_wall_check.is_colliding()

	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = jump_velocity
		elif touching_left_wall:
			velocity = Vector2(wall_jump_velocity.x, wall_jump_velocity.y)
		elif touching_right_wall:
			velocity = Vector2(-wall_jump_velocity.x, wall_jump_velocity.y)

	# Move the character
	move_and_slide()

	# Flip sprite based on direction
	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false

	# Animation switching
	if not is_on_floor():
		sprite.play("jump")
	elif direction != 0:
		sprite.play("RUN")
	else:
		sprite.play("idle")
