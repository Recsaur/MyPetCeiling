extends Node2D

@onready var Stats = $Stats
#Movement
var move_speed = 5
var direction = Vector2(1,0)

#Ceiling States (Ceilates... idk vro socrates)
var Idle = false
var Falling = false
var RClicked = false

var dragging = false
var drag_offset = Vector2i.ZERO

var  rng = RandomNumberGenerator.new()


func _ready() -> void:
	get_viewport().gui_embed_subwindows = false
	var window = get_window()
	var usable_rect = DisplayServer.screen_get_usable_rect()
	var target_y = usable_rect.end.y - window.size.y
	window.position = Vector2i(0,target_y)	


func _process(delta: float) -> void:
	#print(Idle)
	var window = get_window()
	var move_vector = Vector2i(direction * move_speed)
	var usable_rect = DisplayServer.screen_get_usable_rect()
	var target_y = usable_rect.end.y - window.size.y
	
	#Stats.position = DisplayServer.mouse_get_position() - drag_offset
	
	
	#$Window.position = window.position >this made sub window not move idk why
	if window.position.y != target_y and not dragging:
		Falling = true
		$Sprite2D.play("Fall")
		window.position.y += 5
	else:
		Falling = false
		if Idle:
			$Sprite2D.play("Idle")
		else:
			$Sprite2D.play("Walk")
	print(Falling)
	if window.position.y > target_y and not dragging:
		var tween = create_tween()
		window.position.y = target_y
		tween.tween_property($".","scale",Vector2(1.2,0.75),0.075)
		tween.tween_property($".","scale",Vector2(1,1),0.075)
	if dragging:
		window.position = DisplayServer.mouse_get_position() - drag_offset
	if $Sprite2D.frame == 6 and not Idle and not Falling:
		#print($Sprite2D.frame)
		window.position += move_vector
	#print(window.position)
	#print(move_vector)
	if window.position.x + window.size.x > usable_rect.end.x:
		direction.x = -1
		$Sprite2D.flip_h = false
	elif window.position.x < usable_rect.position.x:
		direction.x = 1 
		$Sprite2D.flip_h = true

#func _on_button_button_down() -> void:
	#var tween = create_tween()
	#tween.tween_property($".","scale",Vector2(1.2,0.75),0.075)
	#tween.tween_property($".","scale",Vector2(1,1),0.075)
	##tween.tween_property($".","position",Vector2($".".position.x,$".".position.y+25),0.1)

func _on_button_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			#$Squeak.pitch_scale = rng.randf_range(0.9,1.15)
			if not RClicked:
				var tween = create_tween()
				tween.tween_property($".","scale",Vector2(1.2,0.75),0.075)
				tween.tween_property($".","scale",Vector2(1,1),0.075)
				$Squeak.play()
			dragging = true
			drag_offset = DisplayServer.mouse_get_position() - get_window().position
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			if Idle == false:
				RightClickIdle()
			else:
				RightClickBack()
		elif event.button_index == MOUSE_BUTTON_MIDDLE and RClicked == false:
			if Idle:
				Idle = false
				$Sprite2D.play("Walk")
			else:
				Idle = true
				$Sprite2D.play("Idle")
	if event.is_action_released("Hold"):
		dragging = false


func RightClickIdle():
	var tween = create_tween()
	
	Idle = true
	RClicked = true
	$Sprite2D.play("Idle")
	tween.tween_property($Stats,"modulate",Color(0.0, 0.0, 0.0, 0.0),0.25)
	await tween.finished
	print("Hid Stats")
	$Stats.hide()
	$ChoiceWheel.show()
	
func RightClickBack():
	var tween = create_tween()
	RClicked = false
	dragging = false
	Idle = false
	tween.tween_property($Stats,"modulate",Color(1.0, 1.0, 1.0, 1.0),0.25)
	$ChoiceWheel.hide()
	$Sprite2D.play("Walk")
	
func _on_button_mouse_entered() -> void:
	var tween = create_tween()
	if not RClicked:
		Stats.show()
		tween.tween_property($Sprite2D,"modulate",Color(1.218, 1.218, 1.218, 1.0),0.1)


func _on_button_mouse_exited() -> void:
	var tween = create_tween()
	Stats.hide()
	tween.tween_property($Sprite2D,"modulate",Color(1.0, 1.0, 1.0, 1.0),0.1)
