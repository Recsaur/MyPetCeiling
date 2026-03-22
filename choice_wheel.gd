extends Control

@onready var Ceiling = $".."
@onready var Click = $Click
@onready var Pop = $Pop
var Button1 = false
var Button2 = false
var Button4 = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func OptionAnim(Option,EndSpot: Vector2, OptionName: String):
	var tween = create_tween()
	var colortween = create_tween()
	$Label.text = OptionName
	tween.tween_property(Option,"scale",EndSpot,0.25)
	colortween.tween_property(Option,"modulate",Color(1.572, 1.572, 1.572, 0.749),0.25)

	
func OptionAnimOut(Option,EndSpot: Vector2):
	var colortween = create_tween()
	var tween = create_tween()
	tween.tween_property(Option,"scale",EndSpot,0.25)
	colortween.tween_property(Option,"modulate",Color(1.0, 1.0, 1.0, 0.749),0.25)

func PickedOption(Option,Endspot: Vector2):
	var tween = create_tween()
	tween.tween_property(Option,"position",Endspot,0.125).set_trans(Tween.TRANS_CUBIC)
	
	
	
func _on_button_mouse_entered() -> void:
	var EndSpot = Vector2(0.15,0.15)
	OptionAnim($curve1,EndSpot,"Actions")


func _on_button_2_mouse_entered() -> void:
	var EndSpot = Vector2(0.15,0.15)
	OptionAnim($curve2,EndSpot,"Tools")


func _on_button_3_mouse_entered() -> void:
	var EndSpot = Vector2(0.15,0.15)
	OptionAnim($curve4,EndSpot,"Return")


func _on_button_4_mouse_entered() -> void:
	var EndSpot = Vector2(0.15,0.15)
	OptionAnim($curve3,EndSpot,"Stats")


func _on_button_mouse_exited() -> void:
	var EndSpot = Vector2(0.129,0.129)
	OptionAnimOut($curve1,EndSpot)


func _on_button_2_mouse_exited() -> void:
	var EndSpot = Vector2(0.129,0.129)
	OptionAnimOut($curve2,EndSpot)


func _on_button_3_mouse_exited() -> void:
	var EndSpot = Vector2(0.129,0.129)
	OptionAnimOut($curve4,EndSpot)


func _on_button_4_mouse_exited() -> void:
	var EndSpot = Vector2(0.129,0.129)
	OptionAnimOut($curve3,EndSpot)




func _on_button_2_pressed() -> void:
	if Button2:
		Button2 = false
		$ToolsSubOptions.hide()
	else:
		Button2 = true
		$ToolsSubOptions.show()
	Click.play()

func _on_button_3_pressed() -> void:
	Ceiling.RightClickBack()
	Pop.play()


func _on_button_pressed() -> void:
	if Button1:
		Button1 = false
		$ActionsOptions.hide()
	else:
		Button1 = true
		$ActionsOptions.show()
	Click.play()


func _on_button_4_pressed() -> void:
	Pop.play()
