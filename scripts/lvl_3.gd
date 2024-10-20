extends Node2D
# Level 3 is much like the first two but the end of level is different and
# a func for jumpscare is needed

@onready var StartPos = $StartPos

func _ready():
	Input.warp_mouse(StartPos.position)


func _on_out_mouse_entered():
	Events.emit_signal("player_fail")


func _on_end_mouse_entered():
	Events.emit_signal("player_cheat")


func _on_surprise_mouse_entered():
	Events.emit_signal("jumpscare")
