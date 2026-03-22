extends Window
var ChangedNoSave = false
const FilePath = "user://Note.txt"


func _ready() -> void:
	if FileAccess.file_exists(FilePath):
		var FileMade  = FileAccess.open(FilePath,FileAccess.READ)
		$Control/TextEdit.text = FileMade.get_as_text()
		FileMade.close()
	else:
		$Control/TextEdit.text = ""


func _process(delta: float) -> void:
	pass


func _on_close_requested() -> void:
	if ChangedNoSave:
		$Unsaved.show()
	else:
		$Unsaved.hide()
		hide()


func _on_text_edit_text_changed() -> void:
	title = "Notes*"
	ChangedNoSave = true



func _on_save_pressed() -> void:
	var FileNote = FileAccess.open(FilePath,FileAccess.WRITE)
	FileNote.store_string($Control/TextEdit.text)
	FileNote.close()
	title = "Notes"
	print("Made the text")
	ChangedNoSave = false
	$Unsaved.hide()
	hide()
