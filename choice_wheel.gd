extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func OptionAnim(Option,EndSpot: Vector2):
	var tween = create_tween()
	var colortween = create_tween()
	tween.tween_property(Option,"scale",EndSpot,0.25)
	colortween.tween_property(Option,"modulate",Color(1.572, 1.572, 1.572, 0.749),0.25)

	
func OptionAnimOut(Option,EndSpot: Vector2):
	var colortween = create_tween()
	var tween = create_tween()
	tween.tween_property(Option,"scale",EndSpot,0.25)
	colortween.tween_property(Option,"modulate",Color(1.0, 1.0, 1.0, 0.749),0.25)

func _on_button_mouse_entered() -> void:
	print("ENTERED")
	var EndSpot = Vector2(0.15,0.15)
	OptionAnim($curve1,EndSpot)


func _on_button_2_mouse_entered() -> void:
	print("ENTERED")
	var EndSpot = Vector2(0.15,0.15)
	OptionAnim($curve2,EndSpot)


func _on_button_3_mouse_entered() -> void:
	print("ENTERED")
	var EndSpot = Vector2(0.15,0.15)
	OptionAnim($curve4,EndSpot)


func _on_button_4_mouse_entered() -> void:
	print("ENTERED")
	var EndSpot = Vector2(0.15,0.15)
	OptionAnim($curve3,EndSpot)


func _on_button_mouse_exited() -> void:
	print("ENTERED")
	var EndSpot = Vector2(0.129,0.129)
	OptionAnimOut($curve1,EndSpot)


func _on_button_2_mouse_exited() -> void:
	print("ENTERED")
	var EndSpot = Vector2(0.129,0.129)
	OptionAnimOut($curve2,EndSpot)


func _on_button_3_mouse_exited() -> void:
	print("ENTERED")
	var EndSpot = Vector2(0.129,0.129)
	OptionAnimOut($curve4,EndSpot)


func _on_button_4_mouse_exited() -> void:
	print("ENTERED")
	var EndSpot = Vector2(0.129,0.129)
	OptionAnimOut($curve3,EndSpot)
