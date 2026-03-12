extends Node2D
var move_speed = 5
var direction = Vector2(1,0)
var Idle = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var window = get_window()
	var usable_rect = DisplayServer.screen_get_usable_rect()
	var target_y = usable_rect.end.y - window.size.y
	window.position = Vector2i(0,target_y)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#print(Idle)
	var window = get_window()
	var move_vector = Vector2i(direction * move_speed)
	if $Sprite2D.frame == 6 and Idle == false:
		#print($Sprite2D.frame)
		window.position += move_vector
	#print(window.position)
	#print(move_vector)
	var usable_rect = DisplayServer.screen_get_usable_rect()
	if window.position.x + window.size.x > usable_rect.end.x:
		direction.x = -1
		$Sprite2D.flip_h = false
	elif window.position.x < usable_rect.position.x:
		direction.x = 1 
		$Sprite2D.flip_h = true
	#if 

#func _on_button_button_down() -> void:
	#var tween = create_tween()
	#tween.tween_property($".","scale",Vector2(1.2,0.75),0.075)
	#tween.tween_property($".","scale",Vector2(1,1),0.075)
	##tween.tween_property($".","position",Vector2($".".position.x,$".".position.y+25),0.1)
	#pass # Replace with function body.


func _on_button_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			var tween = create_tween()
			tween.tween_property($".","scale",Vector2(1.2,0.75),0.075)
			tween.tween_property($".","scale",Vector2(1,1),0.075)
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			if Idle == false:
				Idle = true
				$Sprite2D.play("Idle")
			else:
				Idle = false
				$Sprite2D.play("Walk")
			
	pass # Replace with function body.


func _on_button_mouse_entered() -> void:
	var tween = create_tween()
	tween.tween_property($Sprite2D,"modulate",Color(1.255, 1.255, 1.255, 1.0),0.1)
	pass # Replace with function body.


func _on_button_mouse_exited() -> void:
	var tween = create_tween()
	tween.tween_property($Sprite2D,"modulate",Color(1.0, 1.0, 1.0, 1.0),0.1)
	pass # Replace with function body.
