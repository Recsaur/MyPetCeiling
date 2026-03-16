extends Control

@onready var HappyLabel = $Happiness/Happiness
@onready var TireLabel = $Tiredness/Tiredness
@onready var HungerLabel = $Hunger/Hunger

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	HappyLabel.text = str(CeilingStats.Happiness,"%")
	TireLabel.text = str(CeilingStats.Tiredness,"%")
	HungerLabel.text = str(CeilingStats.Hunger,"%")
	
	#position = get_global_mouse_position()
	pass
