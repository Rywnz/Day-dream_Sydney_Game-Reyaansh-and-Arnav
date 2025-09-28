extends CharacterBody2D

@export var speed: float = 200.0
@export var jump_velocity: float = -400.0
@export var gravity: float = 900.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite

func _physics_process(delta: float) -> void:
	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	# Horizontal movement
	velocity.x = direction * speed

	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Jumping
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_velocity
	
	# Move the character
	move_and_slide()

	# Flip sprite based on direction
	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false

	# Animation switching
	if direction != 0:
		sprite.play("RUN")
	else:
		sprite.play("idle")
