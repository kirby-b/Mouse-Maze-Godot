extends Area2D

# Gets a .tscn export
@export_file("*.tscn") var NEXT_LVL: String

func _ready():
	Events.connect("player_win", Callable(self, "_on_player_win"))



func _on_player_win():
	get_tree().change_scene_to_file(NEXT_LVL) # Changes to next level
