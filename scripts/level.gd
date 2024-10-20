extends Node2D

@onready var StartPos = $StartPos

func _ready():
	Input.warp_mouse(StartPos.position)


func _on_out_mouse_entered():
	print("Death")


func _on_end_mouse_entered():
	print("Win")
