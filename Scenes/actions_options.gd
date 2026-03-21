extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
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



func _on_sit_mouse_entered() -> void:
	var EndSpot = Vector2(1.25,1.25)
	OptionAnim($Sit,EndSpot)


func _on_sleep_mouse_entered() -> void:
	var EndSpot = Vector2(1.25,1.25)
	OptionAnim($Sleep,EndSpot)


func _on_feed_mouse_entered() -> void:
	var EndSpot = Vector2(1.25,1.25)
	OptionAnim($Feed,EndSpot)


func _on_roam_mouse_entered() -> void:
	var EndSpot = Vector2(1.25,1.25)
	OptionAnim($Roam,EndSpot)


func _on_sit_mouse_exited() -> void:
	var EndSpot = Vector2(1,1)
	OptionAnimOut($Sit,EndSpot)


func _on_roam_mouse_exited() -> void:
	var EndSpot = Vector2(1,1)
	OptionAnimOut($Roam,EndSpot)


func _on_sleep_mouse_exited() -> void:
	var EndSpot = Vector2(1,1)
	OptionAnimOut($Sleep,EndSpot)


func _on_feed_mouse_exited() -> void:
	var EndSpot = Vector2(1,1)
	OptionAnimOut($Feed,EndSpot)
