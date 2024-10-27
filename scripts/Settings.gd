extends PopupMenu

var showing = false
	
func _ready():
	hide()

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel") and showing == false:
		show()
		showing = true
	elif Input.is_action_just_pressed("ui_cancel") and showing == true:
		hide()
		showing = false

func _on_close_requested():
	showing = false
	hide()

func _on_id_pressed(id):
	if is_item_checkable(id):
		if is_item_checked(id):
			set_item_checked(id, false)
		else:
			set_item_checked(id, true)
			
	if id == 0:
		if is_item_checked(0):
			GlobalVars.game_mode = "scare"
		else:
			GlobalVars.game_mode = "no-scare"
	elif id == 1:
		if is_item_checked(1):
			GlobalVars.game_mode = "easy"
		else:
			GlobalVars.game_mode = "normal"
	elif id == 3:
		hide()
		showing = false
	elif id == 4:
		get_tree().quit()
