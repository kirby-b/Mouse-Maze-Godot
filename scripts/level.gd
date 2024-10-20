extends Node2D

@onready var StartPos = $StartPos

func _ready():
	Input.warp_mouse(StartPos.position)


func _on_out_mouse_entered():
	Events.emit_signal("player_fail")


func _on_end_mouse_entered():
	Events.emit_signal("player_win")
