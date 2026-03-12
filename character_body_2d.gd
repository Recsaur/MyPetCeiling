extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

#func _process(delta: float) -> void:

func _physics_process(delta: float) -> void:
	print(get_window().position)
	# Add the gravity.
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		get_window().position.y -= 10

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		get_window().position.x += 10

	move_and_slide()
